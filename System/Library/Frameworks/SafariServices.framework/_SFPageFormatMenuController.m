@interface _SFPageFormatMenuController
- (BOOL)_canHideToolbar;
- (BOOL)_canShowScribble;
- (BOOL)_canShowWebsiteSettings;
- (BOOL)_canToggleAdvancedPrivateBrowsingPrivacyProtections;
- (BOOL)_canToggleBetweenDesktopAndMobileSite;
- (BOOL)_canToggleContentBlockers;
- (BOOL)_canTogglePrivateRelay;
- (BOOL)_hasExtensionsAvailableToShowInManageExtensionsView;
- (BOOL)_hasStartedTranslation;
- (BOOL)_isActiveTabPausedOrPlaying;
- (BOOL)_isSiriReaderCurrentlyActive;
- (BOOL)_presentBrowsingAssistantFromViewController:(id)a3 withSourceInfo:(id)a4 fromSafariViewController:(BOOL)a5;
- (BOOL)_shouldEnableDownloadsAlert;
- (BOOL)_shouldLaunchFeedbackAppForScribble;
- (BOOL)_shouldShowItemForAction:(id)a3;
- (BOOL)_shouldShowScribbleFeedbackButton;
- (BOOL)_shouldShowUnviewedFinishedDownloadsIndicator;
- (BOOL)presentMenuFromViewController:(id)a3 withSourceInfo:(id)a4 fromSafariViewController:(BOOL)a5;
- (BOOL)stepperIsInTransitionView;
- (NSArray)cardItems;
- (SFBrowsingAssistantMenuSection)settingsSection;
- (UIViewController)viewController;
- (_SFBrowserContentController)browserContentController;
- (_SFPageFormatMenuController)initWithBrowserContentController:(id)a3;
- (_SFPageFormatMenuUIMenuBuilder)uiMenuBuilder;
- (_SFSettingsAlertItem)readerAlertItem;
- (id)_advancedPrivateBrowsingPrivacyProtectionsAlertItem;
- (id)_clearEditsAlertItem;
- (id)_consentCard;
- (id)_contentBlockerManager;
- (id)_contentBlockersToggleAlertItem;
- (id)_desktopMobileToggleAlertItemWithOrientation:(int64_t)a3;
- (id)_downloadsAlertItem;
- (id)_downloadsSection;
- (id)_effectiveScribbleItems;
- (id)_endListeningToSiriReaderAlertItem;
- (id)_entityItems;
- (id)_exitTranslationAlertItem;
- (id)_extensionItems;
- (id)_extensionsSection;
- (id)_fullScreenAlertItem;
- (id)_internalTapToRadarTranslationAlertItem;
- (id)_itemForAction:(id)a3;
- (id)_listenToPageCard;
- (id)_listeningControlsAlertItem;
- (id)_localizedStringOfRunningDownloads;
- (id)_makeItemForAction:(id)a3;
- (id)_manageExtensionsAlertItem;
- (id)_mediaStateAlertItem;
- (id)_moreControlsAlertItem;
- (id)_pageZoomAlertItem;
- (id)_pauseAllAnimationsAlertItem;
- (id)_playAllAnimationsAlertItem;
- (id)_playbackRateAlertItem;
- (id)_playbackStateAndPositionAlertItem;
- (id)_privateRelayToggleAlertItem;
- (id)_readerAlertItem;
- (id)_readerCard;
- (id)_readerFontAlertItem;
- (id)_readerOptionsCard;
- (id)_readerTextSizeAlertItem;
- (id)_readerThemeAlertItem;
- (id)_reportScribbleIssueItem;
- (id)_scribbleAlertItem;
- (id)_siriReaderAlertItem;
- (id)_siriReaderAlertItemWithState:(int64_t)a3 identifier:(id)a4;
- (id)_titleForPlaybackState:(int64_t)a3;
- (id)_translateAlertItemForLocaleIdentifier:(id)a3;
- (id)_userFeedbackAutofillAlertItem;
- (id)_userFeedbackTranslationAlertItem;
- (id)_webExtensionsController;
- (id)_websiteSettingsAlertItem;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)menuForOrientation:(int64_t)a3 sourceInfo:(id)a4;
- (id)moreMenuSectionsForEditMode:(BOOL)a3;
- (id)primaryMenuSectionsForEditMode:(BOOL)a3 inFirstLevelMenu:(BOOL)a4;
- (id)viewControllerForPresentationForItemController:(id)a3;
- (int64_t)_deviceOrientation;
- (unint64_t)_listenToPageActionStateForActiveTab;
- (void)_anchorInWindowCoordinatesForAlert:(id)a3;
- (void)_buildTranslationAlertItemsWithSourceInfo:(id)a3;
- (void)_clearCachedCardItems;
- (void)_clearCachedItems;
- (void)_constructMenuForAlert:(id)a3 orientation:(int64_t)a4;
- (void)_didFinishLastDownload:(id)a3;
- (void)_didTapButtonInStepper:(id)a3;
- (void)_donateSummaryPresentationStartedIfNeeded;
- (void)_enableListenToPageButtonForCard:(id)a3;
- (void)_hasUnviewedDownloadsDidChange:(id)a3;
- (void)_readerAvailabilityDidChange:(id)a3;
- (void)_totalProgressDidChange:(id)a3;
- (void)_translationAvailabilityDidChange:(id)a3;
- (void)_updateDownloadsAlertItem:(id)a3;
- (void)browsingAssistant:(id)a3 presentMoreMenu:(id)a4;
- (void)browsingAssistantWillAppear:(id)a3;
- (void)browsingAssistantWillDisappear:(id)a3;
- (void)configureMainHeaderFooter:(id)a3;
- (void)didReportUserResponseFeedback:(id)a3;
- (void)dismissMenu;
- (void)presentModalViewController:(id)a3 completion:(id)a4;
- (void)reloadAlert;
- (void)reloadBrowsingAssistantIfNeeded;
- (void)updateReaderCardWithSummaryIfNeeded;
- (void)updateShouldShowListeningControls:(BOOL)a3;
@end

@implementation _SFPageFormatMenuController

- (_SFPageFormatMenuController)initWithBrowserContentController:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPageFormatMenuController;
  v5 = [(_SFPageFormatMenuController *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_browserContentController, v4);
    v7 = (WBUFeatureManager *)objc_alloc_init(MEMORY[0x1E4FB6EE0]);
    featureManager = v6->_featureManager;
    v6->_featureManager = v7;

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v6 selector:sel__readerAvailabilityDidChange_ name:@"readerAvailabilityDidChange" object:0];
    [v9 addObserver:v6 selector:sel__translationAvailabilityDidChange_ name:*MEMORY[0x1E4F99728] object:0];
    [v9 addObserver:v6 selector:sel__totalProgressDidChange_ name:@"_SFDownloadManagerTotalProgressDidChangeNotification" object:0];
    [v9 addObserver:v6 selector:sel__didFinishLastDownload_ name:@"_SFDownloadManagerDidFinishLastDownloadNotification" object:0];
    [v9 addObserver:v6 selector:sel__hasUnviewedDownloadsDidChange_ name:@"_SFDownloadManagerHasUnviewedDownloadsDidChangeNotification" object:0];
    v10 = v6;
  }
  return v6;
}

- (id)_webExtensionsController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  v3 = [WeakRetained activeDocument];
  id v4 = [v3 webExtensionsController];

  return v4;
}

- (id)_contentBlockerManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  v3 = [WeakRetained activeDocument];
  id v4 = [v3 contentBlockerManager];

  return v4;
}

- (BOOL)_presentBrowsingAssistantFromViewController:(id)a3 withSourceInfo:(id)a4 fromSafariViewController:(BOOL)a5
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  id v10 = objc_loadWeakRetained((id *)&self->_viewController);
  v29 = [v10 presentingViewController];

  if (v29)
  {
    if ([v10 stepperFocused]) {
      [v10 setStepperFocused:0];
    }
    else {
      [v10 dismissViewControllerAnimated:1 completion:0];
    }
  }
  else
  {
    [(_SFPageFormatMenuController *)self _clearCachedItems];
    id v11 = objc_alloc(MEMORY[0x1E4F78200]);
    objc_super v12 = [WeakRetained activeDocument];
    v13 = objc_msgSend(v11, "initWithShowingOnStartPage:", objc_msgSend(v12, "isShowingSystemStartPage"));

    [v13 setDataSource:self];
    [v13 setDelegate:self];
    [v13 setModalPresentationStyle:7];
    id val = v13;
    v14 = [v13 popoverPresentationController];
    if (objc_opt_respondsToSelector()) {
      uint64_t v15 = [v8 permittedArrowDirections];
    }
    else {
      uint64_t v15 = 1;
    }
    [v14 setPermittedArrowDirections:v15];
    v16 = [[_SFPopoverPresentationDelegate alloc] initWithSourceInfo:v8];
    [(_SFPopoverPresentationDelegate *)v16 setNestsAdaptiveSheetPresentationInNavigationController:0];
    v25 = v16;
    [(_SFPopoverPresentationDelegate *)v16 attachToPopoverPresentationController:v14];
    v17 = [v7 view];
    v27 = [v17 window];
    v18 = [v27 windowScene];
    v19 = _SFContextInfoWithComment();
    location[1] = (id)MEMORY[0x1E4F143A8];
    location[2] = (id)3221225472;
    location[3] = __115___SFPageFormatMenuController__presentBrowsingAssistantFromViewController_withSourceInfo_fromSafariViewController___block_invoke;
    location[4] = &unk_1E5C763A0;
    id v33 = v8;
    id v26 = v14;
    id v34 = v26;
    _SFPopoverSourceInfoUnwrap();

    v20 = [v26 adaptiveSheetPresentationController];
    objc_initWeak(location, val);
    v21 = (void *)MEMORY[0x1E4FB1C30];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __115___SFPageFormatMenuController__presentBrowsingAssistantFromViewController_withSourceInfo_fromSafariViewController___block_invoke_4;
    v30[3] = &unk_1E5C763E8;
    objc_copyWeak(&v31, location);
    v22 = [v21 customDetentWithIdentifier:0 resolver:v30];
    v35[0] = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
    [v20 setDetents:v23];

    [v20 setPrefersGrabberVisible:1];
    objc_storeWeak((id *)&self->_viewController, val);
    [v7 presentViewController:val animated:1 completion:0];
    [WeakRetained clearBadgeOnPageFormatMenu];
    *(_WORD *)&self->_didDonateVisualPresentationSummaryToBiome = 0;

    objc_destroyWeak(&v31);
    objc_destroyWeak(location);
  }
  return v29 == 0;
}

- (BOOL)presentMenuFromViewController:(id)a3 withSourceInfo:(id)a4 fromSafariViewController:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if ([MEMORY[0x1E4F98AF8] isBrowsingAssistantEnabled])
  {
    BOOL v10 = [(_SFPageFormatMenuController *)self _presentBrowsingAssistantFromViewController:v8 withSourceInfo:v9 fromSafariViewController:v5];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    objc_super v12 = [WeakRetained presentingViewController];

    if (v12)
    {
      id v13 = objc_loadWeakRetained((id *)&self->_viewController);
      v14 = [v13 focusedItem];

      if (v14) {
        [v13 setFocusedItem:0];
      }
      else {
        [v13 dismissViewControllerAnimated:1 completion:0];
      }

      BOOL v10 = 0;
    }
    else
    {
      uint64_t v15 = [v8 view];
      v16 = [v15 window];
      v17 = [v16 windowScene];
      v18 = -[_SFPageFormatMenuController menuForOrientation:sourceInfo:](self, "menuForOrientation:sourceInfo:", [v17 interfaceOrientation], v9);

      objc_msgSend(v18, "setUsesReverseOrder:", objc_msgSend(v9, "permittedArrowDirections") == 2);
      objc_msgSend(v18, "setProvenance:", objc_msgSend(v9, "provenance"));
      [v18 setModalPresentationStyle:7];
      v19 = [v18 view];
      [v19 setAccessibilityIdentifier:@"PageFormatMenu"];

      v20 = [[_SFPopoverPresentationDelegate alloc] initWithSourceInfo:v9];
      [(_SFPopoverPresentationDelegate *)v20 setPopoverUsesAdaptivePresentationInCompact:0];
      v21 = [v18 popoverPresentationController];
      id v34 = v20;
      [(_SFPopoverPresentationDelegate *)v20 attachToPopoverPresentationController:v21];
      objc_msgSend(v21, "_setShouldHideArrow:", objc_msgSend(v9, "shouldHideArrow"));
      if ([v9 shouldPassthroughSuperview]) {
        [v21 _setPreferredHorizontalAlignment:1];
      }
      if (objc_opt_respondsToSelector()) {
        uint64_t v22 = [v9 permittedArrowDirections];
      }
      else {
        uint64_t v22 = 1;
      }
      [v21 setPermittedArrowDirections:v22];
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v24 = [v8 view];
      v25 = [v24 window];
      id v26 = [v25 windowScene];
      _SFContextInfoWithComment();
      v27 = id v33 = v21;
      v35 = v23;
      location = (id *)&self->_viewController;
      id v36 = v9;
      v37 = v18;
      id v28 = v18;
      id v29 = v23;
      _SFPopoverSourceInfoUnwrap();

      BOOL v10 = 1;
      [v8 presentViewController:v28 animated:1 completion:0];
      id v30 = objc_loadWeakRetained((id *)&self->_browserContentController);
      [v30 clearBadgeOnPageFormatMenu];

      objc_storeWeak(location, v28);
    }
  }

  return v10;
}

- (id)menuForOrientation:(int64_t)a3 sourceInfo:(id)a4
{
  v6 = objc_alloc_init(_SFSettingsAlertController);
  [(_SFPageFormatMenuController *)self _constructMenuForAlert:v6 orientation:a3];

  return v6;
}

