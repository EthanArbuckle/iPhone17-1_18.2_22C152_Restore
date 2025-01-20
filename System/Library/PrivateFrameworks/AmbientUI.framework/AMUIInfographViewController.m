@interface AMUIInfographViewController
+ (id)_bigDateTimeWidget;
+ (id)_bigDateTimeWidgetDescription;
+ (id)_clockCityWidget;
+ (id)_clockCityWidgetDescription;
+ (id)_clockLocalWidget;
+ (id)_clockLocalWidgetDescription;
+ (id)_clockSquareWidget;
+ (id)_clockSquareWidgetDescription;
+ (id)_defaultWidgetDescriptionForKind:(id)a3 bundleIdentifier:(id)a4 containerBundleIdentifier:(id)a5;
+ (id)_stocksWidget;
+ (id)_stocksWidgetDescription;
- (AMUIInfographViewController)init;
- (AMUIInfographViewControllerDelegate)delegate;
- (AMUIWidgetHostManager)widgetHostManager;
- (APSubjectMonitorSubscription)appProtectionSubjectMonitorSubscription;
- (BOOL)_canShowWhileLocked;
- (BOOL)_emptyIconState:(id)a3;
- (BOOL)_isApplicationForWidgetProtected:(id)a3;
- (BOOL)_isApplicationProtectedForContainerBundleIdentifier:(id)a3 extensionBundleIdentifier:(id)a4;
- (BOOL)_isStackEmpty:(id)a3;
- (BOOL)_preparePosterConfigurationToSaveWithCurrentIconState:(id)a3 intents:(id)a4 reason:(id)a5;
- (BOOL)_recordExistsForContainerBundleIdentifier:(id)a3;
- (BOOL)_saveInfographPosterConfigurationData:(id)a3 completion:(id)a4;
- (BOOL)_shouldMigrateClockCityWidgetForIconDataSources:(id)a3 withWidgetStackElements:(id)a4;
- (BOOL)cannotRemoveLastWidgetInWidgetSheet;
- (BOOL)handleDismiss;
- (BOOL)iconManager:(id)a3 dragsSupportSystemDragsForIconView:(id)a4;
- (BOOL)iconManager:(id)a3 iconViewDisplaysLabel:(id)a4;
- (BOOL)iconManager:(id)a3 isIconVisibleForBundleIdentifier:(id)a4;
- (BOOL)iconManager:(id)a3 isTimedOutForDataSourceContainerBundleIdentifier:(id)a4;
- (BOOL)iconManager:(id)a3 isWidgetValid:(id)a4;
- (BOOL)iconManager:(id)a3 shouldContinueToUseBackgroundView:(id)a4 forComponentsOfIconView:(id)a5;
- (BOOL)iconManagerAllowsWidgetStackWithSingleWidgetToPresentStackConfigurationSheet:(id)a3;
- (BOOL)iconManagerCanSaveIconState:(id)a3;
- (BOOL)iconManagerWidgetsCanAppearInSecureEnvironment:(id)a3;
- (BOOL)isConfiguring;
- (BOOL)isDisplayingEditingButtons;
- (BOOL)isRootFolderContentVisibleForIconManager:(id)a3;
- (BOOL)stackConfigurationInteraction:(id)a3 allowsRemovalOfIconDataSource:(id)a4;
- (BOOL)stackConfigurationInteraction:(id)a3 dragsSupportSystemDragsForIconView:(id)a4;
- (BOOL)stackConfigurationInteractionShouldDisallowLabelArea:(id)a3;
- (BOOL)updatePosterConfiguration:(id)a3 withAnimationSettings:(id)a4;
- (BOOL)wantsDefaultInfographLayout;
- (BSInvalidatable)disableIconStateAutosaveAssertion;
- (CGRect)iconManager:(id)a3 contentBoundingRectForConfigurationOfIconView:(id)a4;
- (Class)iconManager:(id)a3 folderControllerClassForFolderClass:(Class)a4 proposedClass:(Class)a5;
- (NSArray)defaultWidgetDescriptorStacks;
- (NSMutableDictionary)keepRootStaticAssertions;
- (NSSet)pendingLaunchActions;
- (NSString)pendingLaunchBundleIdentifier;
- (NSTimer)launchConfirmationCancelTimer;
- (PRSPosterConfiguration)posterConfiguration;
- (SBHIconManager)iconManager;
- (SBHMainAddSheetViewControlling)addWidgetSheetViewController;
- (SBHStackConfigurationViewController)stackConfigurationViewController;
- (SBIconListLayoutProvider)listLayoutProvider;
- (UIView)launchConfirmationView;
- (double)iconManager:(id)a3 verticalMarginPercentageForConfigurationOfIconView:(id)a4;
- (double)stackConfigurationInteraction:(id)a3 iconContentScaleForGridSizeClass:(id)a4;
- (double)titledButtonsAlpha;
- (id)_applicationBundleIdentifierForLaunchingIconView:(id)a3;
- (id)_createBatteriesWidgetIcon;
- (id)_createContactsWidgetIcon;
- (id)_defaultIconState;
- (id)_effectiveContainerBundleIdentifierForContainerBundleIdentifier:(id)a3 extensionBundleIdentifier:(id)a4;
- (id)_fetchIntents;
- (id)_iconStateFromDefaultWidgetDescriptorStacks:(id)a3;
- (id)_iconStateWithLeadingElements:(id)a3 trialingElements:(id)a4;
- (id)_infographConfigurationMetadata;
- (id)_loadInfographPosterConfigurationDataWithError:(id *)a3;
- (id)_stackElementsFromWidgetDescriptors:(id)a3;
- (id)_uniqueIdentifierStacksFromIconState:(id)a3;
- (id)_uniqueIdentifiersForStack:(id)a3;
- (id)_validatedStackFromWidgets:(id)a3;
- (id)cancelTouchesForCurrentEventInHostedContent;
- (id)customDisplayConfigurationForWidgetViewController;
- (id)defaultIconStateForIconManager:(id)a3;
- (id)iconManager:(id)a3 backgroundViewForComponentsOfType:(int64_t)a4 forIconView:(id)a5;
- (id)iconManager:(id)a3 bundleIdentifierToLaunchForWidgetURL:(id)a4;
- (id)iconManager:(id)a3 configurationDataForDataSource:(id)a4 ofIcon:(id)a5;
- (id)iconManager:(id)a3 containerBundleIdentifierForDescriptor:(id)a4;
- (id)iconManager:(id)a3 localizedFolderNameForDefaultDisplayName:(id)a4;
- (id)iconManager:(id)a3 metricsForCHSWidget:(id)a4 inLocation:(id)a5;
- (id)iconManager:(id)a3 targetedDragPreviewForIconView:(id)a4 item:(id)a5 session:(id)a6 previewParameters:(id)a7;
- (id)renderSchemeForWidgetViewController;
- (id)stackConfigurationInteraction:(id)a3 dragPreviewForIconView:(id)a4;
- (id)stackConfigurationInteraction:(id)a3 draggedIconForIdentifier:(id)a4;
- (id)stackConfigurationInteraction:(id)a3 promoteSuggestedWidget:(id)a4 withinStack:(id)a5;
- (id)stackConfigurationInteraction:(id)a3 targetedDragPreviewForIconView:(id)a4 item:(id)a5 session:(id)a6 previewParameters:(id)a7;
- (id)targetedDragPreviewForIconView:(id)a3 item:(id)a4 session:(id)a5 previewParameters:(id)a6;
- (id)widgetIconForDescriptor:(id)a3 sizeClass:(int64_t)a4;
- (id)widgetIconForDescriptors:(id)a3 sizeClass:(int64_t)a4;
- (id)widgetIconForGalleryItem:(id)a3 sizeClass:(int64_t)a4;
- (id)windowForIconDragPreviewsForStackConfigurationInteraction:(id)a3 forWindowScene:(id)a4;
- (int64_t)iconManager:(id)a3 closeBoxTypeForIconView:(id)a4 proposedType:(int64_t)a5;
- (int64_t)iconManager:(id)a3 userInterfaceStyleForConfigurationOfIconView:(id)a4;
- (int64_t)overrideUserInterfaceStyleForPresentingWidgetSheet;
- (int64_t)stackConfigurationInteractionIconViewComponentBackgroundViewType:(id)a3;
- (unint64_t)_addWidgetSheetStyle;
- (unint64_t)maximumListCountForFoldersForIconManager:(id)a3;
- (unint64_t)presenterType;
- (void)_configureIconManager:(id)a3;
- (void)_dismissLaunchConfirmationAnimated:(BOOL)a3;
- (void)_enumerateWidgetStackViewControllersWithBlock:(id)a3;
- (void)_evaluatePresentationModeForIconViews;
- (void)_fetchDefaultWidgetDescriptorStacks;
- (void)_fetchWidgetHostManager;
- (void)_flashPageControlAnimated:(BOOL)a3;
- (void)_handleInsertionForWidgetIcon:(id)a3 withReferenceIconView:(id)a4 fromPresenter:(id)a5;
- (void)_handleLaunchRequestForApplicationWithBundleIdentifier:(id)a3 withActions:(id)a4;
- (void)_handleWidgetSheetViewControllerDidDisappear:(id)a3;
- (void)_handleWidgetSheetViewControllerWillAppear:(id)a3;
- (void)_handleWidgetSheetViewControllerWillDisappear:(id)a3;
- (void)_invalidateStackConfigurationEditingTimeoutTimer;
- (void)_keepIconViewsStaticForReason:(id)a3;
- (void)_launchConfirmationTapGestureDidFire:(id)a3;
- (void)_migrateClockCityWidgetForIconListModel:(id)a3 withDefaultIconState:(id)a4;
- (void)_presentAddWidgetSheetFromViewController:(id)a3 withAllowedSizeClasses:(id)a4 allowsNonStackableItems:(BOOL)a5;
- (void)_registerForAmbientPresentationTraitChanges;
- (void)_registerForFirstPresentationStateChange;
- (void)_restartStackConfigurationEditingTimeoutTimer;
- (void)_setAmbientDefaults:(id)a3;
- (void)_setupAmbientDefaults;
- (void)_showLaunchConfirmationForApplicationWithBundleIdentifier:(id)a3 withActions:(id)a4 iconView:(id)a5;
- (void)_splitStackElements:(id)a3 intoLeadingElements:(id)a4 trailingElements:(id)a5;
- (void)_stackConfigurationEditingTimeoutTimerFired;
- (void)_syncLocalAmbientIconStateAndIntentsToPoster;
- (void)_updateIconListViewForIconManager:(id)a3;
- (void)_updateIconModelForIconManager:(id)a3;
- (void)_updateIconViewsWithPresentationMode:(unint64_t)a3;
- (void)_updateProactiveIntegrationForIconManager:(id)a3;
- (void)_validateIconListModel:(id)a3;
- (void)_validateIcons:(id)a3 inIconListModel:(id)a4;
- (void)_willEndConfigurationForReason:(id)a3;
- (void)_willEnterConfigurationForReason:(id)a3;
- (void)_willHideTemporaryOverlayForReason:(id)a3;
- (void)_willShowTemporaryOverlayForReason:(id)a3;
- (void)addWidgetSheetViewController:(id)a3 didSelectWidgetIconView:(id)a4;
- (void)addWidgetSheetViewControllerDidAppear:(id)a3;
- (void)addWidgetSheetViewControllerDidCancel:(id)a3;
- (void)addWidgetSheetViewControllerWillAppear:(id)a3;
- (void)addWidgetSheetViewControllerWillDisappear:(id)a3;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)configurationLongPressDidUpdate:(id)a3;
- (void)dealloc;
- (void)didBeginDraggingWidgetIcon:(id)a3;
- (void)extensionsDidChangeForExtensionProvider:(id)a3;
- (void)iconListView:(id)a3 didAddIconView:(id)a4;
- (void)iconManager:(id)a3 configureIconView:(id)a4 forIcon:(id)a5;
- (void)iconManager:(id)a3 iconView:(id)a4 widgetWantsLaunchForBundleIdentifier:(id)a5 withAction:(id)a6;
- (void)iconManager:(id)a3 launchIconForIconView:(id)a4 withActions:(id)a5;
- (void)iconView:(id)a3 didChangeCustomImageViewController:(id)a4;
- (void)invalidate;
- (void)noteAmbientViewControllingDelegateDidUpdate;
- (void)proactiveSuggestionsProvider:(id)a3 willUseIntent:(id)a4 forIconWithIdentifier:(id)a5 widgetUniqueIdentifier:(id)a6;
- (void)setAddWidgetSheetViewController:(id)a3;
- (void)setDefaultWidgetDescriptorStacks:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableIconStateAutosaveAssertion:(id)a3;
- (void)setIconManager:(id)a3;
- (void)setIntent:(id)a3 forIconWithIdentifier:(id)a4 widgetUniqueIdentifier:(id)a5;
- (void)setKeepRootStaticAssertions:(id)a3;
- (void)setLaunchConfirmationCancelTimer:(id)a3;
- (void)setLaunchConfirmationView:(id)a3;
- (void)setPendingLaunchActions:(id)a3;
- (void)setPendingLaunchBundleIdentifier:(id)a3;
- (void)setPosterConfiguration:(id)a3;
- (void)setStackConfigurationViewController:(id)a3;
- (void)setWantsDefaultInfographLayout:(BOOL)a3;
- (void)setWidgetHostManager:(id)a3;
- (void)stackConfigurationInteraction:(id)a3 iconView:(id)a4 dragLiftAnimationDidChangeDirection:(int64_t)a5;
- (void)stackConfigurationInteraction:(id)a3 iconView:(id)a4 willAnimateDragLiftWithAnimator:(id)a5 session:(id)a6;
- (void)stackConfigurationInteraction:(id)a3 requestsPresentAddWidgetSheetFromPresenter:(id)a4;
- (void)stackConfigurationViewControllerDidAppear:(id)a3;
- (void)stackConfigurationViewControllerDidDisappear:(id)a3;
- (void)stackConfigurationViewControllerWillAppear:(id)a3;
- (void)stackConfigurationViewControllerWillDisappear:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)widgetHostManager:(id)a3 didNoteStackChangedActiveWidget:(id)a4;
- (void)widgetStackViewControllerWillBeginScrolling:(id)a3;
@end

@implementation AMUIInfographViewController

- (AMUIInfographViewController)init
{
  v13.receiver = self;
  v13.super_class = (Class)AMUIInfographViewController;
  v2 = [(AMUIInfographViewController *)&v13 initWithNibName:0 bundle:0];
  if (v2)
  {
    v3 = +[AMUIPosterSwitcherModel sharedInstance];
    uint64_t v4 = [v3 posterConfigurationsUpdater];
    posterUpdater = v2->_posterUpdater;
    v2->_posterUpdater = (AMUIPosterUpdater *)v4;

    v6 = [MEMORY[0x263F791F8] rootSettings];
    uint64_t v7 = [v6 widgetSettings];
    widgetSettings = v2->_widgetSettings;
    v2->_widgetSettings = (SBHWidgetSettings *)v7;

    [(AMUIInfographViewController *)v2 setWantsDefaultInfographLayout:0];
    v9 = [MEMORY[0x263F25220] subjectMonitorRegistry];
    uint64_t v10 = [v9 addMonitor:v2 subjectMask:1 subscriptionOptions:1];
    appProtectionSubjectMonitorSubscription = v2->_appProtectionSubjectMonitorSubscription;
    v2->_appProtectionSubjectMonitorSubscription = (APSubjectMonitorSubscription *)v10;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  defaultObserver = self->_defaultObserver;
  if (defaultObserver)
  {
    [(BSDefaultObserver *)defaultObserver invalidate];
    uint64_t v4 = self->_defaultObserver;
    self->_defaultObserver = 0;
  }
  v5 = [(AMUIInfographViewController *)self disableIconStateAutosaveAssertion];
  [v5 invalidate];

  [(AMUIInfographViewController *)self setDisableIconStateAutosaveAssertion:0];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(NSMutableDictionary *)self->_keepRootStaticAssertions objectEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v10++) invalidate];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  keepRootStaticAssertions = self->_keepRootStaticAssertions;
  self->_keepRootStaticAssertions = 0;

  ambientDefaults = self->_ambientDefaults;
  self->_ambientDefaults = 0;

  [(APSubjectMonitorSubscription *)self->_appProtectionSubjectMonitorSubscription invalidate];
  appProtectionSubjectMonitorSubscription = self->_appProtectionSubjectMonitorSubscription;
  self->_appProtectionSubjectMonitorSubscription = 0;

  v14.receiver = self;
  v14.super_class = (Class)AMUIInfographViewController;
  [(AMUIInfographViewController *)&v14 dealloc];
}