- (void)_constructMenuForAlert:(id)a3 orientation:(int64_t)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  id v8 = [WeakRetained activeDocument];
  int v9 = [WeakRetained isShowingReader];
  if ([WeakRetained shouldShowListeningControls])
  {
    BOOL v10 = [(_SFPageFormatMenuController *)self _endListeningToSiriReaderAlertItem];
    [v6 addItem:v10];

    if (![(_SFPageFormatMenuController *)self _isActiveTabPausedOrPlaying])
    {
      id v11 = [(_SFPageFormatMenuController *)self _siriReaderAlertItem];
      [v6 addItem:v11];
    }
    [v6 addDivider];
    objc_super v12 = [(_SFPageFormatMenuController *)self _playbackStateAndPositionAlertItem];
    [v6 addItem:v12];

    id v13 = [(_SFPageFormatMenuController *)self _playbackRateAlertItem];
    [v6 addItem:v13];

    [v6 addDivider];
    uint64_t v14 = [(_SFPageFormatMenuController *)self _moreControlsAlertItem];
    goto LABEL_5;
  }
  if (v9) {
    [(_SFPageFormatMenuController *)self _readerTextSizeAlertItem];
  }
  else {
  v16 = [(_SFPageFormatMenuController *)self _pageZoomAlertItem];
  }
  [v6 addItem:v16];

  v17 = [(_SFPageFormatMenuController *)self _readerAlertItem];
  readerAlertItem = self->_readerAlertItem;
  self->_readerAlertItem = v17;

  if (v9)
  {
    uint64_t v19 = 1;
  }
  else
  {
    v20 = [v8 readerContext];
    uint64_t v19 = [v20 isReaderAvailable];
  }
  [(_SFSettingsAlertItem *)self->_readerAlertItem setEnabled:v19];
  [v6 addItem:self->_readerAlertItem];
  if ([MEMORY[0x1E4F98AF8] isSiriReadThisEnabled]
    && [WeakRetained supportsSiriReadThis])
  {
    if ([(_SFPageFormatMenuController *)self _isSiriReaderCurrentlyActive]) {
      [(_SFPageFormatMenuController *)self _listeningControlsAlertItem];
    }
    else {
    v21 = [(_SFPageFormatMenuController *)self _siriReaderAlertItem];
    }
    [v6 addItem:v21];
  }
  if ((v9 & 1) == 0)
  {
    if (([WeakRetained hasDedicatedMediaStateButton] & 1) == 0 && objc_msgSend(v8, "mediaStateIcon"))
    {
      [v6 addDivider];
      uint64_t v22 = [(_SFPageFormatMenuController *)self _mediaStateAlertItem];
      [v6 addItem:v22];
    }
    v55 = v8;
    int64_t v23 = a4;
    if (([WeakRetained hasDedicatedDownloadsToolbarItem] & 1) == 0
      && [(_SFPageFormatMenuController *)self _shouldEnableDownloadsAlert])
    {
      [v6 addDivider];
      v24 = [(_SFPageFormatMenuController *)self _downloadsAlertItem];
      downloadsAlertItem = self->_downloadsAlertItem;
      self->_downloadsAlertItem = v24;

      [v6 addItem:self->_downloadsAlertItem];
    }
    [v6 addDivider];
    id v26 = objc_msgSend(v6, "safari_popoverSourceInfo");
    [(_SFPageFormatMenuController *)self _buildTranslationAlertItemsWithSourceInfo:v26];

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v27 = self->_translationAlertItems;
    uint64_t v28 = [(NSArray *)v27 countByEnumeratingWithState:&v60 objects:v65 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v61 != v30) {
            objc_enumerationMutation(v27);
          }
          [v6 addItem:*(void *)(*((void *)&v60 + 1) + 8 * i)];
        }
        uint64_t v29 = [(NSArray *)v27 countByEnumeratingWithState:&v60 objects:v65 count:16];
      }
      while (v29);
    }

    a4 = v23;
    id v8 = v55;
  }
  if ([(_SFPageFormatMenuController *)self _canShowWebsiteSettings]
    && [MEMORY[0x1E4F98AF8] isInternalInstall])
  {
    [v6 addDivider];
    v32 = [(_SFPageFormatMenuController *)self _userFeedbackAutofillAlertItem];
    [v6 addItem:v32];
  }
  [v6 addDivider];
  if ((v19 & 1) == 0)
  {
    id v33 = [v8 readerContext];
    [v33 checkReaderAvailability];
  }
  if (v9)
  {
    id v34 = [(_SFPageFormatMenuController *)self _readerFontAlertItem];
    [v6 addItem:v34];

    uint64_t v35 = [(_SFPageFormatMenuController *)self _readerThemeAlertItem];
LABEL_50:
    v40 = (void *)v35;
    [v6 addItem:v35];

    goto LABEL_51;
  }
  if ([(_SFPageFormatMenuController *)self _canHideToolbar])
  {
    id v36 = [(_SFPageFormatMenuController *)self _fullScreenAlertItem];
    [v6 addItem:v36];
  }
  if ([(_SFPageFormatMenuController *)self _canToggleBetweenDesktopAndMobileSite])
  {
    v37 = [(_SFPageFormatMenuController *)self _desktopMobileToggleAlertItemWithOrientation:a4];
    [v6 addItem:v37];
  }
  if ([(_SFPageFormatMenuController *)self _canToggleContentBlockers])
  {
    v38 = [(_SFPageFormatMenuController *)self _contentBlockersToggleAlertItem];
    [v6 addItem:v38];
  }
  if ([(_SFPageFormatMenuController *)self _canToggleAdvancedPrivateBrowsingPrivacyProtections])
  {
    v39 = [(_SFPageFormatMenuController *)self _advancedPrivateBrowsingPrivacyProtectionsAlertItem];
    [v6 addItem:v39];
  }
  if ([(_SFPageFormatMenuController *)self _canTogglePrivateRelay])
  {
    uint64_t v35 = [(_SFPageFormatMenuController *)self _privateRelayToggleAlertItem];
    goto LABEL_50;
  }
LABEL_51:
  [v6 addDivider];
  if ([(_SFPageFormatMenuController *)self _canShowWebsiteSettings])
  {
    v41 = [(_SFPageFormatMenuController *)self _websiteSettingsAlertItem];
    [v6 addItem:v41];
  }
  if ((([WeakRetained supportsPrivacyReport] ^ 1 | v9) & 1) == 0)
  {
    v42 = [_SFPageFormatMenuPrivacyReportController alloc];
    v43 = [WeakRetained activeDocument];
    v44 = [(_SFPageFormatMenuPrivacyReportController *)v42 initWithDocument:v43];

    [(_SFPageFormatMenuPrivacyReportController *)v44 setDelegate:self];
    v45 = [(_SFPageFormatMenuPrivacyReportController *)v44 alertItem];
    [v6 addItem:v45];
  }
  if ((v9 & 1) == 0)
  {
    if (([WeakRetained hasDedicatedExtensionsButton] & 1) == 0)
    {
      BOOL v46 = [(_SFPageFormatMenuController *)self _hasExtensionsAvailableToShowInManageExtensionsView];
      if (v46) {
        [v6 addDivider];
      }
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      v47 = [(_SFPageFormatMenuController *)self _extensionItems];
      uint64_t v48 = [v47 countByEnumeratingWithState:&v56 objects:v64 count:16];
      if (v48)
      {
        uint64_t v49 = v48;
        uint64_t v50 = *(void *)v57;
        do
        {
          for (uint64_t j = 0; j != v49; ++j)
          {
            if (*(void *)v57 != v50) {
              objc_enumerationMutation(v47);
            }
            [v6 addItem:*(void *)(*((void *)&v56 + 1) + 8 * j)];
          }
          uint64_t v49 = [v47 countByEnumeratingWithState:&v56 objects:v64 count:16];
        }
        while (v49);
      }

      if (v46)
      {
        v52 = [(_SFPageFormatMenuController *)self _manageExtensionsAlertItem];
        [v6 addItem:v52];
      }
    }
    if (WBSAXShouldShowAnimatedImageControls()
      && [MEMORY[0x1E4F466F0] instancesRespondToSelector:sel__pauseAllAnimationsWithCompletionHandler_])
    {
      [v6 addDivider];
      v53 = [v8 activeWebView];
      int v54 = [v53 _allowsAnyAnimationToPlay];

      if (v54) {
        [(_SFPageFormatMenuController *)self _pauseAllAnimationsAlertItem];
      }
      else {
      uint64_t v14 = [(_SFPageFormatMenuController *)self _playAllAnimationsAlertItem];
      }
LABEL_5:
      uint64_t v15 = (void *)v14;
      [v6 addItem:v14];
    }
  }
}

- (BOOL)_hasExtensionsAvailableToShowInManageExtensionsView
{
  v3 = [(_SFPageFormatMenuController *)self _webExtensionsController];
  if ([v3 loadEnabledExtensionsWasCalled])
  {
    id v4 = [(_SFPageFormatMenuController *)self _contentBlockerManager];
    BOOL v5 = [v3 extensions];
    if ([v5 count])
    {
      BOOL v6 = 1;
    }
    else
    {
      id v7 = [v4 extensions];
      BOOL v6 = [v7 count] != 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_extensionItems
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  id v4 = [(_SFPageFormatMenuController *)self _webExtensionsController];
  BOOL v5 = [WeakRetained activeDocument];
  uint64_t v6 = [v5 isPrivateBrowsingEnabled];

  id v7 = [v4 enabledExtensionsWithPrivateBrowsingEnabled:v6];
  id v8 = [WeakRetained activeTabForExtensions];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __46___SFPageFormatMenuController__extensionItems__block_invoke;
  v13[3] = &unk_1E5C76438;
  id v14 = v4;
  id v15 = v8;
  id v9 = v8;
  id v10 = v4;
  id v11 = objc_msgSend(v7, "safari_mapAndFilterObjectsUsingBlock:", v13);

  return v11;
}

- (id)_siriReaderAlertItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  id v26 = [WeakRetained activeDocument];
  id v4 = [v26 readerContext];
  BOOL v5 = [MEMORY[0x1E4F78368] sharedVoiceUtilities];
  uint64_t v6 = [v5 activeSiriReaderSessionIdentifier];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [MEMORY[0x1E4F78368] sharedVoiceUtilities];
    id v9 = [v8 activeSiriReaderSessionURL];
    id v10 = v4;
    id v11 = [v4 readerURL];
    char v12 = [v9 isEqual:v11];

    if (v12)
    {
      id v13 = [MEMORY[0x1E4F78368] sharedVoiceUtilities];
      uint64_t v14 = [v13 activeSiriReaderSessionIdentifier];
      goto LABEL_6;
    }
  }
  else
  {
    id v10 = v4;
  }
  id v13 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v14 = [v13 UUIDString];
LABEL_6:
  id v15 = (void *)v14;

  v16 = [(_SFPageFormatMenuController *)self _siriReaderAlertItemWithState:0 identifier:v15];
  cachedSiriReaderAlertItem = self->_cachedSiriReaderAlertItem;
  self->_cachedSiriReaderAlertItem = v16;

  [(_SFSettingsAlertItem *)self->_cachedSiriReaderAlertItem setEnabled:0];
  objc_initWeak(&location, self);
  v18 = [MEMORY[0x1E4F78360] sharedPlaybackController];
  uint64_t v19 = MEMORY[0x1E4F14428];
  id v20 = MEMORY[0x1E4F14428];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __51___SFPageFormatMenuController__siriReaderAlertItem__block_invoke;
  v27[3] = &unk_1E5C76460;
  id v21 = WeakRetained;
  id v28 = v21;
  objc_copyWeak(&v31, &location);
  id v22 = v10;
  id v29 = v22;
  id v23 = v26;
  id v30 = v23;
  [v18 updateContentIdentifierOnQueue:v19 completion:v27];

  v24 = self->_cachedSiriReaderAlertItem;
  objc_destroyWeak(&v31);

  objc_destroyWeak(&location);

  return v24;
}

- (id)_endListeningToSiriReaderAlertItem
{
  v3 = _WBSLocalizedString();
  id v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark"];
  objc_initWeak(&location, self);
  uint64_t v5 = *MEMORY[0x1E4FB28C8];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __65___SFPageFormatMenuController__endListeningToSiriReaderAlertItem__block_invoke;
  id v11 = &unk_1E5C76488;
  objc_copyWeak(&v12, &location);
  uint64_t v6 = +[_SFSettingsAlertItem buttonWithTitle:v3 textStyle:v5 icon:v4 action:33 handler:&v8];
  objc_msgSend(v6, "setAccessibilityIdentifier:", @"EndListening", v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v6;
}

- (id)_moreControlsAlertItem
{
  v3 = _WBSLocalizedString();
  id v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"textformat.size"];
  uint64_t v5 = *MEMORY[0x1E4FB28C8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53___SFPageFormatMenuController__moreControlsAlertItem__block_invoke;
  v8[3] = &unk_1E5C72650;
  v8[4] = self;
  uint64_t v6 = +[_SFSettingsAlertItem buttonWithTitle:v3 textStyle:v5 icon:v4 action:35 handler:v8];
  [v6 setAccessibilityIdentifier:@"MoreControls"];
  [v6 setKeepsMenuPresented:1];

  return v6;
}

- (id)_listeningControlsAlertItem
{
  v3 = _WBSLocalizedString();
  id v4 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"speaker.wave.2.bubble.left"];
  uint64_t v5 = *MEMORY[0x1E4FB28C8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58___SFPageFormatMenuController__listeningControlsAlertItem__block_invoke;
  v10[3] = &unk_1E5C72650;
  v10[4] = self;
  uint64_t v6 = +[_SFSettingsAlertItem buttonWithTitle:v3 textStyle:v5 icon:v4 action:34 handler:v10];
  [v6 setAccessibilityIdentifier:@"ListeningControls"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  uint64_t v8 = [WeakRetained activeDocument];
  objc_msgSend(v6, "setEnabled:", objc_msgSend(v8, "isBlockedByScreenTime") ^ 1);

  [v6 setKeepsMenuPresented:1];

  return v6;
}

- (id)_playbackRateAlertItem
{
  v2 = _WBSLocalizedString();
  v3 = objc_alloc_init(_SFSiriReaderPlaybackRateController);
  id v4 = +[_SFSettingsAlertItem optionsGroupWithTitle:v2 action:36 subItemAction:37 controller:v3];

  [v4 setAccessibilityIdentifier:@"PlaybackRate"];

  return v4;
}

- (id)_playbackStateAndPositionAlertItem
{
  v3 = objc_alloc_init(_SFSiriReaderPlaybackPositionAndStateController);
  id v4 = +[_SFSettingsAlertItem stepperWithController:v3 action:38 handler:0];

  [v4 setAccessibilityIdentifier:@"PlaybackStateAndPosition"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  uint64_t v6 = [WeakRetained activeDocument];
  objc_msgSend(v4, "setEnabled:", objc_msgSend(v6, "isBlockedByScreenTime") ^ 1);

  return v4;
}

- (void)reloadAlert
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  v3 = [WeakRetained presentingViewController];

  if (v3)
  {
    [WeakRetained removeAllItems];
    id v4 = [WeakRetained view];
    uint64_t v5 = [v4 window];
    uint64_t v6 = [v5 windowScene];
    -[_SFPageFormatMenuController _constructMenuForAlert:orientation:](self, "_constructMenuForAlert:orientation:", WeakRetained, [v6 interfaceOrientation]);

    [WeakRetained resizeMenu];
  }
}

- (void)dismissMenu
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  v2 = [WeakRetained presentingViewController];

  if (v2)
  {
    v3 = [WeakRetained presentingViewController];
    [v3 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_readerAvailabilityDidChange:(id)a3
{
  id v12 = a3;
  id v4 = [v12 object];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  uint64_t v6 = [WeakRetained activeDocument];
  id v7 = [v6 readerContext];

  uint64_t v8 = v12;
  if (v4 == v7)
  {
    uint64_t v9 = [v12 userInfo];
    id v10 = [v9 objectForKeyedSubscript:@"isAvailable"];
    int v11 = [v10 BOOLValue];

    if (v11) {
      [(_SFSettingsAlertItem *)self->_readerAlertItem setEnabled:1];
    }

    uint64_t v8 = v12;
  }
}

- (_SFSettingsAlertItem)readerAlertItem
{
  return self->_readerAlertItem;
}

- (id)_readerAlertItem
{
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  int v4 = [WeakRetained isShowingReader];

  uint64_t v5 = _WBSLocalizedString();
  if (v4) {
    [MEMORY[0x1E4FB1818] systemImageNamed:@"safari"];
  }
  else {
  uint64_t v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.plaintext"];
  }
  uint64_t v7 = *MEMORY[0x1E4FB28C8];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __47___SFPageFormatMenuController__readerAlertItem__block_invoke;
  id v13 = &unk_1E5C76488;
  objc_copyWeak(&v14, &location);
  uint64_t v8 = +[_SFSettingsAlertItem buttonWithTitle:v5 textStyle:v7 icon:v6 action:5 handler:&v10];
  objc_msgSend(v8, "setAccessibilityIdentifier:", @"HideReaderViewButton", v10, v11, v12, v13);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);

  return v8;
}

- (BOOL)_isActiveTabPausedOrPlaying
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  uint64_t v3 = [WeakRetained siriReaderPlaybackStateForActiveTab];

  return (unint64_t)(v3 - 1) < 2;
}

- (BOOL)_isSiriReaderCurrentlyActive
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  uint64_t v3 = [WeakRetained siriReaderPlaybackStateForActiveTab];

  int v4 = [MEMORY[0x1E4F78360] sharedPlaybackController];
  uint64_t v5 = [v4 currentPlaybackState];

  return (unint64_t)(v5 - 1) < 2 && v3 != 3;
}

- (void)updateShouldShowListeningControls:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  if ([(_SFPageFormatMenuController *)self _isActiveTabPausedOrPlaying])
  {
    if (!v3)
    {
LABEL_8:
      uint64_t v6 = 0;
      goto LABEL_9;
    }
LABEL_6:
    if ([MEMORY[0x1E4F98AF8] isSiriReadThisEnabled])
    {
      uint64_t v6 = [WeakRetained supportsSiriReadThis];
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  BOOL v5 = [(_SFPageFormatMenuController *)self _isSiriReaderCurrentlyActive];
  uint64_t v6 = 0;
  if (v5 && v3) {
    goto LABEL_6;
  }
LABEL_9:
  [WeakRetained setShouldShowListeningControls:v6];
}

- (id)_titleForPlaybackState:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 2 && a3 != 1)
  {
    BOOL v3 = [MEMORY[0x1E4F78360] sharedPlaybackController];
    [v3 currentPlaybackState];
  }
  int v4 = _WBSLocalizedString();

  return v4;
}

- (id)_siriReaderAlertItemWithState:(int64_t)a3 identifier:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  uint64_t v7 = [(_SFPageFormatMenuController *)self _titleForPlaybackState:a3];
  uint64_t v8 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"speaker.wave.2.bubble.left"];
  uint64_t v9 = *MEMORY[0x1E4FB28C8];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72___SFPageFormatMenuController__siriReaderAlertItemWithState_identifier___block_invoke;
  v13[3] = &unk_1E5C72650;
  id v14 = WeakRetained;
  id v10 = WeakRetained;
  uint64_t v11 = +[_SFSettingsAlertItem buttonWithTitle:v7 textStyle:v9 icon:v8 action:32 handler:v13];
  [v11 setAccessibilityIdentifier:@"ActivateSiriReader"];

  return v11;
}

- (id)_mediaStateAlertItem
{
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  int v4 = [WeakRetained activeDocument];
  [v4 mediaStateIcon];

  BOOL v5 = SFTitleForTogglingMediaStateIcon();
  uint64_t v6 = (void *)MEMORY[0x1E4FB1818];
  uint64_t v7 = SFSystemImageNameForTogglingMediaStateIcon();
  uint64_t v8 = [v6 systemImageNamed:v7];

  uint64_t v9 = *MEMORY[0x1E4FB28C8];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __51___SFPageFormatMenuController__mediaStateAlertItem__block_invoke;
  v16 = &unk_1E5C76488;
  objc_copyWeak(&v17, &location);
  id v10 = +[_SFSettingsAlertItem buttonWithTitle:v5 textStyle:v9 icon:v8 action:9 handler:&v13];
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4FB1618], "systemRedColor", v13, v14, v15, v16);
  [v10 setTintColor:v11];

  [v10 setAccessibilityIdentifier:@"ToggleMediaState"];
  objc_destroyWeak(&v17);

  objc_destroyWeak(&location);

  return v10;
}

- (id)_downloadsAlertItem
{
  objc_initWeak(&location, self);
  BOOL v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.down.circle"];
  int v4 = _WBSLocalizedString();
  uint64_t v5 = *MEMORY[0x1E4FB28C8];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __50___SFPageFormatMenuController__downloadsAlertItem__block_invoke;
  id v12 = &unk_1E5C76488;
  objc_copyWeak(&v13, &location);
  uint64_t v6 = +[_SFSettingsAlertItem buttonWithTitle:v4 textStyle:v5 icon:v3 action:10 handler:&v9];

  objc_msgSend(v6, "setAccessibilityIdentifier:", @"ShowDownloads", v9, v10, v11, v12);
  [(_SFPageFormatMenuController *)self _updateDownloadsAlertItem:v6];
  uint64_t v7 = +[_SFPageFormatMenuBadgeView defaultComponentsArrangement];
  [v6 setComponentsArrangement:v7];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v6;
}

- (void)_updateDownloadsAlertItem:(id)a3
{
  id v19 = a3;
  int v4 = [v19 isEnabled];
  int v5 = [v19 showsIndicatorDot];
  uint64_t v6 = [v19 badgeText];
  uint64_t v7 = +[_SFDownloadManager sharedManager];
  uint64_t v8 = [v7 runningDownloadsCount];

  if (v8)
  {
    uint64_t v9 = [v19 badgeView];

    if (v9)
    {
      uint64_t v10 = [v19 badgeView];
      uint64_t v11 = [(_SFPageFormatMenuController *)self _localizedStringOfRunningDownloads];
      [v10 setBadgeText:v11];
    }
    else
    {
      id v12 = [_SFPageFormatMenuBadgeView alloc];
      id v13 = [(_SFPageFormatMenuController *)self _localizedStringOfRunningDownloads];
      uint64_t v14 = [(_SFPageFormatMenuBadgeView *)v12 initWithText:v13];
      [v19 setBadgeView:v14];
    }
  }
  else
  {
    objc_msgSend(v19, "setShowsIndicatorDot:", -[_SFPageFormatMenuController _shouldShowUnviewedFinishedDownloadsIndicator](self, "_shouldShowUnviewedFinishedDownloadsIndicator"));
    [v19 setBadgeView:0];
  }
  objc_msgSend(v19, "setEnabled:", -[_SFPageFormatMenuController _shouldEnableDownloadsAlert](self, "_shouldEnableDownloadsAlert"));
  id v15 = +[_SFDownloadManager sharedManager];
  if ([v15 runningDownloadsCount])
  {
    v16 = [(_SFPageFormatMenuController *)self _localizedStringOfRunningDownloads];
    [v19 setBadgeText:v16];
  }
  else
  {
    [v19 setBadgeText:0];
  }

  if (v4 != [v19 isEnabled]
    || v5 != [v19 showsIndicatorDot]
    || ([v19 badgeText],
        id v17 = objc_claimAutoreleasedReturnValue(),
        char v18 = WBSIsEqual(),
        v17,
        (v18 & 1) == 0))
  {
    [v19 notifyObserversItemDidUpdate];
  }
}

- (id)_localizedStringOfRunningDownloads
{
  v2 = NSString;
  BOOL v3 = +[_SFDownloadManager sharedManager];
  int v4 = objc_msgSend(v2, "localizedStringWithFormat:", @"%zu", objc_msgSend(v3, "runningDownloadsCount"));

  return v4;
}

- (BOOL)_shouldEnableDownloadsAlert
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  BOOL v3 = [WeakRetained downloadsCount] != 0;

  return v3;
}

- (BOOL)_shouldShowUnviewedFinishedDownloadsIndicator
{
  BOOL v3 = +[_SFDownloadManager sharedManager];
  if ([v3 runningDownloadsCount])
  {
    char v4 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
    char v4 = [WeakRetained hasUnviewedDownloads];
  }
  return v4;
}

- (void)_totalProgressDidChange:(id)a3
{
}

- (void)_didFinishLastDownload:(id)a3
{
}

- (void)_hasUnviewedDownloadsDidChange:(id)a3
{
}

- (id)_desktopMobileToggleAlertItemWithOrientation:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  int v5 = [WeakRetained activeDocument];

  uint64_t v6 = [v5 reloadOptionsController];
  uint64_t v7 = [v5 webView];
  uint64_t v8 = [v7 URL];
  objc_msgSend(v6, "setSupportsAdvancedPrivacyProtections:", objc_msgSend(v5, "supportsAdvancedPrivacyProtectionsForURL:", v8));

  int v9 = [v6 loadedUsingDesktopUserAgent];
  uint64_t v10 = _WBSLocalizedString();
  objc_msgSend(MEMORY[0x1E4FB1818], "safari_currentDeviceImageNameForOrientation:", a3);
  uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v9) {
    id v12 = v11;
  }
  else {
    id v12 = @"desktopcomputer";
  }
  id v13 = [MEMORY[0x1E4FB1818] _systemImageNamed:v12];
  uint64_t v14 = *MEMORY[0x1E4FB28C8];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  id v20 = __76___SFPageFormatMenuController__desktopMobileToggleAlertItemWithOrientation___block_invoke;
  id v21 = &unk_1E5C764B0;
  char v23 = v9;
  id v22 = v6;
  id v15 = v6;
  v16 = +[_SFSettingsAlertItem buttonWithTitle:v10 textStyle:v14 icon:v13 action:18 handler:&v18];
  objc_msgSend(v16, "setAccessibilityIdentifier:", @"ToggleDesktopMobileWebsite", v18, v19, v20, v21);

  return v16;
}