- (void)viewWillLayoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)AMUIInfographViewController;
  [(AMUIInfographViewController *)&v21 viewWillLayoutSubviews];
  v3 = [(AMUIInfographViewController *)self view];
  char v4 = [v3 _isInAWindow];
  v5 = [(AMUIInfographViewController *)self view];
  v6 = v5;
  if (v4)
  {
    uint64_t v7 = [v5 window];
    uint64_t v8 = [v7 safeAreaLayoutGuide];
    [v8 layoutFrame];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
  }
  else
  {
    [v5 frame];
    double v10 = v17;
    double v12 = v18;
    double v14 = v19;
    double v16 = v20;
  }

  -[SBIconListView setFrame:](self->_iconListView, "setFrame:", v10, v12, v14, v16);
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AMUIInfographViewController;
  [(AMUIInfographViewController *)&v7 viewWillAppear:a3];
  char v4 = [(AMUIInfographViewController *)self widgetHostManager];
  v5 = [v4 widgetHost];

  [v5 activate];
  [(SBIconListView *)self->_iconListView setVisiblySettled:0];
  [(SBIconListView *)self->_iconListView setContentVisibility:0];
  v6 = [(NSMutableDictionary *)self->_keepRootStaticAssertions objectForKey:@"AMUIKeepRootStaticForInfographNotVisibleReason"];
  [v6 invalidate];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AMUIInfographViewController;
  [(AMUIInfographViewController *)&v4 viewDidAppear:a3];
  [(ATXAmbientSuggestionProvider *)self->_proactiveClient logViewDidAppear];
  [(SBIconListView *)self->_iconListView setVisiblySettled:1];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AMUIInfographViewController;
  -[AMUIInfographViewController viewWillDisappear:](&v7, sel_viewWillDisappear_);
  [(AMUIInfographViewController *)self _syncLocalAmbientIconStateAndIntentsToPoster];
  v5 = [(AMUIInfographViewController *)self stackConfigurationViewController];

  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_iconManager);
    [WeakRetained dismissModalInteractions];
  }
  [(SBIconListView *)self->_iconListView setVisiblySettled:0];
  [(AMUIInfographViewController *)self _dismissLaunchConfirmationAnimated:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AMUIInfographViewController;
  [(AMUIInfographViewController *)&v6 viewDidDisappear:a3];
  [(ATXAmbientSuggestionProvider *)self->_proactiveClient logViewDidDisappear];
  [(AMUIInfographViewController *)self _keepIconViewsStaticForReason:@"AMUIKeepRootStaticForInfographNotVisibleReason"];
  objc_super v4 = [(AMUIInfographViewController *)self widgetHostManager];
  v5 = [v4 widgetHost];

  [v5 deactivate];
  [(SBIconListView *)self->_iconListView setContentVisibility:2];
  [(SBIconListView *)self->_iconListView setVisiblySettled:1];
  [(AMUIInfographViewController *)self _dismissLaunchConfirmationAnimated:0];
}

- (void)setIconManager:(id)a3
{
  id v8 = a3;
  objc_storeWeak((id *)&self->_iconManager, v8);
  [v8 setDelegate:self];
  objc_super v4 = [v8 widgetExtensionProvider];
  widgetExtensionProvider = self->_widgetExtensionProvider;
  self->_widgetExtensionProvider = v4;

  [(CHSWidgetExtensionProvider *)self->_widgetExtensionProvider registerObserver:self];
  objc_super v6 = [v8 addWidgetSheetConfigurationManager];
  addWidgetSheetConfigurationManager = self->_addWidgetSheetConfigurationManager;
  self->_addWidgetSheetConfigurationManager = v6;

  [(SBHAddWidgetSheetConfigurationManager *)self->_addWidgetSheetConfigurationManager setWidgetDragHandlerDelegate:self];
  [(SBHAddWidgetSheetConfigurationManager *)self->_addWidgetSheetConfigurationManager setAllowsFakeWidgets:0];
  [(SBHAddWidgetSheetConfigurationManager *)self->_addWidgetSheetConfigurationManager setAddWidgetSheetLocation:2];
  [(SBHAddWidgetSheetConfigurationManager *)self->_addWidgetSheetConfigurationManager setMinimumRequiredSDKVersion:1];
  if (self->_ambientWidgetLayout
    || [(AMUIInfographViewController *)self wantsDefaultInfographLayout])
  {
    [(AMUIInfographViewController *)self _configureIconManager:v8];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    [(AMUIInfographViewController *)self _fetchDefaultWidgetDescriptorStacks];
    [(AMUIInfographViewController *)self _fetchWidgetHostManager];
    v5 = obj;
  }
}

- (void)setPosterConfiguration:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  char v6 = [(PRSPosterConfiguration *)self->_posterConfiguration isEqual:v5];
  objc_super v7 = AMUILogInfograph();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v8) {
      -[AMUIInfographViewController setPosterConfiguration:]();
    }
  }
  else
  {
    if (v8) {
      -[AMUIInfographViewController setPosterConfiguration:].cold.5();
    }

    objc_storeStrong((id *)&self->_posterConfiguration, a3);
    id v26 = 0;
    double v9 = objc_msgSend(v5, "pr_loadAmbientWidgetLayoutWithError:", &v26);
    objc_super v7 = v26;
    double v10 = [v9 widgetLayoutIconState];
    double v11 = [v10 objectForKey:@"AMUIIconStateKey"];
    BOOL v12 = 0;
    if (v9 && v10) {
      BOOL v12 = [(AMUIInfographViewController *)self _emptyIconState:v11];
    }
    p_ambientWidgetLayout = (id *)&self->_ambientWidgetLayout;
    if ([(PRPosterAmbientWidgetLayout *)self->_ambientWidgetLayout isEqual:v9])
    {
      id v14 = *p_ambientWidgetLayout;
      if (*p_ambientWidgetLayout) {
        goto LABEL_20;
      }
    }
    if (v12) {
      double v15 = 0;
    }
    else {
      double v15 = v9;
    }
    objc_storeStrong((id *)&self->_ambientWidgetLayout, v15);
    BOOL v16 = [(AMUIInfographViewController *)self wantsDefaultInfographLayout]
       || *p_ambientWidgetLayout == 0;
    [(AMUIInfographViewController *)self setWantsDefaultInfographLayout:v16];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_iconManager);
    if (WeakRetained) {
      [(AMUIInfographViewController *)self _configureIconManager:WeakRetained];
    }

    id v14 = *p_ambientWidgetLayout;
    if (*p_ambientWidgetLayout)
    {
LABEL_20:
      double v18 = [v14 widgetLayoutIconState];

      if (v18)
      {
        double v19 = [*p_ambientWidgetLayout widgetLayoutIconState];
        double v20 = [v19 objectForKey:@"AMUIIconStateKey"];

        objc_super v21 = [(AMUIInfographViewController *)self _uniqueIdentifierStacksFromIconState:v20];
        v22 = AMUILogInfograph();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v28 = v21;
          _os_log_impl(&dword_247837000, v22, OS_LOG_TYPE_DEFAULT, "Successfully loading infographPosterConfigurationData with unique identifier stacks:%{public}@", buf, 0xCu);
        }
      }
      else
      {
        double v20 = AMUILogInfograph();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[AMUIInfographViewController setPosterConfiguration:].cold.4();
        }
      }
    }
    else
    {
      double v20 = AMUILogInfograph();
      BOOL v23 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
      if (v12)
      {
        if (v23) {
          -[AMUIInfographViewController setPosterConfiguration:]();
        }
      }
      else if (v23)
      {
        -[AMUIInfographViewController setPosterConfiguration:]((uint64_t)v5);
      }
    }

    v24 = [(AMUIInfographViewController *)self iconManager];
    v25 = [v24 iconModel];
    [v25 saveIconStateIfNeeded];
  }
}

- (void)_configureIconManager:(id)a3
{
  p_iconManager = &self->_iconManager;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_iconManager);
  [WeakRetained setRecyclesIconViews:0];

  [(AMUIInfographViewController *)self _updateIconModelForIconManager:v6];
  [(AMUIInfographViewController *)self _updateProactiveIntegrationForIconManager:v6];
  [(AMUIInfographViewController *)self _updateIconListViewForIconManager:v6];
}

- (void)_updateIconModelForIconManager:(id)a3
{
  id v19 = a3;
  objc_super v4 = [(PRPosterAmbientWidgetLayout *)self->_ambientWidgetLayout widgetLayoutIconState];
  id v5 = [v4 objectForKey:@"AMUIIconStateKey"];
  id v6 = [v4 objectForKey:@"AMUIIntentsKey"];
  objc_super v7 = [NSDictionary dictionaryWithDictionary:v6];
  initIntents = self->_initIntents;
  self->_initIntents = v7;

  double v9 = [v19 iconModel];
  int v10 = [(AMAmbientDefaults *)self->_ambientDefaults alwaysUpdateIconModelOnAmbientWidgetLayoutChange];
  if (!v9 || (v5 ? (BOOL v11 = v10 == 0) : (BOOL v11 = 0), !v11))
  {
    BOOL v12 = (void *)[objc_alloc(MEMORY[0x263F792A8]) initWithCurrentState:v5 desiredState:0];
    double v13 = (void *)[objc_alloc(MEMORY[0x263F79220]) initWithStore:v12];
    [v19 setIconModel:v13];
  }
  id v14 = [v9 disableIconStateAutosaveForReason:@"Infograph poster"];
  [(AMUIInfographViewController *)self setDisableIconStateAutosaveAssertion:v14];

  double v15 = [v19 rootFolder];
  BOOL v16 = [v15 lists];
  double v17 = [v16 firstObject];

  [(AMUIInfographViewController *)self _validateIconListModel:v17];
  listModel = self->_listModel;
  self->_listModel = v17;
}

- (void)_updateProactiveIntegrationForIconManager:(id)a3
{
  id v11 = a3;
  if (!self->_proactiveClient)
  {
    objc_super v4 = (ATXAmbientSuggestionProvider *)objc_alloc_init(MEMORY[0x263F33BD0]);
    proactiveClient = self->_proactiveClient;
    self->_proactiveClient = v4;
  }
  id v6 = [[AMUIProactiveUsageObserver alloc] initWithListModel:self->_listModel iconManager:v11 proactiveClient:self->_proactiveClient];
  proactiveUsageObserver = self->_proactiveUsageObserver;
  self->_proactiveUsageObserver = v6;

  BOOL v8 = [[AMUIProactiveSuggestionsProvider alloc] initWithIconListModel:self->_listModel iconManager:v11 proactiveClient:self->_proactiveClient];
  proactiveSuggestionsProvider = self->_proactiveSuggestionsProvider;
  self->_proactiveSuggestionsProvider = v8;

  [(AMUIProactiveSuggestionsProvider *)self->_proactiveSuggestionsProvider setDelegate:self];
  [(AMUIProactiveUsageObserver *)self->_proactiveUsageObserver pushStackConfigurationsToProactive];
  [v11 setUsageMonitoringEnabled:1];
  int v10 = [v11 usageMonitor];
  [v10 addObserver:self->_proactiveUsageObserver];
}

- (void)_updateIconListViewForIconManager:(id)a3
{
  id v17 = [a3 listLayoutProvider];
  iconListView = self->_iconListView;
  if (iconListView)
  {
    [(SBIconListView *)iconListView removeFromSuperview];
    id v5 = self->_iconListView;
    self->_iconListView = 0;
  }
  id v6 = objc_alloc(MEMORY[0x263F792A0]);
  listModel = self->_listModel;
  uint64_t v8 = *MEMORY[0x263F79320];
  double v9 = [(AMUIInfographViewController *)self _iconViewProvider];
  int v10 = (SBIconListView *)[v6 initWithModel:listModel layoutProvider:v17 iconLocation:v8 orientation:3 iconViewProvider:v9];
  id v11 = self->_iconListView;
  self->_iconListView = v10;

  [(SBIconListView *)self->_iconListView addLayoutObserver:self];
  [(SBIconListView *)self->_iconListView setIconViewConfigurationOptions:18];
  int v12 = [(AMUIInfographViewController *)self _appearState];
  BOOL v13 = v12 != 3;
  if (v12 == 1) {
    BOOL v13 = 0;
  }
  if (v12) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 1;
  }
  if (v12) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = 2;
  }
  [(SBIconListView *)self->_iconListView setContentVisibility:v15];
  [(SBIconListView *)self->_iconListView setVisiblySettled:v14];
  BOOL v16 = [(AMUIInfographViewController *)self view];
  [v16 addSubview:self->_iconListView];
  [v16 setNeedsLayout];
}

- (id)_loadInfographPosterConfigurationDataWithError:(id *)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_super v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  id v5 = [(AMUIInfographViewController *)self iconManager];
  id v6 = [v5 iconModel];
  objc_super v7 = [v6 iconState];

  if (v7) {
    goto LABEL_2;
  }
  ambientWidgetLayout = self->_ambientWidgetLayout;
  if (!ambientWidgetLayout)
  {
    objc_super v7 = AMUILogInfograph();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[AMUIInfographViewController _loadInfographPosterConfigurationDataWithError:]();
    }
    goto LABEL_3;
  }
  int v12 = [(PRPosterAmbientWidgetLayout *)ambientWidgetLayout widgetLayoutIconState];

  if (!v12)
  {
    objc_super v7 = AMUILogInfograph();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[AMUIInfographViewController _loadInfographPosterConfigurationDataWithError:]();
    }
    goto LABEL_3;
  }
  objc_super v7 = [(PRPosterAmbientWidgetLayout *)self->_ambientWidgetLayout widgetLayoutIconState];
  BOOL v13 = [(AMUIInfographViewController *)self _uniqueIdentifierStacksFromIconState:v7];
  uint64_t v14 = AMUILogInfograph();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543362;
    BOOL v16 = v13;
    _os_log_impl(&dword_247837000, v14, OS_LOG_TYPE_DEFAULT, "Successfully loading infographPosterConfigurationData with unique identifier stacks:%{public}@", (uint8_t *)&v15, 0xCu);
  }

  if (v7)
  {
LABEL_2:
    [v4 setObject:v7 forKey:@"AMUIIconStateKey"];
LABEL_3:
  }
  uint64_t v8 = [v5 widgetIntents];
  if (v8
    || ([NSDictionary dictionaryWithDictionary:self->_initIntents],
        (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [v4 setObject:v8 forKey:@"AMUIIntentsKey"];
  }
  double v9 = AMUILogInfograph();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[AMUIInfographViewController _loadInfographPosterConfigurationDataWithError:]();
  }

  return v4;
}

- (void)_syncLocalAmbientIconStateAndIntentsToPoster
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_2(&dword_247837000, v0, v1, "Poster configuration synced to PosterBoard %@", v2, v3, v4, v5, v6);
}

- (BOOL)_saveInfographPosterConfigurationData:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(AMUIInfographViewController *)self posterConfiguration];
  double v9 = AMUILogInfograph();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [v6 objectForKey:@"AMUIIconStateKey"];
    id v11 = [(AMUIInfographViewController *)self _uniqueIdentifierStacksFromIconState:v10];
    *(_DWORD *)buf = 138543618;
    v22 = v11;
    __int16 v23 = 2112;
    v24 = v8;
    _os_log_impl(&dword_247837000, v9, OS_LOG_TYPE_DEFAULT, "Attempting to save infograph with unique identifier stacks:%{public}@ for poster configuration:%@", buf, 0x16u);
  }
  int v12 = AMUILogInfograph();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
  if (v8)
  {
    if (v13) {
      -[AMUIInfographViewController _saveInfographPosterConfigurationData:completion:]();
    }

    objc_initWeak((id *)buf, self);
    posterUpdater = self->_posterUpdater;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __80__AMUIInfographViewController__saveInfographPosterConfigurationData_completion___block_invoke;
    v17[3] = &unk_265224EF8;
    objc_copyWeak(&v20, (id *)buf);
    id v18 = v8;
    id v19 = v7;
    BOOL v15 = [(AMUIPosterUpdater *)posterUpdater updateInfograph:v6 forPosterConfiguration:v18 completion:v17];

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v13) {
      -[AMUIInfographViewController _saveInfographPosterConfigurationData:completion:]();
    }

    BOOL v15 = 0;
  }

  return v15;
}

void __80__AMUIInfographViewController__saveInfographPosterConfigurationData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v8 = AMUILogInfograph();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __80__AMUIInfographViewController__saveInfographPosterConfigurationData_completion___block_invoke_cold_2();
    }

    if (v6)
    {
      double v9 = AMUILogInfograph();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __80__AMUIInfographViewController__saveInfographPosterConfigurationData_completion___block_invoke_cold_1();
      }
    }
    else if (([WeakRetained[150] isEqual:*(void *)(a1 + 32)] & 1) == 0)
    {
      int v10 = [WeakRetained posterConfiguration];
      id v11 = [v10 serverUUID];
      int v12 = [v5 serverUUID];
      int v13 = [v11 isEqual:v12];

      if (v13) {
        [WeakRetained updatePosterConfiguration:v5 withAnimationSettings:0];
      }
    }
  }
  uint64_t v14 = *(void *)(a1 + 40);
  if (v14) {
    (*(void (**)(uint64_t, id, id))(v14 + 16))(v14, v5, v6);
  }
}

- (id)_uniqueIdentifierStacksFromIconState:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 objectForKey:@"iconLists"];
  id v5 = [v4 objectAtIndexedSubscript:0];
  id v6 = v5;
  if (v5 && [v5 count] == 2)
  {
    id v7 = AMUILogInfograph();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      BOOL v16 = v6;
      _os_log_impl(&dword_247837000, v7, OS_LOG_TYPE_DEFAULT, "Parsing widget stacks:%@ into uniqueIdentifierStacks", buf, 0xCu);
    }

    uint64_t v8 = [v6 objectAtIndexedSubscript:0];
    double v9 = [v6 objectAtIndexedSubscript:1];
    int v10 = [(AMUIInfographViewController *)self _uniqueIdentifiersForStack:v8];
    id v11 = [(AMUIInfographViewController *)self _uniqueIdentifiersForStack:v9];
    v14[0] = v10;
    v14[1] = v11;
    int v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  }
  else
  {
    uint64_t v8 = AMUILogInfograph();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AMUIInfographViewController _uniqueIdentifierStacksFromIconState:]();
    }
    int v12 = 0;
  }

  return v12;
}

- (id)_uniqueIdentifiersForStack:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = AMUILogInfograph();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v3;
    _os_log_impl(&dword_247837000, v4, OS_LOG_TYPE_DEFAULT, "Creating uniqueIdentifiers for stack:%@", buf, 0xCu);
  }

  id v5 = [v3 objectForKey:@"elements"];
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "objectForKey:", @"uniqueIdentifier", (void)v17);
        int v13 = (void *)v12;
        if (v12) {
          uint64_t v14 = (__CFString *)v12;
        }
        else {
          uint64_t v14 = @"(null uniqueIdentifier)";
        }
        BOOL v15 = v14;

        [v6 addObject:v15];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  return v6;
}

- (BOOL)updatePosterConfiguration:(id)a3 withAnimationSettings:(id)a4
{
  return 1;
}