- (id)_pauseAllAnimationsAlertItem
{
  BOOL v3 = _WBSLocalizedString();
  char v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"pause.circle"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  uint64_t v6 = [WeakRetained activeDocument];
  uint64_t v7 = [v6 activeWebView];

  uint64_t v8 = *MEMORY[0x1E4FB28C8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59___SFPageFormatMenuController__pauseAllAnimationsAlertItem__block_invoke;
  v12[3] = &unk_1E5C72650;
  id v13 = v7;
  id v9 = v7;
  uint64_t v10 = +[_SFSettingsAlertItem buttonWithTitle:v3 textStyle:v8 icon:v4 action:30 handler:v12];
  [v10 setAccessibilityIdentifier:@"PauseAllAnimationsAlertItem"];

  return v10;
}

- (id)_playAllAnimationsAlertItem
{
  BOOL v3 = _WBSLocalizedString();
  char v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"play.circle"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  uint64_t v6 = [WeakRetained activeDocument];
  uint64_t v7 = [v6 activeWebView];

  uint64_t v8 = *MEMORY[0x1E4FB28C8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58___SFPageFormatMenuController__playAllAnimationsAlertItem__block_invoke;
  v12[3] = &unk_1E5C72650;
  id v13 = v7;
  id v9 = v7;
  uint64_t v10 = +[_SFSettingsAlertItem buttonWithTitle:v3 textStyle:v8 icon:v4 action:31 handler:v12];
  [v10 setAccessibilityIdentifier:@"PlayAllAnimationsAlertItem"];

  return v10;
}

- (id)_fullScreenAlertItem
{
  BOOL v3 = _WBSLocalizedString();
  uint64_t v4 = *MEMORY[0x1E4FB28C8];
  int v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.up.left.and.arrow.down.right"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51___SFPageFormatMenuController__fullScreenAlertItem__block_invoke;
  v8[3] = &unk_1E5C72650;
  v8[4] = self;
  uint64_t v6 = +[_SFSettingsAlertItem buttonWithTitle:v3 textStyle:v4 icon:v5 action:17 handler:v8];

  [v6 setAccessibilityIdentifier:@"HideToolbar"];

  return v6;
}

- (void)_anchorInWindowCoordinatesForAlert:(id)a3
{
  id v13 = [a3 popoverPresentationController];
  BOOL v3 = [v13 sourceView];
  [v13 sourceRect];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [v3 window];
  [v13 setSourceView:v12];
  objc_msgSend(v12, "convertRect:fromView:", v3, v5, v7, v9, v11);
  objc_msgSend(v13, "setSourceRect:");
}

- (void)_buildTranslationAlertItemsWithSourceInfo:(id)a3
{
  id v4 = a3;
  p_translationAlertItems = &self->_translationAlertItems;
  translationAlertItems = self->_translationAlertItems;
  self->_translationAlertItems = 0;

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v8 = [(_SFPageFormatMenuController *)self _userFeedbackTranslationAlertItem];
  [v7 addObject:v8];
  if ([(_SFPageFormatMenuController *)self _hasStartedTranslation])
  {
    double v9 = [(_SFPageFormatMenuController *)self _exitTranslationAlertItem];
    [v7 insertObject:v9 atIndex:0];

    double v10 = [(_SFPageFormatMenuController *)self _internalTapToRadarTranslationAlertItem];
    objc_msgSend(v7, "safari_addObjectUnlessNil:", v10);

    objc_storeStrong((id *)&self->_translationAlertItems, v7);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
    id v12 = [WeakRetained activeDocument];
    id v13 = [v12 translationContext];

    uint64_t v14 = [v13 availableTargetLocaleIdentifiers];
    if ([v14 count])
    {
      [v8 setEnabled:0];
      if ([v14 count] == 1)
      {
        id v15 = [v14 firstObject];
        v16 = [(_SFPageFormatMenuController *)self _translateAlertItemForLocaleIdentifier:v15];
        [v7 insertObject:v16 atIndex:0];

        objc_storeStrong((id *)p_translationAlertItems, v7);
      }
      else if ((unint64_t)[v14 count] >= 2)
      {
        uint64_t v17 = _WBSLocalizedString();
        objc_initWeak(location, v4);
        uint64_t v18 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"translate"];
        uint64_t v21 = *MEMORY[0x1E4FB28C8];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __73___SFPageFormatMenuController__buildTranslationAlertItemsWithSourceInfo___block_invoke;
        v27[3] = &unk_1E5C764F8;
        objc_copyWeak(&v29, location);
        id v19 = v13;
        id v28 = v19;
        id v22 = (void *)v17;
        id v20 = +[_SFSettingsAlertItem buttonWithTitle:v17 textStyle:v21 icon:v18 action:11 handler:v27];

        objc_initWeak(&from, self);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __73___SFPageFormatMenuController__buildTranslationAlertItemsWithSourceInfo___block_invoke_4;
        v23[3] = &unk_1E5C76520;
        objc_copyWeak(&v25, &from);
        id v24 = v19;
        [v20 setSelectionHandler:v23];
        [v20 setAccessibilityIdentifier:@"Translate Website"];
        [v7 insertObject:v20 atIndex:0];
        objc_storeStrong((id *)p_translationAlertItems, v7);

        objc_destroyWeak(&v25);
        objc_destroyWeak(&from);

        objc_destroyWeak(&v29);
        objc_destroyWeak(location);
      }
    }
  }
}

- (id)_translateAlertItemForLocaleIdentifier:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  double v6 = [WeakRetained activeDocument];
  id v7 = [v6 translationContext];

  double v8 = objc_msgSend(MEMORY[0x1E4F1CA20], "safari_displayNameForLocaleIdentifier:", v4);
  double v9 = NSString;
  double v10 = _WBSLocalizedString();
  double v11 = objc_msgSend(v9, "stringWithFormat:", v10, v8);

  uint64_t v12 = *MEMORY[0x1E4FB28C8];
  id v13 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"translate"];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __70___SFPageFormatMenuController__translateAlertItemForLocaleIdentifier___block_invoke;
  v22[3] = &unk_1E5C760F8;
  id v23 = v7;
  id v24 = v4;
  id v14 = v4;
  id v15 = v7;
  v16 = +[_SFSettingsAlertItem buttonWithTitle:v11 textStyle:v12 icon:v13 action:12 handler:v22];

  [v16 setEnabled:0];
  uint64_t v17 = [NSString stringWithFormat:@"Translate-%@", v14];
  [v16 setAccessibilityIdentifier:v17];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __70___SFPageFormatMenuController__translateAlertItemForLocaleIdentifier___block_invoke_2;
  v20[3] = &unk_1E5C72678;
  id v18 = v16;
  id v21 = v18;
  [v15 validateTargetLocale:v14 completionHandler:v20];

  return v18;
}

- (id)_exitTranslationAlertItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  BOOL v3 = [WeakRetained activeDocument];
  id v4 = [v3 translationContext];

  double v5 = _WBSLocalizedString();
  uint64_t v6 = *MEMORY[0x1E4FB28C8];
  id v7 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"translate"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56___SFPageFormatMenuController__exitTranslationAlertItem__block_invoke;
  v11[3] = &unk_1E5C72650;
  id v12 = v4;
  id v8 = v4;
  double v9 = +[_SFSettingsAlertItem buttonWithTitle:v5 textStyle:v6 icon:v7 action:14 handler:v11];

  [v9 setAccessibilityIdentifier:@"ReloadTranslatedWebpage"];

  return v9;
}

- (id)_internalTapToRadarTranslationAlertItem
{
  if (showInternalTranslationActions())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
    id v4 = [WeakRetained activeDocument];
    double v5 = [v4 translationContext];

    uint64_t v6 = [WeakRetained activeDocument];
    id v7 = [v6 activeWebView];
    id v8 = [v7 window];
    double v9 = [v8 windowScene];

    double v10 = _WBSLocalizedString();
    uint64_t v11 = *MEMORY[0x1E4FB28C8];
    id v12 = [MEMORY[0x1E4FB1818] systemImageNamed:@"ant"];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    id v19 = __70___SFPageFormatMenuController__internalTapToRadarTranslationAlertItem__block_invoke;
    id v20 = &unk_1E5C760F8;
    id v21 = v5;
    id v22 = v9;
    id v13 = v9;
    id v14 = v5;
    id v15 = +[_SFSettingsAlertItem buttonWithTitle:v10 textStyle:v11 icon:v12 action:16 handler:&v17];

    objc_msgSend(v15, "setAccessibilityIdentifier:", @"TranslationTapToRadar", v17, v18, v19, v20);
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)_userFeedbackTranslationAlertItem
{
  BOOL v3 = _WBSLocalizedString();
  uint64_t v4 = *MEMORY[0x1E4FB28C8];
  double v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"exclamationmark.bubble"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64___SFPageFormatMenuController__userFeedbackTranslationAlertItem__block_invoke;
  v8[3] = &unk_1E5C72650;
  v8[4] = self;
  uint64_t v6 = +[_SFSettingsAlertItem buttonWithTitle:v3 textStyle:v4 icon:v5 action:15 handler:v8];

  [v6 setAccessibilityIdentifier:@"ReportTranslationIssue"];

  return v6;
}

- (void)_translationAvailabilityDidChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65___SFPageFormatMenuController__translationAvailabilityDidChange___block_invoke;
  v6[3] = &unk_1E5C72238;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

- (id)_userFeedbackAutofillAlertItem
{
  BOOL v3 = [MEMORY[0x1E4F98970] titleText];
  uint64_t v4 = *MEMORY[0x1E4FB28C8];
  id v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"exclamationmark.bubble"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61___SFPageFormatMenuController__userFeedbackAutofillAlertItem__block_invoke;
  v8[3] = &unk_1E5C72650;
  v8[4] = self;
  uint64_t v6 = +[_SFSettingsAlertItem buttonWithTitle:v3 textStyle:v4 icon:v5 action:29 handler:v8];

  return v6;
}

- (id)_pageZoomAlertItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  BOOL v3 = [SFPageZoomStepperController alloc];
  uint64_t v4 = [WeakRetained activeDocument];
  id v5 = [WeakRetained pageZoomManager];
  uint64_t v6 = [(SFPageZoomStepperController *)v3 initWithDocument:v4 preferenceManager:v5];
  id v7 = +[_SFSettingsAlertItem stepperWithController:v6 action:3 handler:&__block_literal_global_283];

  return v7;
}

- (id)_readerTextSizeAlertItem
{
  BOOL v3 = [SFReaderTextSizeStepperController alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  id v5 = [WeakRetained activeDocument];
  uint64_t v6 = [v5 readerContext];
  id v7 = [(SFReaderTextSizeStepperController *)v3 initWithReaderContext:v6];
  id v8 = +[_SFSettingsAlertItem stepperWithController:v7 action:4 handler:&__block_literal_global_286];

  return v8;
}

- (id)_readerThemeAlertItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  uint64_t v4 = [WeakRetained activeDocument];

  id v5 = [v4 readerContext];
  id v6 = objc_loadWeakRetained((id *)&self->_viewController);
  uint64_t v7 = [v6 provenance];

  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __52___SFPageFormatMenuController__readerThemeAlertItem__block_invoke;
  v16 = &unk_1E5C765C0;
  id v17 = v5;
  uint64_t v18 = v7;
  id v8 = v5;
  double v9 = +[SFReaderAppearanceThemeSelector themeSelectorWithBlock:&v13];
  double v10 = objc_msgSend(v8, "configurationManager", v13, v14, v15, v16);
  objc_msgSend(v9, "setSelectedTheme:", objc_msgSend(v10, "themeForAppearance:", objc_msgSend(v8, "currentAppearance")));

  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v11 = +[_SFSettingsAlertItem paletteWithAction:0 controller:v9];
  [v11 setAccessibilityIdentifier:@"ThemeSelector"];

  return v11;
}

- (id)_readerFontAlertItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  BOOL v3 = [WeakRetained activeDocument];
  uint64_t v4 = [v3 readerContext];

  id v5 = _WBSLocalizedString();
  id v6 = [[_SFReaderFontOptionsGroupController alloc] initWithReaderContext:v4];
  uint64_t v7 = +[_SFSettingsAlertItem optionsGroupWithTitle:v5 action:6 subItemAction:7 controller:v6];

  [v7 setAccessibilityIdentifier:@"ReaderFont"];

  return v7;
}

- (BOOL)_canToggleContentBlockers
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  if ([WeakRetained isShowingReader]) {
    goto LABEL_3;
  }
  BOOL v3 = [WeakRetained activeDocument];
  uint64_t v4 = [v3 webView];
  id v5 = [v4 URL];
  char v6 = objc_msgSend(v5, "safari_isSafariWebExtensionURL");

  if (v6)
  {
LABEL_3:
    char v7 = 0;
  }
  else
  {
    id v8 = [WeakRetained perSitePreferencesVendor];
    double v9 = [v8 contentBlockersPreferenceManager];
    char v7 = [v9 hasEnabledContentBlockers];
  }
  return v7;
}

- (BOOL)_canHideToolbar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  BOOL v3 = [WeakRetained activeDocument];
  if ([v3 canHideToolbar]) {
    int v4 = [WeakRetained isShowingReader] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)_canToggleBetweenDesktopAndMobileSite
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  if ([WeakRetained isShowingReader])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    int v4 = [WeakRetained activeDocument];
    id v5 = [v4 webView];
    char v6 = [v5 URL];

    if (objc_msgSend(v6, "sf_isOfflineReadingListURL")) {
      LOBYTE(v3) = 0;
    }
    else {
      int v3 = objc_msgSend(v6, "safari_isSafariWebExtensionURL") ^ 1;
    }
  }
  return v3;
}

- (BOOL)_canShowWebsiteSettings
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  int v3 = [WeakRetained activeDocument];
  int v4 = [v3 webView];
  id v5 = [v4 URL];
  char v6 = objc_msgSend(v5, "safari_isSafariWebExtensionURL") ^ 1;

  return v6;
}

- (BOOL)_canShowScribble
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  if ([WeakRetained isShowingReader])
  {
    char v3 = 0;
  }
  else
  {
    int v4 = [WeakRetained activeDocument];
    id v5 = [v4 sfScribbleController];
    char v3 = [v5 canEnableScribble];
  }
  return v3;
}

- (BOOL)_canTogglePrivateRelay
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  if ([WeakRetained isShowingReader])
  {
    char v3 = 0;
  }
  else
  {
    int v4 = [WeakRetained activeDocument];
    if ([v4 isNavigatingViaReloadWithoutPrivateRelay])
    {
      char v3 = 1;
    }
    else
    {
      id v5 = [v4 webView];
      if (objc_opt_respondsToSelector())
      {
        char v6 = [v4 webView];
        char v3 = [v6 _wasPrivateRelayed];
      }
      else
      {
        char v3 = 0;
      }
    }
  }

  return v3;
}

- (id)_privateRelayToggleAlertItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  char v3 = [WeakRetained activeDocument];
  char v4 = [v3 wasLoadedWithPrivateRelay];
  if (v4)
  {
    id v5 = @"pin.point.of.interest.to.line.below";
    uint64_t v6 = 20;
  }
  else
  {
    id v5 = @"pin.point.of.interest.to.line.below.slash";
    uint64_t v6 = 21;
  }
  char v7 = _WBSLocalizedString();
  id v8 = [MEMORY[0x1E4FB1818] _systemImageNamed:v5];
  uint64_t v9 = *MEMORY[0x1E4FB28C8];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59___SFPageFormatMenuController__privateRelayToggleAlertItem__block_invoke;
  v14[3] = &unk_1E5C76610;
  char v17 = v4;
  id v15 = v3;
  id v16 = WeakRetained;
  id v10 = WeakRetained;
  id v11 = v3;
  id v12 = +[_SFSettingsAlertItem buttonWithTitle:v7 textStyle:v9 icon:v8 action:v6 handler:v14];
  [v12 setAccessibilityIdentifier:@"TogglePrivateRelay"];

  return v12;
}

- (BOOL)_hasStartedTranslation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  char v3 = [WeakRetained activeDocument];
  char v4 = [v3 translationContext];
  char v5 = [v4 hasStartedTranslating];

  return v5;
}

- (id)_contentBlockersToggleAlertItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  char v3 = [WeakRetained activeDocument];

  char v4 = [v3 wasLoadedWithContentBlockersEnabled];
  if (v4) {
    char v5 = @"shield.slash";
  }
  else {
    char v5 = @"checkmark.shield";
  }
  uint64_t v6 = _WBSLocalizedString();
  char v7 = [MEMORY[0x1E4FB1818] systemImageNamed:v5];
  uint64_t v8 = *MEMORY[0x1E4FB28C8];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __62___SFPageFormatMenuController__contentBlockersToggleAlertItem__block_invoke;
  id v15 = &unk_1E5C764B0;
  id v16 = v3;
  char v17 = v4;
  id v9 = v3;
  id v10 = +[_SFSettingsAlertItem buttonWithTitle:v6 textStyle:v8 icon:v7 action:19 handler:&v12];
  objc_msgSend(v10, "setAccessibilityIdentifier:", @"ToggleContentBlockers", v12, v13, v14, v15);

  return v10;
}