- (void)invalidate
{
  uint64_t v2 = [(AMUIInfographViewController *)self widgetHostManager];
  id v3 = [v2 widgetHost];

  [v3 deactivate];
}

- (void)noteAmbientViewControllingDelegateDidUpdate
{
  [(AMUIInfographViewController *)self _setupAmbientDefaults];
  [(AMUIInfographViewController *)self _fetchDefaultWidgetDescriptorStacks];

  [(AMUIInfographViewController *)self _fetchWidgetHostManager];
}

- (BOOL)handleDismiss
{
  id v3 = [(AMUIInfographViewController *)self stackConfigurationViewController];

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_iconManager);
    [WeakRetained dismissModalInteractions];
  }
  return v3 != 0;
}

- (id)cancelTouchesForCurrentEventInHostedContent
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  iconListView = self->_iconListView;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __74__AMUIInfographViewController_cancelTouchesForCurrentEventInHostedContent__block_invoke;
  v8[3] = &unk_265224F20;
  id v9 = v3;
  id v5 = v3;
  [(SBIconListView *)iconListView enumerateDisplayedIconViewsUsingBlock:v8];
  id v6 = [[AMUIInfographMultipleAssertion alloc] initWithAssertions:v5];

  return v6;
}

void __74__AMUIInfographViewController_cancelTouchesForCurrentEventInHostedContent__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 customIconImageViewController];
  id v5 = [v3 cancelTouchesForCurrentEventInHostedContent];

  uint64_t v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
    uint64_t v4 = v5;
  }
}

- (BOOL)iconManagerWidgetsCanAppearInSecureEnvironment:(id)a3
{
  return 1;
}

- (void)iconManager:(id)a3 configureIconView:(id)a4 forIcon:(id)a5
{
  id v6 = (objc_class *)MEMORY[0x263F1C7A0];
  id v7 = a4;
  id v10 = (id)[[v6 alloc] initWithTarget:self action:sel_configurationLongPressDidUpdate_];
  objc_msgSend(v7, "addGestureRecognizer:");
  [v7 setShowsSquareCorners:1];
  [v7 addObserver:self];

  if (!self->_widgetStackConfigurationFeedbackGenerator)
  {
    uint64_t v8 = (UINotificationFeedbackGenerator *)objc_alloc_init(MEMORY[0x263F1C810]);
    widgetStackConfigurationFeedbackGenerator = self->_widgetStackConfigurationFeedbackGenerator;
    self->_widgetStackConfigurationFeedbackGenerator = v8;
  }
}

- (void)iconManager:(id)a3 launchIconForIconView:(id)a4 withActions:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  uint64_t v8 = [(AMUIInfographViewController *)self _applicationBundleIdentifierForLaunchingIconView:v9];
  if (v8) {
    [(AMUIInfographViewController *)self _showLaunchConfirmationForApplicationWithBundleIdentifier:v8 withActions:v7 iconView:v9];
  }
}

- (CGRect)iconManager:(id)a3 contentBoundingRectForConfigurationOfIconView:(id)a4
{
  uint64_t v4 = [(AMUIInfographViewController *)self iconManager:a3 containerViewControllerForConfigurationOfIconView:a4];
  id v5 = [v4 view];
  id v6 = v5;
  if (v5)
  {
    [v5 bounds];
    objc_msgSend(v6, "convertRect:toView:", v6);
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    double v8 = *MEMORY[0x263F001A8];
    double v10 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v12 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v14 = *(double *)(MEMORY[0x263F001A8] + 24);
  }

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (int64_t)iconManager:(id)a3 userInterfaceStyleForConfigurationOfIconView:(id)a4
{
  uint64_t v4 = [(AMUIInfographViewController *)self traitCollection];
  int64_t v5 = [v4 userInterfaceStyle];

  return v5;
}

- (unint64_t)_addWidgetSheetStyle
{
  return 1;
}

- (id)customDisplayConfigurationForWidgetViewController
{
  id v3 = objc_alloc(MEMORY[0x263F79260]);
  uint64_t v4 = [(AMUIInfographViewController *)self renderSchemeForWidgetViewController];
  int64_t v5 = (void *)[v3 initWithRenderScheme:v4 colorScheme:2];

  return v5;
}

- (id)renderSchemeForWidgetViewController
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(AMUIInfographViewController *)self traitCollection];
  id v3 = self;
  [v2 valueForNSIntegerTrait:v3];
  unsigned int IsRedMode = AMUIAmbientDisplayStyleIsRedMode();

  int64_t v5 = (void *)[objc_alloc(MEMORY[0x263F31EF8]) initWithRenderingMode:IsRedMode backgroundViewPolicy:1];
  id v6 = AMUILogInfograph();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    double v9 = v5;
    __int16 v10 = 1024;
    unsigned int v11 = IsRedMode;
    _os_log_impl(&dword_247837000, v6, OS_LOG_TYPE_DEFAULT, "Created renderScheme:%@ for widget view controller with redModeEnabled:%d", (uint8_t *)&v8, 0x12u);
  }

  return v5;
}

- (Class)iconManager:(id)a3 folderControllerClassForFolderClass:(Class)a4 proposedClass:(Class)a5
{
  return 0;
}

- (id)iconManager:(id)a3 configurationDataForDataSource:(id)a4 ofIcon:(id)a5
{
  id v7 = a4;
  intents = self->_intents;
  if (!intents) {
    intents = (NSMutableDictionary *)self->_initIntents;
  }
  double v9 = intents;
  id v10 = a5;
  uint64_t v11 = objc_opt_class();
  id v12 = v7;
  if (v11)
  {
    if (objc_opt_isKindOfClass()) {
      double v13 = v12;
    }
    else {
      double v13 = 0;
    }
  }
  else
  {
    double v13 = 0;
  }
  id v14 = v13;

  double v15 = [v14 uniqueIdentifier];

  int v16 = [v10 isWidgetIcon];
  double v17 = 0;
  if (v14 && v16)
  {
    double v17 = [(NSMutableDictionary *)v9 objectForKey:v15];
  }

  return v17;
}

- (id)_fetchIntents
{
  id v3 = [(AMUIInfographViewController *)self iconManager];
  uint64_t v4 = v3;
  if (v3 && ([v3 widgetIntents], int64_t v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    id v6 = (void *)MEMORY[0x263EFF9A0];
    id v7 = [v4 widgetIntents];
    int v8 = [v6 dictionaryWithDictionary:v7];

    double v9 = [MEMORY[0x263EFF9A0] dictionary];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __44__AMUIInfographViewController__fetchIntents__block_invoke;
    v19[3] = &unk_265224F48;
    id v20 = v9;
    id v10 = v9;
    [v8 enumerateKeysAndObjectsUsingBlock:v19];
    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v10];
    intents = self->_intents;
    self->_intents = v11;
  }
  else
  {
    double v13 = [(AMUIInfographViewController *)self _loadInfographPosterConfigurationDataWithError:0];
    id v14 = v13;
    if (v13)
    {
      double v15 = [v13 objectForKey:@"AMUIIntentsKey"];
      int v16 = self->_intents;
      self->_intents = v15;
    }
  }
  double v17 = self->_intents;

  return v17;
}

void __44__AMUIInfographViewController__fetchIntents__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v9 = 0;
  id v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v9];
  id v7 = v9;
  if (v7)
  {
    int v8 = AMUILogInfograph();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __44__AMUIInfographViewController__fetchIntents__block_invoke_cold_1((uint64_t)v5);
    }
  }
  else
  {
    [*(id *)(a1 + 32) setObject:v6 forKey:v5];
  }
}

- (void)setIntent:(id)a3 forIconWithIdentifier:(id)a4 widgetUniqueIdentifier:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && !self->_intents)
  {
    uint64_t v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    intents = self->_intents;
    self->_intents = v11;
  }
  double v13 = (void *)[[NSString alloc] initWithFormat:@"%@", v10];
  if (v8)
  {
    id v25 = 0;
    id v14 = [MEMORY[0x263F08910] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v25];
    id v15 = v25;
    if (!v14)
    {
      double v17 = AMUILogWidgets();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = [v8 _indexingHash];
        *(_DWORD *)buf = 138544130;
        id v27 = v10;
        __int16 v28 = 2048;
        uint64_t v29 = v24;
        __int16 v30 = 2112;
        v31 = v13;
        __int16 v32 = 2112;
        id v33 = v15;
        _os_log_error_impl(&dword_247837000, v17, OS_LOG_TYPE_ERROR, "Error archiving intent widget unique identifier '%{public}@/%lld/%@': %@", buf, 0x2Au);
      }
      goto LABEL_17;
    }
    [(NSMutableDictionary *)self->_intents setObject:v14 forKey:v13];
    uint64_t v16 = [v14 length];
    double v17 = AMUILogWidgets();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        uint64_t v19 = [v8 _indexingHash];
        *(_DWORD *)buf = 138543618;
        id v27 = v10;
        __int16 v28 = 2048;
        uint64_t v29 = v19;
        id v20 = "Saving intent for widget unique identifier '%{public}@'/%lld";
        objc_super v21 = v17;
        uint32_t v22 = 22;
LABEL_16:
        _os_log_impl(&dword_247837000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
      }
    }
    else if (v18)
    {
      *(_DWORD *)buf = 138543362;
      id v27 = v10;
      id v20 = "Saving 0-length intent for widget unique identifier '%{public}@'";
      objc_super v21 = v17;
      uint32_t v22 = 12;
      goto LABEL_16;
    }
LABEL_17:

    goto LABEL_18;
  }
  id v23 = AMUILogWidgets();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v27 = v10;
    __int16 v28 = 2048;
    uint64_t v29 = [0 _indexingHash];
    __int16 v30 = 2112;
    v31 = v13;
    _os_log_impl(&dword_247837000, v23, OS_LOG_TYPE_DEFAULT, "Removing intent for widget unique identifier '%{public}@'/%lld/%@", buf, 0x20u);
  }

  [(NSMutableDictionary *)self->_intents removeObjectForKey:v13];
LABEL_18:
}

- (id)defaultIconStateForIconManager:(id)a3
{
  uint64_t v4 = AMUILogInfograph();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_247837000, v4, OS_LOG_TYPE_DEFAULT, "Fetching default icon state", v10, 2u);
  }

  id v5 = [(AMUIInfographViewController *)self defaultWidgetDescriptorStacks];
  id v6 = [(AMUIInfographViewController *)self _iconStateFromDefaultWidgetDescriptorStacks:v5];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    id v7 = [(AMUIInfographViewController *)self _defaultIconState];
  }
  id v8 = v7;

  return v8;
}

- (id)iconManager:(id)a3 backgroundViewForComponentsOfType:(int64_t)a4 forIconView:(id)a5
{
  if (a4 == 1)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x263F1CB60]);
  }
  return v6;
}

- (unint64_t)maximumListCountForFoldersForIconManager:(id)a3
{
  return 1;
}

- (id)iconManager:(id)a3 localizedFolderNameForDefaultDisplayName:(id)a4
{
  return @"Folder";
}

- (BOOL)iconManagerCanSaveIconState:(id)a3
{
  return 1;
}

- (id)iconManager:(id)a3 metricsForCHSWidget:(id)a4 inLocation:(id)a5
{
  id v7 = a4;
  if ([a5 isEqualToString:*MEMORY[0x263F79318]])
  {
    addWidgetSheetMetricsProvider = self->_addWidgetSheetMetricsProvider;
    if (!addWidgetSheetMetricsProvider)
    {
      id v9 = (SBHWidgetMetricsProvider *)objc_alloc_init(MEMORY[0x263F79268]);
      id v10 = self->_addWidgetSheetMetricsProvider;
      self->_addWidgetSheetMetricsProvider = v9;

      [(SBHWidgetMetricsProvider *)self->_addWidgetSheetMetricsProvider setDelegate:self];
      addWidgetSheetMetricsProvider = self->_addWidgetSheetMetricsProvider;
    }
    uint64_t v11 = [(SBHWidgetMetricsProvider *)addWidgetSheetMetricsProvider systemMetricsForWidget:v7];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (BOOL)iconManagerAllowsWidgetStackWithSingleWidgetToPresentStackConfigurationSheet:(id)a3
{
  return 1;
}

- (int64_t)iconManager:(id)a3 closeBoxTypeForIconView:(id)a4 proposedType:(int64_t)a5
{
  return 1;
}

- (BOOL)iconManager:(id)a3 shouldContinueToUseBackgroundView:(id)a4 forComponentsOfIconView:(id)a5
{
  return 1;
}

- (BOOL)iconManager:(id)a3 isWidgetValid:(id)a4
{
  return 1;
}

- (BOOL)iconManager:(id)a3 isTimedOutForDataSourceContainerBundleIdentifier:(id)a4
{
  uint64_t v4 = (objc_class *)MEMORY[0x263F01878];
  id v5 = a4;
  id v6 = (void *)[[v4 alloc] initWithBundleIdentifier:v5 allowPlaceholder:0 error:0];

  if (v6 && (id v7 = (void *)[objc_alloc(MEMORY[0x263F3F6C8]) initWithApplicationRecord:v6]) != 0)
  {
    id v8 = v7;
    char v9 = [v7 isBlockedForScreenTimeExpiration];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isRootFolderContentVisibleForIconManager:(id)a3
{
  return ![(AMUIInfographViewController *)self isConfiguring];
}

- (double)iconManager:(id)a3 verticalMarginPercentageForConfigurationOfIconView:(id)a4
{
  return 0.0;
}

- (id)iconManager:(id)a3 containerBundleIdentifierForDescriptor:(id)a4
{
  id v5 = a4;
  id v6 = [v5 extensionIdentity];
  id v7 = [v6 containerBundleIdentifier];

  id v8 = [v5 extensionIdentity];

  char v9 = [v8 extensionBundleIdentifier];

  id v10 = [(AMUIInfographViewController *)self _effectiveContainerBundleIdentifierForContainerBundleIdentifier:v7 extensionBundleIdentifier:v9];

  return v10;
}

- (id)_effectiveContainerBundleIdentifierForContainerBundleIdentifier:(id)a3 extensionBundleIdentifier:(id)a4
{
  id v5 = (__CFString *)a3;
  id v6 = a4;
  if ([(__CFString *)v5 isEqualToString:@"com.apple.Health.Sleep"]
    && [v6 isEqualToString:@"com.apple.Health.Sleep.SleepWidgetExtension"])
  {

    id v5 = @"com.apple.Health";
  }

  return v5;
}

- (BOOL)iconManager:(id)a3 dragsSupportSystemDragsForIconView:(id)a4
{
  return 0;
}

- (id)iconManager:(id)a3 bundleIdentifierToLaunchForWidgetURL:(id)a4
{
  id v4 = a4;
  if (v4)
  {
    id v5 = v4;
    id v6 = [MEMORY[0x263F01880] defaultWorkspace];
    id v7 = [v6 URLOverrideForURL:v5];

    id v8 = [v6 applicationsAvailableForOpeningURL:v7];
    if ([v8 count])
    {
      char v9 = [v8 objectAtIndex:0];
      id v10 = [v9 bundleIdentifier];
    }
    else
    {
      uint64_t v11 = AMUILogWidgets();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[AMUIInfographViewController iconManager:bundleIdentifierToLaunchForWidgetURL:]();
      }

      id v10 = 0;
    }
  }
  else
  {
    id v7 = AMUILogWidgets();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v13 = 0;
      _os_log_impl(&dword_247837000, v7, OS_LOG_TYPE_DEFAULT, "No bundle identifier was found for widget URL because the URL was nil", v13, 2u);
    }
    id v10 = 0;
  }

  return v10;
}

- (void)iconManager:(id)a3 iconView:(id)a4 widgetWantsLaunchForBundleIdentifier:(id)a5 withAction:(id)a6
{
  char v9 = (void *)MEMORY[0x263EFFA08];
  id v10 = a5;
  id v11 = a4;
  id v12 = [v9 setWithObject:a6];
  [(AMUIInfographViewController *)self _showLaunchConfirmationForApplicationWithBundleIdentifier:v10 withActions:v12 iconView:v11];
}

- (id)iconManager:(id)a3 targetedDragPreviewForIconView:(id)a4 item:(id)a5 session:(id)a6 previewParameters:(id)a7
{
  return [(AMUIInfographViewController *)self targetedDragPreviewForIconView:a4 item:a5 session:a6 previewParameters:a7];
}

- (BOOL)iconManager:(id)a3 isIconVisibleForBundleIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(AMUIInfographViewController *)self delegate];
  LOBYTE(self) = [v6 viewController:self isApplicationVisibleWithBundleIdentifier:v5];

  return (char)self;
}

- (BOOL)iconManager:(id)a3 iconViewDisplaysLabel:(id)a4
{
  return 0;
}

- (void)iconView:(id)a3 didChangeCustomImageViewController:(id)a4
{
  id v6 = [a3 customIconImageViewController];
  id v4 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [v6 setClipsWidgetsToViewBounds:0];
  }
}

- (unint64_t)presenterType
{
  return 0;
}

- (BOOL)isDisplayingEditingButtons
{
  return 0;
}

- (BOOL)cannotRemoveLastWidgetInWidgetSheet
{
  return 1;
}

- (int64_t)overrideUserInterfaceStyleForPresentingWidgetSheet
{
  return 1;
}

- (void)stackConfigurationInteraction:(id)a3 requestsPresentAddWidgetSheetFromPresenter:(id)a4
{
  id v6 = a4;
  id v7 = [a3 configuration];
  id v9 = [v7 sizeClass];

  id v8 = (void *)[objc_alloc(MEMORY[0x263F79208]) initWithGridSizeClass:v9];
  [(AMUIInfographViewController *)self _presentAddWidgetSheetFromViewController:v6 withAllowedSizeClasses:v8 allowsNonStackableItems:0];
}