- (BOOL)_canToggleAdvancedPrivateBrowsingPrivacyProtections
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  if ([WeakRetained isShowingReader])
  {
    char v3 = 0;
  }
  else
  {
    char v4 = [WeakRetained activeDocument];
    char v5 = [v4 webView];
    uint64_t v6 = [v5 URL];
    char v7 = objc_msgSend(v6, "safari_isSafariWebExtensionURL");

    if (v7)
    {
      char v3 = 0;
    }
    else
    {
      uint64_t v8 = [v4 isPrivateBrowsingEnabled];
      id v9 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
      char v3 = objc_msgSend(v9, "safari_enableAdvancedPrivacyProtections:", v8);
    }
  }

  return v3;
}

- (id)_advancedPrivateBrowsingPrivacyProtectionsAlertItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  char v4 = [WeakRetained activeDocument];
  int v5 = [v4 wasLoadedWithAdvancedPrivateBrowsingPrivacyProtections];
  char v6 = v5;
  if (v5)
  {
    char v7 = _WBSLocalizedString();
    if ([(_SFPageFormatMenuController *)self _canTogglePrivateRelay])
    {
      uint64_t v8 = 23;
LABEL_6:
      uint64_t v9 = _WBSLocalizedString();

      char v7 = (void *)v9;
      goto LABEL_9;
    }
    uint64_t v8 = 23;
  }
  else
  {
    char v7 = _WBSLocalizedString();
    if ([(_SFPageFormatMenuController *)self _canTogglePrivateRelay])
    {
      uint64_t v8 = 22;
      goto LABEL_6;
    }
    uint64_t v8 = 22;
  }
LABEL_9:
  uint64_t v10 = *MEMORY[0x1E4FB28C8];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __82___SFPageFormatMenuController__advancedPrivateBrowsingPrivacyProtectionsAlertItem__block_invoke;
  char v17 = &unk_1E5C764B0;
  id v18 = v4;
  char v19 = v6;
  id v11 = v4;
  uint64_t v12 = +[_SFSettingsAlertItem buttonWithTitle:v7 textStyle:v10 icon:0 action:v8 handler:&v14];
  objc_msgSend(v12, "setAccessibilityIdentifier:", @"ToggleAdvancedPrivateBrowsingPrivacyProtections", v14, v15, v16, v17);

  return v12;
}

- (id)_websiteSettingsAlertItem
{
  char v3 = _WBSLocalizedString();
  uint64_t v4 = *MEMORY[0x1E4FB28C8];
  int v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"gear"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56___SFPageFormatMenuController__websiteSettingsAlertItem__block_invoke;
  v8[3] = &unk_1E5C72650;
  v8[4] = self;
  char v6 = +[_SFSettingsAlertItem buttonWithTitle:v3 textStyle:v4 icon:v5 action:24 handler:v8];

  [v6 setAccessibilityIdentifier:@"WebsiteSettings"];

  return v6;
}

- (id)_scribbleAlertItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  char v3 = [WeakRetained activeDocument];

  uint64_t v4 = [v3 sfScribbleController];
  char v5 = [v4 userInitiatedScribblingDisabled];

  if (v5)
  {
    char v6 = 0;
  }
  else
  {
    char v7 = _WBSLocalizedString();
    uint64_t v8 = *MEMORY[0x1E4FB28C8];
    uint64_t v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"eye.slash.fill"];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __49___SFPageFormatMenuController__scribbleAlertItem__block_invoke;
    v11[3] = &unk_1E5C72650;
    id v12 = v3;
    char v6 = +[_SFSettingsAlertItem buttonWithTitle:v7 textStyle:v8 icon:v9 action:46 handler:v11];

    [v6 setAccessibilityIdentifier:@"Scribble"];
  }

  return v6;
}

- (id)_clearEditsAlertItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  char v3 = [WeakRetained activeDocument];

  uint64_t v4 = _WBSLocalizedString();
  uint64_t v5 = *MEMORY[0x1E4FB28C8];
  char v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.uturn.backward"];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51___SFPageFormatMenuController__clearEditsAlertItem__block_invoke;
  v10[3] = &unk_1E5C72650;
  id v11 = v3;
  id v7 = v3;
  uint64_t v8 = +[_SFSettingsAlertItem buttonWithTitle:v4 textStyle:v5 icon:v6 action:47 handler:v10];

  [v8 setAccessibilityIdentifier:@"ClearEdits"];

  return v8;
}

- (id)_reportScribbleIssueItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  uint64_t v4 = [WeakRetained activeDocument];

  uint64_t v5 = [v4 sfScribbleController];
  char v6 = [v5 userInitiatedScribblingDisabled];

  if ((v6 & 1) != 0
    || ![(WBUFeatureManager *)self->_featureManager isSafariSyncEnabled])
  {
    uint64_t v10 = 0;
  }
  else
  {
    id v7 = _WBSLocalizedString();
    uint64_t v8 = *MEMORY[0x1E4FB28C8];
    uint64_t v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"exclamationmark.bubble"];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __55___SFPageFormatMenuController__reportScribbleIssueItem__block_invoke;
    uint64_t v15 = &unk_1E5C760F8;
    id v16 = self;
    id v17 = v4;
    uint64_t v10 = +[_SFSettingsAlertItem buttonWithTitle:v7 textStyle:v8 icon:v9 action:48 handler:&v12];

    objc_msgSend(v10, "setAccessibilityIdentifier:", @"ReportScribbleIssue", v12, v13, v14, v15, v16);
  }

  return v10;
}

- (id)_manageExtensionsAlertItem
{
  char v3 = _WBSLocalizedString();
  uint64_t v4 = *MEMORY[0x1E4FB28C8];
  uint64_t v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"puzzlepiece.extension"];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __57___SFPageFormatMenuController__manageExtensionsAlertItem__block_invoke;
  v19[3] = &unk_1E5C72650;
  v19[4] = self;
  char v6 = +[_SFSettingsAlertItem buttonWithTitle:v3 textStyle:v4 icon:v5 action:27 handler:v19];

  [v6 setAccessibilityIdentifier:@"ManageExtensions"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  uint64_t v8 = [WeakRetained activeDocument];
  LOBYTE(v5) = [v8 isPrivateBrowsingEnabled];

  if (v5) {
    goto LABEL_4;
  }
  uint64_t v9 = [(_SFPageFormatMenuController *)self _webExtensionsController];
  uint64_t v10 = [v9 recentlyInstalledExtensionCount];
  id v11 = [(_SFPageFormatMenuController *)self _contentBlockerManager];
  uint64_t v12 = [v11 recentlyInstalledExtensionCount] + v10;

  if (!v12)
  {
LABEL_4:
    uint64_t v15 = &stru_1EFB97EB8;
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F28EE0];
    uint64_t v14 = [NSNumber numberWithUnsignedInteger:v12];
    uint64_t v15 = [v13 localizedStringFromNumber:v14 numberStyle:1];
  }
  id v16 = +[SFWebExtensionPageMenuController badgeViewForText:v15];
  [v6 setBadgeView:v16];

  [v6 setBadgeText:v15];
  id v17 = +[_SFPageFormatMenuBadgeView defaultComponentsArrangement];
  [v6 setComponentsArrangement:v17];

  return v6;
}

- (void)reloadBrowsingAssistantIfNeeded
{
  if ([MEMORY[0x1E4F98AF8] isBrowsingAssistantEnabled])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    char v3 = [WeakRetained presentingViewController];

    if (v3) {
      [WeakRetained reloadData];
    }
  }
}

- (void)_clearCachedItems
{
  cachedMenuItems = self->_cachedMenuItems;
  self->_cachedMenuItems = 0;

  downloadsAlertItem = self->_downloadsAlertItem;
  self->_downloadsAlertItem = 0;

  translationAlertItems = self->_translationAlertItems;
  self->_translationAlertItems = 0;

  extensionsSection = self->_extensionsSection;
  self->_extensionsSection = 0;

  settingsSection = self->_settingsSection;
  self->_settingsSection = 0;

  [(_SFPageFormatMenuController *)self _clearCachedCardItems];
}

- (void)_clearCachedCardItems
{
  cachedConsentCard = self->_cachedConsentCard;
  self->_cachedConsentCard = 0;

  cachedListenToPageCard = self->_cachedListenToPageCard;
  self->_cachedListenToPageCard = 0;

  cachedReaderCard = self->_cachedReaderCard;
  self->_cachedReaderCard = 0;

  cachedReaderOptionsCard = self->_cachedReaderOptionsCard;
  self->_cachedReaderOptionsCard = 0;

  cachedEntityCards = self->_cachedEntityCards;
  self->_cachedEntityCards = 0;
}

- (id)_entityItems
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  if (([WeakRetained isShowingReader] & 1) != 0
    || ![MEMORY[0x1E4F989E8] hasUserConsent])
  {
    char v3 = 0;
  }
  else
  {
    id v25 = [WeakRetained activeDocument];
    char v3 = [MEMORY[0x1E4F1CA48] array];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v4 = [v25 assistantController];
    uint64_t v5 = [v4 result];
    obuint64_t j = [v5 entityResults];

    uint64_t v6 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v6)
    {
      uint64_t v27 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v32 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          cachedEntityCards = self->_cachedEntityCards;
          uint64_t v10 = [v8 identifier];
          id v11 = [(NSMutableDictionary *)cachedEntityCards objectForKeyedSubscript:v10];

          if (v11)
          {
            [v3 addObject:v11];
          }
          else
          {
            uint64_t v12 = [v25 assistantController];
            uint64_t v13 = [v12 webpageIdentifier];

            uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "count") + 3);
            objc_initWeak(&location, self);
            uint64_t v15 = (void *)MEMORY[0x1E4F78208];
            v28[0] = MEMORY[0x1E4F143A8];
            v28[1] = 3221225472;
            v28[2] = __43___SFPageFormatMenuController__entityItems__block_invoke;
            v28[3] = &unk_1E5C76638;
            objc_copyWeak(&v29, &location);
            id v16 = [v15 entityCardWithSearchResult:v8 webpageIdentifier:v13 componentIdentifier:v14 actionHandler:v28];
            if (!self->_didDonateVisualPresentationEntityToBiome)
            {
              id v17 = [MEMORY[0x1E4F98948] sharedLogger];
              [v17 didShowEntityCardSBA];

              id v18 = [MEMORY[0x1E4F989B0] sharedManager];
              objc_msgSend(v18, "donateBrowsingAssistantVisualComponentPresentationStartedWithWebPageID:componentType:componentIdentifier:tableOfContentsArrayLength:", v13, objc_msgSend(MEMORY[0x1E4F989B0], "entityComponentTypeFromResult:", v8), v14, 0);
            }
            char v19 = self->_cachedEntityCards;
            if (!v19)
            {
              id v20 = [MEMORY[0x1E4F1CA60] dictionary];
              id v21 = self->_cachedEntityCards;
              self->_cachedEntityCards = v20;

              char v19 = self->_cachedEntityCards;
            }
            id v22 = [v8 identifier];
            [(NSMutableDictionary *)v19 setObject:v16 forKeyedSubscript:v22];

            [v3 addObject:v16];
            objc_destroyWeak(&v29);
            objc_destroyWeak(&location);
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v6);
    }

    if ([v3 count]) {
      self->_didDonateVisualPresentationEntityToBiome = 1;
    }
  }

  return v3;
}

- (BOOL)_shouldShowItemForAction:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  uint64_t v6 = [WeakRetained activeDocument];
  if ([v4 isEqualToString:*MEMORY[0x1E4F785F8]]) {
    goto LABEL_5;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F78668]])
  {
    char v7 = [WeakRetained canTogglePinningTab];
    goto LABEL_6;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F785F0]])
  {
LABEL_5:
    char v7 = [WeakRetained canAddToBookmarks];
    goto LABEL_6;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F78608]])
  {
    char v7 = [WeakRetained canAddToReadingList];
  }
  else if ([v4 isEqualToString:*MEMORY[0x1E4F78600]])
  {
    char v7 = [WeakRetained canAddToQuickNote];
  }
  else if ([v4 isEqualToString:*MEMORY[0x1E4F78618]])
  {
    char v7 = [WeakRetained canMoveToTabGroup];
  }
  else if ([v4 isEqualToString:*MEMORY[0x1E4F78628]])
  {
    char v7 = [WeakRetained supportsPrivacyReport];
  }
  else if ([v4 isEqualToString:*MEMORY[0x1E4F78620]])
  {
    char v7 = [WeakRetained canPrintCurrentTab];
  }
  else if ([v4 isEqualToString:*MEMORY[0x1E4F78640]])
  {
    char v7 = [(_SFPageFormatMenuController *)self _canShowScribble];
  }
  else if ([v4 isEqualToString:*MEMORY[0x1E4F78610]])
  {
    char v7 = [(_SFPageFormatMenuController *)self _canHideToolbar];
  }
  else if ([v4 isEqualToString:*MEMORY[0x1E4F78638]])
  {
    char v7 = [(_SFPageFormatMenuController *)self _canToggleBetweenDesktopAndMobileSite];
  }
  else if ([v4 isEqualToString:*MEMORY[0x1E4F78658]])
  {
    char v7 = [(_SFPageFormatMenuController *)self _canToggleContentBlockers];
  }
  else if ([v4 isEqualToString:*MEMORY[0x1E4F78648]])
  {
    char v7 = [(_SFPageFormatMenuController *)self _canToggleAdvancedPrivateBrowsingPrivacyProtections];
  }
  else
  {
    if (![v4 isEqualToString:*MEMORY[0x1E4F78670]])
    {
      if ([v4 isEqualToString:*MEMORY[0x1E4F78630]])
      {
        if ([(_SFPageFormatMenuController *)self _canShowWebsiteSettings]
          && [MEMORY[0x1E4F98AF8] isInternalInstall])
        {
          uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
          LOBYTE(v8) = [v10 BOOLForKey:*MEMORY[0x1E4F99030]];

          goto LABEL_7;
        }
      }
      else if ([v4 isEqualToString:*MEMORY[0x1E4F78660]])
      {
        if (([WeakRetained hasDedicatedMediaStateButton] & 1) == 0 && objc_msgSend(v6, "mediaStateIcon"))
        {
          int v8 = [WeakRetained isShowingReader] ^ 1;
          goto LABEL_7;
        }
      }
      else if ([v4 isEqualToString:*MEMORY[0x1E4F78650]] {
             && WBSAXShouldShowAnimatedImageControls())
      }
      {
        char v7 = [MEMORY[0x1E4F466F0] instancesRespondToSelector:sel__pauseAllAnimationsWithCompletionHandler_];
        goto LABEL_6;
      }
      LOBYTE(v8) = 0;
      goto LABEL_7;
    }
    char v7 = [(_SFPageFormatMenuController *)self _canTogglePrivateRelay];
  }