- (id)stackConfigurationInteraction:(id)a3 draggedIconForIdentifier:(id)a4
{
  return 0;
}

- (id)stackConfigurationInteraction:(id)a3 dragPreviewForIconView:(id)a4
{
  return 0;
}

- (id)stackConfigurationInteraction:(id)a3 targetedDragPreviewForIconView:(id)a4 item:(id)a5 session:(id)a6 previewParameters:(id)a7
{
  return [(AMUIInfographViewController *)self targetedDragPreviewForIconView:a4 item:a5 session:a6 previewParameters:a7];
}

- (id)windowForIconDragPreviewsForStackConfigurationInteraction:(id)a3 forWindowScene:(id)a4
{
  return 0;
}

- (id)stackConfigurationInteraction:(id)a3 promoteSuggestedWidget:(id)a4 withinStack:(id)a5
{
  return 0;
}

- (double)stackConfigurationInteraction:(id)a3 iconContentScaleForGridSizeClass:(id)a4
{
  return 0.5;
}

- (BOOL)stackConfigurationInteractionShouldDisallowLabelArea:(id)a3
{
  return 1;
}

- (BOOL)stackConfigurationInteraction:(id)a3 dragsSupportSystemDragsForIconView:(id)a4
{
  return 0;
}

- (void)stackConfigurationInteraction:(id)a3 iconView:(id)a4 willAnimateDragLiftWithAnimator:(id)a5 session:(id)a6
{
  id v7 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __110__AMUIInfographViewController_stackConfigurationInteraction_iconView_willAnimateDragLiftWithAnimator_session___block_invoke;
  v9[3] = &unk_2652247E0;
  id v10 = v7;
  id v8 = v7;
  [a5 addAnimations:v9];
}

uint64_t __110__AMUIInfographViewController_stackConfigurationInteraction_iconView_willAnimateDragLiftWithAnimator_session___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAllowsCloseBox:0];
}

- (void)stackConfigurationInteraction:(id)a3 iconView:(id)a4 dragLiftAnimationDidChangeDirection:(int64_t)a5
{
  id v6 = a4;
  BOOL v7 = a5 == 1;
  id v8 = (void *)MEMORY[0x263F1CB60];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __106__AMUIInfographViewController_stackConfigurationInteraction_iconView_dragLiftAnimationDidChangeDirection___block_invoke;
  v11[3] = &unk_265224D18;
  char v9 = v7;
  id v12 = v6;
  char v13 = v9;
  id v10 = v6;
  [v8 animateWithDuration:v11 animations:0.2];
}

uint64_t __106__AMUIInfographViewController_stackConfigurationInteraction_iconView_dragLiftAnimationDidChangeDirection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAllowsCloseBox:*(unsigned __int8 *)(a1 + 40)];
}

- (int64_t)stackConfigurationInteractionIconViewComponentBackgroundViewType:(id)a3
{
  return 6;
}

- (BOOL)stackConfigurationInteraction:(id)a3 allowsRemovalOfIconDataSource:(id)a4
{
  return objc_msgSend(MEMORY[0x263F1C408], "isRunningInStoreDemoMode", a3, a4) ^ 1;
}

- (void)stackConfigurationViewControllerWillAppear:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v10 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v10;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  [(AMUIInfographViewController *)self setStackConfigurationViewController:v7];
  addWidgetSheetConfigurationManager = self->_addWidgetSheetConfigurationManager;
  char v9 = [(AMUIInfographViewController *)self addWidgetSheetViewController];
  [(SBHAddWidgetSheetConfigurationManager *)addWidgetSheetConfigurationManager fetchGalleryContentForStackConfigurationViewController:v7 addWidgetSheetViewController:v9];

  [v7 setCanDismissWhileDragging:0];
  [(AMUIInfographViewController *)self _handleWidgetSheetViewControllerWillAppear:v10];

  [(AMUIInfographViewController *)self _willEnterConfigurationForReason:@"AMUIConfigurationReasonStackConfiguration"];
  [(AMUIInfographViewController *)self _dismissLaunchConfirmationAnimated:1];
  [(AMUIInfographViewController *)self _startStackConfigurationEditingTimeoutTimer];
}

- (void)stackConfigurationViewControllerDidAppear:(id)a3
{
  [(AMUIInfographViewController *)self _handleWidgetSheetViewControllerDidAppear:a3];

  [(AMUIInfographViewController *)self _keepIconViewsStaticForReason:@"AMUIKeepRootStaticForStackEditingReason"];
}

- (void)stackConfigurationViewControllerWillDisappear:(id)a3
{
  [(AMUIInfographViewController *)self _handleWidgetSheetViewControllerWillDisappear:a3];
  [(AMUIInfographViewController *)self _willEndConfigurationForReason:@"AMUIConfigurationReasonStackConfiguration"];
  id v4 = [(NSMutableDictionary *)self->_keepRootStaticAssertions objectForKey:@"AMUIKeepRootStaticForStackEditingReason"];
  [v4 invalidate];
  [(AMUIInfographViewController *)self _invalidateStackConfigurationEditingTimeoutTimer];
}

- (void)stackConfigurationViewControllerDidDisappear:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v9 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v9;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [(AMUIInfographViewController *)self stackConfigurationViewController];

  if (v8 == v7)
  {
    [(AMUIInfographViewController *)self setStackConfigurationViewController:0];
    [(SBHAddWidgetSheetConfigurationManager *)self->_addWidgetSheetConfigurationManager setStackConfigurationSuggestedWidgetItems:0];
  }
  [(AMUIInfographViewController *)self _handleWidgetSheetViewControllerDidDisappear:v9];
  objc_storeWeak((id *)&self->_iconViewPresentingStackConfiguration, 0);
}

- (void)addWidgetSheetViewController:(id)a3 didSelectWidgetIconView:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  [(AMUIInfographViewController *)self dismissViewControllerAnimated:v9 != 0 completion:0];
  id v7 = [v6 icon];
  if (v7)
  {
    id v8 = [v9 presenter];
    [(AMUIInfographViewController *)self _handleInsertionForWidgetIcon:v7 withReferenceIconView:v6 fromPresenter:v8];
  }
}

- (void)_handleInsertionForWidgetIcon:(id)a3 withReferenceIconView:(id)a4 fromPresenter:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_class();
  id v12 = v10;
  if (v11)
  {
    if (objc_opt_isKindOfClass()) {
      char v13 = v12;
    }
    else {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }
  id v14 = v13;

  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  id v23 = __97__AMUIInfographViewController__handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter___block_invoke;
  uint64_t v24 = &unk_265224FE8;
  id v25 = v8;
  id v26 = v14;
  id v27 = self;
  id v28 = v9;
  id v15 = v9;
  id v16 = v14;
  id v17 = v8;
  BOOL v18 = (void (**)(void, void))MEMORY[0x24C5614A0](&v21);
  uint64_t v19 = objc_msgSend(v16, "iconListView", v21, v22, v23, v24);
  id v20 = [v19 model];

  ((void (**)(void, void *))v18)[2](v18, v20);
}

void __97__AMUIInfographViewController__handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x263F792C0] placeholderForIcon:*(void *)(a1 + 32)];
  [v3 addIcon:v4];
  if ([v3 directlyContainsIcon:v4])
  {
    uint64_t v5 = [*(id *)(a1 + 40) iconListView];
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    char v32 = 0;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __97__AMUIInfographViewController__handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter___block_invoke_2;
    v23[3] = &unk_265224F98;
    __int16 v30 = v31;
    id v24 = v3;
    id v6 = v4;
    id v25 = v6;
    id v26 = *(id *)(a1 + 32);
    id v7 = v5;
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = *(void **)(a1 + 56);
    id v27 = v7;
    uint64_t v28 = v8;
    id v29 = v9;
    id v10 = (void *)MEMORY[0x24C5614A0](v23);
    id v11 = objc_alloc_init(MEMORY[0x263F79298]);
    objc_initWeak(&location, v11);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __97__AMUIInfographViewController__handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter___block_invoke_4;
    v18[3] = &unk_265224FC0;
    id v12 = v6;
    id v19 = v12;
    char v13 = v10;
    id v20 = v13;
    objc_copyWeak(&v21, &location);
    [v11 setDidAddIconViewBlock:v18];
    [v7 addLayoutObserver:v11];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __97__AMUIInfographViewController__handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter___block_invoke_5;
    v17[3] = &unk_2652248F0;
    void v17[4] = v31;
    id v14 = (void *)MEMORY[0x24C5614A0](v17);
    [*(id *)(a1 + 40) scrollIconToVisible:v12 animated:0 completion:v14];
    id v15 = [*(id *)(a1 + 40) iconListView];
    id v16 = [v15 displayedIconViewForIcon:v12];

    if (v16) {
      v13[2](v13, 0.0);
    }

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

    _Block_object_dispose(v31, 8);
  }
}

void __97__AMUIInfographViewController__handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter___block_invoke_2(uint64_t a1, double a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 80) + 8);
  if (!*(unsigned char *)(v2 + 24))
  {
    *(unsigned char *)(v2 + 24) = 1;
    dispatch_time_t v4 = dispatch_time(0, (uint64_t)(a2 * 1000000000.0));
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __97__AMUIInfographViewController__handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter___block_invoke_3;
    v8[3] = &unk_265224F70;
    id v9 = *(id *)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    id v5 = *(id *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 64);
    id v7 = *(void **)(a1 + 72);
    id v12 = v5;
    uint64_t v13 = v6;
    id v14 = v7;
    dispatch_after(v4, MEMORY[0x263EF83A0], v8);
  }
}

void __97__AMUIInfographViewController__handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter___block_invoke_3(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) replaceIcon:*(void *)(a1 + 40) withIcon:*(void *)(a1 + 48) options:0];
  [*(id *)(a1 + 56) layoutAndCreateIcon:*(void *)(a1 + 48)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 64) + 1224));
  id v4 = [WeakRetained widgetInsertionRippleIconAnimatorForIcon:*(void *)(a1 + 48) iconListView:*(void *)(a1 + 56) withReferenceIconView:*(void *)(a1 + 72)];

  [v4 animateWithCompletion:0];
}

void __97__AMUIInfographViewController__handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 icon];
  int v5 = [v4 isEqual:*(void *)(a1 + 32)];

  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v8 = [v7 userInterfaceIdiom];

    v9.n128_u64[0] = 0x3FD3333333333333;
    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
      v9.n128_f64[0] = 0.0;
    }
    (*(void (**)(uint64_t, __n128))(v6 + 16))(v6, v9);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained invalidate];
  }
}

uint64_t __97__AMUIInfographViewController__handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter___block_invoke_5(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
  if (!*(unsigned char *)(v1 + 24)) {
    *(unsigned char *)(v1 + 24) = 1;
  }
  return result;
}

- (void)addWidgetSheetViewControllerDidCancel:(id)a3
{
}

- (void)addWidgetSheetViewControllerWillAppear:(id)a3
{
  id v4 = a3;
  [(AMUIInfographViewController *)self _invalidateStackConfigurationEditingTimeoutTimer];
  [(AMUIInfographViewController *)self _handleWidgetSheetViewControllerWillAppear:v4];
}

- (void)addWidgetSheetViewControllerDidAppear:(id)a3
{
  id v8 = a3;
  id v4 = [(AMUIInfographViewController *)self stackConfigurationViewController];
  int v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 keepIconImageViewControllersStaticForReason:@"AMUIKeepStackStaticForAddWidgetSheetPresentationReason"];
    if (v6)
    {
      id v7 = [v8 userInfo];
      [v7 setObject:v6 forKey:@"AMUIKeepStackStaticForAddWidgetSheetPresentationReason"];
    }
  }
  [(AMUIInfographViewController *)self _handleWidgetSheetViewControllerDidAppear:v8];
}

- (void)addWidgetSheetViewControllerWillDisappear:(id)a3
{
  id v7 = a3;
  id v4 = [v7 userInfo];
  int v5 = [v4 objectForKey:@"AMUIKeepStackStaticForAddWidgetSheetPresentationReason"];

  if (v5)
  {
    [v5 invalidate];
    uint64_t v6 = [v7 userInfo];
    [v6 removeObjectForKey:@"AMUIKeepStackStaticForAddWidgetSheetPresentationReason"];
  }
  [(AMUIInfographViewController *)self _handleWidgetSheetViewControllerWillDisappear:v7];
  [(AMUIInfographViewController *)self _restartStackConfigurationEditingTimeoutTimer];
}

- (void)_handleWidgetSheetViewControllerWillAppear:(id)a3
{
  id v3 = a3;
  id v4 = [v3 presenter];
  [v4 setSuppressesEditingStateForListView:1];
  if (objc_opt_respondsToSelector())
  {
    if ([v3 hidesPresenterTitledButtons]) {
      double v5 = 0.0;
    }
    else {
      double v5 = 0.3;
    }
  }
  else
  {
    double v5 = 0.3;
  }
  uint64_t v6 = (void *)MEMORY[0x263F1CB60];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __74__AMUIInfographViewController__handleWidgetSheetViewControllerWillAppear___block_invoke;
  v8[3] = &unk_2652247E0;
  id v9 = v4;
  id v7 = v4;
  [v6 animateWithDuration:v8 animations:0 completion:v5];
}

uint64_t __74__AMUIInfographViewController__handleWidgetSheetViewControllerWillAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTitledButtonsAlpha:0.0];
}

- (void)_handleWidgetSheetViewControllerWillDisappear:(id)a3
{
  id v3 = [a3 presenter];
  [v3 setSuppressesEditingStateForListView:0];
  id v4 = (void *)MEMORY[0x263F1CB60];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __77__AMUIInfographViewController__handleWidgetSheetViewControllerWillDisappear___block_invoke;
  v6[3] = &unk_2652247E0;
  id v7 = v3;
  id v5 = v3;
  [v4 animateWithDuration:v6 animations:0 completion:0.3];
}

uint64_t __77__AMUIInfographViewController__handleWidgetSheetViewControllerWillDisappear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTitledButtonsAlpha:1.0];
}

- (void)_handleWidgetSheetViewControllerDidDisappear:(id)a3
{
  id v3 = [a3 presenter];
  [v3 updateExtraButtonVisibilityAnimated:1];
}

- (id)widgetIconForGalleryItem:(id)a3 sizeClass:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  id v8 = v6;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  id v10 = v9;

  uint64_t v11 = objc_opt_class();
  id v12 = v8;
  if (v11)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v14 = v13;

  if (v10)
  {
    id v15 = [(AMUIInfographViewController *)self widgetIconForDescriptor:v10 sizeClass:a4];
  }
  else if (v14)
  {
    id v16 = [v14 descriptorsForSizeClass:a4];
    id v15 = [(AMUIInfographViewController *)self widgetIconForDescriptors:v16 sizeClass:a4];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)widgetIconForDescriptor:(id)a3 sizeClass:(int64_t)a4
{
  id v4 = (objc_class *)MEMORY[0x263F792C8];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithCHSWidgetDescriptor:v5];

  uint64_t v7 = SBHIconGridSizeClassForCHSWidgetFamily();
  [v6 setGridSizeClass:v7];

  return v6;
}

- (id)widgetIconForDescriptors:(id)a3 sizeClass:(int64_t)a4
{
  id v4 = (objc_class *)MEMORY[0x263F792C8];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithCHSWidgetDescriptors:v5];

  uint64_t v7 = SBHIconGridSizeClassForCHSWidgetFamily();
  [v6 setGridSizeClass:v7];

  return v6;
}

- (void)didBeginDraggingWidgetIcon:(id)a3
{
}

- (void)extensionsDidChangeForExtensionProvider:(id)a3
{
  addWidgetSheetConfigurationManager = self->_addWidgetSheetConfigurationManager;
  id v4 = [(AMUIInfographViewController *)self addWidgetSheetViewController];
  [(SBHAddWidgetSheetConfigurationManager *)addWidgetSheetConfigurationManager updatePresentedWidgetEditingViewController:v4];
}

- (void)widgetHostManager:(id)a3 didNoteStackChangedActiveWidget:(id)a4
{
  id v6 = [(AMUIInfographViewController *)self delegate];
  id v5 = [(AMUIInfographViewController *)self _infographConfigurationMetadata];
  [v6 viewController:self didUpdateActiveConfigurationMetadata:v5];
}

- (id)_infographConfigurationMetadata
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  iconListView = self->_iconListView;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__AMUIInfographViewController__infographConfigurationMetadata__block_invoke;
  v7[3] = &unk_265225010;
  id v5 = v3;
  id v8 = v5;
  [(SBIconListView *)iconListView enumerateIconViewsUsingBlock:v7];

  return v5;
}

void __62__AMUIInfographViewController__infographConfigurationMetadata__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v16 = [a2 customIconImageViewController];
  id v5 = self;
  if (objc_opt_isKindOfClass()) {
    id v6 = v16;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = [v7 widgetIcon];
    id v9 = [v8 activeWidget];
    id v10 = objc_msgSend(@"WidgetStack", "stringByAppendingFormat:", @"%lu", a3);
    uint64_t v11 = NSString;
    id v12 = [v9 displayName];
    uint64_t v13 = [v9 extensionBundleIdentifier];
    id v14 = [v9 kind];
    id v15 = [v11 stringWithFormat:@"%@:%@:%@", v12, v13, v14];

    [*(id *)(a1 + 32) setObject:v15 forKeyedSubscript:v10];
  }
}