LABEL_6:
  LOBYTE(v8) = v7;
LABEL_7:

  return v8;
}

- (id)_itemForAction:(id)a3
{
  id v4 = a3;
  cachedMenuItems = self->_cachedMenuItems;
  if (!cachedMenuItems)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    char v7 = self->_cachedMenuItems;
    self->_cachedMenuItems = v6;

    cachedMenuItems = self->_cachedMenuItems;
  }
  int v8 = [(NSMutableDictionary *)cachedMenuItems objectForKeyedSubscript:v4];

  if (!v8)
  {
    uint64_t v9 = [(_SFPageFormatMenuController *)self _makeItemForAction:v4];
    [(NSMutableDictionary *)self->_cachedMenuItems setObject:v9 forKeyedSubscript:v4];
  }
  uint64_t v10 = [(NSMutableDictionary *)self->_cachedMenuItems objectForKeyedSubscript:v4];

  return v10;
}

- (id)_makeItemForAction:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  uint64_t v6 = [WeakRetained activeDocument];
  if ([v4 isEqualToString:*MEMORY[0x1E4F785F8]])
  {
    char v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"star"];
    int v8 = _WBSLocalizedString();
    uint64_t v9 = *MEMORY[0x1E4FB28C8];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __50___SFPageFormatMenuController__makeItemForAction___block_invoke;
    v39[3] = &unk_1E5C72650;
    id v40 = WeakRetained;
    uint64_t v10 = +[_SFSettingsAlertItem buttonWithTitle:v8 textStyle:v9 icon:v7 action:39 handler:v39];
    id v11 = v40;
LABEL_10:

    goto LABEL_11;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F78668]])
  {
    if ([WeakRetained currentTabIsPinned]) {
      uint64_t v12 = @"pin.slash";
    }
    else {
      uint64_t v12 = @"pin";
    }
    char v7 = [MEMORY[0x1E4FB1818] systemImageNamed:v12];
    int v8 = _WBSLocalizedString();
    uint64_t v14 = *MEMORY[0x1E4FB28C8];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __50___SFPageFormatMenuController__makeItemForAction___block_invoke_2;
    v37[3] = &unk_1E5C72650;
    id v38 = WeakRetained;
    uint64_t v10 = +[_SFSettingsAlertItem buttonWithTitle:v8 textStyle:v14 icon:v7 action:45 handler:v37];
    id v11 = v38;
    goto LABEL_10;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F785F0]])
  {
    char v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"book"];
    int v8 = _WBSLocalizedString();
    uint64_t v13 = *MEMORY[0x1E4FB28C8];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __50___SFPageFormatMenuController__makeItemForAction___block_invoke_3;
    void v35[3] = &unk_1E5C72650;
    id v36 = WeakRetained;
    uint64_t v10 = +[_SFSettingsAlertItem buttonWithTitle:v8 textStyle:v13 icon:v7 action:40 handler:v35];
    id v11 = v36;
    goto LABEL_10;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F78608]])
  {
    char v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"eyeglasses"];
    int v8 = _WBSLocalizedString();
    uint64_t v16 = *MEMORY[0x1E4FB28C8];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __50___SFPageFormatMenuController__makeItemForAction___block_invoke_4;
    v33[3] = &unk_1E5C72650;
    id v34 = WeakRetained;
    uint64_t v10 = +[_SFSettingsAlertItem buttonWithTitle:v8 textStyle:v16 icon:v7 action:42 handler:v33];
    id v11 = v34;
    goto LABEL_10;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F78600]])
  {
    char v7 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"quicknote"];
    int v8 = _WBSLocalizedString();
    uint64_t v17 = *MEMORY[0x1E4FB28C8];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __50___SFPageFormatMenuController__makeItemForAction___block_invoke_5;
    v31[3] = &unk_1E5C72650;
    id v32 = WeakRetained;
    uint64_t v10 = +[_SFSettingsAlertItem buttonWithTitle:v8 textStyle:v17 icon:v7 action:41 handler:v31];
    id v11 = v32;
    goto LABEL_10;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F78618]])
  {
    id v18 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.up.forward.app"];
    char v19 = _WBSLocalizedString();
    uint64_t v10 = +[_SFSettingsAlertItem buttonWithTitle:v19 textStyle:*MEMORY[0x1E4FB28C8] icon:v18 action:43 handler:&__block_literal_global_477];

    if (objc_opt_respondsToSelector())
    {
      objc_initWeak(&location, self);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __50___SFPageFormatMenuController__makeItemForAction___block_invoke_8;
      v28[3] = &unk_1E5C725B8;
      objc_copyWeak(&v29, &location);
      id v20 = [WeakRetained moveMenuOnPageMenuWithDismissHandler:v28];
      [v10 setPopUpMenu:v20];

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
    goto LABEL_21;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F78628]])
  {
    id v21 = [_SFPageFormatMenuPrivacyReportController alloc];
    id v22 = [WeakRetained activeDocument];
    id v23 = [(_SFPageFormatMenuPrivacyReportController *)v21 initWithDocument:v22];

    [(_SFPageFormatMenuPrivacyReportController *)v23 setDelegate:self];
    uint64_t v10 = [(_SFPageFormatMenuPrivacyReportController *)v23 alertItem];

    goto LABEL_11;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F78620]])
  {
    char v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"printer"];
    int v8 = _WBSLocalizedString();
    uint64_t v24 = *MEMORY[0x1E4FB28C8];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __50___SFPageFormatMenuController__makeItemForAction___block_invoke_9;
    v26[3] = &unk_1E5C72650;
    id v27 = WeakRetained;
    uint64_t v10 = +[_SFSettingsAlertItem buttonWithTitle:v8 textStyle:v24 icon:v7 action:44 handler:v26];
    id v11 = v27;
    goto LABEL_10;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F78640]])
  {
    uint64_t v25 = [(_SFPageFormatMenuController *)self _scribbleAlertItem];
LABEL_42:
    uint64_t v10 = (void *)v25;
    goto LABEL_11;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F78610]])
  {
    uint64_t v25 = [(_SFPageFormatMenuController *)self _fullScreenAlertItem];
    goto LABEL_42;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F78638]])
  {
    uint64_t v25 = [(_SFPageFormatMenuController *)self _desktopMobileToggleAlertItemWithOrientation:[(_SFPageFormatMenuController *)self _deviceOrientation]];
    goto LABEL_42;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F78658]])
  {
    uint64_t v25 = [(_SFPageFormatMenuController *)self _contentBlockersToggleAlertItem];
    goto LABEL_42;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F78648]])
  {
    uint64_t v25 = [(_SFPageFormatMenuController *)self _advancedPrivateBrowsingPrivacyProtectionsAlertItem];
    goto LABEL_42;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F78670]])
  {
    uint64_t v25 = [(_SFPageFormatMenuController *)self _privateRelayToggleAlertItem];
    goto LABEL_42;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F78630]])
  {
    uint64_t v25 = [(_SFPageFormatMenuController *)self _userFeedbackAutofillAlertItem];
    goto LABEL_42;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F78660]])
  {
    uint64_t v25 = [(_SFPageFormatMenuController *)self _mediaStateAlertItem];
    goto LABEL_42;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F78650]])
  {
    id v18 = [v6 activeWebView];
    if ([v18 _allowsAnyAnimationToPlay]) {
      [(_SFPageFormatMenuController *)self _pauseAllAnimationsAlertItem];
    }
    else {
    uint64_t v10 = [(_SFPageFormatMenuController *)self _playAllAnimationsAlertItem];
    }
LABEL_21:

    goto LABEL_11;
  }
  uint64_t v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)_shouldShowScribbleFeedbackButton
{
  return 1;
}

- (BOOL)_shouldLaunchFeedbackAppForScribble
{
  return 0;
}

- (id)primaryMenuSectionsForEditMode:(BOOL)a3 inFirstLevelMenu:(BOOL)a4
{
  BOOL v51 = a4;
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  long long v58 = [MEMORY[0x1E4F78210] favoritesSection];
  char v7 = [MEMORY[0x1E4F1CA48] array];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  int v8 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  uint64_t v9 = objc_msgSend(v8, "browsingAssistant_favoritedMenuActions");

  uint64_t v10 = [v9 countByEnumeratingWithState:&v69 objects:v75 count:16];
  v55 = v6;
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v70;
    uint64_t v59 = *MEMORY[0x1E4F78640];
    uint64_t v53 = *MEMORY[0x1E4F78688];
    BOOL v56 = a3;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v70 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        if ([(_SFPageFormatMenuController *)self _shouldShowItemForAction:v14])
        {
          if (a3 || ![v14 isEqualToString:v59])
          {
            uint64_t v15 = [(_SFPageFormatMenuController *)self _itemForAction:v14];
            objc_msgSend(v7, "safari_addObjectUnlessNil:", v15);
          }
          else
          {
            uint64_t v15 = [(_SFPageFormatMenuController *)self _effectiveScribbleItems];
            if ((unint64_t)[v15 count] > 1)
            {
              uint64_t v17 = v7;
              if ([v7 count])
              {
                id v18 = v58;
                [v58 setItems:v17];
                [v6 addObject:v58];
                char v19 = (void *)[objc_alloc(MEMORY[0x1E4F78210]) initWithIdentifier:v53];
                [v19 setItems:v15];
                [v6 addObject:v19];
              }
              else
              {
                id v18 = v58;
                [v58 setItems:v15];
                [v6 addObject:v58];
              }
              uint64_t v20 = [objc_alloc(MEMORY[0x1E4F78210]) initWithIdentifier:@"otherFavorites"];

              char v7 = [MEMORY[0x1E4F1CA48] array];
              uint64_t v16 = v17;
              long long v58 = (void *)v20;
              uint64_t v6 = v55;
              a3 = v56;
            }
            else
            {
              uint64_t v16 = [v15 firstObject];
              objc_msgSend(v7, "safari_addObjectUnlessNil:", v16);
            }
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v69 objects:v75 count:16];
    }
    while (v11);
  }

  id v21 = WeakRetained;
  if (!v51 || [WeakRetained isShowingReader])
  {
    id v22 = v58;
    [v58 setItems:v7];
    [v6 addObject:v58];
    id v23 = (void *)[v6 copy];
    goto LABEL_56;
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v24 = SFUnconfigurableMenuAcitons();
  uint64_t v25 = [v24 countByEnumeratingWithState:&v65 objects:v74 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v66;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v66 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v65 + 1) + 8 * j);
        if ([(_SFPageFormatMenuController *)self _shouldShowItemForAction:v29])
        {
          id v30 = [(_SFPageFormatMenuController *)self _itemForAction:v29];
          objc_msgSend(v7, "safari_addObjectUnlessNil:", v30);
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v65 objects:v74 count:16];
    }
    while (v26);
  }
  int v54 = v7;

  translationAlertItems = self->_translationAlertItems;
  if (!translationAlertItems)
  {
    [(_SFPageFormatMenuController *)self _buildTranslationAlertItemsWithSourceInfo:0];
    translationAlertItems = self->_translationAlertItems;
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v32 = translationAlertItems;
  long long v33 = (void *)[(NSArray *)v32 countByEnumeratingWithState:&v61 objects:v73 count:16];
  if (!v33)
  {

    uint64_t v35 = 0;
    char v7 = v54;
    v42 = v55;
    id v22 = v58;
    goto LABEL_49;
  }
  id v34 = 0;
  long long v60 = 0;
  long long v57 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = *(void *)v62;
  do
  {
    for (k = 0; k != v33; k = (char *)k + 1)
    {
      if (*(void *)v62 != v36) {
        objc_enumerationMutation(v32);
      }
      id v38 = *(void **)(*((void *)&v61 + 1) + 8 * (void)k);
      v39 = v34;
      id v40 = v38;
      switch([v38 actionType])
      {
        case 11:
        case 12:
          goto LABEL_43;
        case 14:
          v39 = v60;
          id v40 = v34;
          long long v60 = v38;
          goto LABEL_43;
        case 15:
          v39 = v57;
          id v40 = v34;
          long long v57 = v38;
          goto LABEL_43;
        case 16:
          v39 = v35;
          id v40 = v34;
          uint64_t v35 = v38;
LABEL_43:
          id v41 = v38;

          id v34 = v40;
          break;
        default:
          continue;
      }
    }
    long long v33 = (void *)[(NSArray *)v32 countByEnumeratingWithState:&v61 objects:v73 count:16];
  }
  while (v33);

  if (!v34)
  {
    char v7 = v54;
    v42 = v55;
    long long v33 = v57;
    id v22 = v58;
    if (v60)
    {
      [v58 setItems:v54];
      [v55 addObject:v58];
      id v43 = objc_alloc(MEMORY[0x1E4F78210]);
      v44 = (void *)[v43 initWithIdentifier:*MEMORY[0x1E4F78690]];
      v45 = [MEMORY[0x1E4F1CA48] array];
      objc_msgSend(v45, "safari_addObjectUnlessNil:", v60);
      objc_msgSend(v45, "safari_addObjectUnlessNil:", v57);
      objc_msgSend(v45, "safari_addObjectUnlessNil:", v35);
      [v44 setItems:v45];
      [v55 addObject:v44];

      goto LABEL_52;
    }
LABEL_49:
    [v22 setItems:v7];
    [v42 addObject:v22];
    long long v60 = 0;
LABEL_52:
    id v34 = 0;
    id v21 = WeakRetained;
    goto LABEL_53;
  }
  char v7 = v54;
  [v54 addObject:v34];
  id v22 = v58;
  [v58 setItems:v54];
  [v55 addObject:v58];
  id v21 = WeakRetained;
  long long v33 = v57;
LABEL_53:
  BOOL v46 = [v21 activeDocument];
  char v47 = [v46 isShowingSystemStartPage];

  if ((v47 & 1) == 0)
  {
    uint64_t v48 = [(_SFPageFormatMenuController *)self _downloadsSection];
    objc_msgSend(v55, "safari_addObjectUnlessNil:", v48);

    uint64_t v49 = [(_SFPageFormatMenuController *)self _extensionsSection];
    objc_msgSend(v55, "safari_addObjectUnlessNil:", v49);
  }
  uint64_t v6 = v55;
  id v23 = (void *)[v55 copy];

LABEL_56:

  return v23;
}