- (void)_presentAddWidgetSheetFromViewController:(id)a3 withAllowedSizeClasses:(id)a4 allowsNonStackableItems:(BOOL)a5
{
  BOOL v5 = a5;
  addWidgetSheetConfigurationManager = self->_addWidgetSheetConfigurationManager;
  id v39 = a4;
  id v10 = addWidgetSheetConfigurationManager;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [(SBHAddWidgetSheetConfigurationManager *)v10 applicationWidgetCollectionsForEditingViewController:v12 withAllowedSizeClasses:&v39 allowingNonStackableItems:v5];
  id v14 = v39;

  v38 = v14;
  uint64_t v15 = [v14 chsWidgetFamilyMask];
  BOOL v16 = v5;
  id v17 = [(AMUIInfographViewController *)self _iconViewProvider];
  BOOL v18 = [(AMUIInfographViewController *)self iconManager];
  id v19 = [v18 addWidgetSheetIconImageCache];

  id v20 = objc_alloc_init(MEMORY[0x263F791F0]);
  id v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F79238]), "initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellIconImageCache:addWidgetSheetStyle:", v20, v17, v15, v16, v19, -[AMUIInfographViewController _addWidgetSheetStyle](self, "_addWidgetSheetStyle"));
  objc_msgSend(v21, "setAddWidgetSheetLocation:", -[SBHAddWidgetSheetConfigurationManager addWidgetSheetLocation](v10, "addWidgetSheetLocation"));
  [v21 setPresenter:v12];

  [v21 setAddWidgetSheetWidgetBackgroundType:1];
  uint64_t v22 = [(AMUIInfographViewController *)self traitCollection];
  objc_msgSend(v21, "setOverrideUserInterfaceStyle:", objc_msgSend(v22, "userInterfaceStyle"));

  id v23 = [(SBHAddWidgetSheetConfigurationManager *)v10 stackConfigurationSuggestedWidgetItems];

  [v21 setGalleryLayoutSize:0];
  [v21 setSuggestedItems:v23 forGalleryLayoutSize:0];
  [(AMUIInfographViewController *)self setAddWidgetSheetViewController:v21];
  [v21 setApplicationWidgetCollections:v13];
  [v21 setDelegate:self];
  [v21 setModalPresentationStyle:2];
  id v24 = [(AMUIInfographViewController *)self view];
  [v24 bounds];
  double v26 = v25;
  double v28 = v27;

  objc_msgSend(v21, "preferredInsetsForSheetPresentationInInterfaceOrientation:", -[AMUIInfographViewController interfaceOrientation](self, "interfaceOrientation"));
  objc_msgSend(v21, "setPreferredContentSize:", v26 - (v29 + v30), v28 - (v31 + v32));
  id v33 = [v21 presentationController];
  uint64_t v34 = objc_opt_class();
  id v35 = v33;
  if (v34)
  {
    if (objc_opt_isKindOfClass()) {
      v36 = v35;
    }
    else {
      v36 = 0;
    }
  }
  else
  {
    v36 = 0;
  }
  id v37 = v36;

  [v37 _setShouldDismissWhenTappedOutside:1];
  [v37 setPrefersEdgeAttachedInCompactHeight:1];
  [v37 setWidthFollowsPreferredContentSizeWhenEdgeAttached:1];
  [v37 setPreferredCornerRadius:35.0];

  [(AMUIInfographViewController *)self presentViewController:v21 animated:1 completion:0];
}

- (void)_showLaunchConfirmationForApplicationWithBundleIdentifier:(id)a3 withActions:(id)a4 iconView:(id)a5
{
  v68[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(AMUIInfographViewController *)self isConfiguring])
  {
    id v11 = AMUILogInfograph();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_247837000, v11, OS_LOG_TYPE_DEFAULT, "Skipping launch confirmation because of configuration", (uint8_t *)&buf, 2u);
    }
LABEL_12:

    goto LABEL_17;
  }
  id v12 = [v10 window];

  if (!v12)
  {
    id v11 = AMUILogInfograph();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_247837000, v11, OS_LOG_TYPE_DEFAULT, "Skipping launch confirmation because iconView is no longer in a window", (uint8_t *)&buf, 2u);
    }
    goto LABEL_12;
  }
  uint64_t v13 = [v10 window];
  id v14 = [(AMUIInfographViewController *)self view];
  uint64_t v15 = [v14 window];

  if (v13 != v15)
  {
    id v11 = AMUILogInfograph();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_247837000, v11, OS_LOG_TYPE_DEFAULT, "Skipping launch confirmation because iconView is not in the correct window", (uint8_t *)&buf, 2u);
    }
    goto LABEL_12;
  }
  [(AMUIInfographViewController *)self _willShowTemporaryOverlayForReason:@"AMUITemporaryOverlayReasonSetUpLaunchConfirmation"];
  [(AMUIInfographViewController *)self _dismissLaunchConfirmationAnimated:1];
  if (v10)
  {
    id v16 = objc_alloc(MEMORY[0x263F1CB98]);
    id v17 = [MEMORY[0x263F1C480] effectWithStyle:16];
    BOOL v18 = (void *)[v16 initWithEffect:v17];

    [v18 _setContinuousCornerRadius:14.0];
    id v19 = [v18 layer];
    [v19 setAllowsGroupBlending:1];

    [v18 setAccessibilityIdentifier:@"infograph-launch-confirmation"];
    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v20 = [MEMORY[0x263F1C6C8] configurationWithPointSize:4 weight:33.0];
    id v21 = [MEMORY[0x263F1C6C8] configurationPreferringMonochrome];
    v57 = [v20 configurationByApplyingConfiguration:v21];

    v56 = [MEMORY[0x263F1C6B0] systemImageNamed:@"arrow.up.forward.square.fill" withConfiguration:v57];
    v58 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v56];
    uint64_t v22 = [MEMORY[0x263F1C550] whiteColor];
    [v58 setTintColor:v22];

    id v23 = [v58 layer];
    [v23 setAllowsGroupBlending:1];

    id v24 = [v58 layer];
    double v25 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D58]];
    v68[0] = v25;
    double v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v68 count:1];
    [v24 setCompositingFilter:v26];

    [v58 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v27 = [v18 contentView];
    [v27 addSubview:v58];

    v51 = [(AMUIInfographViewController *)self view];
    [v51 addSubview:v18];
    v44 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel__launchConfirmationTapGestureDidFire_];
    [v18 addGestureRecognizer:v44];
    [(AMUIInfographViewController *)self setLaunchConfirmationView:v18];
    [(AMUIInfographViewController *)self setPendingLaunchBundleIdentifier:v8];
    [(AMUIInfographViewController *)self setPendingLaunchActions:v9];
    v41 = (void *)MEMORY[0x263F08938];
    v55 = [v18 widthAnchor];
    v54 = [v55 constraintEqualToConstant:60.0];
    v67[0] = v54;
    v53 = [v18 heightAnchor];
    v52 = [v53 constraintEqualToConstant:60.0];
    v67[1] = v52;
    v50 = [v18 centerXAnchor];
    v49 = [v10 trailingAnchor];
    v48 = [v50 constraintEqualToAnchor:v49 constant:-15.0];
    v67[2] = v48;
    v47 = [v18 centerYAnchor];
    v46 = [v10 topAnchor];
    v45 = [v47 constraintEqualToAnchor:v46 constant:15.0];
    v67[3] = v45;
    v43 = [v18 centerXAnchor];
    v42 = [v58 centerXAnchor];
    double v28 = [v43 constraintEqualToAnchor:v42];
    v67[4] = v28;
    double v29 = [v18 centerYAnchor];
    double v30 = [v58 centerYAnchor];
    double v31 = [v29 constraintEqualToAnchor:v30];
    v67[5] = v31;
    double v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:6];
    [v41 activateConstraints:v32];

    CGAffineTransformMakeScale(&v66, 0.01, 0.01);
    [v18 setTransform:&v66];
    [v18 setAlpha:0.0];
    id v33 = [MEMORY[0x263F29CE0] settingsWithMass:2.0 stiffness:219.325 damping:21.4268];
    uint64_t v34 = (void *)MEMORY[0x263F29D20];
    v64[0] = MEMORY[0x263EF8330];
    v64[1] = 3221225472;
    v64[2] = __110__AMUIInfographViewController__showLaunchConfirmationForApplicationWithBundleIdentifier_withActions_iconView___block_invoke;
    v64[3] = &unk_2652247E0;
    id v35 = v18;
    id v65 = v35;
    [v34 animateWithSettings:v33 options:2 actions:v64 completion:0];
    v36 = [MEMORY[0x263F29C80] settingsWithMass:2.0 stiffness:1973.92 damping:125.664];
    [v36 setDelay:0.085];
    id v37 = (void *)MEMORY[0x263F29D20];
    v62[0] = MEMORY[0x263EF8330];
    v62[1] = 3221225472;
    v62[2] = __110__AMUIInfographViewController__showLaunchConfirmationForApplicationWithBundleIdentifier_withActions_iconView___block_invoke_2;
    v62[3] = &unk_2652247E0;
    id v38 = v35;
    id v63 = v38;
    [v37 animateWithSettings:v36 options:2 actions:v62 completion:0];
    objc_initWeak(&buf, self);
    id v39 = (void *)MEMORY[0x263EFFA20];
    v59[0] = MEMORY[0x263EF8330];
    v59[1] = 3221225472;
    v59[2] = __110__AMUIInfographViewController__showLaunchConfirmationForApplicationWithBundleIdentifier_withActions_iconView___block_invoke_3;
    v59[3] = &unk_265225038;
    objc_copyWeak(&v60, &buf);
    v40 = [v39 scheduledTimerWithTimeInterval:0 repeats:v59 block:10.0];
    [(AMUIInfographViewController *)self setLaunchConfirmationCancelTimer:v40];
    [(AMUIInfographViewController *)self _willShowTemporaryOverlayForReason:@"AMUITemporaryOverlayReasonLaunchConfirmation"];

    objc_destroyWeak(&v60);
    objc_destroyWeak(&buf);
  }
  else
  {
    [(AMUIInfographViewController *)self _handleLaunchRequestForApplicationWithBundleIdentifier:v8 withActions:v9];
  }
  [(AMUIInfographViewController *)self _willHideTemporaryOverlayForReason:@"AMUITemporaryOverlayReasonSetUpLaunchConfirmation"];
LABEL_17:
}

uint64_t __110__AMUIInfographViewController__showLaunchConfirmationForApplicationWithBundleIdentifier_withActions_iconView___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v4[0] = *MEMORY[0x263F000D0];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  return [v1 setTransform:v4];
}

uint64_t __110__AMUIInfographViewController__showLaunchConfirmationForApplicationWithBundleIdentifier_withActions_iconView___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __110__AMUIInfographViewController__showLaunchConfirmationForApplicationWithBundleIdentifier_withActions_iconView___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismissLaunchConfirmationAnimated:1];
}

- (void)_launchConfirmationTapGestureDidFire:(id)a3
{
  if ([a3 state] == 3)
  {
    id v6 = [(AMUIInfographViewController *)self pendingLaunchBundleIdentifier];
    id v4 = [(AMUIInfographViewController *)self pendingLaunchActions];
    if (v6)
    {
      BOOL v5 = objc_msgSend(v4, "bs_filter:", &__block_literal_global_11);
      [(AMUIInfographViewController *)self _handleLaunchRequestForApplicationWithBundleIdentifier:v6 withActions:v5];
    }
    [(AMUIInfographViewController *)self _dismissLaunchConfirmationAnimated:1];
  }
}

uint64_t __68__AMUIInfographViewController__launchConfirmationTapGestureDidFire___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isValid];
}

- (void)_dismissLaunchConfirmationAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(AMUIInfographViewController *)self launchConfirmationView];
  id v6 = v5;
  if (v5)
  {
    if (v3)
    {
      id v7 = (void *)MEMORY[0x263F1CB60];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      void v14[2] = __66__AMUIInfographViewController__dismissLaunchConfirmationAnimated___block_invoke;
      v14[3] = &unk_2652247E0;
      id v15 = v5;
      uint64_t v9 = MEMORY[0x263EF8330];
      uint64_t v10 = 3221225472;
      id v11 = __66__AMUIInfographViewController__dismissLaunchConfirmationAnimated___block_invoke_2;
      id v12 = &unk_265224B88;
      id v13 = v15;
      [v7 animateWithDuration:v14 animations:&v9 completion:0.3];
    }
    else
    {
      [v5 removeFromSuperview];
    }
    -[AMUIInfographViewController setLaunchConfirmationView:](self, "setLaunchConfirmationView:", 0, v9, v10, v11, v12);
    [(AMUIInfographViewController *)self _willHideTemporaryOverlayForReason:@"AMUITemporaryOverlayReasonLaunchConfirmation"];
  }
  id v8 = [(AMUIInfographViewController *)self launchConfirmationCancelTimer];
  [v8 invalidate];

  [(AMUIInfographViewController *)self setLaunchConfirmationCancelTimer:0];
  [(AMUIInfographViewController *)self setPendingLaunchBundleIdentifier:0];
  [(AMUIInfographViewController *)self setPendingLaunchActions:0];
}

uint64_t __66__AMUIInfographViewController__dismissLaunchConfirmationAnimated___block_invoke(uint64_t a1)
{
  long long v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.01, 0.01);
  [v2 setTransform:&v4];
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __66__AMUIInfographViewController__dismissLaunchConfirmationAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)_handleLaunchRequestForApplicationWithBundleIdentifier:(id)a3 withActions:(id)a4
{
  id v5 = a3;
  id v6 = (void *)MEMORY[0x263EFF9A0];
  id v7 = a4;
  id v8 = [v6 dictionary];
  uint64_t v9 = MEMORY[0x263EFFA88];
  objc_msgSend(v8, "bs_setSafeObject:forKey:", MEMORY[0x263EFFA88], *MEMORY[0x263F3F5E8]);
  objc_msgSend(v8, "bs_setSafeObject:forKey:", v9, *MEMORY[0x263F3F608]);
  objc_msgSend(v8, "bs_setSafeObject:forKey:", @"AMUIAppLaunchOriginAmbient", *MEMORY[0x263F3F5C0]);
  objc_msgSend(v8, "bs_setSafeObject:forKey:", v7, *MEMORY[0x263F3F580]);

  uint64_t v10 = [MEMORY[0x263F3F778] optionsWithDictionary:v8];
  id v11 = [MEMORY[0x263F3F790] serviceWithDefaultShellEndpoint];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __98__AMUIInfographViewController__handleLaunchRequestForApplicationWithBundleIdentifier_withActions___block_invoke;
  v13[3] = &unk_265225080;
  id v14 = v5;
  id v12 = v5;
  [v11 openApplication:v12 withOptions:v10 completion:v13];
}

void __98__AMUIInfographViewController__handleLaunchRequestForApplicationWithBundleIdentifier_withActions___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  CGAffineTransform v4 = AMUILogInfograph();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (v3)
  {
    if (v5) {
      __98__AMUIInfographViewController__handleLaunchRequestForApplicationWithBundleIdentifier_withActions___block_invoke_cold_2();
    }
  }
  else if (v5)
  {
    __98__AMUIInfographViewController__handleLaunchRequestForApplicationWithBundleIdentifier_withActions___block_invoke_cold_1();
  }
}

- (void)_registerForAmbientPresentationTraitChanges
{
  v6[1] = *MEMORY[0x263EF8340];
  id v3 = self;
  v6[0] = v3;
  CGAffineTransform v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  id v5 = (id)[(AMUIInfographViewController *)self registerForTraitChanges:v4 withHandler:&__block_literal_global_177];
}

void __74__AMUIInfographViewController__registerForAmbientPresentationTraitChanges__block_invoke(uint64_t a1, id *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  long long v2 = a2 + 153;
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [v3 customDisplayConfigurationForWidgetViewController];

  id v6 = AMUILogInfograph();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_247837000, v6, OS_LOG_TYPE_DEFAULT, "Updating widget view controllers to custom display configuration:%@ due to displayStyleTrait change", (uint8_t *)&v7, 0xCu);
  }

  [WeakRetained updateWidgetViewControllersWithCustomDisplayConfiguration:v5];
}

- (id)_iconStateWithLeadingElements:(id)a3 trialingElements:(id)a4
{
  v21[5] = *MEMORY[0x263EF8340];
  v20[0] = @"elements";
  v20[1] = @"allowsExternalSuggestions";
  v21[0] = a3;
  v21[1] = &unk_26FBDB290;
  v20[2] = @"gridSize";
  v20[3] = @"allowsSuggestions";
  v21[2] = @"small";
  v21[3] = &unk_26FBDB2A8;
  v20[4] = @"iconType";
  v21[4] = @"custom";
  id v5 = NSDictionary;
  id v6 = a4;
  id v13 = a3;
  int v7 = [v5 dictionaryWithObjects:v21 forKeys:v20 count:5];
  v18[0] = @"elements";
  v18[1] = @"allowsExternalSuggestions";
  v19[0] = v6;
  v19[1] = &unk_26FBDB290;
  v18[2] = @"gridSize";
  v18[3] = @"allowsSuggestions";
  v19[2] = @"small";
  v19[3] = &unk_26FBDB2A8;
  void v18[4] = @"iconType";
  void v19[4] = @"custom";
  id v8 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:5];
  id v16 = @"iconLists";
  v14[0] = v7;
  v14[1] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  id v15 = v9;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];
  id v17 = v10;
  id v11 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];

  return v11;
}