- (id)_extensionsSection
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  if ([WeakRetained hasDedicatedExtensionsButton])
  {

LABEL_6:
    char v7 = 0;
    goto LABEL_7;
  }
  BOOL v4 = [(_SFPageFormatMenuController *)self _hasExtensionsAvailableToShowInManageExtensionsView];

  if (!v4) {
    goto LABEL_6;
  }
  p_extensionsSection = &self->_extensionsSection;
  extensionsSection = self->_extensionsSection;
  if (extensionsSection)
  {
    char v7 = extensionsSection;
  }
  else
  {
    id v9 = objc_alloc(MEMORY[0x1E4F78210]);
    char v7 = (SFBrowsingAssistantMenuSection *)[v9 initWithIdentifier:*MEMORY[0x1E4F78680]];
    uint64_t v10 = [(_SFPageFormatMenuController *)self _manageExtensionsAlertItem];
    v27[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    uint64_t v12 = [(_SFPageFormatMenuController *)self _extensionItems];
    uint64_t v13 = [v11 arrayByAddingObjectsFromArray:v12];
    [(SFBrowsingAssistantMenuSection *)v7 setItems:v13];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v14 = [(SFBrowsingAssistantMenuSection *)v7 items];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v23;
      p_viewController = &self->_viewController;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v20 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          id v21 = objc_loadWeakRetained((id *)p_viewController);
          [v20 setUpSelectionHandlerIfNeededWithViewController:v21];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v16);
    }

    objc_storeStrong((id *)p_extensionsSection, v7);
  }
LABEL_7:

  return v7;
}

- (id)_downloadsSection
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  if ([WeakRetained hasDedicatedDownloadsToolbarItem])
  {

LABEL_7:
    uint64_t v5 = 0;
    goto LABEL_8;
  }
  BOOL v4 = [(_SFPageFormatMenuController *)self _shouldEnableDownloadsAlert];

  if (!v4) {
    goto LABEL_7;
  }
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F78210]) initWithIdentifier:@"downloads"];
  downloadsAlertItem = self->_downloadsAlertItem;
  if (!downloadsAlertItem)
  {
    char v7 = [(_SFPageFormatMenuController *)self _downloadsAlertItem];
    int v8 = self->_downloadsAlertItem;
    self->_downloadsAlertItem = v7;

    downloadsAlertItem = self->_downloadsAlertItem;
  }
  v11[0] = downloadsAlertItem;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [v5 setItems:v9];

LABEL_8:

  return v5;
}

- (id)moreMenuSectionsForEditMode:(BOOL)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v35 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  char v7 = objc_msgSend(v6, "browsingAssistant_favoritedMenuActions");
  int v8 = [v5 setWithArray:v7];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  SFMorePageMenuSections();
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v31 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v31)
  {
    uint64_t v30 = *(void *)v44;
    uint64_t v37 = *MEMORY[0x1E4F78640];
    uint64_t v33 = *MEMORY[0x1E4F78688];
    unint64_t v9 = 0x1E4F78000uLL;
    BOOL v34 = a3;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v44 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = v10;
        uint64_t v11 = *(void *)(*((void *)&v43 + 1) + 8 * v10);
        id v38 = (void *)[objc_alloc(*(Class *)(v9 + 528)) initWithIdentifier:v11];
        uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        uint64_t v13 = SFSectionToConfigurableMenuActions();
        uint64_t v14 = [v13 objectForKeyedSubscript:v11];

        uint64_t v15 = [v14 countByEnumeratingWithState:&v39 objects:v47 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v40;
          id v18 = (void *)v12;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v40 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v20 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              if ([(_SFPageFormatMenuController *)self _shouldShowItemForAction:v20]
                && ([v8 containsObject:v20] & 1) == 0)
              {
                if (a3 || ![v20 isEqualToString:v37])
                {
                  id v21 = [(_SFPageFormatMenuController *)self _itemForAction:v20];
                  objc_msgSend(v18, "safari_addObjectUnlessNil:", v21);
                }
                else
                {
                  id v21 = [(_SFPageFormatMenuController *)self _effectiveScribbleItems];
                  if ((unint64_t)[v21 count] > 1)
                  {
                    if ([v18 count])
                    {
                      [v38 setItems:v18];
                      [v35 addObject:v38];
                      uint64_t v36 = v18;
                      long long v25 = (void *)[objc_alloc(MEMORY[0x1E4F78210]) initWithIdentifier:v33];
                      [v25 setItems:v21];
                      [v35 addObject:v25];

                      id v18 = v36;
                    }
                    else
                    {
                      [v38 setItems:v21];
                      [v35 addObject:v38];
                    }
                    uint64_t v26 = [objc_alloc(MEMORY[0x1E4F78210]) initWithIdentifier:@"otherAdvancedActions"];

                    uint64_t v24 = [MEMORY[0x1E4F1CA48] array];
                    id v38 = (void *)v26;
                    a3 = v34;
                  }
                  else
                  {
                    uint64_t v22 = [v21 firstObject];
                    long long v23 = v18;
                    id v18 = (void *)v22;
                    uint64_t v24 = (uint64_t)v23;
                    objc_msgSend(v23, "safari_addObjectUnlessNil:", v22);
                  }

                  id v18 = (void *)v24;
                }
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v39 objects:v47 count:16];
          }
          while (v16);
        }
        else
        {
          id v18 = (void *)v12;
        }

        [v38 setItems:v18];
        [v35 addObject:v38];

        uint64_t v10 = v32 + 1;
        unint64_t v9 = 0x1E4F78000;
      }
      while (v32 + 1 != v31);
      uint64_t v31 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v31);
  }

  uint64_t v27 = (void *)[v35 copy];

  return v27;
}

- (id)_effectiveScribbleItems
{
  char v3 = [(_SFPageFormatMenuController *)self _itemForAction:*MEMORY[0x1E4F78640]];
  BOOL v4 = [MEMORY[0x1E4F1CA48] array];
  objc_msgSend(v4, "safari_addObjectUnlessNil:", v3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  uint64_t v6 = [WeakRetained activeDocument];

  char v7 = [v6 sfScribbleController];
  uint64_t v8 = [v7 hiddenElementCount];

  if (v8)
  {
    unint64_t v9 = [(_SFPageFormatMenuController *)self _clearEditsAlertItem];
    objc_msgSend(v4, "safari_addObjectUnlessNil:", v9);
  }
  else if (![v6 hasEnteredScribbleMode])
  {
    goto LABEL_6;
  }
  if ([(_SFPageFormatMenuController *)self _shouldShowScribbleFeedbackButton])
  {
    uint64_t v10 = [(_SFPageFormatMenuController *)self _reportScribbleIssueItem];
    objc_msgSend(v4, "safari_addObjectUnlessNil:", v10);
  }
LABEL_6:
  uint64_t v11 = (void *)[v4 copy];

  return v11;
}

- (int64_t)_deviceOrientation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  char v3 = [WeakRetained presentingViewController];
  BOOL v4 = [v3 view];
  uint64_t v5 = [v4 window];
  uint64_t v6 = [v5 windowScene];
  int64_t v7 = [v6 interfaceOrientation];

  return v7;
}

- (SFBrowsingAssistantMenuSection)settingsSection
{
  if ([(_SFPageFormatMenuController *)self _canShowWebsiteSettings])
  {
    settingsSection = self->_settingsSection;
    if (!settingsSection)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
      uint64_t v5 = [WeakRetained activeDocument];
      uint64_t v6 = [_SFPerSitePreferencesPopoverViewController alloc];
      int64_t v7 = [v5 perSitePreferencesVendor];
      uint64_t v8 = [(_SFPerSitePreferencesPopoverViewController *)v6 initWithBrowserDocument:v5 perSitePreferencesVendor:v7];

      unint64_t v9 = [(_SFPerSitePreferencesPopoverViewController *)v8 pageMenuSection];
      uint64_t v10 = self->_settingsSection;
      self->_settingsSection = v9;

      settingsSection = self->_settingsSection;
    }
    uint64_t v11 = settingsSection;
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (unint64_t)_listenToPageActionStateForActiveTab
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  if ([WeakRetained supportsSiriReadThis])
  {
    char v3 = [WeakRetained activeDocument];
    BOOL v4 = [v3 readerContext];
    if ([WeakRetained canReadActiveLanguage]
      && [v4 isReaderAvailable]
      && ([v3 isBlockedByScreenTime] & 1) == 0)
    {
      uint64_t v7 = [WeakRetained siriReaderPlaybackStateForActiveTab];
      if ((unint64_t)(v7 - 1) > 2) {
        unint64_t v5 = 1;
      }
      else {
        unint64_t v5 = qword_1A6A8A7A8[v7 - 1];
      }
    }
    else
    {
      unint64_t v5 = 0;
    }
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (NSArray)cardItems
{
  char v3 = [MEMORY[0x1E4F1CA48] array];
  BOOL v4 = [(_SFPageFormatMenuController *)self _listenToPageCard];
  objc_msgSend(v3, "safari_addObjectUnlessNil:", v4);

  unint64_t v5 = [(_SFPageFormatMenuController *)self _readerCard];
  objc_msgSend(v3, "safari_addObjectUnlessNil:", v5);

  uint64_t v6 = [(_SFPageFormatMenuController *)self _readerOptionsCard];
  objc_msgSend(v3, "safari_addObjectUnlessNil:", v6);

  uint64_t v7 = [(_SFPageFormatMenuController *)self _consentCard];
  objc_msgSend(v3, "safari_addObjectUnlessNil:", v7);

  uint64_t v8 = [(_SFPageFormatMenuController *)self _entityItems];
  objc_msgSend(v3, "safari_addObjectsFromArrayUnlessNil:", v8);

  unint64_t v9 = (void *)[v3 copy];

  return (NSArray *)v9;
}

- (void)_enableListenToPageButtonForCard:(id)a3
{
  id v7 = a3;
  char v3 = [v7 secondaryAction];
  char v4 = [v3 attributes];

  if (v4)
  {
    unint64_t v5 = [v7 secondaryAction];
    uint64_t v6 = (void *)[v5 copy];

    objc_msgSend(v6, "setAttributes:", objc_msgSend(v6, "attributes") & 0xFFFFFFFFFFFFFFFELL);
    [v7 setSecondaryAction:v6];
    [v7 notifyObserverCardDidUpdate];
  }
}

- (id)_readerOptionsCard
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  if ([WeakRetained isShowingReader])
  {
    cachedReaderOptionsCard = self->_cachedReaderOptionsCard;
    if (cachedReaderOptionsCard)
    {
      unint64_t v5 = cachedReaderOptionsCard;
    }
    else
    {
      objc_initWeak(&location, self);
      uint64_t v6 = [WeakRetained activeDocument];
      id v7 = [v6 readerContext];

      unint64_t v8 = [(_SFPageFormatMenuController *)self _listenToPageActionStateForActiveTab];
      unint64_t v9 = (void *)MEMORY[0x1E4F78208];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __49___SFPageFormatMenuController__readerOptionsCard__block_invoke;
      v20[3] = &unk_1E5C725B8;
      objc_copyWeak(&v21, &location);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __49___SFPageFormatMenuController__readerOptionsCard__block_invoke_2;
      v18[3] = &unk_1E5C725B8;
      objc_copyWeak(&v19, &location);
      uint64_t v10 = [v9 readerOptionsCardWithReaderContext:v7 dismissReaderHandler:v20 listenToPageHandler:v18 listenToPageActionState:v8];
      uint64_t v11 = self->_cachedReaderOptionsCard;
      self->_cachedReaderOptionsCard = v10;

      if (v8)
      {
        uint64_t v12 = [MEMORY[0x1E4F78360] sharedPlaybackController];
        uint64_t v13 = MEMORY[0x1E4F14428];
        id v14 = MEMORY[0x1E4F14428];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __49___SFPageFormatMenuController__readerOptionsCard__block_invoke_3;
        v16[3] = &unk_1E5C76660;
        objc_copyWeak(&v17, &location);
        [v12 updateContentIdentifierOnQueue:v13 completion:v16];

        objc_destroyWeak(&v17);
      }
      unint64_t v5 = self->_cachedReaderOptionsCard;
      objc_destroyWeak(&v19);
      objc_destroyWeak(&v21);

      objc_destroyWeak(&location);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void)_donateSummaryPresentationStartedIfNeeded
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  char v4 = [WeakRetained activeDocument];
  id v9 = [v4 assistantController];

  unint64_t v5 = [v9 summary];
  if ([v5 length] && !self->_didDonateVisualPresentationSummaryToBiome)
  {
    uint64_t v6 = [MEMORY[0x1E4F98948] sharedLogger];
    [v6 didShowSummaryCardSBA];

    id v7 = [MEMORY[0x1E4F989B0] sharedManager];
    unint64_t v8 = [v9 webpageIdentifier];
    [v7 donateBrowsingAssistantVisualComponentPresentationStartedWithWebPageID:v8 componentType:2 componentIdentifier:&unk_1EFBDED88 tableOfContentsArrayLength:0];

    self->_didDonateVisualPresentationSummaryToBiome = 1;
  }
}

- (id)_readerCard
{
  objc_initWeak(location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  if ([WeakRetained isShowingReader])
  {
    char v4 = 0;
    goto LABEL_22;
  }
  cachedReaderCard = self->_cachedReaderCard;
  if (cachedReaderCard)
  {
    char v4 = cachedReaderCard;
    goto LABEL_22;
  }
  uint64_t v6 = [WeakRetained activeDocument];
  id v7 = [v6 readerContext];
  int v8 = [v7 isReaderAvailable];
  id v9 = [v6 assistantController];
  if ([MEMORY[0x1E4F989E8] hasUserConsent]
    && [v9 isSummaryAvailable])
  {
    uint64_t v10 = [v9 summary];
    uint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4FB1680]) initWithDelegate:self];
    [(_SFPageFormatMenuController *)self _donateSummaryPresentationStartedIfNeeded];
LABEL_9:
    uint64_t v11 = [v9 cachedReaderArticleTitle];
    uint64_t v12 = v11;
    id v28 = v6;
    if (v11)
    {
      id v30 = v11;
    }
    else
    {
      uint64_t v13 = [v6 webView];
      id v30 = [v13 title];
    }
    unint64_t v14 = [(_SFPageFormatMenuController *)self _listenToPageActionStateForActiveTab];
    uint64_t v29 = v7;
    uint64_t v15 = [v9 result];
    uint64_t v16 = [v15 disclaimerText];

    id v17 = (void *)MEMORY[0x1E4F78208];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __42___SFPageFormatMenuController__readerCard__block_invoke;
    v41[3] = &unk_1E5C72808;
    objc_copyWeak(&v44, location);
    id v18 = v10;
    id v42 = v18;
    id v19 = v9;
    id v43 = v19;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __42___SFPageFormatMenuController__readerCard__block_invoke_2;
    v38[3] = &unk_1E5C72DE0;
    objc_copyWeak(&v40, location);
    id v39 = WeakRetained;
    uint64_t v20 = [v17 readerCardWithReaderContext:v7 title:v30 summary:v18 disclaimer:v16 contextMenuInteraction:v31 showReaderHandler:v41 listenToPageHandler:v38 listenToPageActionState:v14];
    id v21 = self->_cachedReaderCard;
    self->_cachedReaderCard = v20;

    if (v14) {
      int v22 = v8;
    }
    else {
      int v22 = 0;
    }
    if (v22 == 1)
    {
      long long v23 = [MEMORY[0x1E4F78360] sharedPlaybackController];
      uint64_t v24 = MEMORY[0x1E4F14428];
      id v25 = MEMORY[0x1E4F14428];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __42___SFPageFormatMenuController__readerCard__block_invoke_3;
      v36[3] = &unk_1E5C76660;
      objc_copyWeak(&v37, location);
      [v23 updateContentIdentifierOnQueue:v24 completion:v36];

      objc_destroyWeak(&v37);
      id v7 = v29;
    }
    uint64_t v6 = v28;
    if (v8)
    {
      uint64_t v26 = [v19 cachedReaderArticleTitle];

      if (!v26)
      {
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __42___SFPageFormatMenuController__readerCard__block_invoke_4;
        v32[3] = &unk_1E5C76688;
        objc_copyWeak(&v35, location);
        id v33 = v19;
        id v34 = v30;
        [v7 getReaderArticleTitleWithCompletion:v32];

        objc_destroyWeak(&v35);
      }
    }
    char v4 = self->_cachedReaderCard;

    objc_destroyWeak(&v40);
    objc_destroyWeak(&v44);

    goto LABEL_21;
  }
  uint64_t v10 = 0;
  uint64_t v31 = 0;
  char v4 = 0;
  if (v8) {
    goto LABEL_9;
  }
LABEL_21:

LABEL_22:
  objc_destroyWeak(location);

  return v4;
}

- (void)updateReaderCardWithSummaryIfNeeded
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  char v4 = [WeakRetained activeDocument];
  uint64_t v12 = [v4 assistantController];

  int v5 = [MEMORY[0x1E4F989E8] hasUserConsent];
  uint64_t v6 = v12;
  if (v5)
  {
    int v7 = [v12 isSummaryAvailable];
    uint64_t v6 = v12;
    if (v7)
    {
      if (self->_cachedReaderCard)
      {
        int v8 = [v12 summary];
        id v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1680]) initWithDelegate:self];
        uint64_t v10 = [(SFBrowsingAssistantCardItem *)self->_cachedReaderCard bodyText];
        char v11 = [v8 isEqualToString:v10];

        if ((v11 & 1) == 0)
        {
          [(SFBrowsingAssistantCardItem *)self->_cachedReaderCard setBodyText:v8];
          [(SFBrowsingAssistantCardItem *)self->_cachedReaderCard setContextMenuInteraction:v9];
          [(SFBrowsingAssistantCardItem *)self->_cachedReaderCard notifyObserverCardDidUpdate];
          [(_SFPageFormatMenuController *)self _donateSummaryPresentationStartedIfNeeded];
        }

        uint64_t v6 = v12;
      }
    }
  }
}

- (id)_listenToPageCard
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  if ([WeakRetained supportsSiriReadThis]
    && (([MEMORY[0x1E4F78360] sharedPlaybackController],
         char v4 = objc_claimAutoreleasedReturnValue(),
         uint64_t v5 = [v4 currentPlaybackState],
         v4,
         v5)
      ? (BOOL v6 = v5 == 3)
      : (BOOL v6 = 1),
        !v6
     && (uint64_t v9 = [WeakRetained siriReaderPlaybackStateForActiveTab],
         v5 != 1 ? (BOOL v10 = v9 == v5) : (BOOL v10 = 1),
         v10)))
  {
    cachedListenToPageCard = self->_cachedListenToPageCard;
    if (!cachedListenToPageCard)
    {
      uint64_t v12 = [MEMORY[0x1E4F78208] listenToPageCard];
      uint64_t v13 = self->_cachedListenToPageCard;
      self->_cachedListenToPageCard = v12;

      cachedListenToPageCard = self->_cachedListenToPageCard;
    }
    int v7 = cachedListenToPageCard;
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

- (id)_consentCard
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  if ([WeakRetained isShowingReader]) {
    goto LABEL_7;
  }
  if (![MEMORY[0x1E4F989E8] shouldShowConsentCard]) {
    goto LABEL_7;
  }
  char v4 = [WeakRetained activeDocument];
  char v5 = [v4 isPrivateBrowsingEnabled];

  if (v5) {
    goto LABEL_7;
  }
  BOOL v6 = (void *)MEMORY[0x1E4F989E0];
  int v7 = [WeakRetained activeDocument];
  int v8 = [v7 translationContext];
  uint64_t v9 = [v8 webpageLocale];
  LODWORD(v6) = [v6 assistantEnabledForLocale:v9];

  if (!v6)
  {
LABEL_7:
    char v11 = 0;
  }
  else
  {
    cachedConsentCard = self->_cachedConsentCard;
    if (cachedConsentCard)
    {
      char v11 = cachedConsentCard;
    }
    else
    {
      objc_initWeak(&location, self);
      uint64_t v13 = (void *)MEMORY[0x1E4F78208];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __43___SFPageFormatMenuController__consentCard__block_invoke;
      v18[3] = &unk_1E5C725B8;
      objc_copyWeak(&v19, &location);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __43___SFPageFormatMenuController__consentCard__block_invoke_2;
      v16[3] = &unk_1E5C725B8;
      objc_copyWeak(&v17, &location);
      unint64_t v14 = [v13 consentCardWithNotNowHandler:v18 continueHandler:v16];
      uint64_t v15 = self->_cachedConsentCard;
      self->_cachedConsentCard = v14;

      char v11 = self->_cachedConsentCard;
      objc_destroyWeak(&v17);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }

  return v11;
}

- (void)configureMainHeaderFooter:(id)a3
{
  id v4 = a3;
  objc_initWeak(location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  BOOL v6 = [WeakRetained activeDocument];
  if ([WeakRetained isShowingReader])
  {
    int v7 = [SFReaderTextSizeStepperController alloc];
    int v8 = [WeakRetained activeDocument];
    uint64_t v9 = [v8 readerContext];
    uint64_t v10 = [(SFReaderTextSizeStepperController *)v7 initWithReaderContext:v9];
  }
  else
  {
    char v11 = [SFPageZoomStepperController alloc];
    int v8 = [WeakRetained activeDocument];
    uint64_t v9 = [WeakRetained pageZoomManager];
    uint64_t v10 = [(SFPageZoomStepperController *)v11 initWithDocument:v8 preferenceManager:v9];
  }
  uint64_t v12 = (void *)v10;

  if (v12)
  {
    uint64_t v13 = [v4 stepper];

    if (!v13)
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F78380]);
      [v4 setStepper:v14];
    }
    uint64_t v15 = [v4 stepper];
    [v12 prepareStepper:v15];
    objc_initWeak(&from, v15);
    if (objc_opt_respondsToSelector())
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __57___SFPageFormatMenuController_configureMainHeaderFooter___block_invoke;
      v29[3] = &unk_1E5C766B0;
      objc_copyWeak(&v30, &from);
      [v12 setDidSetValueHandler:v29];
      objc_destroyWeak(&v30);
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __57___SFPageFormatMenuController_configureMainHeaderFooter___block_invoke_2;
    v25[3] = &unk_1E5C766D8;
    objc_copyWeak(&v27, &from);
    id v16 = v12;
    id v26 = v16;
    objc_copyWeak(&v28, location);
    [v15 setDecrementButtonActionHandler:v25];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __57___SFPageFormatMenuController_configureMainHeaderFooter___block_invoke_3;
    v21[3] = &unk_1E5C766D8;
    objc_copyWeak(&v23, &from);
    id v22 = v16;
    objc_copyWeak(&v24, location);
    [v15 setIncrementButtonActionHandler:v21];
    objc_destroyWeak(&v24);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v28);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&from);
  }
  objc_msgSend(v4, "setLeadingButtonEnabled:", objc_msgSend(WeakRetained, "canFindOnPage"));
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __57___SFPageFormatMenuController_configureMainHeaderFooter___block_invoke_4;
  v18[3] = &unk_1E5C72DE0;
  objc_copyWeak(&v20, location);
  id v17 = v6;
  id v19 = v17;
  [v4 setLeadingButtonActionHandler:v18];

  objc_destroyWeak(&v20);
  objc_destroyWeak(location);
}

- (void)_didTapButtonInStepper:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  [WeakRetained setStepperFocused:1];
  if (([WeakRetained _isInPopoverPresentation] & 1) == 0
    && ([WeakRetained isBeingDismissed] & 1) == 0)
  {
    BOOL v6 = [WeakRetained presentingViewController];

    if (v6)
    {
      [v4 pulse];
      int v7 = [WeakRetained popoverPresentationController];
      int v8 = [v7 adaptiveSheetPresentationController];
      uint64_t v9 = [v8 containerView];

      id v10 = objc_alloc_init(MEMORY[0x1E4F78388]);
      [v9 bounds];
      objc_msgSend(v10, "setFrame:");
      [v9 addSubview:v10];
      [v10 setStepper:v4];
      id v11 = objc_loadWeakRetained((id *)&self->_browserContentController);
      self->_stepperIsInTransitionView = 1;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __54___SFPageFormatMenuController__didTapButtonInStepper___block_invoke;
      v14[3] = &unk_1E5C72350;
      void v14[4] = self;
      id v15 = v11;
      id v16 = v10;
      id v12 = v10;
      id v13 = v11;
      [WeakRetained dismissViewControllerAnimated:1 completion:v14];
    }
  }
}

- (void)browsingAssistantWillAppear:(id)a3
{
  p_browserContentController = &self->_browserContentController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_browserContentController);
  LODWORD(p_browserContentController) = [v4 _isInPopoverPresentation];

  [WeakRetained willPresentBrowsingAssistantInSheet:p_browserContentController ^ 1];
}

- (void)browsingAssistantWillDisappear:(id)a3
{
  p_browserContentController = &self->_browserContentController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_browserContentController);
  LODWORD(p_browserContentController) = [v4 _isInPopoverPresentation];

  [WeakRetained willDismissBrowsingAssistantInSheet:p_browserContentController ^ 1];
}

- (void)browsingAssistant:(id)a3 presentMoreMenu:(id)a4
{
}

- (id)viewControllerForPresentationForItemController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  id v4 = [WeakRetained viewControllerToPresentFrom];

  return v4;
}

- (void)presentModalViewController:(id)a3 completion:(id)a4
{
  p_browserContentController = &self->_browserContentController;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_browserContentController);
  [WeakRetained presentModalViewController:v7 completion:v6];
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  id v7 = [WeakRetained activeDocument];
  int v8 = [v7 assistantController];
  uint64_t v9 = [v8 result];
  id v10 = [v9 summaryResult];

  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2050000000;
  id v11 = (void *)getSearchUIClass_softClass;
  uint64_t v22 = getSearchUIClass_softClass;
  if (!getSearchUIClass_softClass)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __getSearchUIClass_block_invoke;
    v18[3] = &unk_1E5C723B0;
    void v18[4] = &v19;
    __getSearchUIClass_block_invoke((uint64_t)v18);
    id v11 = (void *)v20[3];
  }
  id v12 = v11;
  _Block_object_dispose(&v19, 8);
  id v13 = [v12 rowViewForResult:v10 style:0 feedbackDelegate:self];
  id v14 = 0;
  if (objc_opt_respondsToSelector())
  {
    id v15 = (void *)MEMORY[0x1E4FB1678];
    id v16 = [v13 contextMenuActionProvider];
    id v14 = [v15 configurationWithIdentifier:0 previewProvider:0 actionProvider:v16];
  }

  return v14;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v5 = (objc_class *)MEMORY[0x1E4FB1B28];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  int v8 = [MEMORY[0x1E4FB1618] clearColor];
  [v7 setBackgroundColor:v8];

  uint64_t v9 = [v6 view];

  [v9 bounds];
  id v10 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:");
  [v7 setVisiblePath:v10];

  id v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v9 parameters:v7];

  return v11;
}

- (void)didReportUserResponseFeedback:(id)a3
{
  char v3 = (void *)MEMORY[0x1E4F989E0];
  id v4 = a3;
  id v5 = [v3 sharedPARSession];
  [v5 didReportUserResponseFeedback:v4];
}

- (_SFBrowserContentController)browserContentController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);

  return (_SFBrowserContentController *)WeakRetained;
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  return (UIViewController *)WeakRetained;
}

- (_SFPageFormatMenuUIMenuBuilder)uiMenuBuilder
{
  return self->_uiMenuBuilder;
}

- (BOOL)stepperIsInTransitionView
{
  return self->_stepperIsInTransitionView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiMenuBuilder, 0);
  objc_destroyWeak((id *)&self->_viewController);
  objc_destroyWeak((id *)&self->_browserContentController);
  objc_storeStrong((id *)&self->_featureManager, 0);
  objc_storeStrong((id *)&self->_cachedEntityCards, 0);
  objc_storeStrong((id *)&self->_cachedReaderOptionsCard, 0);
  objc_storeStrong((id *)&self->_cachedReaderCard, 0);
  objc_storeStrong((id *)&self->_cachedListenToPageCard, 0);
  objc_storeStrong((id *)&self->_cachedConsentCard, 0);
  objc_storeStrong((id *)&self->_settingsSection, 0);
  objc_storeStrong((id *)&self->_extensionsSection, 0);
  objc_storeStrong((id *)&self->_cachedMenuItems, 0);
  objc_storeStrong((id *)&self->_cachedSiriReaderAlertItem, 0);
  objc_storeStrong((id *)&self->_translationAlertItems, 0);
  objc_storeStrong((id *)&self->_downloadsAlertItem, 0);

  objc_storeStrong((id *)&self->_readerAlertItem, 0);
}

@end