- (id)_iconStateFromDefaultWidgetDescriptorStacks:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = AMUILogInfograph();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl(&dword_247837000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to create iconStateFromDefaultWidgetDescriptorStacks:%@", (uint8_t *)&v13, 0xCu);
  }

  if (v4)
  {
    id v6 = [v4 objectAtIndexedSubscript:0];
    int v7 = [v4 objectAtIndexedSubscript:1];
    id v8 = [(AMUIInfographViewController *)self _stackElementsFromWidgetDescriptors:v6];
    uint64_t v9 = [(AMUIInfographViewController *)self _stackElementsFromWidgetDescriptors:v7];
    uint64_t v10 = [(AMUIInfographViewController *)self _iconStateWithLeadingElements:v8 trialingElements:v9];
    id v11 = AMUILogInfograph();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v10;
      _os_log_impl(&dword_247837000, v11, OS_LOG_TYPE_DEFAULT, "Successfully created iconStateFromDefaultWidgetDescriptorStacks:%@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    id v6 = AMUILogInfograph();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_247837000, v6, OS_LOG_TYPE_DEFAULT, "Could not create default icon state because defaultWidgetDescriptorStacks was nil", (uint8_t *)&v13, 2u);
    }
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_stackElementsFromWidgetDescriptors:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v10 = [v9 kind];
        id v11 = [v9 extensionIdentity];
        id v12 = [v11 containerBundleIdentifier];

        int v13 = [v9 extensionBundleIdentifier];
        v21[0] = @"elementType";
        v21[1] = @"widgetIdentifier";
        v22[0] = @"widget";
        v22[1] = v10;
        v21[2] = @"containerBundleIdentifier";
        v21[3] = @"bundleIdentifier";
        v22[2] = v12;
        v22[3] = v13;
        v21[4] = @"widgetSuggestionSource";
        v22[4] = @"onboarding";
        id v14 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:5];
        [v4 addObject:v14];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)_defaultIconState
{
  v65[5] = *MEMORY[0x263EF8340];
  v64[0] = @"elementType";
  v64[1] = @"widgetIdentifier";
  v65[0] = @"widget";
  v65[1] = @"com.apple.mobiletimer.datetime";
  v64[2] = @"containerBundleIdentifier";
  v64[3] = @"bundleIdentifier";
  v65[2] = @"com.apple.mobiletimer";
  v65[3] = @"com.apple.mobiletimer.WorldClockWidget";
  void v64[4] = @"widgetSuggestionSource";
  v65[4] = @"onboarding";
  uint64_t v41 = [NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:5];
  v62[0] = @"elementType";
  v62[1] = @"widgetIdentifier";
  v63[0] = @"widget";
  v63[1] = @"com.apple.CalendarWidget.CalendarDateWidget";
  v62[2] = @"containerBundleIdentifier";
  v62[3] = @"bundleIdentifier";
  v63[2] = @"com.apple.mobilecal";
  v63[3] = @"com.apple.mobilecal.CalendarWidgetExtension";
  void v62[4] = @"widgetSuggestionSource";
  v63[4] = @"onboarding";
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:5];
  v60[0] = @"elementType";
  v60[1] = @"widgetIdentifier";
  v61[0] = @"widget";
  v61[1] = @"detail";
  v60[2] = @"containerBundleIdentifier";
  v60[3] = @"bundleIdentifier";
  v61[2] = @"com.apple.stocks";
  v61[3] = @"com.apple.stocks.widget";
  v60[4] = @"widgetSuggestionSource";
  v61[4] = @"onboarding";
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:5];
  v58[0] = @"elementType";
  v58[1] = @"widgetIdentifier";
  v59[0] = @"widget";
  v59[1] = @"com.apple.mobiletimer.square";
  v58[2] = @"containerBundleIdentifier";
  v58[3] = @"bundleIdentifier";
  v59[2] = @"com.apple.mobiletimer";
  v59[3] = @"com.apple.mobiletimer.WorldClockWidget";
  v58[4] = @"widgetSuggestionSource";
  void v59[4] = @"onboarding";
  [NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:5];
  v57[0] = v41;
  id v35 = (void *)v3;
  v36 = (void *)v2;
  v57[1] = v2;
  uint64_t v34 = v57[2] = v3;
  v57[3] = v34;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v57 count:4];
  v42 = [(AMUIInfographViewController *)self _validatedStackFromWidgets:v4];

  v55[0] = @"elementType";
  v55[1] = @"widgetIdentifier";
  v56[0] = @"widget";
  v56[1] = @"com.apple.CalendarWidget.CalendarMonthWidget";
  v55[2] = @"containerBundleIdentifier";
  v55[3] = @"bundleIdentifier";
  v56[2] = @"com.apple.mobilecal";
  v56[3] = @"com.apple.mobilecal.CalendarWidgetExtension";
  v55[4] = @"widgetSuggestionSource";
  v56[4] = @"onboarding";
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:5];
  v53[0] = @"elementType";
  v53[1] = @"widgetIdentifier";
  v54[0] = @"widget";
  v54[1] = @"com.apple.weather";
  v53[2] = @"containerBundleIdentifier";
  v53[3] = @"bundleIdentifier";
  v54[2] = @"com.apple.weather";
  v54[3] = @"com.apple.weather.widget";
  v53[4] = @"widgetSuggestionSource";
  v54[4] = @"onboarding";
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:5];
  v51[0] = @"elementType";
  v51[1] = @"widgetIdentifier";
  v52[0] = @"widget";
  v52[1] = @"com.apple.CalendarWidget.CalendarUpNextWidget";
  v51[2] = @"containerBundleIdentifier";
  v51[3] = @"bundleIdentifier";
  v52[2] = @"com.apple.mobilecal";
  v52[3] = @"com.apple.mobilecal.CalendarWidgetExtension";
  v51[4] = @"widgetSuggestionSource";
  v52[4] = @"onboarding";
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:5];
  v49[0] = @"elementType";
  v49[1] = @"widgetIdentifier";
  v49[2] = @"containerBundleIdentifier";
  v50[0] = @"widget";
  v50[1] = @"com.apple.reminders.widget";
  v49[3] = @"bundleIdentifier";
  v49[4] = @"widgetSuggestionSource";
  v50[2] = @"com.apple.reminders";
  v50[3] = @"com.apple.reminders.WidgetExtension";
  v50[4] = @"onboarding";
  [NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:5];
  id v39 = (void *)v6;
  v40 = (void *)v5;
  v48[0] = v5;
  id v37 = v48[1] = v6;
  id v38 = (void *)v7;
  v48[2] = v7;
  v48[3] = v37;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:4];
  uint64_t v9 = [(AMUIInfographViewController *)self _validatedStackFromWidgets:v8];

  uint64_t v10 = [v42 count];
  uint64_t v11 = [v9 count];
  uint64_t v12 = v11;
  if (v10 && v11)
  {
    id v14 = (void *)v41;
    int v13 = v42;
    uint64_t v15 = self;
    long long v17 = v35;
    id v16 = v36;
    long long v18 = (void *)v34;
  }
  else
  {
    v46[0] = @"elementType";
    v46[1] = @"widgetIdentifier";
    v47[0] = @"widget";
    v47[1] = @"BatteriesAvocadoWidget";
    v46[2] = @"containerBundleIdentifier";
    v46[3] = @"bundleIdentifier";
    v47[2] = @"com.apple.Batteries";
    v47[3] = @"com.apple.Batteries.BatteriesAvocadoWidgetExtension";
    v46[4] = @"widgetSuggestionSource";
    v47[4] = @"onboarding";
    id v33 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:5];
    v44[0] = @"elementType";
    v44[1] = @"widgetIdentifier";
    v45[0] = @"widget";
    v45[1] = @"SingleContactWidget_iOS";
    v44[2] = @"containerBundleIdentifier";
    v44[3] = @"bundleIdentifier";
    v45[2] = @"com.apple.PeopleViewService";
    v45[3] = @"com.apple.PeopleViewService.PeopleWidget-iOS";
    v44[4] = @"widgetSuggestionSource";
    v45[4] = @"onboarding";
    double v32 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:5];
    if ([v42 count] == 2)
    {
      long long v19 = [v42 firstObject];
      long long v20 = [v19 valueForKey:@"containerBundleIdentifier"];
      int v21 = [v20 isEqualToString:@"com.apple.mobiletimer"];
    }
    else
    {
      int v21 = 0;
    }
    long long v17 = v35;
    id v16 = v36;
    long long v18 = (void *)v34;
    id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v23 = objc_alloc_init(MEMORY[0x263EFF980]);
    if (v10 | v12)
    {
      if (v10)
      {
        uint64_t v15 = self;
        if (v12)
        {
          id v14 = (void *)v41;
          int v13 = v42;
        }
        else
        {
          int v13 = v42;
          if ([v42 count] == 1) {
            int v26 = 1;
          }
          else {
            int v26 = v21;
          }
          if (v26 == 1)
          {
            uint64_t v27 = [MEMORY[0x263EFF8C0] arrayWithObject:v33];

            uint64_t v9 = (void *)v27;
          }
          else
          {
            [(AMUIInfographViewController *)self _splitStackElements:v42 intoLeadingElements:v22 trailingElements:v23];
          }
          id v14 = (void *)v41;
        }
      }
      else
      {
        id v14 = (void *)v41;
        uint64_t v15 = self;
        if ([v9 count] == 1)
        {
          int v13 = [MEMORY[0x263EFF8C0] arrayWithObject:v33];
        }
        else
        {
          [(AMUIInfographViewController *)self _splitStackElements:v9 intoLeadingElements:v22 trailingElements:v23];
          int v13 = v42;
        }
      }
    }
    else
    {
      uint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithObject:v33];

      uint64_t v25 = [MEMORY[0x263EFF8C0] arrayWithObject:v32];

      uint64_t v9 = (void *)v25;
      int v13 = (void *)v24;
      id v14 = (void *)v41;
      uint64_t v15 = self;
    }
    if ([v22 count] && objc_msgSend(v23, "count"))
    {
      id v28 = v22;

      id v29 = v23;
      uint64_t v9 = v29;
      int v13 = v28;
    }
  }
  double v30 = [(AMUIInfographViewController *)v15 _iconStateWithLeadingElements:v13 trialingElements:v9];

  return v30;
}

- (void)_splitStackElements:(id)a3 intoLeadingElements:(id)a4 trailingElements:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  unint64_t v10 = (unint64_t)[v9 count] >> 1;
  uint64_t v11 = objc_msgSend(v9, "subarrayWithRange:", 0, v10);
  [v8 addObjectsFromArray:v11];

  objc_msgSend(v9, "subarrayWithRange:", v10, objc_msgSend(v9, "count") - v10);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  [v7 addObjectsFromArray:v12];
}

- (id)_validatedStackFromWidgets:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        unint64_t v10 = objc_msgSend(v9, "objectForKey:", @"containerBundleIdentifier", v15);
        uint64_t v11 = [v9 objectForKey:@"extensionBundleIdentifier"];
        BOOL v12 = [(AMUIInfographViewController *)self _recordExistsForContainerBundleIdentifier:v10];
        BOOL v13 = [(AMUIInfographViewController *)self _isApplicationProtectedForContainerBundleIdentifier:v10 extensionBundleIdentifier:v11];
        if (v12 && !v13) {
          [v15 addObject:v9];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  return v15;
}

- (BOOL)_preparePosterConfigurationToSaveWithCurrentIconState:(id)a3 intents:(id)a4 reason:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(AMUIInfographViewController *)self _emptyIconState:v8])
  {
    uint64_t v11 = AMUILogInfograph();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[AMUIInfographViewController _preparePosterConfigurationToSaveWithCurrentIconState:intents:reason:]();
    }
    BOOL v12 = 0;
  }
  else
  {
    BOOL v13 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v11 = v13;
    if (v8) {
      [v13 setObject:v8 forKey:@"AMUIIconStateKey"];
    }
    if (v9) {
      [v11 setObject:v9 forKey:@"AMUIIntentsKey"];
    }
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __100__AMUIInfographViewController__preparePosterConfigurationToSaveWithCurrentIconState_intents_reason___block_invoke;
    v15[3] = &unk_2652250C8;
    id v16 = v10;
    BOOL v12 = [(AMUIInfographViewController *)self _saveInfographPosterConfigurationData:v11 completion:v15];
  }
  return v12;
}

void __100__AMUIInfographViewController__preparePosterConfigurationToSaveWithCurrentIconState_intents_reason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = AMUILogInfograph();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412802;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v5;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_error_impl(&dword_247837000, v7, OS_LOG_TYPE_ERROR, "Error saving poster configuration. Updated reason:%@ configuration:%@ error:%@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (BOOL)_emptyIconState:(id)a3
{
  id v4 = [a3 objectForKey:@"iconLists"];
  id v5 = v4;
  if (v4 && [v4 count])
  {
    id v6 = [v5 firstObject];
    if ([v6 count] == 2)
    {
      uint64_t v7 = [v6 objectAtIndexedSubscript:0];
      uint64_t v8 = objc_opt_class();
      id v9 = v7;
      if (v8)
      {
        if (objc_opt_isKindOfClass()) {
          uint64_t v10 = v9;
        }
        else {
          uint64_t v10 = 0;
        }
      }
      else
      {
        uint64_t v10 = 0;
      }
      id v12 = v10;

      __int16 v13 = [v6 objectAtIndexedSubscript:1];
      uint64_t v14 = objc_opt_class();
      id v15 = v13;
      if (v14)
      {
        if (objc_opt_isKindOfClass()) {
          id v16 = v15;
        }
        else {
          id v16 = 0;
        }
      }
      else
      {
        id v16 = 0;
      }
      id v17 = v16;

      BOOL v18 = [(AMUIInfographViewController *)self _isStackEmpty:v12];
      BOOL v19 = [(AMUIInfographViewController *)self _isStackEmpty:v17];

      char v11 = v18 || v19;
    }
    else
    {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

- (BOOL)_isStackEmpty:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, "bs_safeArrayForKey:", @"elements");
  id v5 = objc_msgSend(v3, "bs_safeStringForKey:", @"bundleIdentifier");

  BOOL v6 = v5 == 0;
  if (v4 && [v4 count]) {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)configurationLongPressDidUpdate:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1)
  {
    id v5 = [v4 view];
    BOOL v6 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v8 = v5;
      id v9 = [(AMUIInfographViewController *)self delegate];
      uint64_t v10 = [v9 createUnlockRequestForViewController:self];
      char v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      [v10 setName:v12];

      __int16 v13 = AMUIAmbientUIFrameworkBundle();
      uint64_t v14 = [v13 localizedStringForKey:@"UNLOCK_WIDGET_STACK_EDITING" value:&stru_26FBC9C48 table:0];
      [v10 setUnlockDestination:v14];

      objc_initWeak(&location, self);
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __63__AMUIInfographViewController_configurationLongPressDidUpdate___block_invoke;
      v16[3] = &unk_265224B60;
      objc_copyWeak(&v18, &location);
      id v15 = v8;
      id v17 = v15;
      [v9 requestUnlockForViewController:self withRequest:v10 completion:v16];
      [(AMUIInfographViewController *)self _dismissLaunchConfirmationAnimated:1];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }
}

uint64_t __63__AMUIInfographViewController_configurationLongPressDidUpdate___block_invoke(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(result + 40));
    id v4 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v7 = WeakRetained;
      id WeakRetained = (id *)[*(id *)(v2 + 32) _isInAWindow];
      id v4 = v7;
      if (WeakRetained)
      {
        id v5 = [v7 viewIfLoaded];
        int v6 = [v5 _isInAWindow];

        id v4 = v7;
        if (v6)
        {
          [v7[142] notificationOccurred:0];
          objc_storeWeak(v7 + 141, *(id *)(v2 + 32));
          id WeakRetained = (id *)[*(id *)(v2 + 32) presentStackConfigurationCard];
          id v4 = v7;
        }
      }
    }
    return MEMORY[0x270F9A758](WeakRetained, v4);
  }
  return result;
}

- (void)_fetchWidgetHostManager
{
  id v3 = [(AMUIInfographViewController *)self delegate];
  id v5 = [v3 widgetHostManagerForViewController:self];

  if (v5)
  {
    [v5 setDelegate:self];
    [(AMUIInfographViewController *)self setWidgetHostManager:v5];
    id v4 = [v5 iconManager];
    [(AMUIInfographViewController *)self setIconManager:v4];
  }
}

- (void)_fetchDefaultWidgetDescriptorStacks
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = [(AMUIInfographViewController *)self delegate];
  id v4 = [v3 defaultWidgetDescriptorStacksForViewController:self];
  id v5 = AMUILogInfograph();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_247837000, v5, OS_LOG_TYPE_DEFAULT, "Fetched defaultWidgetDescriptorStacks:%@", (uint8_t *)&v6, 0xCu);
  }

  [(AMUIInfographViewController *)self setDefaultWidgetDescriptorStacks:v4];
}

- (void)_keepIconViewsStaticForReason:(id)a3
{
  id v4 = a3;
  keepRootStaticAssertions = self->_keepRootStaticAssertions;
  if (!keepRootStaticAssertions)
  {
    int v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v7 = self->_keepRootStaticAssertions;
    self->_keepRootStaticAssertions = v6;

    keepRootStaticAssertions = self->_keepRootStaticAssertions;
  }
  uint64_t v8 = keepRootStaticAssertions;
  objc_initWeak(&location, self);
  id v9 = objc_alloc(MEMORY[0x263F29CD8]);
  uint64_t v10 = [MEMORY[0x263F08C38] UUID];
  char v11 = [v10 UUIDString];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  void v14[2] = __61__AMUIInfographViewController__keepIconViewsStaticForReason___block_invoke;
  v14[3] = &unk_2652250F0;
  objc_copyWeak(&v16, &location);
  id v12 = v4;
  id v15 = v12;
  __int16 v13 = (void *)[v9 initWithIdentifier:v11 forReason:v12 invalidationBlock:v14];

  [(NSMutableDictionary *)v8 setObject:v13 forKey:v12];
  [(AMUIInfographViewController *)self _evaluatePresentationModeForIconViews];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __61__AMUIInfographViewController__keepIconViewsStaticForReason___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained[154] removeObjectForKey:*(void *)(a1 + 32)];
    [v3 _evaluatePresentationModeForIconViews];
    id WeakRetained = v3;
  }
}

- (void)_evaluatePresentationModeForIconViews
{
  BOOL v3 = [(NSMutableDictionary *)self->_keepRootStaticAssertions count] != 0;

  [(AMUIInfographViewController *)self _updateIconViewsWithPresentationMode:v3];
}

- (void)_updateIconViewsWithPresentationMode:(unint64_t)a3
{
  iconListView = self->_iconListView;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __68__AMUIInfographViewController__updateIconViewsWithPresentationMode___block_invoke;
  _OWORD v4[3] = &__block_descriptor_40_e27_v32__0__SBIconView_8Q16_B24l;
  v4[4] = a3;
  [(SBIconListView *)iconListView enumerateIconViewsUsingBlock:v4];
}

uint64_t __68__AMUIInfographViewController__updateIconViewsWithPresentationMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 customIconImageViewController];
  if (v3)
  {
    id v5 = (void *)v3;
    if (objc_opt_respondsToSelector()) {
      [v5 setPresentationMode:*(void *)(a1 + 32)];
    }
  }

  return MEMORY[0x270F9A828]();
}

- (void)_registerForFirstPresentationStateChange
{
  if ([(AMAmbientDefaults *)self->_ambientDefaults isFirstPresentation])
  {
    objc_initWeak(&location, self);
    ambientDefaults = self->_ambientDefaults;
    id v4 = [NSString stringWithUTF8String:"firstPresentation"];
    uint64_t v5 = MEMORY[0x263EF83A0];
    id v6 = MEMORY[0x263EF83A0];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __71__AMUIInfographViewController__registerForFirstPresentationStateChange__block_invoke;
    v9[3] = &unk_265224808;
    objc_copyWeak(&v10, &location);
    uint64_t v7 = [(AMAmbientDefaults *)ambientDefaults observeDefault:v4 onQueue:v5 withBlock:v9];
    defaultObserver = self->_defaultObserver;
    self->_defaultObserver = v7;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __71__AMUIInfographViewController__registerForFirstPresentationStateChange__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained && ([WeakRetained[138] isFirstPresentation] & 1) == 0)
  {
    dispatch_time_t v3 = dispatch_time(0, 800000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __71__AMUIInfographViewController__registerForFirstPresentationStateChange__block_invoke_2;
    block[3] = &unk_2652247E0;
    block[4] = v2;
    dispatch_after(v3, MEMORY[0x263EF83A0], block);
  }
}

uint64_t __71__AMUIInfographViewController__registerForFirstPresentationStateChange__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _flashPageControlAnimated:1];
}

- (void)_flashPageControlAnimated:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __57__AMUIInfographViewController__flashPageControlAnimated___block_invoke;
  v3[3] = &__block_descriptor_33_e38_v16__0__SBHWidgetStackViewController_8l;
  BOOL v4 = a3;
  [(AMUIInfographViewController *)self _enumerateWidgetStackViewControllersWithBlock:v3];
}

void __57__AMUIInfographViewController__flashPageControlAnimated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 _flashPageControlAnimated:*(unsigned __int8 *)(a1 + 32)];
  }
}

- (void)_enumerateWidgetStackViewControllersWithBlock:(id)a3
{
  id v4 = a3;
  iconListView = self->_iconListView;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __77__AMUIInfographViewController__enumerateWidgetStackViewControllersWithBlock___block_invoke;
  v7[3] = &unk_265225158;
  id v8 = v4;
  id v6 = v4;
  [(SBIconListView *)iconListView enumerateIconViewsUsingBlock:v7];
}

void __77__AMUIInfographViewController__enumerateWidgetStackViewControllersWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 customIconImageViewController];
  id v3 = self;
  if (objc_opt_isKindOfClass()) {
    id v4 = v6;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)_applicationBundleIdentifierForLaunchingIconView:(id)a3
{
  id v3 = a3;
  id v4 = [v3 icon];
  if ([v4 isWidgetIcon])
  {
    id v5 = [v3 customIconImageViewController];
    id v6 = self;
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v5;
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = v7;

    id v9 = [v8 currentWidgetViewController];

    id v10 = objc_msgSend(v9, "sbh_underlyingAvocadoHostViewControllers");
    char v11 = [v10 anyObject];

    id v12 = [v11 widget];
    __int16 v13 = [v12 extensionIdentity];
    uint64_t v14 = [v13 containerBundleIdentifier];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (BOOL)isConfiguring
{
  return [(NSCountedSet *)self->_configurationReasons count] != 0;
}

- (void)_willEnterConfigurationForReason:(id)a3
{
  id v9 = a3;
  configurationReasons = self->_configurationReasons;
  if (!configurationReasons)
  {
    id v5 = (NSCountedSet *)objc_alloc_init(MEMORY[0x263F08760]);
    id v6 = self->_configurationReasons;
    self->_configurationReasons = v5;

    configurationReasons = self->_configurationReasons;
  }
  uint64_t v7 = [(NSCountedSet *)configurationReasons count];
  [(NSCountedSet *)self->_configurationReasons addObject:v9];
  if (!v7)
  {
    id v8 = [(AMUIInfographViewController *)self delegate];
    [v8 viewControllerWillBeginConfiguration:self];
  }
}

- (void)_willEndConfigurationForReason:(id)a3
{
  configurationReasons = self->_configurationReasons;
  id v5 = a3;
  uint64_t v6 = [(NSCountedSet *)configurationReasons count];
  [(NSCountedSet *)self->_configurationReasons removeObject:v5];

  uint64_t v7 = [(NSCountedSet *)self->_configurationReasons count];
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    id v9 = [(AMUIInfographViewController *)self delegate];
    [v9 viewControllerWillEndConfiguration:self];
  }
}

- (void)_willShowTemporaryOverlayForReason:(id)a3
{
  id v9 = a3;
  temporaryOverlayReasons = self->_temporaryOverlayReasons;
  if (!temporaryOverlayReasons)
  {
    id v5 = (NSCountedSet *)objc_alloc_init(MEMORY[0x263F08760]);
    uint64_t v6 = self->_temporaryOverlayReasons;
    self->_temporaryOverlayReasons = v5;

    temporaryOverlayReasons = self->_temporaryOverlayReasons;
  }
  uint64_t v7 = [(NSCountedSet *)temporaryOverlayReasons count];
  [(NSCountedSet *)self->_temporaryOverlayReasons addObject:v9];
  if (!v7)
  {
    BOOL v8 = [(AMUIInfographViewController *)self delegate];
    [v8 viewControllerWillBeginShowingTemporaryOverlay:self];
  }
}

- (void)_willHideTemporaryOverlayForReason:(id)a3
{
  temporaryOverlayReasons = self->_temporaryOverlayReasons;
  id v5 = a3;
  uint64_t v6 = [(NSCountedSet *)temporaryOverlayReasons count];
  [(NSCountedSet *)self->_temporaryOverlayReasons removeObject:v5];

  uint64_t v7 = [(NSCountedSet *)self->_temporaryOverlayReasons count];
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    id v9 = [(AMUIInfographViewController *)self delegate];
    [v9 viewControllerWillEndShowingTemporaryOverlay:self];
  }
}

- (id)targetedDragPreviewForIconView:(id)a3 item:(id)a4 session:(id)a5 previewParameters:(id)a6
{
  id v7 = a6;
  id v8 = a3;
  [v8 iconImageInfo];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  double v14 = v13;
  id v15 = [MEMORY[0x263F1C550] blackColor];
  [v7 setBackgroundColor:v15];

  id v16 = (void *)MEMORY[0x263F1C478];
  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v21.size.width = v10;
  v21.size.height = v12;
  CGRect v22 = CGRectInset(v21, -6.0, -6.0);
  id v17 = objc_msgSend(v16, "bezierPathWithRoundedRect:cornerRadius:", v22.origin.x, v22.origin.y, v22.size.width, v22.size.height, v14);
  [v7 setVisiblePath:v17];

  id v18 = [v8 defaultDragPreviewWithParameters:v7];

  return v18;
}

- (void)_setupAmbientDefaults
{
  id v3 = [(AMUIInfographViewController *)self delegate];
  id v4 = [v3 ambientDefaultsForViewController:self];
  ambientDefaults = self->_ambientDefaults;
  self->_ambientDefaults = v4;

  if ([(AMUIInfographViewController *)self wantsDefaultInfographLayout]) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = [(AMAmbientDefaults *)self->_ambientDefaults isFirstPresentation];
  }
  [(AMUIInfographViewController *)self setWantsDefaultInfographLayout:v6];

  [(AMUIInfographViewController *)self _registerForFirstPresentationStateChange];
}

- (void)_validateIconListModel:(id)a3
{
  v36[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 icons];
  if (v5)
  {
    [(AMUIInfographViewController *)self _validateIcons:v5 inIconListModel:v4];
    uint64_t v6 = [v4 numberOfIcons];
    switch(v6)
    {
      case 0:
        id v7 = [(AMUIInfographViewController *)self _createBatteriesWidgetIcon];
        id v8 = [(AMUIInfographViewController *)self _createContactsWidgetIcon];
        v36[0] = v7;
        v36[1] = v8;
        double v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
        id v10 = (id)[v4 addIcons:v9];

        goto LABEL_27;
      case 1:
        id v7 = [v4 firstIcon];
        double v11 = [(PRPosterAmbientWidgetLayout *)self->_ambientWidgetLayout widgetLayoutIconState];
        CGFloat v12 = v11;
        if (v11)
        {
          double v13 = [v11 objectForKey:@"AMUIIconStateKey"];
          double v14 = [v13 objectForKey:@"iconLists"];
          uint64_t v15 = objc_opt_class();
          id v16 = v14;
          if (v15)
          {
            if (objc_opt_isKindOfClass()) {
              id v17 = v16;
            }
            else {
              id v17 = 0;
            }
          }
          else
          {
            id v17 = 0;
          }
          id v18 = v17;

          if (v18)
          {
            BOOL v19 = [v18 firstObject];
            uint64_t v20 = objc_opt_class();
            id v21 = v19;
            if (v20)
            {
              if (objc_opt_isKindOfClass()) {
                CGRect v22 = v21;
              }
              else {
                CGRect v22 = 0;
              }
            }
            else
            {
              CGRect v22 = 0;
            }
            id v23 = v22;

            if (v23 && [v23 count] == 2)
            {
              uint64_t v24 = [v23 firstObject];
              uint64_t v25 = objc_opt_class();
              int v26 = __BSSafeCast(v24, v25);

              if (v26)
              {
                uint64_t v27 = [v26 objectForKey:@"displayIdentifier"];
                uint64_t v28 = objc_opt_class();
                id v35 = __BSSafeCast(v27, v28);

                id v29 = [v7 uniqueIdentifier];
                uint64_t v34 = v26;
                unsigned int v30 = [v35 isEqualToString:v29];

                double v31 = [(AMUIInfographViewController *)self _createBatteriesWidgetIcon];
                uint64_t v32 = v30;
                int v26 = v34;
                id v33 = (id)[v4 insertIcon:v31 atIndex:v32];
              }
            }
          }
        }

        goto LABEL_27;
      case 2:
        id v7 = [(AMUIInfographViewController *)self _defaultIconState];
        [(AMUIInfographViewController *)self _migrateClockCityWidgetForIconListModel:v4 withDefaultIconState:v7];
LABEL_27:

        break;
    }
  }
}

- (void)_validateIcons:(id)a3 inIconListModel:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v22 = a4;
  id obj = v6;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v25 = [v6 countByEnumeratingWithState:&v31 objects:v38 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v9 = objc_opt_class();
        id v10 = v8;
        if (v9)
        {
          if (objc_opt_isKindOfClass()) {
            double v11 = v10;
          }
          else {
            double v11 = 0;
          }
        }
        else
        {
          double v11 = 0;
        }
        id v12 = v11;

        if (v12)
        {
          uint64_t v26 = i;
          double v13 = [v12 widgets];
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v37 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v28;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v28 != v16) {
                  objc_enumerationMutation(v13);
                }
                id v18 = *(void **)(*((void *)&v27 + 1) + 8 * j);
                BOOL v19 = [v18 containerBundleIdentifier];
                if (![(AMUIInfographViewController *)self _recordExistsForContainerBundleIdentifier:v19])
                {
                  uint64_t v20 = AMUILogInfograph();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)id buf = 138412290;
                    v36 = v18;
                    _os_log_impl(&dword_247837000, v20, OS_LOG_TYPE_DEFAULT, "Removing widget:%@ from icon because container app was deleted", buf, 0xCu);
                  }

                  [v12 removeIconDataSource:v18];
                }
                if ([(AMUIInfographViewController *)self _isApplicationForWidgetProtected:v18])
                {
                  id v21 = AMUILogInfograph();
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)id buf = 138412290;
                    v36 = v18;
                    _os_log_impl(&dword_247837000, v21, OS_LOG_TYPE_DEFAULT, "Removing widget:%@ from icon because container app is locked or hidden", buf, 0xCu);
                  }

                  [v12 removeIconDataSource:v18];
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v37 count:16];
            }
            while (v15);
          }
          if (![v12 iconDataSourceCount]) {
            [v22 removeIcon:v12];
          }

          uint64_t i = v26;
        }
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v38 count:16];
    }
    while (v25);
  }
}

- (BOOL)_isApplicationForWidgetProtected:(id)a3
{
  id v4 = a3;
  id v5 = [v4 containerBundleIdentifier];
  id v6 = [v4 extensionBundleIdentifier];

  LOBYTE(self) = [(AMUIInfographViewController *)self _isApplicationProtectedForContainerBundleIdentifier:v5 extensionBundleIdentifier:v6];
  return (char)self;
}

- (BOOL)_isApplicationProtectedForContainerBundleIdentifier:(id)a3 extensionBundleIdentifier:(id)a4
{
  id v4 = [(AMUIInfographViewController *)self _effectiveContainerBundleIdentifierForContainerBundleIdentifier:a3 extensionBundleIdentifier:a4];
  id v5 = [MEMORY[0x263F251D0] applicationWithBundleIdentifier:v4];
  BOOL v6 = ([v5 isLocked] & 1) != 0 || objc_msgSend(v5, "isHidden");

  return v6;
}

- (BOOL)_recordExistsForContainerBundleIdentifier:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F01878];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithBundleIdentifier:v4 allowPlaceholder:0 error:0];

  return v5 != 0;
}

- (id)_createBatteriesWidgetIcon
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263F79258]) initWithKind:@"BatteriesAvocadoWidget" extensionBundleIdentifier:@"com.apple.Batteries.BatteriesAvocadoWidgetExtension" containerBundleIdentifier:@"com.apple.Batteries"];
  id v3 = (void *)[objc_alloc(MEMORY[0x263F792C8]) initWithWidget:v2];

  return v3;
}

- (id)_createContactsWidgetIcon
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263F79258]) initWithKind:@"SingleContactWidget_iOS" extensionBundleIdentifier:@"com.apple.PeopleViewService.PeopleWidget-iOS" containerBundleIdentifier:@"com.apple.PeopleViewService"];
  id v3 = (void *)[objc_alloc(MEMORY[0x263F792C8]) initWithWidget:v2];

  return v3;
}

- (void)_migrateClockCityWidgetForIconListModel:(id)a3 withDefaultIconState:(id)a4
{
  id v37 = a3;
  id v6 = a4;
  id v7 = self->_ambientDefaults;
  if (([(AMAmbientDefaults *)v7 hasMigratedClockCityWidget] & 1) == 0)
  {
    id v8 = [v37 iconAtIndex:0];
    uint64_t v9 = objc_opt_class();
    id v10 = v8;
    if (v9)
    {
      if (objc_opt_isKindOfClass()) {
        double v11 = v10;
      }
      else {
        double v11 = 0;
      }
    }
    else
    {
      double v11 = 0;
    }
    id v12 = v11;

    double v13 = [v12 iconDataSources];
    uint64_t v14 = [v6 objectForKey:@"iconLists"];
    uint64_t v15 = objc_opt_class();
    id v16 = v14;
    if (v15)
    {
      if (objc_opt_isKindOfClass()) {
        id v17 = v16;
      }
      else {
        id v17 = 0;
      }
    }
    else
    {
      id v17 = 0;
    }
    id v18 = v17;

    if (v18)
    {
      BOOL v19 = [v18 firstObject];
      uint64_t v20 = objc_opt_class();
      id v21 = v19;
      if (v20)
      {
        if (objc_opt_isKindOfClass()) {
          id v22 = v21;
        }
        else {
          id v22 = 0;
        }
      }
      else
      {
        id v22 = 0;
      }
      id v24 = v22;

      if (v24)
      {
        uint64_t v25 = [v24 firstObject];
        uint64_t v26 = objc_opt_class();
        id v27 = v25;
        if (v26)
        {
          if (objc_opt_isKindOfClass()) {
            long long v28 = v27;
          }
          else {
            long long v28 = 0;
          }
        }
        else
        {
          long long v28 = 0;
        }
        id v29 = v28;

        if (v29)
        {
          long long v30 = [v29 objectForKey:@"elements"];
          uint64_t v31 = objc_opt_class();
          id v32 = v30;
          if (v31)
          {
            if (objc_opt_isKindOfClass()) {
              long long v33 = v32;
            }
            else {
              long long v33 = 0;
            }
          }
          else
          {
            long long v33 = 0;
          }
          id v23 = v33;
        }
        else
        {
          id v23 = 0;
        }
      }
      else
      {
        id v23 = 0;
      }
    }
    else
    {
      id v23 = 0;
    }
    if ([(AMUIInfographViewController *)self _shouldMigrateClockCityWidgetForIconDataSources:v13 withWidgetStackElements:v23])
    {
      long long v34 = [v13 firstObject];
      [v12 removeIconDataSource:v34];
      id v35 = (void *)[objc_alloc(MEMORY[0x263F79258]) initWithKind:@"com.apple.mobiletimer.datetime" extensionBundleIdentifier:@"com.apple.mobiletimer.WorldClockWidget" containerBundleIdentifier:@"com.apple.mobiletimer"];
      v36 = [v13 firstObject];
      [v12 insertIconDataSource:v35 beforeIconDataSource:v36];
    }
    [(AMAmbientDefaults *)v7 setMigratedClockCityWidget:1];
  }
}

- (BOOL)_shouldMigrateClockCityWidgetForIconDataSources:(id)a3 withWidgetStackElements:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v28 = v5;
  unint64_t v7 = [v5 count];
  if (v7 < [v6 count])
  {
LABEL_26:
    char v9 = 0;
    goto LABEL_27;
  }
  if ([v6 count])
  {
    uint64_t v8 = 0;
    char v9 = 1;
    while (1)
    {
      id v10 = [v28 objectAtIndex:v8];
      uint64_t v11 = objc_opt_class();
      id v12 = v10;
      if (v11) {
        id v13 = (objc_opt_isKindOfClass() & 1) != 0 ? v12 : 0;
      }
      else {
        id v13 = 0;
      }
      id v14 = v13;

      uint64_t v15 = [v6 objectAtIndex:v8];
      uint64_t v16 = objc_opt_class();
      id v17 = v15;
      if (v16) {
        id v18 = (objc_opt_isKindOfClass() & 1) != 0 ? v17 : 0;
      }
      else {
        id v18 = 0;
      }
      id v19 = v18;

      if (!v14 || !v19) {
        break;
      }
      uint64_t v20 = [v14 extensionBundleIdentifier];
      id v21 = [v14 kind];
      id v22 = [v19 objectForKey:@"bundleIdentifier"];
      if (v8)
      {
        id v23 = [v19 objectForKey:@"widgetIdentifier"];
      }
      else
      {
        id v23 = @"com.apple.mobiletimer.City";
      }
      char v24 = [v20 isEqualToString:v22];
      char v25 = [v21 isEqualToString:v23];
      if (v9) {
        char v26 = v24;
      }
      else {
        char v26 = 0;
      }
      char v9 = v26 & v25;

      if (++v8 >= (unint64_t)[v6 count]) {
        goto LABEL_27;
      }
    }

    goto LABEL_26;
  }
  char v9 = 1;
LABEL_27:

  return v9;
}

- (void)_restartStackConfigurationEditingTimeoutTimer
{
  [(AMUIInfographViewController *)self _invalidateStackConfigurationEditingTimeoutTimer];
  id v3 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__stackConfigurationEditingTimeoutTimerFired selector:0 userInfo:0 repeats:30.0];
  configurationEditTimeoutTimer = self->_configurationEditTimeoutTimer;
  self->_configurationEditTimeoutTimer = v3;

  id v5 = self->_configurationEditTimeoutTimer;

  [(NSTimer *)v5 setTolerance:10.0];
}

- (void)_stackConfigurationEditingTimeoutTimerFired
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconViewPresentingStackConfiguration);
  [WeakRetained dismissStackConfigurationCard];

  [(AMUIInfographViewController *)self _invalidateStackConfigurationEditingTimeoutTimer];
}

- (void)_invalidateStackConfigurationEditingTimeoutTimer
{
  configurationEditTimeoutTimer = self->_configurationEditTimeoutTimer;
  if (configurationEditTimeoutTimer)
  {
    [(NSTimer *)configurationEditTimeoutTimer invalidate];
    id v4 = self->_configurationEditTimeoutTimer;
    self->_configurationEditTimeoutTimer = 0;
  }
}

- (void)proactiveSuggestionsProvider:(id)a3 willUseIntent:(id)a4 forIconWithIdentifier:(id)a5 widgetUniqueIdentifier:(id)a6
{
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  v16[1] = *MEMORY[0x263EF8340];
  addWidgetSheetListLayoutProvider = self->_addWidgetSheetListLayoutProvider;
  if (!addWidgetSheetListLayoutProvider)
  {
    uint64_t v4 = *MEMORY[0x263F79320];
    id v5 = objc_alloc_init(MEMORY[0x263F791F0]);
    id v6 = [v5 layoutForIconLocation:v4];
    unint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F791E0]) initWithBaseListLayout:v6];
    uint64_t v8 = objc_alloc_init(AMUIInfographListLayoutProvider);
    char v9 = [(AMUIInfographListLayoutProvider *)v8 layoutForIconLocation:v4];
    [v7 setListLayout:v9 forSelector:sel_widgetContentMargins];
    [v7 setListLayout:v9 forSelector:sel_widgetContentMarginsWithBackgroundRemoved];
    [v7 setListLayout:v9 forSelector:sel_widgetScaleFactor];
    [v7 setListLayout:v9 forSelector:sel_iconImageInfo];
    [v7 setListLayout:v9 forSelector:sel_iconImageInfoForGridSizeClass_];
    id v10 = objc_alloc(MEMORY[0x263F791E8]);
    uint64_t v15 = v4;
    v16[0] = v7;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    id v12 = (SBIconListLayoutProvider *)[v10 initWithListLayouts:v11];
    id v13 = self->_addWidgetSheetListLayoutProvider;
    self->_addWidgetSheetListLayoutProvider = v12;

    addWidgetSheetListLayoutProvider = self->_addWidgetSheetListLayoutProvider;
  }

  return addWidgetSheetListLayoutProvider;
}

- (void)iconListView:(id)a3 didAddIconView:(id)a4
{
  objc_msgSend(a4, "customIconImageViewController", a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = self;
  if (objc_opt_isKindOfClass()) {
    id v6 = v8;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (objc_opt_respondsToSelector()) {
    [v7 addObserver:self];
  }
}

- (void)widgetStackViewControllerWillBeginScrolling:(id)a3
{
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__AMUIInfographViewController_appProtectionSubjectsChanged_forSubscription___block_invoke;
  block[3] = &unk_2652247E0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __76__AMUIInfographViewController_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1224));
  id v5 = [WeakRetained rootFolder];

  id v3 = [v5 lists];
  uint64_t v4 = [v3 firstObject];

  [*(id *)(a1 + 32) _validateIconListModel:v4];
}

- (double)titledButtonsAlpha
{
  return self->_titledButtonsAlpha;
}

- (AMUIInfographViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AMUIInfographViewControllerDelegate *)WeakRetained;
}

- (APSubjectMonitorSubscription)appProtectionSubjectMonitorSubscription
{
  return self->_appProtectionSubjectMonitorSubscription;
}

- (SBHMainAddSheetViewControlling)addWidgetSheetViewController
{
  return self->_addWidgetSheetViewController;
}

- (void)setAddWidgetSheetViewController:(id)a3
{
}

- (SBHStackConfigurationViewController)stackConfigurationViewController
{
  return self->_stackConfigurationViewController;
}

- (void)setStackConfigurationViewController:(id)a3
{
}

- (PRSPosterConfiguration)posterConfiguration
{
  return self->_posterConfiguration;
}

- (AMUIWidgetHostManager)widgetHostManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetHostManager);

  return (AMUIWidgetHostManager *)WeakRetained;
}

- (void)setWidgetHostManager:(id)a3
{
}

- (NSArray)defaultWidgetDescriptorStacks
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_defaultWidgetDescriptorStacks);

  return (NSArray *)WeakRetained;
}

- (void)setDefaultWidgetDescriptorStacks:(id)a3
{
}

- (BOOL)wantsDefaultInfographLayout
{
  return self->_wantsDefaultInfographLayout;
}

- (void)setWantsDefaultInfographLayout:(BOOL)a3
{
  self->_wantsDefaultInfographLayout = a3;
}

- (SBHIconManager)iconManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconManager);

  return (SBHIconManager *)WeakRetained;
}

- (NSMutableDictionary)keepRootStaticAssertions
{
  return self->_keepRootStaticAssertions;
}

- (void)setKeepRootStaticAssertions:(id)a3
{
}

- (UIView)launchConfirmationView
{
  return self->_launchConfirmationView;
}

- (void)setLaunchConfirmationView:(id)a3
{
}

- (NSTimer)launchConfirmationCancelTimer
{
  return self->_launchConfirmationCancelTimer;
}

- (void)setLaunchConfirmationCancelTimer:(id)a3
{
}

- (NSString)pendingLaunchBundleIdentifier
{
  return self->_pendingLaunchBundleIdentifier;
}

- (void)setPendingLaunchBundleIdentifier:(id)a3
{
}

- (NSSet)pendingLaunchActions
{
  return self->_pendingLaunchActions;
}

- (void)setPendingLaunchActions:(id)a3
{
}

- (BSInvalidatable)disableIconStateAutosaveAssertion
{
  return self->_disableIconStateAutosaveAssertion;
}

- (void)setDisableIconStateAutosaveAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disableIconStateAutosaveAssertion, 0);
  objc_storeStrong((id *)&self->_pendingLaunchActions, 0);
  objc_storeStrong((id *)&self->_pendingLaunchBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_launchConfirmationCancelTimer, 0);
  objc_storeStrong((id *)&self->_launchConfirmationView, 0);
  objc_storeStrong((id *)&self->_keepRootStaticAssertions, 0);
  objc_destroyWeak((id *)&self->_iconManager);
  objc_destroyWeak((id *)&self->_defaultWidgetDescriptorStacks);
  objc_destroyWeak((id *)&self->_widgetHostManager);
  objc_storeStrong((id *)&self->_posterConfiguration, 0);
  objc_storeStrong((id *)&self->_stackConfigurationViewController, 0);
  objc_storeStrong((id *)&self->_addWidgetSheetViewController, 0);
  objc_storeStrong((id *)&self->_appProtectionSubjectMonitorSubscription, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_widgetDragHandler);
  objc_storeStrong((id *)&self->_widgetStackConfigurationFeedbackGenerator, 0);
  objc_destroyWeak((id *)&self->_iconViewPresentingStackConfiguration);
  objc_storeStrong((id *)&self->_configurationEditTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_defaultObserver, 0);
  objc_storeStrong((id *)&self->_ambientDefaults, 0);
  objc_storeStrong((id *)&self->_iconListView, 0);
  objc_storeStrong((id *)&self->_ambientWidgetLayout, 0);
  objc_storeStrong((id *)&self->_posterUpdater, 0);
  objc_storeStrong((id *)&self->_initIntents, 0);
  objc_storeStrong((id *)&self->_intents, 0);
  objc_storeStrong((id *)&self->_temporaryOverlayReasons, 0);
  objc_storeStrong((id *)&self->_configurationReasons, 0);
  objc_storeStrong((id *)&self->_addWidgetSheetListLayoutProvider, 0);
  objc_storeStrong((id *)&self->_addWidgetSheetMetricsProvider, 0);
  objc_storeStrong((id *)&self->_widgetSettings, 0);
  objc_storeStrong((id *)&self->_widgetExtensionProvider, 0);
  objc_storeStrong((id *)&self->_addWidgetSheetConfigurationManager, 0);
  objc_storeStrong((id *)&self->_listModel, 0);
  objc_storeStrong((id *)&self->_proactiveSuggestionsProvider, 0);
  objc_storeStrong((id *)&self->_proactiveUsageObserver, 0);

  objc_storeStrong((id *)&self->_proactiveClient, 0);
}

- (void)_setAmbientDefaults:(id)a3
{
}

+ (id)_clockCityWidget
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263F79258]) initWithKind:@"com.apple.mobiletimer.City" extensionBundleIdentifier:@"com.apple.mobiletimer.WorldClockWidget" containerBundleIdentifier:@"com.apple.mobiletimer"];

  return v2;
}

+ (id)_clockLocalWidget
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263F79258]) initWithKind:@"com.apple.mobiletimer.datetime" extensionBundleIdentifier:@"com.apple.mobiletimer.WorldClockWidget" containerBundleIdentifier:@"com.apple.mobiletimer"];

  return v2;
}

+ (id)_bigDateTimeWidget
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263F79258]) initWithKind:@"com.apple.CalendarWidget.CalendarDateWidget" extensionBundleIdentifier:@"com.apple.mobilecal.CalendarWidgetExtension" containerBundleIdentifier:@"com.apple.mobilecal"];

  return v2;
}

+ (id)_stocksWidget
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263F79258]) initWithKind:@"detail" extensionBundleIdentifier:@"com.apple.stocks.widget" containerBundleIdentifier:@"com.apple.stocks"];

  return v2;
}

+ (id)_clockSquareWidget
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263F79258]) initWithKind:@"com.apple.mobiletimer.square" extensionBundleIdentifier:@"com.apple.mobiletimer.WorldClockWidget" containerBundleIdentifier:@"com.apple.mobiletimer"];

  return v2;
}

+ (id)_defaultWidgetDescriptionForKind:(id)a3 bundleIdentifier:(id)a4 containerBundleIdentifier:(id)a5
{
  v14[5] = *MEMORY[0x263EF8340];
  v13[0] = @"elementType";
  v13[1] = @"widgetIdentifier";
  v14[0] = @"widget";
  v14[1] = a3;
  v13[2] = @"containerBundleIdentifier";
  v13[3] = @"bundleIdentifier";
  void v14[2] = a5;
  v14[3] = a4;
  void v13[4] = @"widgetSuggestionSource";
  void v14[4] = @"onboarding";
  id v7 = NSDictionary;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v7 dictionaryWithObjects:v14 forKeys:v13 count:5];

  return v11;
}

+ (id)_clockCityWidgetDescription
{
  return +[AMUIInfographViewController _defaultWidgetDescriptionForKind:@"com.apple.mobiletimer.City" bundleIdentifier:@"com.apple.mobiletimer.WorldClockWidget" containerBundleIdentifier:@"com.apple.mobiletimer"];
}

+ (id)_clockLocalWidgetDescription
{
  return +[AMUIInfographViewController _defaultWidgetDescriptionForKind:@"com.apple.mobiletimer.datetime" bundleIdentifier:@"com.apple.mobiletimer.WorldClockWidget" containerBundleIdentifier:@"com.apple.mobiletimer"];
}

+ (id)_bigDateTimeWidgetDescription
{
  return +[AMUIInfographViewController _defaultWidgetDescriptionForKind:@"com.apple.CalendarWidget.CalendarDateWidget" bundleIdentifier:@"com.apple.mobilecal.CalendarWidgetExtension" containerBundleIdentifier:@"com.apple.mobilecal"];
}

+ (id)_stocksWidgetDescription
{
  return +[AMUIInfographViewController _defaultWidgetDescriptionForKind:@"detail" bundleIdentifier:@"com.apple.stocks.widget" containerBundleIdentifier:@"com.apple.stocks"];
}

+ (id)_clockSquareWidgetDescription
{
  return +[AMUIInfographViewController _defaultWidgetDescriptionForKind:@"com.apple.mobiletimer.square" bundleIdentifier:@"com.apple.mobiletimer.WorldClockWidget" containerBundleIdentifier:@"com.apple.mobiletimer"];
}

- (void)setPosterConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1(&dword_247837000, v0, v1, "Skipping setPosterConfiguration; same poster already set (current '%@', new '%@')");
}

- (void)setPosterConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_247837000, v0, v1, "Received empty widgetLayoutIconState from posterConfiguration:%@", v2, v3, v4, v5, v6);
}

- (void)setPosterConfiguration:(uint64_t)a1 .cold.3(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1(&dword_247837000, v1, v2, "Received nil ambientWidgetLayout from posterConfiguration:%@ withError:%@", (void)v3, DWORD2(v3));
}

- (void)setPosterConfiguration:.cold.4()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_247837000, v0, v1, "Received nil widgetLayoutIconState from posterConfiguration:%@", v2, v3, v4, v5, v6);
}

- (void)setPosterConfiguration:.cold.5()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_247837000, v0, v1, "Executing setPosterConfiguration; new poster configuration incoming (new '%@')",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)_loadInfographPosterConfigurationDataWithError:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_247837000, v0, v1, "Load memory icon state %@", v2, v3, v4, v5, v6);
}

- (void)_loadInfographPosterConfigurationDataWithError:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_247837000, v0, v1, "Error loading infographPosterConfigurationData, ambientWidgetLayout is nil", v2, v3, v4, v5, v6);
}

- (void)_loadInfographPosterConfigurationDataWithError:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_247837000, v0, v1, "Error loading infographPosterConfigurationData, widgetLayoutIconState is nil", v2, v3, v4, v5, v6);
}

- (void)_saveInfographPosterConfigurationData:completion:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_247837000, v0, v1, "Failed to save infograph to poster configuration because we don't have a poster configuration yet", v2, v3, v4, v5, v6);
}

- (void)_saveInfographPosterConfigurationData:completion:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_247837000, v0, v1, "Poster updater tries to update poster configuration %@", v2, v3, v4, v5, v6);
}

void __80__AMUIInfographViewController__saveInfographPosterConfigurationData_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_247837000, v0, v1, "Failed to update infograph configuration with error: %@.", v2, v3, v4, v5, v6);
}

void __80__AMUIInfographViewController__saveInfographPosterConfigurationData_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_2(&dword_247837000, v0, v1, "The updated poster configuration is %@.", v2, v3, v4, v5, v6);
}

- (void)_uniqueIdentifierStacksFromIconState:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_247837000, v0, v1, "Cannot create unique identifier stacks from icon state, invalid stacks in iconLists:%@", v2, v3, v4, v5, v6);
}

void __44__AMUIInfographViewController__fetchIntents__block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1(&dword_247837000, v1, v2, "Fail to archive intent for %@ with error %@", (void)v3, DWORD2(v3));
}

- (void)iconManager:bundleIdentifierToLaunchForWidgetURL:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_247837000, v0, v1, "No app proxies found for widget URL:%@", v2, v3, v4, v5, v6);
}

void __98__AMUIInfographViewController__handleLaunchRequestForApplicationWithBundleIdentifier_withActions___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_2(&dword_247837000, v0, v1, "[%{public}@] Application launch from widget succeeded", v2, v3, v4, v5, v6);
}

void __98__AMUIInfographViewController__handleLaunchRequestForApplicationWithBundleIdentifier_withActions___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_247837000, v0, v1, "[%{public}@] Application launch from widget failed: %{public}@");
}

- (void)_preparePosterConfigurationToSaveWithCurrentIconState:intents:reason:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_247837000, v0, v1, "AMUIInfographViewController prepares to save an empty IconState", v2, v3, v4, v5, v6);
}

@end