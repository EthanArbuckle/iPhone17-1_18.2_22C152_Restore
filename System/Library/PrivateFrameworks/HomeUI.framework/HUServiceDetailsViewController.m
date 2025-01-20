@interface HUServiceDetailsViewController
+ (id)acceptableItemClasses;
- (BOOL)_allowRowHighlightForItem:(id)a3;
- (BOOL)_allowRowSelectionForItem:(id)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isCameraItem;
- (BOOL)_notifyOfHomeTheaterReconfigurationIfNecessary:(id)a3;
- (BOOL)_shouldFollowTitleValueTintColorforItem:(id)a3;
- (BOOL)_shouldPresentRemoveRouterConfirmation;
- (BOOL)_shouldShowAddButtonForOptionItem:(id)a3;
- (BOOL)_shouldShowDetailDisclosureForItem:(id)a3;
- (BOOL)_shouldShowHomeTheaterPrompt;
- (BOOL)automaticallyUpdatesViewControllerTitle;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasDetailsActionFor:(id)a3 item:(id)a4;
- (BOOL)hasDetailsActionForContainedServiceGridViewController:(id)a3 item:(id)a4;
- (BOOL)isItemGroup;
- (BOOL)isMultiServiceAccessory;
- (BOOL)isPresentingRoomsList;
- (BOOL)itemManager:(id)a3 shouldShowControlPanelItem:(id)a4;
- (BOOL)itemManager:(id)a3 shouldShowSectionTitleForControlPanelItem:(id)a4;
- (BOOL)requiresPresentingViewControllerDismissal;
- (BOOL)shouldDisableAdditionalDismissalForTogglingSeparatingTiles;
- (BOOL)shouldHideFooterBelowSection:(int64_t)a3;
- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3;
- (BOOL)shouldHideSeparatorsForCell:(id)a3 indexPath:(id)a4;
- (BOOL)shouldIncludeRoomNameInHeaderTitle;
- (BOOL)shouldTrackProgrammableSwitchActivations;
- (BOOL)supportsCustomIconEditing;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (BOOL)triggerEditor:(id)a3 shouldCommitTriggerBuilder:(id)a4;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HFNamingComponents)namingComponent;
- (HFServiceLikeItem)item;
- (HMHome)home;
- (HUAccessorySettingsItemModuleController)accessorySettingsItemModuleController;
- (HUAssociatedSceneAndTriggerModuleController)sceneAndTriggerModuleController;
- (HUAvailableRelatedTriggerItemModuleController)associatedTriggerModuleController;
- (HUChildServiceItemModuleController)accessoryServicesEditorItemModuleController;
- (HUChildServiceItemModuleController)inputSourceItemModuleController;
- (HUChildServiceItemModuleController)valveEditorItemModuleController;
- (HUControlPanelController)controlPanelController;
- (HUMatterConnectedServicesItemModuleController)connectedServicesItemModuleController;
- (HUNameItemModuleController)nameItemModuleController;
- (HUPresentationDelegate)presentationDelegate;
- (HUQuickControlProxHandOffSummaryViewUpdater)proxHandOffSummaryViewUpdater;
- (HUQuickControlSummaryNavigationBarTitleView)navigationBarTitleView;
- (HUServiceDetailsItemManager)detailsItemManager;
- (HUServiceDetailsTextViewDelegate)textViewDelegate;
- (HUServiceDetailsViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4;
- (HUServiceDetailsViewController)initWithServiceLikeItem:(id)a3;
- (HUSoftwareUpdateItemModuleController)softwareUpdateItemModuleController;
- (HUTelevisionSettingsItemModuleController)televisionSettingsItemModuleController;
- (NAFuture)accountFuture;
- (NAFuture)homePodIdentifyFuture;
- (NSHashTable)expandedControlPanelItems;
- (NSMapTable)moduleToModuleControllerMap;
- (NSMutableSet)registeredButtonFutures;
- (NSString)description;
- (UIButton)closeButton;
- (UILongPressGestureRecognizer)longPressRecognizer;
- (id)_characteristicsAffectedByControlItem:(id)a3;
- (id)_commitBuilder;
- (id)_commitBuilderFor:(id)a3 with:(id)a4;
- (id)_createMenuWithValues:(id)a3 cell:(id)a4 currentItem:(id)a5;
- (id)_magicallyUpdateNavigationStackForNewRootItem:(id)a3 topViewController:(id)a4;
- (id)_microphoneStatus;
- (id)_primaryStatusTextForLatestResults:(id)a3 showingSecondaryStatus:(BOOL)a4;
- (id)_recoverItemBuilder:(id)a3 fromError:(id)a4;
- (id)_removeFromGroup;
- (id)_removeItem;
- (id)_roomForItem:(id)a3;
- (id)_roomUpdateBuilderFor:(id)a3;
- (id)_secondaryStatusTextForLatestResults:(id)a3;
- (id)buildItemModuleControllerForModule:(id)a3;
- (id)childServiceEditorModuleController:(id)a3 didSelectItem:(id)a4;
- (id)createAccessoryDetailInfoListModuleControllerWith:(id)a3;
- (id)detailsViewControllerFor:(id)a3 item:(id)a4;
- (id)detailsViewControllerForContainedMediaAccessoryGridViewController:(id)a3 item:(id)a4;
- (id)detailsViewControllerForContainedServiceGridViewController:(id)a3 item:(id)a4;
- (id)finishPresentation:(id)a3 animated:(BOOL)a4;
- (id)itemManager:(id)a3 sectionFooterForControlPanelItem:(id)a4 forServiceItem:(id)a5;
- (id)itemManager:(id)a3 sectionTitleForControlPanelItem:(id)a4 forServiceItem:(id)a5;
- (id)itemModuleControllers;
- (id)pickerViewCell:(id)a3 titleForValueAtIndex:(int64_t)a4;
- (id)showConnectedEcosystems;
- (id)softwareUpdateModuleController:(id)a3 dismissViewController:(id)a4;
- (id)softwareUpdateModuleController:(id)a3 navigateToViewController:(id)a4;
- (id)softwareUpdateModuleController:(id)a3 presentViewController:(id)a4;
- (int64_t)inProgressExportDiagnosticsIndex;
- (int64_t)numberOfValuesForPickerViewCell:(id)a3;
- (unint64_t)automaticDisablingReasonsForItem:(id)a3;
- (void)_didRemoveHomeKitObject:(id)a3;
- (void)_didSelectRoomItem:(id)a3;
- (void)_executeSilentSoftwareUpdateCheck;
- (void)_exportDiagnosticsForItem:(id)a3;
- (void)_fetchAccessoryDiagnosticInfo;
- (void)_identifyHomePod;
- (void)_longPressRecognized:(id)a3;
- (void)_notifyOfHomePodPairingIfNecessary:(id)a3;
- (void)_offerToCreateHomeTheaterIfPossible:(id)a3;
- (void)_presentContainedItems;
- (void)_presentEcosystemAccessoryRemoveConfirmation:(id)a3;
- (void)_presentGroupPicker;
- (void)_presentHomeAccessoryRemoveConfirmation:(id)a3;
- (void)_presentRemoveConfirmation:(id)a3;
- (void)_presentRemoveFromGroupConfirmation:(id)a3;
- (void)_presentRemoveRouterConfirmation;
- (void)_presentResetHomePodConfirmation:(id)a3;
- (void)_presentTriggerEditorForProgrammableSwitchEventOptionItem:(id)a3;
- (void)_registerButtonActionHandler:(id)a3 item:(id)a4;
- (void)_restartGroupedHomePodAccessory;
- (void)_restartHomePod;
- (void)_separateOrUnifyTile;
- (void)_setDismissedHomePodHasNonMemberMediaAccountWarning:(BOOL)a3;
- (void)_setupProgrammableSwitchCell:(id)a3 forItem:(id)a4;
- (void)_updateAssociatedServiceTypeCells;
- (void)_updateCheckedStateForAssociatedServiceTypeCell:(id)a3 item:(id)a4;
- (void)_updateControlStatusText;
- (void)_updateIconDescriptorAnimated:(BOOL)a3;
- (void)_updateName:(id)a3;
- (void)accessory:(id)a3 service:(id)a4 didUpdateValueForCharacteristic:(id)a5;
- (void)accessoryDidUpdateControllable:(id)a3;
- (void)accessoryDidUpdateServices:(id)a3;
- (void)addRoomButtonPressed:(id)a3;
- (void)checkForAccessoriesNeedingReprovisioning;
- (void)commitChanges;
- (void)controlPanelController:(id)a3 didEndPossibleWritesForControlItem:(id)a4;
- (void)controlPanelController:(id)a3 willBeginPossibleWritesForControlItem:(id)a4;
- (void)dealloc;
- (void)didRemoveCHIPPairingforAccessory:(id)a3;
- (void)didSelectHeaderWarningAction:(id)a3;
- (void)didSelectHomeAssistantDeviceSplitAccountAction:(unint64_t)a3;
- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6;
- (void)diffableDataItemManager:(id)a3 willUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6 isInitialLoad:(BOOL)a7;
- (void)dismissPrivacyController;
- (void)dismissTriggerActionEditorViewController:(id)a3;
- (void)editRoomViewControllerDidFinish:(id)a3 withNewRoom:(id)a4;
- (void)home:(id)a3 didRemoveAccessory:(id)a4;
- (void)home:(id)a3 didRemoveMediaSystem:(id)a4;
- (void)home:(id)a3 didRemoveServiceGroup:(id)a4;
- (void)itemManager:(id)a3 didUpdateResultsForItem:(id)a4 atIndexPath:(id)a5;
- (void)itemManager:(id)a3 didUpdateResultsForSourceItem:(id)a4;
- (void)itemManager:(id)a3 performUpdateRequest:(id)a4;
- (void)mediaSystemEditor:(id)a3 didAbortDueTo:(id)a4;
- (void)mediaSystemEditor:(id)a3 didCreate:(id)a4;
- (void)moduleController:(id)a3 expandModule:(id)a4;
- (void)moduleController:(id)a3 presentSettingDetailsViewController:(id)a4;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)pickerViewCell:(id)a3 didSelectValueAtIndex:(int64_t)a4;
- (void)serviceGroupEditor:(id)a3 didCreateServiceGroup:(id)a4;
- (void)setAccessoryServicesEditorItemModuleController:(id)a3;
- (void)setAccessorySettingsItemModuleController:(id)a3;
- (void)setAccountFuture:(id)a3;
- (void)setAssociatedTriggerModuleController:(id)a3;
- (void)setCloseButton:(id)a3;
- (void)setConnectedServicesItemModuleController:(id)a3;
- (void)setDetailsItemManager:(id)a3;
- (void)setHome:(id)a3;
- (void)setHomePodIdentifyFuture:(id)a3;
- (void)setInProgressExportDiagnosticsIndex:(int64_t)a3;
- (void)setInputSourceItemModuleController:(id)a3;
- (void)setIsPresentingRoomsList:(BOOL)a3;
- (void)setLongPressRecognizer:(id)a3;
- (void)setModuleToModuleControllerMap:(id)a3;
- (void)setNameItemModuleController:(id)a3;
- (void)setNamingComponent:(id)a3;
- (void)setNavigationBarTitleView:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setProxHandOffSummaryViewUpdater:(id)a3;
- (void)setRegisteredButtonFutures:(id)a3;
- (void)setRequiresPresentingViewControllerDismissal:(BOOL)a3;
- (void)setSceneAndTriggerModuleController:(id)a3;
- (void)setShouldDisableAdditionalDismissalForTogglingSeparatingTiles:(BOOL)a3;
- (void)setShouldIncludeRoomNameInHeaderTitle:(BOOL)a3;
- (void)setShouldTrackProgrammableSwitchActivations:(BOOL)a3;
- (void)setSoftwareUpdateItemModuleController:(id)a3;
- (void)setTelevisionSettingsItemModuleController:(id)a3;
- (void)setTextViewDelegate:(id)a3;
- (void)setValveEditorItemModuleController:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)textDidChange:(id)a3 forTextField:(id)a4 item:(id)a5;
- (void)textFieldDidEndEditing:(id)a3 item:(id)a4;
- (void)triggerEditor:(id)a3 didFinishWithTriggerBuilder:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillDismiss;
@end

@implementation HUServiceDetailsViewController

- (id)createAccessoryDetailInfoListModuleControllerWith:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = HUServiceDetailsViewController.createAccessoryDetailInfoListModuleController(with:)((uint64_t)v4);

  return v6;
}

+ (id)acceptableItemClasses
{
  if (_MergedGlobals_4_3 != -1) {
    dispatch_once(&_MergedGlobals_4_3, &__block_literal_global_82_1);
  }
  v2 = (void *)qword_1EA12E060;

  return v2;
}

void __55__HUServiceDetailsViewController_acceptableItemClasses__block_invoke_2()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
  v10 = (void *)qword_1EA12E060;
  qword_1EA12E060 = v9;
}

- (HUServiceDetailsViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  uint64_t v7 = NSStringFromSelector(sel_initWithServiceLikeItem_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUServiceDetailsViewController.m", 169, @"%s is unavailable; use %@ instead",
    "-[HUServiceDetailsViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (HUServiceDetailsViewController)initWithServiceLikeItem:(id)a3
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() acceptableItemClasses];
  v91[0] = MEMORY[0x1E4F143A8];
  v91[1] = 3221225472;
  v91[2] = __58__HUServiceDetailsViewController_initWithServiceLikeItem___block_invoke;
  v91[3] = &unk_1E63865E0;
  id v6 = v4;
  id v92 = v6;
  if ((objc_msgSend(v5, "na_any:", v91) & 1) == 0)
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = [v5 allObjects];
    uint64_t v9 = objc_msgSend(v8, "na_map:", &__block_literal_global_105_2);
    v10 = [v9 componentsJoinedByString:@"/"];
    NSLog(&cfstr_RequiresAObjec.isa, v7, v10);
  }
  v11 = [[HUServiceDetailsItemManager alloc] initWithServiceItem:v6 delegate:self];
  v90.receiver = self;
  v90.super_class = (Class)HUServiceDetailsViewController;
  v12 = [(HUItemTableViewController *)&v90 initWithItemManager:v11 tableViewStyle:1];
  if (v12)
  {
    id v13 = v6;
    v14 = &unk_1F1A3D6E8;
    if ([v13 conformsToProtocol:v14]) {
      v15 = v13;
    }
    else {
      v15 = 0;
    }
    id v16 = v15;

    char v17 = [v16 isItemGroup];
    v12->_isItemGroup = v17;
    v12->_isMultiServiceAccessory = 0;
    v12->_shouldIncludeRoomNameInHeaderTitle = 0;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      id v18 = v13;
      if (objc_opt_isKindOfClass()) {
        v19 = v18;
      }
      else {
        v19 = 0;
      }
      id v20 = v19;

      v21 = [v20 accessory];
      v12->_isMultiServiceAccessory = objc_msgSend(v21, "hf_isMultiServiceAccessory");
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_31:
        objc_storeWeak((id *)&v12->_detailsItemManager, v11);
        v53 = [[HUControlPanelController alloc] initWithDelegate:v12];
        controlPanelController = v12->_controlPanelController;
        v12->_controlPanelController = v53;

        uint64_t v55 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
        expandedControlPanelItems = v12->_expandedControlPanelItems;
        v12->_expandedControlPanelItems = (NSHashTable *)v55;

        uint64_t v57 = [objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:v12 action:sel__longPressRecognized_];
        longPressRecognizer = v12->_longPressRecognizer;
        v12->_longPressRecognizer = (UILongPressGestureRecognizer *)v57;

        [(UILongPressGestureRecognizer *)v12->_longPressRecognizer setDelegate:v12];
        v59 = [(HUServiceDetailsViewController *)v12 tableView];
        [v59 addGestureRecognizer:v12->_longPressRecognizer];

        v60 = objc_alloc_init(HUServiceDetailsTextViewDelegate);
        textViewDelegate = v12->_textViewDelegate;
        v12->_textViewDelegate = v60;

        [(HUServiceDetailsTextViewDelegate *)v12->_textViewDelegate setItemManager:v11];
        [(HUServiceDetailsTextViewDelegate *)v12->_textViewDelegate setViewController:v12];
        uint64_t v62 = [v13 namingComponentForHomeKitObject];
        namingComponent = v12->_namingComponent;
        v12->_namingComponent = (HFNamingComponents *)v62;

        v64 = [MEMORY[0x1E4F691A0] sharedDispatcher];
        [v64 addHomeObserver:v12];

        v65 = [MEMORY[0x1E4F691A0] sharedDispatcher];
        [v65 addAccessoryObserver:v12];

        v66 = [v13 latestResults];
        v67 = [v66 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
        [(HUServiceDetailsViewController *)v12 setTitle:v67];

        v68 = objc_alloc_init(HUQuickControlSummaryNavigationBarTitleView);
        [(HUServiceDetailsViewController *)v12 setNavigationBarTitleView:v68];

        if (([MEMORY[0x1E4F69758] shouldUseLegacyQuickControlPresentation] & 1) == 0)
        {
          v69 = [[HUBaseIconViewConfiguration alloc] initWithItem:v13 appearance:3];
          v70 = [(HUServiceDetailsViewController *)v12 navigationBarTitleView];
          v71 = [v70 summaryView];
          v72 = [v71 baseIconView];
          [v72 setConfiguration:v69];
        }
        if ([MEMORY[0x1E4F69758] isProxHandOffV2Config])
        {
          v73 = [HUQuickControlProxHandOffSummaryViewUpdater alloc];
          v74 = [(HUServiceDetailsViewController *)v12 navigationBarTitleView];
          v75 = [(HUQuickControlProxHandOffSummaryViewUpdater *)v73 initWithNavigationBarTitleView:v74];
          [(HUServiceDetailsViewController *)v12 setProxHandOffSummaryViewUpdater:v75];
        }
        goto LABEL_35;
      }
      objc_opt_class();
      id v22 = v13;
      if (objc_opt_isKindOfClass()) {
        v23 = v22;
      }
      else {
        v23 = 0;
      }
      id v20 = v23;

      if (([v20 isHomePod] & 1) != 0 || objc_msgSend(v20, "isHomePodMediaSystem"))
      {
        v24 = objc_opt_new();
        [(HUServiceDetailsViewController *)v12 setRegisteredButtonFutures:v24];

        objc_initWeak(&location, v12);
        v86[0] = MEMORY[0x1E4F143A8];
        v86[1] = 3221225472;
        v86[2] = __58__HUServiceDetailsViewController_initWithServiceLikeItem___block_invoke_3;
        v86[3] = &unk_1E638C768;
        v88[1] = (id)a2;
        objc_copyWeak(v88, &location);
        v80 = v11;
        v87 = v80;
        +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguagesWithCompletion:v86];
        v25 = [MEMORY[0x1E4F691A0] sharedDispatcher];
        v26 = [v25 home];
        int v27 = objc_msgSend(v26, "hf_currentUserIsOwner");

        if (v27)
        {
          v78 = [MEMORY[0x1E4F68F00] sharedInstance];
          v28 = [MEMORY[0x1E4F691A0] sharedDispatcher];
          v29 = [v28 home];
          v30 = [v29 uniqueIdentifier];
          v31 = [v30 UUIDString];
          v81 = [v78 mediaAccountForHomeIdentifier:v31];

          if (v81)
          {
            v32 = HFLogForCategory();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              NSStringFromSelector(a2);
              id v79 = (id)objc_claimAutoreleasedReturnValue();
              v77 = [MEMORY[0x1E4F691A0] sharedDispatcher];
              v33 = [v77 home];
              v34 = [v33 uniqueIdentifier];
              v35 = [v34 UUIDString];
              *(_DWORD *)buf = 138412802;
              id v95 = v79;
              __int16 v96 = 2112;
              v97 = v81;
              __int16 v98 = 2112;
              v99 = v35;
              _os_log_impl(&dword_1BE345000, v32, OS_LOG_TYPE_DEFAULT, "%@ Setting media account - [%@]  for home with identifier - [%@]", buf, 0x20u);
            }
            [(HUServiceDetailsItemManager *)v80 setHomeMediaAccount:v81];
            v36 = [(HUServiceDetailsViewController *)v12 detailsItemManager];
            id v37 = (id)[v36 reloadAndUpdateAllItemsFromSenderSelector:a2];

            v38 = [(HUServiceDetailsViewController *)v12 detailsItemManager];
            int v39 = [v38 diffableDataSourceDisabled];

            if (v39)
            {
              v40 = [(HUServiceDetailsViewController *)v12 tableView];
              v41 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
              [v40 reloadSections:v41 withRowAnimation:5];
            }
            else
            {
              v49 = [(HUItemTableViewController *)v12 itemManager];
              v50 = [v49 itemSectionForSectionIndex:0];

              if (v50)
              {
                v51 = [(HUServiceDetailsViewController *)v12 detailsItemManager];
                v93 = v50;
                v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v93 count:1];
                [v51 reloadUIRepresentationForSections:v52 withAnimation:0];
              }
            }
          }
          else
          {
            v42 = [MEMORY[0x1E4F68F00] sharedInstance];
            v43 = [MEMORY[0x1E4F691A0] sharedDispatcher];
            v44 = [v43 home];
            uint64_t v45 = [v42 executeHomeMediaAccountFetchForHome:v44];
            accountFuture = v12->_accountFuture;
            v12->_accountFuture = (NAFuture *)v45;

            v47 = v12->_accountFuture;
            v83[0] = MEMORY[0x1E4F143A8];
            v83[1] = 3221225472;
            v83[2] = __58__HUServiceDetailsViewController_initWithServiceLikeItem___block_invoke_173;
            v83[3] = &unk_1E638C790;
            v85[1] = (id)a2;
            objc_copyWeak(v85, &location);
            v84 = v80;
            id v48 = (id)[(NAFuture *)v47 addCompletionBlock:v83];

            objc_destroyWeak(v85);
          }
        }
        objc_destroyWeak(v88);
        objc_destroyWeak(&location);
      }
    }

    goto LABEL_31;
  }
LABEL_35:

  return v12;
}

uint64_t __58__HUServiceDetailsViewController_initWithServiceLikeItem___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

NSString *__58__HUServiceDetailsViewController_initWithServiceLikeItem___block_invoke_2(int a1, Class aClass)
{
  return NSStringFromClass(aClass);
}

void __58__HUServiceDetailsViewController_initWithServiceLikeItem___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v16 = NSStringFromSelector(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 138412802;
    v19 = v16;
    __int16 v20 = 2112;
    id v21 = v6;
    __int16 v22 = 2112;
    id v23 = v5;
    _os_log_debug_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEBUG, "%@ fetchSupportedVoiceRecognitionLanguagesWithCompletion returned (%@) %@", buf, 0x20u);
  }
  if (!v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [*(id *)(a1 + 32) setSupportedVoiceRecognitionLanguages:v5];
    v10 = [WeakRetained detailsItemManager];
    id v11 = (id)[v10 reloadAndUpdateAllItemsFromSenderSelector:*(void *)(a1 + 48)];

    v12 = [WeakRetained detailsItemManager];
    LODWORD(v10) = [v12 diffableDataSourceDisabled];

    if (v10)
    {
      uint64_t v9 = [WeakRetained tableView];
      id v13 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
      [v9 reloadSections:v13 withRowAnimation:5];
    }
    else
    {
      v14 = [WeakRetained itemManager];
      uint64_t v9 = [v14 itemSectionForSectionIndex:0];

      if (!v9) {
        goto LABEL_11;
      }
      id v13 = [WeakRetained detailsItemManager];
      char v17 = v9;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
      [v13 reloadUIRepresentationForSections:v15 withAnimation:0];
    }
    goto LABEL_11;
  }
  WeakRetained = HFLogForCategory();
  if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 138412546;
    v19 = v9;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_error_impl(&dword_1BE345000, WeakRetained, OS_LOG_TYPE_ERROR, "%@ Error fetching voice recognition languages [%@]", buf, 0x16u);
LABEL_11:
  }
}

void __58__HUServiceDetailsViewController_initWithServiceLikeItem___block_invoke_173(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = NSStringFromSelector(*(SEL *)(a1 + 48));
      id v11 = [MEMORY[0x1E4F691A0] sharedDispatcher];
      v12 = [v11 home];
      id v13 = [v12 uniqueIdentifier];
      v14 = [v13 UUIDString];
      *(_DWORD *)buf = 138412802;
      __int16 v20 = v10;
      __int16 v21 = 2112;
      __int16 v22 = v14;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_error_impl(&dword_1BE345000, v7, OS_LOG_TYPE_ERROR, "%@ Error fetching media account for home with identifier [%@] - [%@]", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F7A0D8];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __58__HUServiceDetailsViewController_initWithServiceLikeItem___block_invoke_175;
    v15[3] = &unk_1E638A3E0;
    objc_copyWeak(v18, (id *)(a1 + 40));
    v18[1] = *(id *)(a1 + 48);
    id v16 = v5;
    id v17 = *(id *)(a1 + 32);
    id v9 = (id)[v8 futureWithBlock:v15];

    objc_destroyWeak(v18);
  }
}

void __58__HUServiceDetailsViewController_initWithServiceLikeItem___block_invoke_175(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v26 = v6;
    __int16 v27 = 2112;
    uint64_t v28 = v7;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@ Setting media account for home with identifier [%@]", buf, 0x16u);
  }
  uint64_t v8 = *(void **)(a1 + 32);
  id v9 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v10 = [v9 home];
  id v11 = [v10 uniqueIdentifier];
  v12 = [v11 UUIDString];
  id v13 = [v8 objectForKey:v12];

  [*(id *)(a1 + 40) setHomeMediaAccount:v13];
  v14 = [WeakRetained detailsItemManager];
  id v15 = (id)[v14 reloadAndUpdateAllItemsFromSenderSelector:*(void *)(a1 + 56)];

  id v16 = [WeakRetained tableView];
  uint64_t v17 = [v16 numberOfSections];

  if (v17 >= 1)
  {
    id v18 = [WeakRetained detailsItemManager];
    int v19 = [v18 diffableDataSourceDisabled];

    if (v19)
    {
      __int16 v20 = [WeakRetained tableView];
      __int16 v21 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
      [v20 reloadSections:v21 withRowAnimation:5];
    }
    else
    {
      __int16 v22 = [WeakRetained itemManager];
      __int16 v20 = [v22 itemSectionForSectionIndex:0];

      if (!v20)
      {
LABEL_9:

        goto LABEL_10;
      }
      __int16 v21 = [WeakRetained detailsItemManager];
      id v24 = v20;
      __int16 v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
      [v21 reloadUIRepresentationForSections:v23 withAnimation:0];
    }
    goto LABEL_9;
  }
LABEL_10:
  [v3 finishWithNoResult];
}

- (void)dealloc
{
  id v3 = [(HUServiceDetailsViewController *)self accountFuture];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)HUServiceDetailsViewController;
  [(HUServiceDetailsViewController *)&v4 dealloc];
}

- (void)viewWillDismiss
{
  id v2 = [(HUServiceDetailsViewController *)self detailsItemManager];
  [v2 tearDown];
}

- (NSString)description
{
  objc_opt_class();
  id v3 = [(HUServiceDetailsViewController *)self item];
  if (objc_opt_isKindOfClass()) {
    objc_super v4 = v3;
  }
  else {
    objc_super v4 = 0;
  }
  id v5 = v4;

  if ([v5 mediaAccessoryItemType] == 4)
  {
    id v6 = [MEMORY[0x1E4F7A0D0] builderWithObject:self];
    uint64_t v7 = NSString;
    uint64_t v8 = [v5 latestResults];
    id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    v10 = [v5 mediaProfileContainer];
    id v11 = [v7 stringWithFormat:@"%p '%@' %@'", v5, v9, v10];

    [v6 appendString:v11 withName:@"HFMediaAccessoryItem"];
    v12 = [v6 build];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)HUServiceDetailsViewController;
    v12 = [(HUItemTableViewController *)&v14 description];
  }

  return (NSString *)v12;
}

- (void)viewWillAppear:(BOOL)a3
{
  v35.receiver = self;
  v35.super_class = (Class)HUServiceDetailsViewController;
  [(HUItemTableViewController *)&v35 viewWillAppear:a3];
  uint64_t v4 = [(HUServiceDetailsViewController *)self item];
  if (!v4) {
    goto LABEL_14;
  }
  id v5 = (void *)v4;
  id v6 = [(HUServiceDetailsViewController *)self item];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_14;
  }
  uint64_t v8 = objc_opt_class();
  id v9 = [(HUServiceDetailsViewController *)self item];
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
    id v11 = v9;
    if (v10) {
      goto LABEL_10;
    }
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    id v13 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v12 handleFailureInFunction:v13, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v8, objc_opt_class() file lineNumber description];
  }
  id v11 = 0;
LABEL_10:

  if (v11)
  {
    objc_super v14 = [(HUServiceDetailsViewController *)self detailsItemManager];
    int v15 = [v14 shouldShowDeviceOptionsForAccessoryItem:v11];

    if (v15)
    {
      id v16 = [(HUServiceDetailsViewController *)self detailsItemManager];
      [v16 registerKVO];
    }
  }

LABEL_14:
  [(HUServiceDetailsViewController *)self checkForAccessoriesNeedingReprovisioning];
  uint64_t v17 = [(HUServiceDetailsViewController *)self navigationController];
  id v18 = [v17 viewControllers];
  uint64_t v19 = [v18 count];

  if (v19 == 1)
  {
    __int16 v20 = [MEMORY[0x1E4F427E0] buttonWithType:7];
    [(HUServiceDetailsViewController *)self setCloseButton:v20];

    __int16 v21 = [(HUServiceDetailsViewController *)self closeButton];
    [v21 setAccessibilityIdentifier:@"AccessoryDetails.Close"];

    __int16 v22 = [(HUServiceDetailsViewController *)self closeButton];
    [v22 addTarget:self action:sel__closeButtonPressed_ forControlEvents:64];

    id v23 = objc_alloc(MEMORY[0x1E4F427C0]);
    id v24 = [(HUServiceDetailsViewController *)self closeButton];
    uint64_t v25 = (void *)[v23 initWithCustomView:v24];
    v26 = [(HUServiceDetailsViewController *)self navigationItem];
    [v26 setRightBarButtonItem:v25];

    __int16 v27 = [(HUServiceDetailsViewController *)self parentViewController];
    uint64_t v28 = [v27 navigationItem];
    uint64_t v29 = [v28 titleView];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(HUServiceDetailsViewController *)self setNavigationBarTitleView:v29];
    }
    v30 = [(HUServiceDetailsViewController *)self navigationBarTitleView];
    v31 = [(HUServiceDetailsViewController *)self navigationItem];
    [v31 setTitleView:v30];

    v32 = [MEMORY[0x1E4F428B8] clearColor];
    v33 = [(HUServiceDetailsViewController *)self navigationBarTitleView];
    [v33 setBackgroundColor:v32];

    v34 = [(HUServiceDetailsViewController *)self navigationController];
    [v34 setDelegate:self];
  }
  [(HUServiceDetailsViewController *)self _updateControlStatusText];
  [(HUServiceDetailsViewController *)self _updateIconDescriptorAnimated:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)HUServiceDetailsViewController;
  [(HUItemTableViewController *)&v7 viewDidAppear:a3];
  [(HUServiceDetailsViewController *)self setShouldTrackProgrammableSwitchActivations:1];
  uint64_t v4 = (void *)MEMORY[0x1E4F68EE0];
  uint64_t v8 = *MEMORY[0x1E4F68050];
  id v5 = [(HUServiceDetailsViewController *)self item];
  v9[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v4 sendEvent:33 withData:v6];

  [(HUServiceDetailsViewController *)self _executeSilentSoftwareUpdateCheck];
  [(HUServiceDetailsViewController *)self _fetchAccessoryDiagnosticInfo];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v21.receiver = self;
  v21.super_class = (Class)HUServiceDetailsViewController;
  [(HUItemTableViewController *)&v21 viewWillDisappear:a3];
  uint64_t v4 = [(HUServiceDetailsViewController *)self item];
  if (!v4) {
    goto LABEL_14;
  }
  id v5 = (void *)v4;
  id v6 = [(HUServiceDetailsViewController *)self item];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_14;
  }
  uint64_t v8 = objc_opt_class();
  id v9 = [(HUServiceDetailsViewController *)self item];
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
    id v11 = v9;
    if (v10) {
      goto LABEL_10;
    }
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    id v13 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v12 handleFailureInFunction:v13, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v8, objc_opt_class() file lineNumber description];
  }
  id v11 = 0;
LABEL_10:

  if (v11)
  {
    objc_super v14 = [(HUServiceDetailsViewController *)self detailsItemManager];
    int v15 = [v14 shouldShowDeviceOptionsForAccessoryItem:v11];

    if (v15)
    {
      id v16 = [(HUServiceDetailsViewController *)self detailsItemManager];
      [v16 unregisterKVO];
    }
  }

LABEL_14:
  if ([(HUServiceDetailsViewController *)self isMovingFromParentViewController])
  {
    uint64_t v17 = [(HUServiceDetailsViewController *)self navigationController];
    id v18 = [v17 viewControllers];
    unint64_t v19 = [v18 count];

    if (v19 >= 2) {
      id v20 = [(HUServiceDetailsViewController *)self _commitBuilder];
    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HUServiceDetailsViewController;
  [(HUItemTableViewController *)&v5 viewDidDisappear:a3];
  [(HUServiceDetailsViewController *)self setShouldTrackProgrammableSwitchActivations:0];
  uint64_t v4 = [(HUServiceDetailsViewController *)self nameItemModuleController];
  [v4 cancelNameEdit];
}

- (void)setShouldIncludeRoomNameInHeaderTitle:(BOOL)a3
{
  if (self->_shouldIncludeRoomNameInHeaderTitle != a3)
  {
    self->_shouldIncludeRoomNameInHeaderTitle = a3;
    [(HUServiceDetailsViewController *)self _updateControlStatusText];
  }
}

- (void)commitChanges
{
  id v3 = [(HUServiceDetailsViewController *)self detailsItemManager];
  uint64_t v4 = [v3 nameModule];
  objc_super v5 = [v4 nameAndIconItem];
  id v9 = [(HUItemTableViewController *)self textFieldForVisibleItem:v5];

  if (![v9 isEditing]
    || ([v9 endEditing:1], objc_msgSend(MEMORY[0x1E4F69758], "isAMac")))
  {
    id v6 = [(HUServiceDetailsViewController *)self _commitBuilder];
    objc_super v7 = [(HUServiceDetailsViewController *)self presentationDelegate];
    id v8 = (id)[v7 finishPresentation:self animated:1];
  }
}

- (id)_commitBuilderFor:(id)a3 with:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    NSLog(&cfstr_BuilderForItem.isa, v6);
  }
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v24 = v6;
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "User committing builder for %@, builder: %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  id v9 = [v7 commitItem];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __57__HUServiceDetailsViewController__commitBuilderFor_with___block_invoke;
  v20[3] = &unk_1E63897B0;
  objc_copyWeak(&v22, (id *)buf);
  id v10 = v7;
  id v21 = v10;
  id v11 = [v9 recover:v20];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  id v18[2] = __57__HUServiceDetailsViewController__commitBuilderFor_with___block_invoke_2;
  v18[3] = &unk_1E6386FB8;
  objc_copyWeak(&v19, (id *)buf);
  id v12 = (id)[v11 addFailureBlock:v18];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57__HUServiceDetailsViewController__commitBuilderFor_with___block_invoke_3;
  v16[3] = &unk_1E6387DC8;
  id v13 = v6;
  id v17 = v13;
  id v14 = (id)[v11 addSuccessBlock:v16];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);

  return v11;
}

id __57__HUServiceDetailsViewController__commitBuilderFor_with___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [WeakRetained _recoverItemBuilder:*(void *)(a1 + 32) fromError:v4];

  return v6;
}

void __57__HUServiceDetailsViewController__commitBuilderFor_with___block_invoke_2(uint64_t a1, void *a2)
{
  id v15 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = objc_msgSend(v15, "hf_isHomeKitNamingError");
  objc_super v5 = [MEMORY[0x1E4F69110] sharedHandler];
  if (v4)
  {
    int v6 = [WeakRetained isItemGroup];
    id v7 = (uint64_t *)MEMORY[0x1E4F687B0];
    if (!v6) {
      id v7 = (uint64_t *)MEMORY[0x1E4F687B8];
    }
    uint64_t v8 = *v7;
    id v9 = [v15 userInfo];
    id v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F68440]];
    [v5 handleError:v15 operationType:v8 options:v10 retryBlock:0 cancelBlock:0];
  }
  else
  {
    id v11 = NSString;
    int v12 = [WeakRetained isItemGroup];
    id v13 = (uint64_t *)MEMORY[0x1E4F687B0];
    if (!v12) {
      id v13 = (uint64_t *)MEMORY[0x1E4F687B8];
    }
    uint64_t v14 = *v13;
    id v9 = [MEMORY[0x1E4F69110] descriptionLocalizationKeyForError:v15];
    id v10 = [v11 stringWithFormat:@"HFErrorHandler: [Ignore] Operation: %@ encountered error: %@", v14, v9];
    [v5 logError:v15 operationDescription:v10];
  }
}

void __57__HUServiceDetailsViewController__commitBuilderFor_with___block_invoke_3(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v4 = *MEMORY[0x1E4F68720];
  v5[0] = MEMORY[0x1E4F1CC38];
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  id v3 = (id)[v1 updateWithOptions:v2];
}

- (id)_commitBuilder
{
  id v3 = [(HUServiceDetailsViewController *)self navigationItem];
  uint64_t v4 = [v3 rightBarButtonItem];
  [v4 setEnabled:0];

  objc_super v5 = [(HUServiceDetailsViewController *)self detailsItemManager];
  int v6 = [v5 sourceItem];

  id v7 = [(HUServiceDetailsViewController *)self detailsItemManager];
  uint64_t v8 = [v7 serviceLikeBuilder];

  objc_initWeak(&location, self);
  id v9 = [(HUServiceDetailsViewController *)self nameItemModuleController];
  id v10 = [v9 prepareForCommit];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __48__HUServiceDetailsViewController__commitBuilder__block_invoke;
  v20[3] = &unk_1E63850B8;
  void v20[4] = self;
  id v11 = (id)[v10 addCompletionBlock:v20];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __48__HUServiceDetailsViewController__commitBuilder__block_invoke_2;
  v16[3] = &unk_1E638C7B8;
  objc_copyWeak(&v19, &location);
  id v12 = v6;
  id v17 = v12;
  id v13 = v8;
  id v18 = v13;
  uint64_t v14 = [v10 flatMap:v16];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v14;
}

void __48__HUServiceDetailsViewController__commitBuilder__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationItem];
  uint64_t v1 = [v2 rightBarButtonItem];
  [v1 setEnabled:1];
}

id __48__HUServiceDetailsViewController__commitBuilder__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained _commitBuilderFor:*(void *)(a1 + 32) with:*(void *)(a1 + 40)];

  return v3;
}

- (id)_removeFromGroup
{
  return (id)[MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

- (id)_removeItem
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  uint64_t v4 = [(HUServiceDetailsViewController *)self detailsItemManager];
  objc_super v5 = [v4 serviceLikeBuilder];

  if (v5)
  {
    objc_opt_class();
    int v6 = [(HUServiceDetailsViewController *)self detailsItemManager];
    id v7 = [v6 sourceItem];
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = v8;

    if ([v9 isHomePodMediaSystem])
    {
      [(HUServiceDetailsViewController *)self setRequiresPresentingViewControllerDismissal:1];
      id v10 = [(HUServiceDetailsViewController *)self presentationDelegate];
      id v11 = [v10 finishPresentation:self animated:1];
    }
    else
    {
      id v11 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
    }
    uint64_t v14 = [(HUServiceDetailsViewController *)self navigationItem];
    id v15 = [v14 rightBarButtonItem];
    [v15 setEnabled:0];

    id v16 = HFLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [(HUServiceDetailsViewController *)self detailsItemManager];
      id v18 = [v17 sourceItem];
      *(_DWORD *)buf = 138412546;
      id v37 = v18;
      __int16 v38 = 2112;
      int v39 = v5;
      _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "Preparing to remove item '%@' using builder '%@'", buf, 0x16u);
    }
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __45__HUServiceDetailsViewController__removeItem__block_invoke;
    v32[3] = &unk_1E638C7E0;
    id v19 = v5;
    id v33 = v19;
    objc_copyWeak(&v34, &location);
    id v20 = (id)[v11 flatMap:v32];
    if (!v11)
    {
      __int16 v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2, self, @"HUServiceDetailsViewController.m", 595, @"Invalid parameter not satisfying: %@", @"removalFuture" object file lineNumber description];
    }
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __45__HUServiceDetailsViewController__removeItem__block_invoke_3;
    v30[3] = &unk_1E63867B0;
    objc_copyWeak(&v31, &location);
    id v21 = (id)[v11 addCompletionBlock:v30];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __45__HUServiceDetailsViewController__removeItem__block_invoke_4;
    v27[3] = &unk_1E6386E70;
    objc_copyWeak(&v29, &location);
    id v28 = v19;
    id v22 = (id)[v11 addFailureBlock:v27];
    if ([v9 supportsDirectObliteration])
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __45__HUServiceDetailsViewController__removeItem__block_invoke_2_240;
      v26[3] = &unk_1E6387DC8;
      v26[4] = self;
      id v23 = (id)[v11 addSuccessBlock:v26];
    }

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v34);
  }
  else
  {
    id v12 = [(HUServiceDetailsViewController *)self detailsItemManager];
    id v13 = [v12 sourceItem];
    NSLog(&cfstr_BuilderForItem_0.isa, v13);

    id v11 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  objc_destroyWeak(&location);

  return v11;
}

id __45__HUServiceDetailsViewController__removeItem__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) removeItemFromHome];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__HUServiceDetailsViewController__removeItem__block_invoke_2;
  v7[3] = &unk_1E63897B0;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  id v8 = *(id *)(a1 + 32);
  objc_super v5 = [v4 recover:v7];

  objc_destroyWeak(&v9);

  return v5;
}

id __45__HUServiceDetailsViewController__removeItem__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  int v6 = [WeakRetained _recoverItemBuilder:*(void *)(a1 + 32) fromError:v4];

  return v6;
}

void __45__HUServiceDetailsViewController__removeItem__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained navigationItem];
  id v2 = [v1 rightBarButtonItem];
  [v2 setEnabled:1];
}

void __45__HUServiceDetailsViewController__removeItem__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v7 = [WeakRetained detailsItemManager];
    id v8 = [v7 sourceItem];
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    id v13 = v8;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "Failed to remove item '%@' using builder '%@': %@", buf, 0x20u);
  }
  objc_super v5 = [MEMORY[0x1E4F69110] sharedHandler];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__HUServiceDetailsViewController__removeItem__block_invoke_239;
  v10[3] = &unk_1E63862A0;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  [v5 handleError:v3 retryBlock:v10 cancelBlock:0];

  objc_destroyWeak(&v11);
}

void __45__HUServiceDetailsViewController__removeItem__block_invoke_239(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = (id)[WeakRetained _removeItem];
}

void __45__HUServiceDetailsViewController__removeItem__block_invoke_2_240(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) detailsItemManager];
  [v1 resetAccessory];
}

- (void)_restartHomePod
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v5 = NSStringFromSelector(a2);
    int v7 = 138412546;
    id v8 = self;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped restart HomePod", (uint8_t *)&v7, 0x16u);
  }
  int v6 = [(HUServiceDetailsViewController *)self detailsItemManager];
  [v6 restartAccessory];
}

- (void)_updateCheckedStateForAssociatedServiceTypeCell:(id)a3 item:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  int v7 = [(HUServiceDetailsViewController *)self detailsItemManager];
  if ([v7 showAssociatedServiceTypeList])
  {
    id v8 = [(HUServiceDetailsViewController *)self detailsItemManager];
    __int16 v9 = [v8 selectedAssociatedServiceTypeItem];
    objc_msgSend(v10, "setChecked:", objc_msgSend(v9, "isEqual:", v6));
  }
  else
  {
    [v10 setChecked:0];
  }
}

- (void)addRoomButtonPressed:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4F69478]);
  objc_super v5 = [(HUItemTableViewController *)self itemManager];
  id v6 = [v5 home];
  id v9 = (id)[v4 initWithExistingObject:0 inHome:v6];

  int v7 = [[HUEditRoomViewController alloc] initWithRoomBuilder:v9 presentationDelegate:self addRoomDelegate:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v7];
  [v8 setModalPresentationStyle:2];
  [(HUServiceDetailsViewController *)self presentViewController:v8 animated:1 completion:0];
}

- (HFServiceLikeItem)item
{
  id v2 = [(HUItemTableViewController *)self itemManager];
  id v3 = [v2 sourceItem];

  return (HFServiceLikeItem *)v3;
}

- (BOOL)automaticallyUpdatesViewControllerTitle
{
  return 0;
}

- (void)_updateControlStatusText
{
  id v3 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v20 = [v3 headerItem];

  id v4 = [v20 latestResults];

  if (!v4)
  {
    uint64_t v5 = [(HUServiceDetailsViewController *)self item];

    id v20 = (id)v5;
  }
  id v6 = [(HUServiceDetailsViewController *)self navigationBarTitleView];
  int v7 = [v6 summaryView];

  if (([MEMORY[0x1E4F69758] isProxHandOffV2Config] & 1) == 0)
  {
    id v8 = [v20 latestResults];
    id v9 = [(HUServiceDetailsViewController *)self _primaryStatusTextForLatestResults:v8 showingSecondaryStatus:1];
    [v7 setPrimaryText:v9];

    id v10 = [v20 latestResults];
    uint64_t v11 = [(HUServiceDetailsViewController *)self _secondaryStatusTextForLatestResults:v10];

    if (v11)
    {
      id v12 = v7;
      id v13 = v11;
LABEL_6:
      [v12 setSecondaryText:v13];
LABEL_11:

      goto LABEL_12;
    }
    __int16 v14 = [(HUServiceDetailsViewController *)self detailsItemManager];
    uint64_t v15 = [v14 sourceItemAccessory];
    __int16 v16 = objc_msgSend(v15, "hf_siriEndpointProfile");
    if (v16)
    {
    }
    else
    {
      id v17 = [(HUServiceDetailsViewController *)self detailsItemManager];
      int v18 = [v17 sourceItemIsHomePod];

      if (!v18)
      {
        id v12 = v7;
        id v13 = 0;
        goto LABEL_6;
      }
    }
    id v19 = [(HUServiceDetailsViewController *)self _microphoneStatus];
    [v7 setMicrophoneStatusText:v19];

    goto LABEL_11;
  }
LABEL_12:
}

- (void)_updateIconDescriptorAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v17 = [(HUServiceDetailsViewController *)self item];
  uint64_t v5 = [v17 latestResults];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F689E8]];

  if (([MEMORY[0x1E4F69758] shouldUseLegacyQuickControlPresentation] & 1) == 0)
  {
    id v9 = [[HUBaseIconViewConfiguration alloc] initWithItem:v17 appearance:3];
    id v10 = [(HUServiceDetailsViewController *)self navigationBarTitleView];
    uint64_t v11 = [v10 summaryView];
    id v12 = [v11 baseIconView];
    [v12 setConfiguration:v9];

    goto LABEL_12;
  }
  int v7 = [v17 latestResults];
  uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F68C20]];
  if (v8)
  {
    id v9 = (HUBaseIconViewConfiguration *)v8;
  }
  else
  {
    id v13 = [v17 latestResults];
    id v9 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F68BC0]];

    if (!v9) {
      goto LABEL_7;
    }
  }
  if ([(HUBaseIconViewConfiguration *)v9 integerValue] != 2)
  {
    if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials]) {
      uint64_t v14 = 2;
    }
    else {
      uint64_t v14 = 3;
    }
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v14 = 1;
LABEL_11:
  uint64_t v15 = [(HUServiceDetailsViewController *)self navigationBarTitleView];
  __int16 v16 = [v15 summaryView];
  id v10 = [v16 iconView];

  [v10 updateWithIconDescriptor:v6 displayStyle:v14 animated:v3];
LABEL_12:
}

- (id)_primaryStatusTextForLatestResults:(id)a3 showingSecondaryStatus:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315650;
    int v18 = "-[HUServiceDetailsViewController _primaryStatusTextForLatestResults:showingSecondaryStatus:]";
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 1024;
    BOOL v22 = v4;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_INFO, "%s %@ %d", (uint8_t *)&v17, 0x1Cu);
  }

  if (v4
    || ([v6 objectForKeyedSubscript:*MEMORY[0x1E4F689A0]],
        (uint64_t v15 = objc_claimAutoreleasedReturnValue()) == 0)
    && ([v6 objectForKeyedSubscript:*MEMORY[0x1E4F689C8]],
        (uint64_t v15 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v8 = *MEMORY[0x1E4F68A60];
    id v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68A60]];
    id v10 = [v9 serviceName];
    uint64_t v11 = [v10 length];

    if (!v11)
    {
      id v12 = [(HUServiceDetailsViewController *)self item];
      id v13 = [v12 latestResults];
      uint64_t v14 = [v13 objectForKeyedSubscript:v8];

      id v9 = (void *)v14;
    }
    if ([(HUServiceDetailsViewController *)self shouldIncludeRoomNameInHeaderTitle])
    {
      [v9 composedString];
    }
    else
    {
      [v9 serviceName];
    uint64_t v15 = };

    if (!v15)
    {
      uint64_t v15 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68948]];
      if (!v15)
      {
        uint64_t v15 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];
      }
    }
  }

  return v15;
}

- (id)_secondaryStatusTextForLatestResults:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F689A0]];
  if (!v4)
  {
    BOOL v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68998]];
    if (!v4)
    {
      BOOL v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68948]];
      if (!v4)
      {
        BOOL v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];
      }
    }
  }

  return v4;
}

- (id)_microphoneStatus
{
  id v3 = objc_opt_new();
  BOOL v4 = [(HUServiceDetailsViewController *)self detailsItemManager];
  uint64_t v5 = [v4 sourceItemAccessory];
  id v6 = [v5 mediaProfile];
  int v7 = objc_msgSend(v6, "hf_mediaAccessoryCommonSettingsManager");

  uint64_t v8 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v9 = [v8 sourceItemAccessory];
  id v10 = objc_msgSend(v9, "hf_siriEndpointProfile");
  int v11 = [v10 manuallyDisabled];

  id v12 = [v7 settingValueForKeyPath:*MEMORY[0x1E4F68038]];
  int v13 = [v12 BOOLValue];

  uint64_t v14 = [(HUServiceDetailsViewController *)self view];
  uint64_t v15 = [v14 effectiveUserInterfaceLayoutDirection];

  __int16 v16 = [(HUServiceDetailsViewController *)self detailsItemManager];
  int v17 = [v16 sourceItemIsHomePod];

  if (v17)
  {
    objc_opt_class();
    int v18 = [(HUServiceDetailsViewController *)self detailsItemManager];
    __int16 v19 = [v18 sourceItem];
    if (objc_opt_isKindOfClass()) {
      id v20 = v19;
    }
    else {
      id v20 = 0;
    }
    id v21 = v20;

    int v22 = [v21 isSiriDisabled];
    int v13 = v22 ^ 1;
  }
  if ((v11 | v13 ^ 1) == 1)
  {
    if (v11)
    {
      uint64_t v23 = _HULocalizedStringWithDefaultValue(@"HUSiriEndpoint_MicrophoneOff", @"HUSiriEndpoint_MicrophoneOff", 1);
    }
    else
    {
      id v24 = [(HUItemTableViewController *)self itemManager];
      __int16 v25 = [v24 home];
      id v26 = HULocalizedSiriTriggerPhrase(v25);
      uint64_t v23 = HULocalizedStringWithFormat(@"HUSiriEndpoint_HeySiriTurnedOff", @"%@", v27, v28, v29, v30, v31, v32, (uint64_t)v26);
    }
    id v33 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v23];
    id v34 = objc_alloc(MEMORY[0x1E4F28B18]);
    objc_super v35 = objc_msgSend(NSString, "stringWithFormat:", @"%1s", "");
    v36 = (void *)[v34 initWithString:v35];

    id v37 = (void *)MEMORY[0x1E4F42A80];
    __int16 v38 = [MEMORY[0x1E4F428B8] systemGrayColor];
    int v39 = objc_msgSend(v37, "hu_mutedMicrophoneImageWithTintColor:", v38);

    uint64_t v40 = objc_opt_new();
    [v40 setImage:v39];
    uint64_t v41 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v40];
    v42 = (void *)v41;
    if (v15 == 1) {
      v43 = v33;
    }
    else {
      v43 = (void *)v41;
    }
    if (v15 == 1) {
      v44 = (void *)v41;
    }
    else {
      v44 = v33;
    }
    [v3 appendAttributedString:v43];
    [v3 appendAttributedString:v36];
    [v3 appendAttributedString:v44];
  }

  return v3;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v5 = a3;
  id v6 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v7 = [v6 nameModule];

  if (v7 == v5)
  {
    int v18 = [[HUNameItemModuleController alloc] initWithModule:v5 host:self];
    [(HUServiceDetailsViewController *)self setNameItemModuleController:v18];

    __int16 v19 = [(HUServiceDetailsViewController *)self nameItemModuleController];
    [v19 setNameFieldHasClearButton:1];

    id v20 = [(HUItemTableViewController *)self itemManager];
    id v21 = [v20 home];
    uint64_t v22 = objc_msgSend(v21, "hf_currentUserIsRestrictedGuest") ^ 1;
    uint64_t v23 = [(HUServiceDetailsViewController *)self nameItemModuleController];
    [v23 setNameFieldHasClearButton:v22];

    uint64_t v24 = [(HUServiceDetailsViewController *)self nameItemModuleController];
  }
  else
  {
    uint64_t v8 = [(HUServiceDetailsViewController *)self detailsItemManager];
    id v9 = [v8 accessoryRepresentableItemModule];

    if (v9 == v5)
    {
      uint64_t v24 = [(HUServiceDetailsViewController *)self createAccessoryDetailInfoListModuleControllerWith:v5];
    }
    else
    {
      id v10 = [(HUServiceDetailsViewController *)self detailsItemManager];
      id v11 = [v10 sceneAndTriggerModule];

      if (v11 == v5)
      {
        __int16 v25 = [(HUItemModuleController *)[HUAssociatedSceneAndTriggerModuleController alloc] initWithModule:v5];
        [(HUServiceDetailsViewController *)self setSceneAndTriggerModuleController:v25];

        uint64_t v24 = [(HUServiceDetailsViewController *)self sceneAndTriggerModuleController];
      }
      else
      {
        id v12 = [(HUServiceDetailsViewController *)self detailsItemManager];
        id v13 = [v12 relatedTriggerItemModule];

        if (v13 == v5)
        {
          id v26 = [(HUServiceDetailsViewController *)self associatedTriggerModuleController];
          uint64_t v27 = [[HUAvailableRelatedTriggerItemModuleController alloc] initWithModule:v5];
          [(HUServiceDetailsViewController *)self setAssociatedTriggerModuleController:v27];

          uint64_t v28 = [(HUServiceDetailsViewController *)self associatedTriggerModuleController];
          [v28 setHost:self];

          uint64_t v29 = [(HUServiceDetailsViewController *)self associatedTriggerModuleController];
          [v26 updatePresentedViewControllerForNewModuleController:v29];

          int v17 = [(HUServiceDetailsViewController *)self associatedTriggerModuleController];

          goto LABEL_13;
        }
        uint64_t v14 = [(HUServiceDetailsViewController *)self detailsItemManager];
        id v15 = [v14 connectedServicesItemModule];

        if (v15 != v5)
        {
          __int16 v16 = [MEMORY[0x1E4F28B00] currentHandler];
          [v16 handleFailureInMethod:a2, self, @"HUServiceDetailsViewController.m", 845, @"Unexpected module %@", v5 object file lineNumber description];

          int v17 = 0;
          goto LABEL_13;
        }
        uint64_t v30 = [(HUItemModuleController *)[HUMatterConnectedServicesItemModuleController alloc] initWithModule:v5];
        [(HUServiceDetailsViewController *)self setConnectedServicesItemModuleController:v30];

        uint64_t v24 = [(HUServiceDetailsViewController *)self connectedServicesItemModuleController];
      }
    }
  }
  int v17 = (void *)v24;
LABEL_13:

  return v17;
}

- (id)itemModuleControllers
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v3 = (HUHomeKitAccessorySettingsItemModuleController *)objc_opt_new();
  v86.receiver = self;
  v86.super_class = (Class)HUServiceDetailsViewController;
  BOOL v4 = [(HUItemTableViewController *)&v86 itemModuleControllers];
  [(HUHomeKitAccessorySettingsItemModuleController *)v3 unionSet:v4];

  id v5 = [(HUServiceDetailsViewController *)self associatedTriggerModuleController];
  if (!v5)
  {
    id v6 = [(HUServiceDetailsViewController *)self detailsItemManager];
    id v7 = [v6 relatedTriggerItemModule];

    if (!v7) {
      goto LABEL_5;
    }
    uint64_t v8 = [HUAvailableRelatedTriggerItemModuleController alloc];
    id v9 = [(HUServiceDetailsViewController *)self detailsItemManager];
    id v10 = [v9 relatedTriggerItemModule];
    id v11 = [(HUAvailableRelatedTriggerItemModuleController *)v8 initWithModule:v10];
    [(HUServiceDetailsViewController *)self setAssociatedTriggerModuleController:v11];

    id v5 = [(HUServiceDetailsViewController *)self associatedTriggerModuleController];
    [v5 setHost:self];
  }

LABEL_5:
  id v12 = [(HUServiceDetailsViewController *)self associatedTriggerModuleController];
  [(HUHomeKitAccessorySettingsItemModuleController *)v3 na_safeAddObject:v12];

  id v13 = [(HUServiceDetailsViewController *)self accessorySettingsItemModuleController];
  if (!v13)
  {
    uint64_t v14 = [(HUServiceDetailsViewController *)self detailsItemManager];
    id v15 = [v14 accessorySettingsItemModule];

    if (!v15) {
      goto LABEL_9;
    }
    __int16 v16 = [HUAccessorySettingsItemModuleController alloc];
    id v13 = [(HUServiceDetailsViewController *)self detailsItemManager];
    int v17 = [v13 accessorySettingsItemModule];
    int v18 = [(HUAccessorySettingsItemModuleController *)v16 initWithModule:v17 delegate:self];
    [(HUServiceDetailsViewController *)self setAccessorySettingsItemModuleController:v18];
  }
LABEL_9:
  __int16 v19 = [(HUServiceDetailsViewController *)self accessorySettingsItemModuleController];
  [(HUHomeKitAccessorySettingsItemModuleController *)v3 na_safeAddObject:v19];

  id v20 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v21 = [v20 homeKitAccessorySettingsModules];

  if (v21)
  {
    v81 = v3;
    uint64_t v22 = HFLogForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      id v79 = [(HUServiceDetailsViewController *)self detailsItemManager];
      v80 = [v79 homeKitAccessorySettingsModules];
      *(_DWORD *)buf = 138412290;
      v88 = v80;
      _os_log_debug_impl(&dword_1BE345000, v22, OS_LOG_TYPE_DEBUG, "Creating Item Module Controllers from  homeKitAccessorySettingsModules = [%@]", buf, 0xCu);
    }
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    uint64_t v23 = [(HUServiceDetailsViewController *)self detailsItemManager];
    uint64_t v24 = [v23 homeKitAccessorySettingsModules];

    uint64_t v25 = [v24 countByEnumeratingWithState:&v82 objects:v91 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v83;
      do
      {
        uint64_t v28 = 0;
        do
        {
          if (*(void *)v83 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void **)(*((void *)&v82 + 1) + 8 * v28);
          objc_opt_class();
          id v30 = v29;
          if (objc_opt_isKindOfClass()) {
            uint64_t v31 = v30;
          }
          else {
            uint64_t v31 = 0;
          }
          id v32 = v31;

          if (v32)
          {
            id v33 = [(HUServiceDetailsViewController *)self moduleToModuleControllerMap];
            id v34 = [v33 objectForKey:v32];

            if (!v34)
            {
              objc_super v35 = [[HUHomeKitAccessorySettingsItemModuleController alloc] initWithModule:v32 delegate:self];
              v36 = [(HUServiceDetailsViewController *)self moduleToModuleControllerMap];

              if (!v36)
              {
                id v37 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
                [(HUServiceDetailsViewController *)self setModuleToModuleControllerMap:v37];
              }
              __int16 v38 = HFLogForCategory();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                v88 = v35;
                __int16 v89 = 2112;
                id v90 = v32;
                _os_log_debug_impl(&dword_1BE345000, v38, OS_LOG_TYPE_DEBUG, "Setting moduleController = [%@] for Module = [%@] in moduleToModuleControllerMap", buf, 0x16u);
              }

              int v39 = [(HUServiceDetailsViewController *)self moduleToModuleControllerMap];
              [v39 setObject:v35 forKey:v32];
            }
          }

          ++v28;
        }
        while (v26 != v28);
        uint64_t v26 = [v24 countByEnumeratingWithState:&v82 objects:v91 count:16];
      }
      while (v26);
    }

    uint64_t v40 = [(HUServiceDetailsViewController *)self moduleToModuleControllerMap];
    uint64_t v41 = [v40 objectEnumerator];

    uint64_t v42 = [v41 nextObject];
    id v3 = v81;
    if (v42)
    {
      v43 = (void *)v42;
      do
      {
        [(HUHomeKitAccessorySettingsItemModuleController *)v81 na_safeAddObject:v43];
        uint64_t v44 = [v41 nextObject];

        v43 = (void *)v44;
      }
      while (v44);
    }
  }
  uint64_t v45 = HFLogForCategory();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v88 = v3;
    _os_log_debug_impl(&dword_1BE345000, v45, OS_LOG_TYPE_DEBUG, "itemModuleControllers = [%@]", buf, 0xCu);
  }

  v46 = [(HUServiceDetailsViewController *)self softwareUpdateItemModuleController];
  if (v46) {
    goto LABEL_38;
  }
  v47 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v48 = [v47 softwareUpdateItemModule];

  if (v48)
  {
    v49 = [HUSoftwareUpdateItemModuleController alloc];
    v46 = [(HUServiceDetailsViewController *)self detailsItemManager];
    v50 = [v46 softwareUpdateItemModule];
    v51 = [(HUSoftwareUpdateItemModuleController *)v49 initWithModule:v50 delegate:self expandableTextViewCellDelegate:self];
    [(HUServiceDetailsViewController *)self setSoftwareUpdateItemModuleController:v51];

LABEL_38:
  }
  v52 = [(HUServiceDetailsViewController *)self softwareUpdateItemModuleController];
  [(HUHomeKitAccessorySettingsItemModuleController *)v3 na_safeAddObject:v52];

  v53 = [(HUServiceDetailsViewController *)self detailsItemManager];
  v54 = [v53 valveEditorItemModule];

  if (v54)
  {
    uint64_t v55 = [(HUServiceDetailsViewController *)self valveEditorItemModuleController];

    if (!v55)
    {
      v56 = [[HUChildServiceItemModuleController alloc] initWithModule:v54 delegate:self];
      [(HUServiceDetailsViewController *)self setValveEditorItemModuleController:v56];
    }
  }
  uint64_t v57 = [(HUServiceDetailsViewController *)self valveEditorItemModuleController];
  [(HUHomeKitAccessorySettingsItemModuleController *)v3 na_safeAddObject:v57];

  v58 = [(HUServiceDetailsViewController *)self detailsItemManager];
  v59 = [v58 accessoryServicesEditorItemModule];

  if (v59)
  {
    v60 = [(HUServiceDetailsViewController *)self accessoryServicesEditorItemModuleController];
    if (!v60)
    {
      if (![(HUServiceDetailsViewController *)self isMultiServiceAccessory]) {
        goto LABEL_47;
      }
      v60 = [[HUChildServiceItemModuleController alloc] initWithModule:v59 delegate:self];
      [(HUServiceDetailsViewController *)self setAccessoryServicesEditorItemModuleController:v60];
    }
  }
LABEL_47:
  v61 = [(HUServiceDetailsViewController *)self accessoryServicesEditorItemModuleController];
  [(HUHomeKitAccessorySettingsItemModuleController *)v3 na_safeAddObject:v61];

  uint64_t v62 = [(HUServiceDetailsViewController *)self televisionSettingsItemModuleController];
  if (v62)
  {
LABEL_50:

    goto LABEL_51;
  }
  v63 = [(HUServiceDetailsViewController *)self detailsItemManager];
  v64 = [v63 televisionSettingsItemModule];

  if (v64)
  {
    v65 = [HUTelevisionSettingsItemModuleController alloc];
    uint64_t v62 = [(HUServiceDetailsViewController *)self detailsItemManager];
    v66 = [v62 televisionSettingsItemModule];
    v67 = [(HUItemModuleController *)v65 initWithModule:v66];
    [(HUServiceDetailsViewController *)self setTelevisionSettingsItemModuleController:v67];

    goto LABEL_50;
  }
LABEL_51:
  v68 = [(HUServiceDetailsViewController *)self televisionSettingsItemModuleController];
  [(HUHomeKitAccessorySettingsItemModuleController *)v3 na_safeAddObject:v68];

  v69 = [(HUServiceDetailsViewController *)self detailsItemManager];
  v70 = [v69 inputSourceItemModule];

  if (v70)
  {
    uint64_t v71 = [(HUServiceDetailsViewController *)self inputSourceItemModuleController];
    if (!v71) {
      goto LABEL_54;
    }
    v72 = (void *)v71;
    v73 = [(HUServiceDetailsViewController *)self inputSourceItemModuleController];
    v74 = [v73 module];
    char v75 = [v74 isEqual:v70];

    if ((v75 & 1) == 0)
    {
LABEL_54:
      v76 = [[HUChildServiceItemModuleController alloc] initWithModule:v70 delegate:self];
      [(HUServiceDetailsViewController *)self setInputSourceItemModuleController:v76];
    }
  }
  v77 = [(HUServiceDetailsViewController *)self inputSourceItemModuleController];
  [(HUHomeKitAccessorySettingsItemModuleController *)v3 na_safeAddObject:v77];

  return v3;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_8;
  }
  id v6 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v7 = [v6 headerItem];
  int v8 = [v5 isEqual:v7];

  if (v8) {
    goto LABEL_8;
  }
  id v9 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v10 = [v9 splitMediaAccountTitleItem];
  int v11 = [v5 isEqual:v10];

  if (v11) {
    goto LABEL_8;
  }
  id v12 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v13 = [v12 splitMediaAccountUseDefaultAccountItem];
  if ([v5 isEqual:v13]) {
    goto LABEL_6;
  }
  uint64_t v14 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v15 = [v14 splitMediaAccountSignoutAccountItem];
  int v16 = [v5 isEqual:v15];

  if (v16) {
    goto LABEL_8;
  }
  id v12 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v13 = [v12 favoriteItem];
  if ([v5 isEqual:v13])
  {
LABEL_6:

LABEL_8:
    int v17 = objc_opt_class();
    goto LABEL_9;
  }
  __int16 v19 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v20 = [v19 showInHomeDashboardItem];
  int v21 = [v5 isEqual:v20];

  if (v21) {
    goto LABEL_8;
  }
  uint64_t v22 = [(HUServiceDetailsViewController *)self detailsItemManager];
  uint64_t v23 = [v22 pairingModeItem];
  int v24 = [v5 isEqual:v23];

  if (v24) {
    goto LABEL_8;
  }
  uint64_t v25 = [(HUServiceDetailsViewController *)self detailsItemManager];
  uint64_t v26 = [v25 exportDiagnosticsItem];
  int v27 = [v5 isEqual:v26];

  if (v27) {
    goto LABEL_8;
  }
  uint64_t v28 = [(HUServiceDetailsViewController *)self detailsItemManager];
  uint64_t v29 = [v28 removeFromGroupItem];
  int v30 = [v5 isEqual:v29];

  if (v30) {
    goto LABEL_8;
  }
  uint64_t v31 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v32 = [v31 removeItem];
  int v33 = [v5 isEqual:v32];

  if (v33) {
    goto LABEL_8;
  }
  id v34 = [(HUServiceDetailsViewController *)self detailsItemManager];
  objc_super v35 = [v34 resetItem];
  int v36 = [v5 isEqual:v35];

  if (v36) {
    goto LABEL_8;
  }
  id v37 = [(HUServiceDetailsViewController *)self detailsItemManager];
  __int16 v38 = [v37 restartItem];
  int v39 = [v5 isEqual:v38];

  if (v39) {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v41 = [(HUServiceDetailsViewController *)self detailsItemManager];
    int v42 = [v41 isCharacteristicStateItem:v5];

    if (v42) {
      goto LABEL_8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_8;
    }
    id v12 = [(HUServiceDetailsViewController *)self detailsItemManager];
    id v13 = [v12 addGroupItem];
    if ([v5 isEqual:v13]) {
      goto LABEL_6;
    }
    v43 = [(HUServiceDetailsViewController *)self detailsItemManager];
    uint64_t v44 = [v43 createNewRoomItem];
    if ([v5 isEqual:v44]) {
      goto LABEL_41;
    }
    uint64_t v45 = [(HUServiceDetailsViewController *)self detailsItemManager];
    v46 = [v45 separateTileItem];
    if (([v5 isEqual:v46] & 1) == 0)
    {
      v64 = [(HUServiceDetailsViewController *)self detailsItemManager];
      v47 = [v64 collectDiagnosticsItem];
      if (([v5 isEqual:v47] & 1) == 0)
      {
        uint64_t v62 = [(HUServiceDetailsViewController *)self detailsItemManager];
        id v48 = [v62 identifyHomePodItem];
        char v63 = [v5 isEqual:v48];

        if (v63) {
          goto LABEL_8;
        }
        v49 = [(HUServiceDetailsViewController *)self detailsItemManager];
        v50 = [v49 roomItem];
        int v51 = [v5 isEqual:v50];

        if (v51)
        {
          [MEMORY[0x1E4F69758] useMacIdiom];
          goto LABEL_8;
        }
        v52 = [(HUServiceDetailsViewController *)self detailsItemManager];
        v53 = [v52 roomListItem];
        int v54 = [v5 isEqual:v53];

        if (v54) {
          goto LABEL_8;
        }
        id v12 = [(HUServiceDetailsViewController *)self detailsItemManager];
        id v13 = [v12 cameraStatusLightItem];
        if ([v5 isEqual:v13]) {
          goto LABEL_6;
        }
        v43 = [(HUServiceDetailsViewController *)self detailsItemManager];
        uint64_t v44 = [v43 cameraNightModeItem];
        if (([v5 isEqual:v44] & 1) == 0)
        {
          uint64_t v55 = [(HUServiceDetailsViewController *)self detailsItemManager];
          v56 = [v55 cameraDoorbellChimeMuteItem];
          char v57 = [v5 isEqual:v56];

          if ((v57 & 1) == 0)
          {
            v58 = [(HUServiceDetailsViewController *)self detailsItemManager];
            v59 = [v58 lockAddHomeKeyToWalletItem];
            int v60 = [v5 isEqual:v59];

            if (!v60)
            {
              v61 = [(HUServiceDetailsViewController *)self detailsItemManager];
              [v61 supportsWiFiStrengthDisplay:v5];
            }
          }
          goto LABEL_8;
        }
        goto LABEL_41;
      }
    }
LABEL_41:

    goto LABEL_6;
  }
  uint64_t v40 = [(HUServiceDetailsViewController *)self controlPanelController];
  int v17 = [v40 cellClassForItem:v5];

LABEL_9:

  return (Class)v17;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(HUServiceDetailsViewController *)self _setupProgrammableSwitchCell:v7 forItem:v8];
    }
  }
  id v9 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v10 = [v9 splitMediaAccountTitleItem];
  if (v10 != v8)
  {

LABEL_11:
    goto LABEL_12;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    objc_opt_class();
    id v12 = v7;
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
    id v9 = v13;

    uint64_t v14 = [MEMORY[0x1E4F6A420] preferredFontForTextStyle:*MEMORY[0x1E4F438A0] traits:32770];
    [v9 setTitleFont:v14];

    [v9 setMaxNumberOfTitleLines:0];
    id v15 = [MEMORY[0x1E4F6A420] preferredFontForTextStyle:*MEMORY[0x1E4F43890] traits:0x8000];
    [v9 setDescriptionFont:v15];

    [v9 setMaxNumberOfDescriptionLines:0];
    [v9 setHideIcon:1];
    [v9 setSelectionStyle:0];
    goto LABEL_11;
  }
LABEL_12:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v16 = [(HUServiceDetailsViewController *)self detailsItemManager];
    int v17 = [v16 roomItem];
    int v18 = [v8 isEqual:v17];

    if (v18)
    {
      objc_opt_class();
      id v19 = v7;
      if (objc_opt_isKindOfClass()) {
        id v20 = v19;
      }
      else {
        id v20 = 0;
      }
      id v21 = v20;

      [v21 setItem:v8];
      uint64_t v22 = [(HUServiceDetailsViewController *)self detailsItemManager];
      uint64_t v23 = [v22 serviceLikeBuilder];
      int v24 = [v23 room];
      uint64_t v25 = [v24 room];
      uint64_t v26 = [v25 uniqueIdentifier];
      int v27 = v26;
      long long v84 = v21;
      if (v26)
      {
        id v28 = v26;
      }
      else
      {
        v81 = [(HUServiceDetailsViewController *)self item];
        v80 = [v81 accessories];
        uint64_t v29 = [v80 anyObject];
        [v29 room];
        int v30 = v82 = v22;
        id v28 = [v30 uniqueIdentifier];

        uint64_t v22 = v82;
      }

      uint64_t v31 = [(HUServiceDetailsViewController *)self detailsItemManager];
      id v32 = [v31 orderedRoomSectionItems];
      v85[0] = MEMORY[0x1E4F143A8];
      v85[1] = 3221225472;
      id v85[2] = __62__HUServiceDetailsViewController_setupCell_forItem_indexPath___block_invoke;
      v85[3] = &unk_1E6386108;
      id v86 = v28;
      id v83 = v28;
      int v33 = objc_msgSend(v32, "na_firstObjectPassingTest:", v85);

      id v34 = [(HUServiceDetailsViewController *)self detailsItemManager];
      objc_super v35 = [v34 orderedRoomSectionItems];
      int v36 = (void *)[v35 copy];
      id v37 = [(HUServiceDetailsViewController *)self _createMenuWithValues:v36 cell:v84 currentItem:v33];
      __int16 v38 = [v84 button];
      [v38 setMenu:v37];
    }
  }
  int v39 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v40 = [v39 roomListItem];

  if (v40 == v8)
  {
    objc_opt_class();
    id v70 = v7;
    if (objc_opt_isKindOfClass()) {
      uint64_t v71 = v70;
    }
    else {
      uint64_t v71 = 0;
    }
    id v50 = v71;

    [v50 setDelegate:self];
    goto LABEL_61;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v41 = v7;
    if (objc_opt_isKindOfClass()) {
      int v42 = v41;
    }
    else {
      int v42 = 0;
    }
    id v43 = v42;

    uint64_t v44 = [(HUServiceDetailsViewController *)self traitCollection];
    _UITableViewDefaultSectionCornerRadiusForTraitCollection();
    objc_msgSend(v43, "_setCornerRadius:");

    uint64_t v45 = [(HUServiceDetailsViewController *)self textViewDelegate];
    v46 = [v43 messageTextView];
    [v46 setDelegate:v45];

    v47 = [v43 actionButton];
    [v47 removeTarget:self action:sel_didSelectHeaderWarningAction_ forControlEvents:64];

    id v48 = [v43 actionButton];

    [v48 addTarget:self action:sel_didSelectHeaderWarningAction_ forControlEvents:64];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v49 = [(HUServiceDetailsViewController *)self controlPanelController];
      [v49 setupCell:v7 forItem:v8];

      objc_opt_class();
      id v50 = v7;
      if (objc_opt_isKindOfClass()) {
        int v51 = v50;
      }
      else {
        int v51 = 0;
      }
      id v52 = v51;

      if (v52)
      {
        v53 = [(HUServiceDetailsViewController *)self expandedControlPanelItems];
        objc_msgSend(v52, "setWheelViewVisible:", objc_msgSend(v53, "containsObject:", v8));
      }
      else
      {
        id v50 = 0;
      }
LABEL_61:

      goto LABEL_62;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      id v54 = v7;
      if (objc_opt_isKindOfClass()) {
        uint64_t v55 = v54;
      }
      else {
        uint64_t v55 = 0;
      }
      id v56 = v55;

      objc_msgSend(v56, "setValueColorFollowsTintColor:", -[HUServiceDetailsViewController _shouldFollowTitleValueTintColorforItem:](self, "_shouldFollowTitleValueTintColorforItem:", v8));
      char v57 = [(HUServiceDetailsViewController *)self detailsItemManager];
      v58 = [v57 accessoryInfoItemProvider];
      v59 = [v58 items];
      objc_msgSend(v56, "setAllowCopyValueToPasteboard:", objc_msgSend(v59, "containsObject:", v8));
    }
    id v50 = v7;
    int v60 = [(HUServiceDetailsViewController *)self detailsItemManager];
    v61 = [v60 pairingModeItem];
    int v62 = [v8 isEqual:v61];

    if (v62) {
      [v50 setDestructive:0];
    }
    char v63 = [(HUServiceDetailsViewController *)self detailsItemManager];
    v64 = [v63 removeItem];
    int v65 = [v8 isEqual:v64];

    if (v65) {
      [v50 setDestructive:1];
    }
    v66 = [(HUServiceDetailsViewController *)self detailsItemManager];
    v67 = [v66 resetItem];
    if ([v8 isEqual:v67])
    {
      v68 = [(HUServiceDetailsViewController *)self item];
      objc_opt_class();
      char v69 = objc_opt_isKindOfClass();

      if (v69) {
        [v50 setDestructive:0];
      }
    }
    else
    {
    }
    v72 = [(HUServiceDetailsViewController *)self detailsItemManager];
    v73 = [v72 restartItem];
    if ([v8 isEqual:v73])
    {
      v74 = [(HUServiceDetailsViewController *)self item];
      objc_opt_class();
      char v75 = objc_opt_isKindOfClass();

      if (v75) {
        [v50 setDestructive:0];
      }
    }
    else
    {
    }
    v76 = [(HUServiceDetailsViewController *)self detailsItemManager];
    v77 = [v76 exportDiagnosticsItem];
    if ([v8 isEqual:v77])
    {
      v78 = [(HUServiceDetailsViewController *)self item];
      objc_opt_class();
      char v79 = objc_opt_isKindOfClass();

      if (v79) {
        [v50 setDestructive:0];
      }
    }
    else
    {
    }
    objc_msgSend(v50, "setAccessoryType:", -[HUServiceDetailsViewController _shouldShowDetailDisclosureForItem:](self, "_shouldShowDetailDisclosureForItem:", v8));
    [v50 setHideIcon:1];
    goto LABEL_61;
  }
LABEL_62:
}

uint64_t __62__HUServiceDetailsViewController_setupCell_forItem_indexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 latestResults];
  BOOL v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68BE8]];
  uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];

  return v5;
}

- (BOOL)_shouldFollowTitleValueTintColorforItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v6 = [v5 accessoryInfoItemProvider];
  id v7 = [v6 items];
  char v8 = [v7 containsObject:v4];

  id v9 = [(HUServiceDetailsViewController *)self detailsItemManager];
  char v10 = [v9 isCharacteristicStateItem:v4];

  int v11 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v12 = [v11 homeTheaterAudioOutputItem];

  id v13 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v14 = [v13 managedConfigurationProfilesItem];

  BOOL v15 = 0;
  if ((v8 & 1) == 0 && (v10 & 1) == 0) {
    BOOL v15 = v12 != v4 && v14 != v4;
  }

  return v15;
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v96.receiver = self;
  v96.super_class = (Class)HUServiceDetailsViewController;
  [(HUItemTableViewController *)&v96 updateCell:v10 forItem:v11 indexPath:v12 animated:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(HUServiceDetailsViewController *)self _setupProgrammableSwitchCell:v10 forItem:v11];
      goto LABEL_20;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = [(HUServiceDetailsViewController *)self controlPanelController];
      [v13 updateCell:v10 forItem:v11 animated:v6];

      goto LABEL_20;
    }
  }
  id v14 = [(HUServiceDetailsViewController *)self detailsItemManager];
  BOOL v15 = [v14 favoriteItem];
  if ([v11 isEqual:v15]) {
    goto LABEL_14;
  }
  int v16 = [(HUServiceDetailsViewController *)self detailsItemManager];
  int v17 = [v16 showInHomeDashboardItem];
  if ([v11 isEqual:v17])
  {
LABEL_13:

LABEL_14:
    goto LABEL_15;
  }
  v91 = v12;
  int v18 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v19 = [v18 cameraStatusLightItem];
  if ([v11 isEqual:v19])
  {
LABEL_12:

    id v12 = v91;
    goto LABEL_13;
  }
  __int16 v89 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v20 = [v89 cameraNightModeItem];
  if ([v11 isEqual:v20])
  {

    goto LABEL_12;
  }
  long long v85 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v83 = [v85 cameraDoorbellChimeMuteItem];
  char v87 = [v11 isEqual:v83];

  id v12 = v91;
  if ((v87 & 1) == 0)
  {
    int v24 = [(HUServiceDetailsViewController *)self detailsItemManager];
    int v25 = [v24 isCharacteristicStateItem:v11];

    if (v25)
    {
      uint64_t v26 = [v11 latestResults];
      id v27 = [v26 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];

      id v28 = [(HUItemTableViewController *)self itemManager];
      uint64_t v29 = objc_msgSend(v28, "displayedItemsInSection:", objc_msgSend(v91, "section"));
      unint64_t v30 = [v29 count];

      if (v30 >= 2)
      {
        uint64_t v31 = [v11 latestResults];
        uint64_t v32 = [v31 objectForKeyedSubscript:*MEMORY[0x1E4F689E0]];
        int v33 = (void *)v32;
        if (v32) {
          id v34 = (void *)v32;
        }
        else {
          id v34 = v27;
        }
        id v35 = v34;

        id v27 = v35;
      }
      id v36 = v10;
      [v36 setTitleText:v27];
      id v37 = [v11 latestResults];
      __int16 v38 = [v37 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];
      int v39 = [v38 stringWithAttributes:MEMORY[0x1E4F1CC08]];
      id v40 = [v39 string];
      [v36 setValueText:v40];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          NSLog(&cfstr_WrongCellClass.isa);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_20;
        }
        id v27 = v10;
        id v41 = [v11 latestResults];
        int v42 = [v41 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
        id v43 = [v27 textLabel];
        [v43 setText:v42];

        uint64_t v44 = [v11 latestResults];
        uint64_t v45 = [v44 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
        [v27 setAccessibilityIdentifier:v45];

        [(HUServiceDetailsViewController *)self _updateCheckedStateForAssociatedServiceTypeCell:v27 item:v11];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v90 = v10;
          v46 = [(HUServiceDetailsViewController *)self detailsItemManager];
          v47 = [v46 serviceLikeBuilder];
          id v48 = [v47 room];
          v49 = [v48 room];
          id v50 = [v49 uniqueIdentifier];
          int v51 = v50;
          if (v50)
          {
            id v52 = v50;
          }
          else
          {
            id v86 = [(HUServiceDetailsViewController *)self item];
            long long v84 = [v86 accessories];
            char v63 = [v84 anyObject];
            v64 = [v63 room];
            [v64 uniqueIdentifier];
            uint64_t v65 = v88 = v46;

            id v52 = (id)v65;
            v46 = v88;

            id v12 = v91;
          }

          v66 = [(HUServiceDetailsViewController *)self detailsItemManager];
          v67 = [v66 orderedRoomSectionItems];
          v94[0] = MEMORY[0x1E4F143A8];
          v94[1] = 3221225472;
          v94[2] = __72__HUServiceDetailsViewController_updateCell_forItem_indexPath_animated___block_invoke;
          v94[3] = &unk_1E638C808;
          id v68 = v52;
          id v95 = v68;
          uint64_t v69 = [v67 indexOfObjectPassingTest:v94];

          if ((v69 & 0x8000000000000000) == 0
            && v69 < [(HUServiceDetailsViewController *)self numberOfValuesForPickerViewCell:v90])
          {
            [v90 setSelectedIndex:v69 animated:0];
          }

          goto LABEL_20;
        }
        v53 = [(HUServiceDetailsViewController *)self detailsItemManager];
        int v54 = [v53 canToggleAccessoryInfoItem:v11];

        if (v54)
        {
          [v10 setSelectionStyle:0];
          goto LABEL_20;
        }
        uint64_t v55 = [(HUServiceDetailsViewController *)self detailsItemManager];
        id v56 = [v55 lockAddHomeKeyToWalletItem];
        int v57 = [v11 isEqual:v56];

        if (v57)
        {
          uint64_t v22 = [MEMORY[0x1E4F42B58] valueCellConfiguration];
          v58 = [v11 latestResults];
          v59 = [v58 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
          [v22 setText:v59];

          int v60 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
          v61 = [v22 textProperties];
          [v61 setColor:v60];

          int v62 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_walletAppIconImage");
          [v22 setImage:v62];

          [v10 setContentConfiguration:v22];
          goto LABEL_19;
        }
        id v70 = [(HUServiceDetailsViewController *)self detailsItemManager];
        uint64_t v71 = [v70 exportDiagnosticsItem];
        int v72 = [v11 isEqual:v71];

        if (!v72) {
          goto LABEL_20;
        }
        objc_opt_class();
        id v73 = v10;
        if (objc_opt_isKindOfClass()) {
          v74 = v73;
        }
        else {
          v74 = 0;
        }
        id v27 = v74;

        char v75 = [v11 latestResults];
        v76 = [v75 objectForKeyedSubscript:*MEMORY[0x1E4F68898]];

        if (v76) {
          int v77 = [v76 isFinished] ^ 1;
        }
        else {
          int v77 = 0;
        }
        objc_opt_class();
        v78 = [v27 accessoryView];
        if (objc_opt_isKindOfClass()) {
          char v79 = v78;
        }
        else {
          char v79 = 0;
        }
        id v80 = v79;

        if (v77)
        {
          if (v80)
          {
            id v81 = v78;

            [v27 setDisabled:1];
            [v81 startAnimating];
            [(HUServiceDetailsViewController *)self _registerButtonActionHandler:v76 item:v11];
            id v80 = v81;
          }
          else
          {
            v92[0] = MEMORY[0x1E4F143A8];
            v92[1] = 3221225472;
            v92[2] = __72__HUServiceDetailsViewController_updateCell_forItem_indexPath_animated___block_invoke_2;
            v92[3] = &unk_1E638C830;
            id v82 = v27;
            id v93 = v82;
            __72__HUServiceDetailsViewController_updateCell_forItem_indexPath_animated___block_invoke_2((uint64_t)v92);
            id v80 = (id)objc_claimAutoreleasedReturnValue();
            [v82 setDisabled:1];
            [v80 startAnimating];
            [(HUServiceDetailsViewController *)self _registerButtonActionHandler:v76 item:v11];
          }
        }
        else
        {
          [v27 setDisabled:0];
          [v80 stopAnimating];
        }
      }
    }

    goto LABEL_20;
  }
LABEL_15:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    NSLog(&cfstr_WrongCellClass.isa);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = v10;
    [v21 setDelegate:self];
    uint64_t v22 = [v11 latestResults];
    uint64_t v23 = [v22 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
    [v21 setAccessibilityIdentifier:v23];

LABEL_19:
  }
LABEL_20:
}

uint64_t __72__HUServiceDetailsViewController_updateCell_forItem_indexPath_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 latestResults];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68BE8]];
  uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];

  return v5;
}

id __72__HUServiceDetailsViewController_updateCell_forItem_indexPath_animated___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
  [*(id *)(a1 + 32) setAccessoryView:v2];

  return v2;
}

- (void)_registerButtonActionHandler:(id)a3 item:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HUServiceDetailsViewController *)self registeredButtonFutures];
  char v10 = [v9 containsObject:v7];

  if ((v10 & 1) == 0)
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__HUServiceDetailsViewController__registerButtonActionHandler_item___block_invoke;
    aBlock[3] = &unk_1E638C858;
    objc_copyWeak(v25, &location);
    id v24 = v8;
    v25[1] = (id)a2;
    id v11 = _Block_copy(aBlock);
    objc_initWeak(&from, v7);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    int v17 = __68__HUServiceDetailsViewController__registerButtonActionHandler_item___block_invoke_2;
    int v18 = &unk_1E638C880;
    objc_copyWeak(&v20, &location);
    id v12 = v11;
    id v19 = v12;
    objc_copyWeak(&v21, &from);
    id v13 = (id)[v7 addCompletionBlock:&v15];
    id v14 = [(HUServiceDetailsViewController *)self registeredButtonFutures];
    objc_msgSend(v14, "na_safeAddObject:", v7);

    v12[2](v12);
    objc_destroyWeak(&v21);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&from);

    objc_destroyWeak(v25);
    objc_destroyWeak(&location);
  }
}

void __68__HUServiceDetailsViewController__registerButtonActionHandler_item___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained detailsItemManager];
  id v4 = (void *)MEMORY[0x1E4F69230];
  uint64_t v5 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 32)];
  BOOL v6 = [v4 requestToUpdateItems:v5 senderSelector:*(void *)(a1 + 48)];
  id v7 = (id)[v3 performItemUpdateRequest:v6];

  id v8 = [WeakRetained detailsItemManager];
  v10[0] = *(void *)(a1 + 32);
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v8 reloadUIRepresentationForItems:v9 withAnimation:0];
}

void __68__HUServiceDetailsViewController__registerButtonActionHandler_item___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v8)
  {
    uint64_t v5 = [MEMORY[0x1E4F69110] sharedHandler];
    [v5 handleError:v8];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  BOOL v6 = [WeakRetained registeredButtonFutures];
  id v7 = objc_loadWeakRetained((id *)(a1 + 48));
  [v6 removeObject:v7];
}

- (id)_createMenuWithValues:(id)a3 cell:(id)a4 currentItem:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_initWeak(&location, self);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  id v20 = __73__HUServiceDetailsViewController__createMenuWithValues_cell_currentItem___block_invoke;
  id v21 = &unk_1E638C8D0;
  objc_copyWeak(&v26, &location);
  id v12 = v8;
  id v22 = v12;
  id v13 = v9;
  id v23 = v13;
  id v14 = v10;
  id v24 = v14;
  id v15 = v11;
  id v25 = v15;
  [v12 enumerateObjectsUsingBlock:&v18];
  uint64_t v16 = objc_msgSend(MEMORY[0x1E4F42B80], "menuWithTitle:children:", &stru_1F18F92B8, v15, v18, v19, v20, v21);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

  return v16;
}

void __73__HUServiceDetailsViewController__createMenuWithValues_cell_currentItem___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (id *)(a1 + 64);
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v8 = [v6 latestResults];

  id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  id v10 = (void *)MEMORY[0x1E4F426E8];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __73__HUServiceDetailsViewController__createMenuWithValues_cell_currentItem___block_invoke_2;
  uint64_t v16 = &unk_1E638C8A8;
  id v11 = *(id *)(a1 + 32);
  uint64_t v20 = a3;
  id v17 = v11;
  id v18 = WeakRetained;
  id v19 = *(id *)(a1 + 40);
  id v12 = [v10 actionWithTitle:v9 image:0 identifier:0 handler:&v13];
  objc_msgSend(v12, "setState:", objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", *(void *)(a1 + 48), v13, v14, v15, v16) == a3);
  [*(id *)(a1 + 56) addObject:v12];
}

void __73__HUServiceDetailsViewController__createMenuWithValues_cell_currentItem___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(a1 + 56)];
  [*(id *)(a1 + 40) _didSelectRoomItem:v4];
  id v2 = [*(id *)(a1 + 40) _createMenuWithValues:*(void *)(a1 + 32) cell:*(void *)(a1 + 48) currentItem:v4];
  id v3 = [*(id *)(a1 + 48) button];
  [v3 setMenu:v2];
}

- (void)_updateName:(id)a3
{
  id v21 = a3;
  if (v21)
  {
    id v4 = [(HUServiceDetailsViewController *)self detailsItemManager];
    uint64_t v5 = [v4 serviceLikeBuilder];
    id v6 = [v5 name];
    char v7 = [v21 isEqualToString:v6];

    if ((v7 & 1) == 0)
    {
      [(HUServiceDetailsViewController *)self setTitle:v21];
      id v8 = [(HUServiceDetailsViewController *)self detailsItemManager];
      id v9 = [v8 serviceLikeBuilder];
      [v9 setName:v21];

      id v10 = objc_alloc_init(MEMORY[0x1E4F697A8]);
      id v11 = [MEMORY[0x1E4F695D8] policyWithDecision:0];
      [v10 setReadPolicy:v11];

      id v12 = [(HUServiceDetailsViewController *)self detailsItemManager];
      uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
      p_detailsItemManager = &self->_detailsItemManager;
      id WeakRetained = objc_loadWeakRetained((id *)p_detailsItemManager);
      uint64_t v16 = [WeakRetained headerItem];
      id v17 = objc_loadWeakRetained((id *)p_detailsItemManager);
      id v18 = [v17 sourceItem];
      id v19 = objc_msgSend(v13, "setWithObjects:", v16, v18, 0);
      id v20 = (id)[v12 _updateResultsForItems:v19 context:v10];
    }
  }
}

- (void)textDidChange:(id)a3 forTextField:(id)a4 item:(id)a5
{
  id v13 = a3;
  id v7 = a5;
  objc_opt_class();
  id v8 = v7;
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if (!v10
    || ([v10 service],
        id v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = objc_msgSend(v11, "hf_isChildService"),
        v11,
        (v12 & 1) == 0))
  {
    [(HUServiceDetailsViewController *)self _updateName:v13];
  }
}

- (void)textFieldDidEndEditing:(id)a3 item:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(HUServiceDetailsViewController *)self _commitBuilder];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __62__HUServiceDetailsViewController_textFieldDidEndEditing_item___block_invoke;
  v10[3] = &unk_1E63867B0;
  objc_copyWeak(&v11, &location);
  id v9 = (id)[v8 addCompletionBlock:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __62__HUServiceDetailsViewController_textFieldDidEndEditing_item___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if ((objc_msgSend(a3, "hf_isHomeKitNamingError") & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v4 = objc_alloc_init(MEMORY[0x1E4F697A8]);
    uint64_t v5 = [MEMORY[0x1E4F695D8] policyWithDecision:0];
    [v4 setReadPolicy:v5];

    id v6 = [WeakRetained detailsItemManager];
    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    id v8 = [WeakRetained detailsItemManager];
    id v9 = [v8 headerItem];
    id v10 = [WeakRetained detailsItemManager];
    id v11 = [v10 sourceItem];
    char v12 = [WeakRetained detailsItemManager];
    id v13 = [v12 nameModule];
    uint64_t v14 = [v13 nameAndIconItem];
    id v15 = objc_msgSend(v7, "setWithObjects:", v9, v11, v14, 0);
    id v16 = (id)[v6 _updateResultsForItems:v15 context:v4];
  }
}

- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)HUServiceDetailsViewController;
  unsigned int v5 = -[HUItemTableViewController shouldHideHeaderAboveSection:](&v14, sel_shouldHideHeaderAboveSection_);
  id v6 = [(HUServiceDetailsViewController *)self detailsItemManager];
  uint64_t v7 = [v6 displayedSectionIdentifierForSectionIndex:a3];
  int v8 = v5 | [(id)v7 isEqualToString:@"HUServiceDetailsHeaderSectionIdentifier"];

  id v9 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v10 = [v9 displayedSectionIdentifierForSectionIndex:a3];
  LODWORD(v7) = [v10 isEqualToString:@"HUServiceDetailsFirmwareUpdateSectionPromptIdentifier"];

  id v11 = [(HUServiceDetailsViewController *)self detailsItemManager];
  char v12 = [v11 displayedSectionIdentifierForSectionIndex:a3];
  LODWORD(v9) = v8 | v7 | [v12 isEqualToString:@"HUServiceDetailsFirmwareUpdateAppStoreSectionIdentifier"];

  return (char)v9;
}

- (BOOL)shouldHideFooterBelowSection:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)HUServiceDetailsViewController;
  unsigned int v5 = -[HUItemTableViewController shouldHideHeaderAboveSection:](&v14, sel_shouldHideHeaderAboveSection_);
  id v6 = [(HUServiceDetailsViewController *)self detailsItemManager];
  uint64_t v7 = [v6 displayedSectionIdentifierForSectionIndex:a3];
  int v8 = v5 | [(id)v7 isEqualToString:@"HUServiceDetailsHeaderSectionIdentifier"];

  id v9 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v10 = [v9 displayedSectionIdentifierForSectionIndex:a3];
  LODWORD(v7) = [v10 isEqualToString:@"HUServiceDetailsFirmwareUpdateSectionPromptIdentifier"];

  id v11 = [(HUServiceDetailsViewController *)self detailsItemManager];
  char v12 = [v11 displayedSectionIdentifierForSectionIndex:a3];
  LODWORD(v9) = v8 | v7 | [v12 isEqualToString:@"HUServiceDetailsFirmwareUpdateAppStoreSectionIdentifier"];

  return (char)v9;
}

- (BOOL)shouldHideSeparatorsForCell:(id)a3 indexPath:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)HUServiceDetailsViewController;
  id v5 = a3;
  LOBYTE(a4) = [(HUItemTableViewController *)&v8 shouldHideSeparatorsForCell:v5 indexPath:a4];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (a4 | isKindOfClass) & 1;
}

- (unint64_t)automaticDisablingReasonsForItem:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)HUServiceDetailsViewController;
  id v4 = a3;
  id v5 = [(HUItemTableViewController *)&v12 automaticDisablingReasonsForItem:v4];
  id v6 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v7 = [v6 showContainedItems];

  objc_super v8 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v9 = [v8 statusAndNotificationItem];

  if (v7 == v4 || v9 == v4) {
    return 1;
  }
  else {
    return (unint64_t)v5;
  }
}

- (void)_updateAssociatedServiceTypeCells
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = [(HUServiceDetailsViewController *)self tableView];
  id v4 = [v3 indexPathsForVisibleRows];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * v8);
        id v10 = [(HUItemTableViewController *)self itemManager];
        id v11 = [v10 displayedItemAtIndexPath:v9];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          objc_super v12 = [(HUServiceDetailsViewController *)self tableView];
          id v13 = [v12 cellForRowAtIndexPath:v9];
          if (objc_opt_isKindOfClass()) {
            objc_super v14 = v13;
          }
          else {
            objc_super v14 = 0;
          }
          id v15 = v14;

          [(HUServiceDetailsViewController *)self _updateCheckedStateForAssociatedServiceTypeCell:v15 item:v11];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

- (void)itemManager:(id)a3 didUpdateResultsForItem:(id)a4 atIndexPath:(id)a5
{
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HUServiceDetailsViewController;
  [(HUItemTableViewController *)&v13 itemManager:a3 didUpdateResultsForItem:v8 atIndexPath:a5];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_detailsItemManager);
  id v10 = [WeakRetained headerItem];

  if (v10 == v8)
  {
    id v11 = [v8 latestResults];
    objc_super v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    [(HUServiceDetailsViewController *)self setTitle:v12];
  }
  [(HUServiceDetailsViewController *)self _updateControlStatusText];
  [(HUServiceDetailsViewController *)self _updateIconDescriptorAnimated:1];
}

- (void)dismissPrivacyController
{
}

- (BOOL)_isCameraItem
{
  id v2 = [(HUServiceDetailsViewController *)self item];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v11 = a3;
  uint64_t v7 = (HUServiceDetailsViewController *)a4;
  if (v7 == self || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = [(HUServiceDetailsViewController *)self navigationBarTitleView];
    uint64_t v9 = v8;
    uint64_t v10 = 0;
  }
  else
  {
    id v8 = [(HUServiceDetailsViewController *)self navigationBarTitleView];
    uint64_t v9 = v8;
    uint64_t v10 = 1;
  }
  [v8 setHidden:v10];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HUServiceDetailsViewController *)self detailsItemManager];
  uint64_t v9 = [v8 displayedItemAtIndexPath:v7];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ([(HUServiceDetailsViewController *)self _allowRowSelectionForItem:v9])
    {
      LOBYTE(v13) = 1;
      goto LABEL_20;
    }
LABEL_17:
    LOBYTE(v13) = 0;
    goto LABEL_20;
  }
  uint64_t v10 = [v6 cellForRowAtIndexPath:v7];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_17;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = objc_msgSend(v10, "allControlViews", 0);
  objc_super v12 = [v11 allObjects];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v12);
        }
        long long v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && [v16 canBeHighlighted]
          && ![v16 isDisabled])
        {
          LOBYTE(v13) = 1;
          goto LABEL_19;
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_19:

LABEL_20:
  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v297[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v286.receiver = self;
  v286.super_class = (Class)HUServiceDetailsViewController;
  [(HUItemTableViewController *)&v286 tableView:v6 didSelectRowAtIndexPath:v7];
  id v8 = [(HUServiceDetailsViewController *)self detailsItemManager];
  uint64_t v9 = [v8 displayedItemAtIndexPath:v7];

  [v6 deselectRowAtIndexPath:v7 animated:1];
  uint64_t v10 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v11 = [v10 internalDebuggingItem];
  BOOL v12 = v9 == v11;

  uint64_t v13 = [(HUServiceDetailsViewController *)self detailsItemManager];
  uint64_t v14 = v13;
  if (v12)
  {
    id v26 = [v13 sourceItemHomeKitObject];

    id v27 = [(HUServiceDetailsViewController *)self navigationController];
    id v28 = [[HUAccessoryDebugViewController alloc] initWithHomeKitObject:v26];
    id v29 = (id)objc_msgSend(v27, "hu_pushPreloadableViewController:animated:", v28, 1);

    goto LABEL_63;
  }
  id v15 = [v13 audioSettingsItem];
  BOOL v16 = v9 == v15;

  if (v16)
  {
    unint64_t v30 = [(HUServiceDetailsViewController *)self item];
    uint64_t v31 = [v30 latestResults];
    uint64_t v32 = [v31 objectForKeyedSubscript:*MEMORY[0x1E4F68740]];
    if ([v32 conformsToProtocol:&unk_1F1AD86A8]) {
      int v33 = v32;
    }
    else {
      int v33 = 0;
    }
    id v34 = v33;

    if (!objc_msgSend(v34, "hf_showsAudioSettings")) {
      goto LABEL_161;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_161;
    }
    id v35 = objc_alloc(MEMORY[0x1E4F692C8]);
    id v36 = [(HUItemTableViewController *)self itemManager];
    id v37 = [v36 home];
    __int16 v38 = (void *)[v35 initWithExistingObject:v34 inHome:v37];

    uint64_t v39 = objc_opt_class();
    id v40 = [(HUServiceDetailsViewController *)self item];
    if (v40)
    {
      if (objc_opt_isKindOfClass()) {
        id v41 = v40;
      }
      else {
        id v41 = 0;
      }
      int v42 = v40;
      if (v41) {
        goto LABEL_25;
      }
      id v43 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v44 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v43 handleFailureInFunction:v44, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v39, objc_opt_class() file lineNumber description];
    }
    int v42 = 0;
LABEL_25:

    uint64_t v45 = [[HUMediaAccessoryAudioSettingsViewController alloc] initWithMediaSystemBuilder:v38 mediaAccessoryItem:v42];
    [(HUMediaAccessoryAudioSettingsViewController *)v45 setPresentationDelegate:self];
    v46 = [(HUServiceDetailsViewController *)self navigationController];
    id v47 = (id)objc_msgSend(v46, "hu_pushPreloadableViewController:animated:", v45, 1);

    goto LABEL_161;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v17 = objc_opt_class();
    id v18 = v9;
    if (v18)
    {
      if (objc_opt_isKindOfClass()) {
        long long v19 = v18;
      }
      else {
        long long v19 = 0;
      }
      long long v20 = v18;
      if (v19) {
        goto LABEL_11;
      }
      long long v21 = [MEMORY[0x1E4F28B00] currentHandler];
      id v22 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v21 handleFailureInFunction:v22, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v17, objc_opt_class() file lineNumber description];
    }
    long long v20 = 0;
LABEL_11:

    uint64_t v23 = +[HUAccessorySettingsDetailsViewControllerFactory viewControllerForGroup:v20];
    id v24 = [(HUServiceDetailsViewController *)self navigationController];
    id v25 = (id)objc_msgSend(v24, "hu_pushPreloadableViewController:animated:", v23, 1);

    goto LABEL_63;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v48 = v9;
    if (objc_opt_isKindOfClass()) {
      v49 = v48;
    }
    else {
      v49 = 0;
    }
    id v50 = v49;

    int v51 = objc_opt_new();
    [v51 addObject:*MEMORY[0x1E4F68550]];
    [v51 addObject:*MEMORY[0x1E4F68480]];
    [v51 addObject:*MEMORY[0x1E4F68488]];
    [v51 addObject:*MEMORY[0x1E4F68478]];
    id v52 = [v50 settingKeyPath];
    int v53 = [v51 na_safeContainsObject:v52];

    if (v53)
    {
      int v54 = +[HUAccessorySettingsDetailsViewControllerFactory viewControllerForSettingItem:v50];
      uint64_t v55 = [(HUServiceDetailsViewController *)self navigationController];
      id v56 = (id)objc_msgSend(v55, "hu_pushPreloadableViewController:animated:", v54, 1);
    }
    goto LABEL_62;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v57 = objc_opt_class();
    id v58 = v9;
    if (v58)
    {
      if (objc_opt_isKindOfClass()) {
        v59 = v58;
      }
      else {
        v59 = 0;
      }
      id v50 = v58;
      if (v59)
      {
LABEL_43:

        int v62 = [v50 controlItems];
        int v51 = [v62 anyObject];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v63 = [(HUServiceDetailsViewController *)self expandedControlPanelItems];
          char v64 = [v63 containsObject:v50];

          uint64_t v65 = [(HUServiceDetailsViewController *)self expandedControlPanelItems];
          v66 = v65;
          if (v64) {
            [v65 removeObject:v50];
          }
          else {
            [v65 addObject:v50];
          }

          __int16 v89 = [(HUServiceDetailsViewController *)self detailsItemManager];
          int v90 = [v89 diffableDataSourceDisabled];

          if (v90)
          {
            long long v85 = [(HUServiceDetailsViewController *)self tableView];
            v297[0] = v7;
            id v86 = [MEMORY[0x1E4F1C978] arrayWithObjects:v297 count:1];
            [(HUTemperatureUnitPickerViewController *)v85 reloadRowsAtIndexPaths:v86 withRowAnimation:0];
          }
          else
          {
            long long v85 = [(HUServiceDetailsViewController *)self detailsItemManager];
            id v296 = v50;
            id v86 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v296 count:1];
            [(HUTemperatureUnitPickerViewController *)v85 reloadUIRepresentationForItems:v86 withAnimation:1];
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
LABEL_62:

            goto LABEL_63;
          }
          long long v84 = v51;
          long long v85 = [[HUTemperatureUnitPickerViewController alloc] initWithUnitItem:v84];

          id v86 = [(HUServiceDetailsViewController *)self navigationController];
          [v86 pushViewController:v85 animated:1];
        }

        goto LABEL_62;
      }
      int v60 = [MEMORY[0x1E4F28B00] currentHandler];
      v61 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v60 handleFailureInFunction:v61, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v57, objc_opt_class() file lineNumber description];
    }
    id v50 = 0;
    goto LABEL_43;
  }
  v67 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v68 = [v67 roomItem];
  int v69 = [v9 isEqual:v68];

  id v70 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v50 = v70;
  if (!v69)
  {
    char v79 = [v70 associatedServiceTypeItem];
    int v80 = [v9 isEqual:v79];

    id v81 = [(HUServiceDetailsViewController *)self detailsItemManager];
    id v82 = v81;
    if (v80)
    {
      [v81 setShowAssociatedServiceTypeList:1];

      id v83 = [(HUServiceDetailsViewController *)self detailsItemManager];
      [v83 setShowRoomsList:0];

      goto LABEL_63;
    }
    char v87 = [v81 createNewRoomItem];
    int v88 = [v9 isEqual:v87];

    if (v88)
    {
      [(HUServiceDetailsViewController *)self addRoomButtonPressed:v6];
      goto LABEL_63;
    }
    v91 = [(HUServiceDetailsViewController *)self detailsItemManager];
    uint64_t v92 = [v91 addGroupItem];
    int v93 = [v9 isEqual:v92];

    if (v93)
    {
      [(HUServiceDetailsViewController *)self _presentGroupPicker];
      goto LABEL_63;
    }
    v94 = [(HUServiceDetailsViewController *)self detailsItemManager];
    id v95 = [v94 identifyHomePodItem];
    int v96 = [v9 isEqual:v95];

    if (v96)
    {
      [(HUServiceDetailsViewController *)self _identifyHomePod];
      goto LABEL_63;
    }
    v97 = [(HUServiceDetailsViewController *)self detailsItemManager];
    __int16 v98 = [v97 separateTileItem];
    int v99 = [v9 isEqual:v98];

    if (v99)
    {
      [(HUServiceDetailsViewController *)self _separateOrUnifyTile];
      goto LABEL_63;
    }
    uint64_t v100 = [(HUServiceDetailsViewController *)self detailsItemManager];
    v101 = [v100 showContainedItems];
    int v102 = [v9 isEqual:v101];

    if (v102)
    {
      [(HUServiceDetailsViewController *)self _presentContainedItems];
      goto LABEL_63;
    }
    v103 = [(HUServiceDetailsViewController *)self detailsItemManager];
    v104 = [v103 lockPinCodesItem];
    BOOL v105 = v9 == v104;

    v106 = [(HUServiceDetailsViewController *)self detailsItemManager];
    v107 = v106;
    if (v105)
    {
      v117 = [v106 lockPinCodesItem];
      v118 = [v117 latestResults];
      v119 = [v118 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];
      char v120 = [v119 BOOLValue];

      if ((v120 & 1) == 0)
      {
        v121 = [MEMORY[0x1E4F691A0] sharedDispatcher];
        v122 = [(HUItemTableViewController *)self itemManager];
        v123 = [v122 home];
        v124 = [v121 pinCodeManagerForHome:v123];

        id v125 = (id)[v124 fetchFromAccessoryCache];
        v126 = [(HUServiceDetailsViewController *)self detailsItemManager];
        v127 = [v126 sourceItemAccessory];

        v128 = [(HUItemTableViewController *)self itemManager];
        v129 = [v128 home];

        v130 = [HUUsersAndGuestsPinCodeViewController alloc];
        v131 = [(HUServiceDetailsViewController *)self item];
        v132 = [(HUUsersAndGuestsPinCodeViewController *)v130 initWithSourceItem:v131 pinCodeManager:v124 home:v129 forAccessory:v127];

        v133 = [(HUServiceDetailsViewController *)self navigationController];
        id v134 = (id)objc_msgSend(v133, "hu_pushPreloadableViewController:animated:", v132, 1);
      }
      goto LABEL_63;
    }
    v108 = [v106 statusAndNotificationItem];
    int v109 = [v9 isEqual:v108];

    if (v109)
    {
      v110 = [HUStatusAndNotificationsViewController alloc];
      v111 = [(HUServiceDetailsViewController *)self item];
      v112 = [(HUItemTableViewController *)self itemManager];
      v113 = [v112 home];
      v114 = [(HUStatusAndNotificationsViewController *)v110 initWithServiceItem:v111 inHome:v113 displayingDetails:1];

      v115 = [(HUServiceDetailsViewController *)self navigationController];
      id v116 = (id)objc_msgSend(v115, "hu_pushPreloadableViewController:animated:", v114, 1);

      goto LABEL_63;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v135 = objc_alloc(MEMORY[0x1E4F68EB0]);
      v136 = [v9 actionSet];
      v137 = [(HUServiceDetailsViewController *)self home];
      v138 = (void *)[v135 initWithExistingObject:v136 inHome:v137];

      v139 = [[HUSceneActionEditorViewController alloc] initWithActionSetBuilder:v138 mode:0];
      [(HUSceneActionEditorViewController *)v139 setShowCancelButton:0];
      [(HUSceneActionEditorViewController *)v139 setPresentationDelegate:self];
      v140 = [(HUServiceDetailsViewController *)self navigationController];
      id v141 = (id)objc_msgSend(v140, "hu_pushPreloadableViewController:animated:", v139, 1);

      goto LABEL_63;
    }
    v142 = [(HUServiceDetailsViewController *)self detailsItemManager];
    v143 = [v142 pairingModeItem];
    int v144 = [v9 isEqual:v143];

    if (v144)
    {
      v145 = [(HUServiceDetailsViewController *)self item];
      v146 = [v145 accessories];
      v147 = [v146 anyObject];
      objc_initWeak(&location, v147);

      id v148 = objc_loadWeakRetained(&location);
      LODWORD(v145) = v148 == 0;

      if (v145)
      {
        v156 = HFLogForCategory();
        if (os_log_type_enabled(v156, OS_LOG_TYPE_ERROR))
        {
          v184 = [(HUServiceDetailsViewController *)self item];
          *(_DWORD *)id from = 138412290;
          *(void *)&from[4] = v184;
          _os_log_error_impl(&dword_1BE345000, v156, OS_LOG_TYPE_ERROR, "Attempted to activate pairing mode for chip accessory but found nil accessory %@", from, 0xCu);
        }
        v157 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 38);
        v158 = [MEMORY[0x1E4F69110] sharedHandler];
        [v158 handleError:v157];
      }
      else
      {
        objc_initWeak((id *)from, self);
        id v149 = objc_loadWeakRetained(&location);
        v282[0] = MEMORY[0x1E4F143A8];
        v282[1] = 3221225472;
        v282[2] = __68__HUServiceDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke;
        v282[3] = &unk_1E638C8F8;
        objc_copyWeak(&v283, &location);
        objc_copyWeak(&v284, (id *)from);
        [v149 activateCHIPPairingModeAndCreateSetupPayloadStringWithCompletion:v282];

        objc_destroyWeak(&v284);
        objc_destroyWeak(&v283);
        objc_destroyWeak((id *)from);
      }
      objc_destroyWeak(&location);
      goto LABEL_63;
    }
    v150 = [(HUServiceDetailsViewController *)self detailsItemManager];
    v151 = [v150 exportDiagnosticsItem];
    int v152 = [v9 isEqual:v151];

    if (v152)
    {
      [(HUServiceDetailsViewController *)self _exportDiagnosticsForItem:v9];
      goto LABEL_63;
    }
    v153 = [(HUServiceDetailsViewController *)self detailsItemManager];
    v154 = [v153 removeItem];
    int v155 = [v9 isEqual:v154];

    if (v155)
    {
      [(HUServiceDetailsViewController *)self _presentRemoveConfirmation:v7];
      goto LABEL_63;
    }
    v159 = [(HUServiceDetailsViewController *)self detailsItemManager];
    v160 = [v159 removeFromGroupItem];
    int v161 = [v9 isEqual:v160];

    if (v161)
    {
      [(HUServiceDetailsViewController *)self _presentRemoveFromGroupConfirmation:v7];
      goto LABEL_63;
    }
    v162 = [(HUServiceDetailsViewController *)self detailsItemManager];
    v163 = [v162 resetItem];
    int v164 = [v9 isEqual:v163];

    if (v164)
    {
      [(HUServiceDetailsViewController *)self _presentResetHomePodConfirmation:v7];
      goto LABEL_63;
    }
    v165 = [(HUServiceDetailsViewController *)self detailsItemManager];
    v166 = [v165 restartItem];
    int v167 = [v9 isEqual:v166];

    if (v167)
    {
      [(HUServiceDetailsViewController *)self _restartGroupedHomePodAccessory];
      goto LABEL_63;
    }
    v168 = [(HUServiceDetailsViewController *)self detailsItemManager];
    v169 = [v168 accessoryItem];
    int v170 = [v9 isEqual:v169];

    if (v170)
    {
      v171 = [(HUServiceDetailsViewController *)self detailsItemManager];
      v172 = [v171 sourceItemAccessory];

      v173 = objc_msgSend(v172, "hf_owningBridgeAccessory");
      if (objc_msgSend(v172, "hf_isBridge"))
      {
        if ((objc_msgSend(v172, "hf_isPureBridge") & 1) == 0)
        {
          v174 = [(HUServiceDetailsViewController *)self detailsItemManager];
          int v175 = [v174 sourceItemIsService];

          if (v175)
          {
            id v176 = v172;

            v173 = v176;
          }
        }
      }
      v177 = objc_msgSend(v173, "hf_primaryService");
      char v178 = objc_msgSend(v173, "hf_isVisibleAsBridge");
      if (v177) {
        char v179 = v178;
      }
      else {
        char v179 = 1;
      }
      if ((v179 & 1) != 0
        || (objc_msgSend(v173, "hf_showAsIndividualServices") & 1) == 0
        && (objc_msgSend(v173, "hf_isMultiServiceAccessory") & 1) != 0)
      {
        id v180 = objc_alloc(MEMORY[0x1E4F68E18]);
        v181 = [(HUServiceDetailsViewController *)self item];
        v182 = [v181 valueSource];
        uint64_t v183 = [v180 initWithAccessory:v173 valueSource:v182];
      }
      else
      {
        v194 = (void *)MEMORY[0x1E4F69550];
        v181 = [(HUServiceDetailsViewController *)self item];
        v182 = [v181 valueSource];
        uint64_t v183 = [v194 serviceItemForService:v177 valueSource:v182];
      }
      v195 = (void *)v183;

      v196 = [[HUServiceDetailsViewController alloc] initWithServiceLikeItem:v195];
      [(HUServiceDetailsViewController *)v196 setPresentationDelegate:self];
      v197 = [(HUServiceDetailsViewController *)self navigationController];
      id v198 = (id)objc_msgSend(v197, "hu_pushPreloadableViewController:animated:", v196, 1);

      goto LABEL_63;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v185 = [(HUServiceDetailsViewController *)self detailsItemManager];
      int v186 = [v185 showAssociatedServiceTypeList];

      if (v186)
      {
        id v187 = v9;
        v188 = [v187 latestResults];
        v189 = [v188 objectForKeyedSubscript:*MEMORY[0x1E4F68318]];

        if (!v189) {
          NSLog(&cfstr_AssociatedServ.isa, v187);
        }
        v190 = [(HUServiceDetailsViewController *)self detailsItemManager];
        v191 = [v190 selectAssociatedServiceType:v189];

        objc_initWeak((id *)from, self);
        v280[0] = MEMORY[0x1E4F143A8];
        v280[1] = 3221225472;
        v280[2] = __68__HUServiceDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_576;
        v280[3] = &unk_1E63874A0;
        objc_copyWeak(&v281, (id *)from);
        id v192 = (id)[v191 addSuccessBlock:v280];
        id v193 = (id)[v191 addFailureBlock:&__block_literal_global_578];
        objc_destroyWeak(&v281);
        objc_destroyWeak((id *)from);
      }
      else
      {
        id v187 = [(HUServiceDetailsViewController *)self detailsItemManager];
        [v187 setShowAssociatedServiceTypeList:1];
      }

      [(HUServiceDetailsViewController *)self _updateAssociatedServiceTypeCells];
      goto LABEL_63;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(HUServiceDetailsViewController *)self _presentTriggerEditorForProgrammableSwitchEventOptionItem:v9];
      goto LABEL_63;
    }
    v199 = [(HUServiceDetailsViewController *)self detailsItemManager];
    int v200 = [v199 canToggleAccessoryInfoItem:v9];

    v201 = [(HUServiceDetailsViewController *)self detailsItemManager];
    v202 = v201;
    if (v200)
    {
      [v201 toggleAccessoryInfoItem:v9];

      goto LABEL_63;
    }
    v203 = [v201 splitMediaAccountUseDefaultAccountItem];
    BOOL v204 = v9 == v203;

    if (v204)
    {
      [(HUServiceDetailsViewController *)self didSelectHomeAssistantDeviceSplitAccountAction:1];
      goto LABEL_63;
    }
    v205 = [(HUServiceDetailsViewController *)self detailsItemManager];
    v206 = [v205 splitMediaAccountSignoutAccountItem];
    BOOL v207 = v9 == v206;

    if (v207)
    {
      [(HUServiceDetailsViewController *)self didSelectHomeAssistantDeviceSplitAccountAction:2];
      goto LABEL_63;
    }
    v208 = [(HUServiceDetailsViewController *)self detailsItemManager];
    v209 = [v208 homeTheaterAudioOutputItem];
    BOOL v210 = v9 == v209;

    if (v210)
    {
      objc_opt_class();
      v223 = [(HUServiceDetailsViewController *)self item];
      if (objc_opt_isKindOfClass()) {
        v224 = v223;
      }
      else {
        v224 = 0;
      }
      id v34 = v224;

      if (v34)
      {
        v225 = [[HUHomeTheaterAudioViewController alloc] initWithMediaAccessoryItem:v34];
        v226 = [(HUServiceDetailsViewController *)self navigationController];
        id v227 = (id)objc_msgSend(v226, "hu_pushPreloadableViewController:animated:", v225, 1);
      }
    }
    else
    {
      v211 = [(HUServiceDetailsViewController *)self detailsItemManager];
      v212 = [v211 cameraActivityZonesItem];
      BOOL v213 = v9 == v212;

      if (v213)
      {
        objc_opt_class();
        v228 = [(HUServiceDetailsViewController *)self detailsItemManager];
        v229 = [v228 sourceItem];
        if (objc_opt_isKindOfClass()) {
          v230 = v229;
        }
        else {
          v230 = 0;
        }
        id v50 = v230;

        if (v50)
        {
          v231 = [HUCameraActivityZoneEditorViewController alloc];
          v232 = [v50 profile];
          int v51 = [(HUCameraActivityZoneEditorViewController *)v231 initWithCameraProfile:v232];

          v233 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v51];
          [v233 setToolbarHidden:0];
          [v233 setModalPresentationStyle:2];
          [(HUServiceDetailsViewController *)self presentViewController:v233 animated:1 completion:0];
        }
        else
        {
          int v51 = HFLogForCategory();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)id from = 138412290;
            *(void *)&from[4] = v9;
            _os_log_error_impl(&dword_1BE345000, v51, OS_LOG_TYPE_ERROR, "Unable to launch editor for invalid item:%@", from, 0xCu);
          }
        }
        goto LABEL_62;
      }
      v214 = [(HUServiceDetailsViewController *)self detailsItemManager];
      v215 = [v214 cameraRecordingOptionsItem];
      int v216 = [v9 isEqual:v215];

      if (v216)
      {
        v217 = [(HUServiceDetailsViewController *)self navigationController];
        v218 = [HUCameraRecordingOptionsTableViewController alloc];
        v219 = [(HUServiceDetailsViewController *)self detailsItemManager];
        v220 = [v219 sourceItem];
        v221 = [(HUCameraRecordingOptionsTableViewController *)v218 initWithServiceLikeItem:v220];
        id v222 = (id)objc_msgSend(v217, "hu_pushPreloadableViewController:animated:", v221, 1);

        goto LABEL_63;
      }
      v234 = [(HUServiceDetailsViewController *)self detailsItemManager];
      v235 = [v234 cameraFaceRecognitionItem];
      int v236 = [v9 isEqual:v235];

      if (v236)
      {
        v237 = [HUFaceRecognitionLibraryListViewController alloc];
        v238 = [(HUItemTableViewController *)self itemManager];
        v239 = [v238 home];
        v240 = [(HUFaceRecognitionLibraryListViewController *)v237 initWithHome:v239];

        v241 = [(HUServiceDetailsViewController *)self navigationController];
        id v242 = (id)objc_msgSend(v241, "hu_pushPreloadableViewController:animated:", v240, 1);

        goto LABEL_63;
      }
      v243 = [(HUServiceDetailsViewController *)self detailsItemManager];
      v244 = [v243 collectDiagnosticsItem];
      BOOL v245 = v9 == v244;

      if (v245)
      {
        v265 = [HUAccessoryDiagnosticsViewController alloc];
        v266 = [(HUServiceDetailsViewController *)self item];
        v267 = [(HUAccessoryDiagnosticsViewController *)v265 initWithSourceItem:v266];

        v268 = [(HUServiceDetailsViewController *)self navigationController];
        id v269 = (id)objc_msgSend(v268, "hu_pushPreloadableViewController:animated:", v267, 1);

        goto LABEL_63;
      }
      v246 = [(HUServiceDetailsViewController *)self detailsItemManager];
      v247 = [v246 lockAddHomeKeyToWalletItem];
      int v248 = [v9 isEqual:v247];

      v249 = [(HUServiceDetailsViewController *)self detailsItemManager];
      v250 = v249;
      if (v248)
      {
        v251 = [v249 sourceItem];
        int v252 = [v251 conformsToProtocol:&unk_1F1A3D558];

        if (v252)
        {
          v253 = [(HUServiceDetailsViewController *)self detailsItemManager];
          v254 = [v253 sourceItem];

          v255 = [v254 home];
          v256 = HFLogForCategory();
          if (os_log_type_enabled(v256, OS_LOG_TYPE_DEFAULT))
          {
            v257 = [(id)objc_opt_class() description];
            *(_DWORD *)id from = 138413314;
            *(void *)&from[4] = v257;
            __int16 v288 = 2080;
            v289 = "-[HUServiceDetailsViewController tableView:didSelectRowAtIndexPath:]";
            __int16 v290 = 2112;
            v291 = v9;
            __int16 v292 = 2112;
            v293 = v254;
            __int16 v294 = 2112;
            v295 = v255;
            _os_log_impl(&dword_1BE345000, v256, OS_LOG_TYPE_DEFAULT, "(%@:%s) user tapped %@ of %@ in home %@", from, 0x34u);
          }
          v258 = [v6 cellForRowAtIndexPath:v7];
          objc_opt_class();
          id v259 = v258;
          if (objc_opt_isKindOfClass()) {
            v260 = v259;
          }
          else {
            v260 = 0;
          }
          id v261 = v260;

          [v261 setShowSpinner:1];
          v262 = [MEMORY[0x1E4F69770] handleAddOrShowHomeKeyButtonTapForHome:v255];
          v278[0] = MEMORY[0x1E4F143A8];
          v278[1] = 3221225472;
          v278[2] = __68__HUServiceDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_609;
          v278[3] = &unk_1E63850B8;
          id v279 = v261;
          id v263 = v261;
          id v264 = (id)[v262 addCompletionBlock:v278];
        }
        goto LABEL_63;
      }
      v270 = [v249 managedConfigurationProfilesItem];
      int v271 = [v9 isEqual:v270];

      if (!v271) {
        goto LABEL_63;
      }
      objc_opt_class();
      v272 = [(HUItemTableViewController *)self itemManager];
      if (objc_opt_isKindOfClass()) {
        v273 = v272;
      }
      else {
        v273 = 0;
      }
      id v274 = v273;

      id v34 = [v274 sourceItemAccessory];

      if (v34)
      {
        v275 = [[HUManagedConfigurationProfilesViewController alloc] initWithAccessory:v34];
        v276 = [(HUServiceDetailsViewController *)self navigationController];
        [v276 pushViewController:v275 animated:1];
      }
    }
LABEL_161:

    goto LABEL_63;
  }
  int v51 = [v70 home];
  if (([v51 hf_currentUserIsAdministrator] & 1) == 0) {
    goto LABEL_62;
  }
  uint64_t v71 = [(HUServiceDetailsViewController *)self detailsItemManager];
  int v72 = [v71 sourceItem];
  id v73 = [v72 latestResults];
  v74 = [v73 objectForKeyedSubscript:*MEMORY[0x1E4F68CA0]];
  char v277 = [v74 BOOLValue];

  if ((v277 & 1) == 0)
  {
    [(HUServiceDetailsViewController *)self setIsPresentingRoomsList:1];
    char v75 = [(HUServiceDetailsViewController *)self detailsItemManager];
    int v76 = [v75 showRoomsList];
    int v77 = [(HUServiceDetailsViewController *)self detailsItemManager];
    [v77 setShowRoomsList:v76 ^ 1u];

    v78 = [(HUServiceDetailsViewController *)self detailsItemManager];
    [v78 setShowAssociatedServiceTypeList:0];
  }
LABEL_63:
}

void __68__HUServiceDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v48[2] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  __int16 v38 = v5;
  if (v4)
  {
    uint64_t v42 = 0;
    id v43 = &v42;
    uint64_t v44 = 0x2050000000;
    id v6 = (void *)qword_1EA12E068;
    uint64_t v45 = qword_1EA12E068;
    if (!qword_1EA12E068)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getMTRSetupPayloadClass_block_invoke;
      id v47 = &unk_1E63852F0;
      v48[0] = &v42;
      __getMTRSetupPayloadClass_block_invoke((uint64_t)buf);
      id v6 = (void *)v43[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v42, 8);
    id v8 = [v7 setupPayloadWithOnboardingPayload:v4 error:0];
    uint64_t v9 = [v8 manualEntryCode];
    uint64_t v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = WeakRetained;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v4;
      *(_WORD *)&buf[22] = 2112;
      id v47 = v8;
      LOWORD(v48[0]) = 2112;
      *(void *)((char *)v48 + 2) = v9;
      _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "Successfully activated pairing mode for CHIP accessory: %@, setupPayloadString: %@, payload: %@, manual pairing code: %@", buf, 0x2Au);
    }
    BOOL v12 = +[HUStringDisplayFormatter stringByApplyingCodeFormatToString:v9];
    id v13 = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v14 = [v13 name];
    id v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      _HULocalizedStringWithDefaultValue(@"HUAccessoryTitle", @"HUAccessoryTitle", 1);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v18 = v16;

    long long v19 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsPairingModeItem_Alert_Title", @"HUServiceDetailsPairingModeItem_Alert_Title", 1);
    id v26 = HULocalizedStringWithFormat(@"HUServiceDetailsPairingModeItem_Alert_Body", @"%@%@", v20, v21, v22, v23, v24, v25, (uint64_t)v18);
    id v27 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v19 message:v26 preferredStyle:1];
    id v28 = (void *)MEMORY[0x1E4F42720];
    id v29 = _HULocalizedStringWithDefaultValue(@"HUAlertDismiss", @"HUAlertDismiss", 1);
    unint64_t v30 = [v28 actionWithTitle:v29 style:0 handler:&__block_literal_global_565];
    [v27 addAction:v30];

    uint64_t v31 = (void *)MEMORY[0x1E4F42720];
    uint64_t v32 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsPairingModeItem_Alert_Copy_Button_Title", @"HUServiceDetailsPairingModeItem_Alert_Copy_Button_Title", 1);
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __68__HUServiceDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_569;
    v40[3] = &unk_1E6385188;
    id v41 = v9;
    id v33 = v9;
    id v34 = [v31 actionWithTitle:v32 style:0 handler:v40];
    [v27 addAction:v34];

    id v35 = objc_loadWeakRetained((id *)(a1 + 40));
    [v35 presentViewController:v27 animated:1 completion:0];
  }
  else
  {
    if (v5)
    {
      id v17 = v5;
    }
    else
    {
      id v17 = [MEMORY[0x1E4F28C58] hmfUnspecifiedError];
    }
    id v8 = v17;
    id v36 = HFLogForCategory();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      id v37 = objc_loadWeakRetained((id *)(a1 + 32));
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v37;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v8;
      _os_log_error_impl(&dword_1BE345000, v36, OS_LOG_TYPE_ERROR, "Encountered error activating pairing mode for CHIP accessory: %@ error: %@", buf, 0x16u);
    }
    BOOL v12 = [MEMORY[0x1E4F69110] sharedHandler];
    [v12 handleError:v8];
  }
}

void __68__HUServiceDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_562()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = HFLogForCategory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    id v2 = "-[HUServiceDetailsViewController tableView:didSelectRowAtIndexPath:]_block_invoke";
    _os_log_impl(&dword_1BE345000, v0, OS_LOG_TYPE_DEFAULT, "(%s) User tapped 'Dismiss' from alert", (uint8_t *)&v1, 0xCu);
  }
}

void __68__HUServiceDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_569(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 title];
    int v7 = 136315394;
    id v8 = "-[HUServiceDetailsViewController tableView:didSelectRowAtIndexPath:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped '%@' from alert", (uint8_t *)&v7, 0x16u);
  }
  id v6 = [MEMORY[0x1E4F42C50] generalPasteboard];
  [v6 setString:*(void *)(a1 + 32)];
}

void __68__HUServiceDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_576(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v1 = [WeakRetained detailsItemManager];
  [v1 setShowAssociatedServiceTypeList:0];

  [WeakRetained _updateAssociatedServiceTypeCells];
}

void __68__HUServiceDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F69110];
  id v3 = a2;
  id v4 = [v2 sharedHandler];
  [v4 logError:v3 operationDescription:@"HUServiceDetailsViewController.updateAssociatedServiceType"];
}

uint64_t __68__HUServiceDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_609(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShowSpinner:0];
}

- (void)diffableDataItemManager:(id)a3 willUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6 isInitialLoad:(BOOL)a7
{
  BOOL v7 = a7;
  v16.receiver = self;
  v16.super_class = (Class)HUServiceDetailsViewController;
  id v12 = a6;
  id v13 = a5;
  [(HUItemTableViewController *)&v16 diffableDataItemManager:a3 willUpdateItems:a4 addItems:v13 removeItems:v12 isInitialLoad:v7];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __109__HUServiceDetailsViewController_diffableDataItemManager_willUpdateItems_addItems_removeItems_isInitialLoad___block_invoke;
  v15[3] = &unk_1E63889F8;
  void v15[4] = self;
  objc_msgSend(v12, "na_each:", v15);

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __109__HUServiceDetailsViewController_diffableDataItemManager_willUpdateItems_addItems_removeItems_isInitialLoad___block_invoke_2;
  v14[3] = &unk_1E63889F8;
  v14[4] = self;
  objc_msgSend(v13, "na_each:", v14);
}

void __109__HUServiceDetailsViewController_diffableDataItemManager_willUpdateItems_addItems_removeItems_isInitialLoad___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v7 = v3;
  if (objc_opt_isKindOfClass()) {
    id v4 = v7;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) controlPanelController];
    [v6 removeItem:v5];
  }
}

void __109__HUServiceDetailsViewController_diffableDataItemManager_willUpdateItems_addItems_removeItems_isInitialLoad___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v10 = v3;
  if (objc_opt_isKindOfClass()) {
    id v4 = v10;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) controlPanelController];
    id v7 = [v6 allItems];
    char v8 = [v7 containsObject:v5];

    if ((v8 & 1) == 0)
    {
      __int16 v9 = [*(id *)(a1 + 32) controlPanelController];
      [v9 addItem:v5];
    }
  }
}

- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6
{
  v13.receiver = self;
  v13.super_class = (Class)HUServiceDetailsViewController;
  id v10 = a4;
  [(HUItemTableViewController *)&v13 diffableDataItemManager:a3 didUpdateItems:v10 addItems:a5 removeItems:a6];
  uint64_t v11 = [(HUServiceDetailsViewController *)self inputSourceItemModuleController];
  [v11 updateAllConfigurationDisabled];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __94__HUServiceDetailsViewController_diffableDataItemManager_didUpdateItems_addItems_removeItems___block_invoke;
  v12[3] = &unk_1E63889F8;
  v12[4] = self;
  objc_msgSend(v10, "na_each:", v12);
}

void __94__HUServiceDetailsViewController_diffableDataItemManager_didUpdateItems_addItems_removeItems___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1256));
  id v4 = [WeakRetained headerItem];

  if (v4 == v7)
  {
    id v5 = [v7 latestResults];
    id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    [*(id *)(a1 + 32) setTitle:v6];
  }
  [*(id *)(a1 + 32) _updateControlStatusText];
  [*(id *)(a1 + 32) _updateIconDescriptorAnimated:1];
}

- (void)itemManager:(id)a3 performUpdateRequest:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v6 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = [v6 changes];
  char v8 = [v7 itemOperations];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_super v13 = *(void **)(*((void *)&v20 + 1) + 8 * v12);
        objc_opt_class();
        uint64_t v14 = [v13 item];
        if (objc_opt_isKindOfClass()) {
          id v15 = v14;
        }
        else {
          id v15 = 0;
        }
        id v16 = v15;

        if (v16)
        {
          if ([v13 type] == 1)
          {
            id v17 = [(HUServiceDetailsViewController *)self controlPanelController];
            [v17 addItem:v16];
          }
          else
          {
            if ([v13 type] != 2) {
              goto LABEL_15;
            }
            id v17 = [(HUServiceDetailsViewController *)self controlPanelController];
            [v17 removeItem:v16];
          }
        }
LABEL_15:

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  v19.receiver = self;
  v19.super_class = (Class)HUServiceDetailsViewController;
  [(HUItemTableViewController *)&v19 itemManager:v18 performUpdateRequest:v6];
}

- (BOOL)itemManager:(id)a3 shouldShowControlPanelItem:(id)a4
{
  id v5 = a4;
  id v6 = [(HUServiceDetailsViewController *)self controlPanelController];
  char v7 = [v6 shouldDisplayItem:v5];

  return v7;
}

- (BOOL)itemManager:(id)a3 shouldShowSectionTitleForControlPanelItem:(id)a4
{
  id v5 = a4;
  id v6 = [(HUServiceDetailsViewController *)self controlPanelController];
  char v7 = [v6 shouldShowSectionTitleForItem:v5];

  return v7;
}

- (id)itemManager:(id)a3 sectionTitleForControlPanelItem:(id)a4 forServiceItem:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = [(HUServiceDetailsViewController *)self controlPanelController];
  uint64_t v10 = [v9 sectionTitleForItem:v8 forSourceItem:v7];

  return v10;
}

- (id)itemManager:(id)a3 sectionFooterForControlPanelItem:(id)a4 forServiceItem:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = [(HUServiceDetailsViewController *)self controlPanelController];
  uint64_t v10 = [v9 sectionFooterForItem:v8 forSourceItem:v7];

  return v10;
}

- (void)itemManager:(id)a3 didUpdateResultsForSourceItem:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = [(HUServiceDetailsViewController *)self _roomForItem:a4];
  id v6 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v7 = [v6 serviceLikeBuilder];
  id v8 = [v7 room];
  uint64_t v9 = [v8 room];
  uint64_t v10 = [v9 uniqueIdentifier];

  if (!v10)
  {
    long long v21 = HFLogForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      long long v22 = [(HUServiceDetailsViewController *)self detailsItemManager];
      long long v23 = [v22 serviceLikeBuilder];
      int v24 = 136315394;
      uint64_t v25 = "-[HUServiceDetailsViewController itemManager:didUpdateResultsForSourceItem:]";
      __int16 v26 = 2112;
      id v27 = v23;
      _os_log_impl(&dword_1BE345000, v21, OS_LOG_TYPE_DEFAULT, "%s The source item has been changed, but we can't confirm that the room has changed because the self.detailsItemManager.serviceLikeBuilder (%@) has a nil room - which seems wrong.", (uint8_t *)&v24, 0x16u);
    }
    goto LABEL_9;
  }
  uint64_t v11 = [v5 uniqueIdentifier];

  if (v11)
  {
    uint64_t v12 = [(HUServiceDetailsViewController *)self detailsItemManager];
    objc_super v13 = [v12 serviceLikeBuilder];
    uint64_t v14 = [v13 room];
    id v15 = [v14 room];
    id v16 = [v15 uniqueIdentifier];
    id v17 = [v5 uniqueIdentifier];
    char v18 = [v16 isEqual:v17];

    if ((v18 & 1) == 0)
    {
      objc_super v19 = HFLogForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        long long v20 = [v5 name];
        int v24 = 136315394;
        uint64_t v25 = "-[HUServiceDetailsViewController itemManager:didUpdateResultsForSourceItem:]";
        __int16 v26 = 2112;
        id v27 = v20;
        _os_log_impl(&dword_1BE345000, v19, OS_LOG_TYPE_DEFAULT, "%s The room has changed to (%@), thus the items in this view are stale. Resetting.", (uint8_t *)&v24, 0x16u);
      }
      long long v21 = [(HUServiceDetailsViewController *)self detailsItemManager];
      [v21 resetServiceLikeItemBuilder];
LABEL_9:
    }
  }
}

- (int64_t)numberOfValuesForPickerViewCell:(id)a3
{
  id v3 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v4 = [v3 orderedRoomSectionItems];
  int64_t v5 = [v4 count];

  return v5;
}

- (void)pickerViewCell:(id)a3 didSelectValueAtIndex:(int64_t)a4
{
  if ([(HUServiceDetailsViewController *)self isPresentingRoomsList])
  {
    [(HUServiceDetailsViewController *)self setIsPresentingRoomsList:0];
  }
  else
  {
    id v6 = [(HUServiceDetailsViewController *)self detailsItemManager];
    id v7 = [v6 orderedRoomSectionItems];
    unint64_t v8 = [v7 count];

    if (v8 > a4)
    {
      uint64_t v9 = [(HUServiceDetailsViewController *)self detailsItemManager];
      uint64_t v10 = [v9 orderedRoomSectionItems];
      id v11 = [v10 objectAtIndexedSubscript:a4];

      [(HUServiceDetailsViewController *)self _didSelectRoomItem:v11];
    }
  }
}

- (id)pickerViewCell:(id)a3 titleForValueAtIndex:(int64_t)a4
{
  id v6 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v7 = [v6 orderedRoomSectionItems];
  unint64_t v8 = [v7 count];

  if (v8 <= a4)
  {
    objc_super v13 = 0;
  }
  else
  {
    uint64_t v9 = [(HUServiceDetailsViewController *)self detailsItemManager];
    uint64_t v10 = [v9 orderedRoomSectionItems];
    id v11 = [v10 objectAtIndexedSubscript:a4];

    uint64_t v12 = [v11 latestResults];
    objc_super v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  }

  return v13;
}

- (id)_characteristicsAffectedByControlItem:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA80] set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int64_t v5 = objc_msgSend(v3, "characteristicOptions", 0);
  id v6 = [v5 objectForKeyedSubscript:&unk_1F19B4808];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [v3 valueSource];
        objc_super v13 = [v12 allCharacteristicsForCharacteristicType:v11];
        [v4 unionSet:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v4;
}

- (void)controlPanelController:(id)a3 willBeginPossibleWritesForControlItem:(id)a4
{
  id v5 = a4;
  id v7 = [(HUItemTableViewController *)self itemManager];
  id v6 = [(HUServiceDetailsViewController *)self _characteristicsAffectedByControlItem:v5];

  [v7 beginSuppressingUpdatesForCharacteristics:v6 withReason:@"serviceDetailsControlInteraction"];
}

- (void)controlPanelController:(id)a3 didEndPossibleWritesForControlItem:(id)a4
{
  id v4 = [(HUItemTableViewController *)self itemManager];
  [v4 endSuppressingUpdatesForCharacteristicsWithReason:@"serviceDetailsControlInteraction" updateAffectedItems:1];
}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 conformsToProtocol:&unk_1F19E7BA8]) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;
  if ([v8 requiresPresentingViewControllerDismissal])
  {
    [(HUServiceDetailsViewController *)self setRequiresPresentingViewControllerDismissal:1];
    uint64_t v9 = [(HUServiceDetailsViewController *)self presentationDelegate];
    uint64_t v10 = [v9 finishPresentation:self animated:v4];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v11 = [(UIViewController *)self hu_dismissViewControllerAnimated:v4];
    }
    else
    {
      objc_super v13 = [(HUServiceDetailsViewController *)self navigationController];
      id v14 = (id)[v13 popViewControllerAnimated:v4];

      uint64_t v11 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
    }
    uint64_t v10 = (void *)v11;
  }

  return v10;
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(HUServiceDetailsViewController *)self tableView];
  id v41 = [v7 indexPathForCell:v6];

  id v8 = [(HUItemTableViewController *)self itemManager];
  uint64_t v9 = [v8 displayedItemAtIndexPath:v41];

  uint64_t v10 = [(HUServiceDetailsViewController *)self detailsItemManager];
  uint64_t v11 = [v10 favoriteItem];
  int v12 = [v9 isEqual:v11];

  objc_super v13 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v14 = v13;
  if (v12)
  {
    long long v15 = [v13 serviceLikeBuilder];

    [v15 setIsFavorite:v4];
LABEL_5:
    id v20 = (id)[v15 commitItem];
LABEL_6:

    goto LABEL_7;
  }
  long long v16 = [v13 showInHomeDashboardItem];
  int v17 = [v9 isEqual:v16];

  long long v18 = [(HUServiceDetailsViewController *)self detailsItemManager];
  objc_super v19 = v18;
  if (v17)
  {
    long long v15 = [v18 serviceLikeBuilder];

    [v15 setShowInHomeDashboard:v4];
    goto LABEL_5;
  }
  id v33 = [v18 cameraStatusLightItem];
  int v34 = [v9 isEqual:v33];

  id v35 = [(HUServiceDetailsViewController *)self detailsItemManager];
  long long v15 = v35;
  if (v34)
  {
    [v35 updateCameraStatusLight:v4];
    goto LABEL_6;
  }
  id v36 = [v35 cameraNightModeItem];
  int v37 = [v9 isEqual:v36];

  __int16 v38 = [(HUServiceDetailsViewController *)self detailsItemManager];
  long long v15 = v38;
  if (v37)
  {
    [v38 updateCameraNightMode:v4];
    goto LABEL_6;
  }
  uint64_t v39 = [v38 cameraDoorbellChimeMuteItem];
  int v40 = [v9 isEqual:v39];

  if (v40)
  {
    long long v15 = [(HUServiceDetailsViewController *)self detailsItemManager];
    [v15 updateDoorbellChimeMuteMode:v4];
    goto LABEL_6;
  }
LABEL_7:
  long long v21 = [v9 latestResults];
  uint64_t v22 = *MEMORY[0x1E4F68AC0];
  long long v23 = [v21 objectForKey:*MEMORY[0x1E4F68AC0]];

  if (v23)
  {
    int v24 = [v9 latestResults];
    uint64_t v25 = [v24 objectForKeyedSubscript:v22];
  }
  else
  {
    uint64_t v25 = 0;
  }
  id v26 = v9;
  if ([v26 conformsToProtocol:&unk_1F1A2A7D0]) {
    id v27 = v26;
  }
  else {
    id v27 = 0;
  }
  id v28 = v27;

  if (![v25 length] && v28)
  {
    uint64_t v29 = [v28 itemTitleLocalizationKey];

    uint64_t v25 = (void *)v29;
  }
  unint64_t v30 = (void *)MEMORY[0x1E4F68EE0];
  uint64_t v31 = [(HUItemTableViewController *)self itemManager];
  uint64_t v32 = [v31 sourceItem];
  [v30 sendSwitchCellToggleEventForItem:v32 isOn:v4 title:v25 fromSourceViewController:self];
}

- (void)mediaSystemEditor:(id)a3 didCreate:(id)a4
{
  id v18 = a3;
  id v7 = a4;
  if (!v7)
  {
    int v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HUServiceDetailsViewController.m", 2044, @"Invalid parameter not satisfying: %@", @"mediaSystem" object file lineNumber description];
  }
  id v8 = objc_alloc(MEMORY[0x1E4F69280]);
  uint64_t v9 = [(HUServiceDetailsViewController *)self item];
  uint64_t v10 = [v9 valueSource];
  uint64_t v11 = (void *)[v8 initWithValueSource:v10 mediaProfileContainer:v7];

  id v12 = objc_alloc(MEMORY[0x1E4F692C8]);
  objc_super v13 = [v7 home];
  id v14 = (void *)[v12 initWithExistingObject:v7 inHome:v13];

  long long v15 = [[HUMediaAccessoryAudioSettingsViewController alloc] initWithMediaSystemBuilder:v14 mediaAccessoryItem:v11];
  [(HUMediaAccessoryAudioSettingsViewController *)v15 setPresentationDelegate:self];
  long long v16 = [(HUServiceDetailsViewController *)self _magicallyUpdateNavigationStackForNewRootItem:v11 topViewController:v15];
  [v18 setPresentationDelegate:v16];
}

- (void)mediaSystemEditor:(id)a3 didAbortDueTo:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v7 mediaProfile];

  if (!v9)
  {
    long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HUServiceDetailsViewController.m", 2058, @"Invalid parameter not satisfying: %@", @"accessoryNeedingUpdate.mediaProfile" object file lineNumber description];
  }
  id v10 = (id)objc_msgSend(v7, "hf_fetchAvailableSoftwareUpdateWithOptions:", 0);
  id v11 = objc_alloc(MEMORY[0x1E4F69280]);
  id v12 = [(HUServiceDetailsViewController *)self item];
  objc_super v13 = [v12 valueSource];
  id v14 = [v7 mediaProfile];

  id v17 = (id)[v11 initWithValueSource:v13 mediaProfileContainer:v14];
  long long v15 = [(HUServiceDetailsViewController *)self _magicallyUpdateNavigationStackForNewRootItem:v17 topViewController:0];
  [v8 setPresentationDelegate:v15];
}

- (void)serviceGroupEditor:(id)a3 didCreateServiceGroup:(id)a4
{
  id v14 = a3;
  id v7 = a4;
  if (!v7)
  {
    objc_super v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HUServiceDetailsViewController.m", 2071, @"Invalid parameter not satisfying: %@", @"serviceGroup" object file lineNumber description];
  }
  id v8 = objc_alloc(MEMORY[0x1E4F69538]);
  uint64_t v9 = [(HUServiceDetailsViewController *)self item];
  id v10 = [v9 valueSource];
  id v11 = (void *)[v8 initWithValueSource:v10 serviceGroup:v7];

  id v12 = [(HUServiceDetailsViewController *)self _magicallyUpdateNavigationStackForNewRootItem:v11 topViewController:0];
  [v14 setPresentationDelegate:v12];
}

- (id)_magicallyUpdateNavigationStackForNewRootItem:(id)a3 topViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    long long v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"HUServiceDetailsViewController.m", 2087, @"Invalid parameter not satisfying: %@", @"item" object file lineNumber description];
  }
  uint64_t v9 = [[HUServiceDetailsViewController alloc] initWithServiceLikeItem:v7];
  id v10 = [(HUServiceDetailsViewController *)self presentationDelegate];
  [(HUServiceDetailsViewController *)v9 setPresentationDelegate:v10];

  [(HUServiceDetailsViewController *)v9 setRequiresPresentingViewControllerDismissal:0];
  id v11 = [MEMORY[0x1E4F1CA48] arrayWithObject:v9];
  objc_msgSend(v11, "na_safeAddObject:", v8);
  id v12 = [(HUServiceDetailsViewController *)self navigationController];
  objc_super v13 = [(HUServiceDetailsViewController *)self presentingViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    objc_opt_class();
    long long v15 = [(HUServiceDetailsViewController *)self presentingViewController];
    if (objc_opt_isKindOfClass()) {
      long long v16 = v15;
    }
    else {
      long long v16 = 0;
    }
    id v17 = v16;

    id v18 = [v17 viewControllers];
    objc_super v19 = objc_msgSend(v18, "na_firstObjectPassingTest:", &__block_literal_global_659);

    id v20 = [v19 quickControlViewController];
    long long v21 = [v20 presentationDelegate];
    [(HUServiceDetailsViewController *)v9 setPresentationDelegate:v21];

    id v12 = v17;
  }
  [v12 setViewControllers:v11 animated:0];

  return v9;
}

uint64_t __98__HUServiceDetailsViewController__magicallyUpdateNavigationStackForNewRootItem_topViewController___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)detailsViewControllerFor:(id)a3 item:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [[HUServiceDetailsViewController alloc] initWithServiceLikeItem:v6];

  id v8 = [v5 serviceContainingItem];
  objc_opt_class();
  LOBYTE(v6) = objc_opt_isKindOfClass();

  if (v6)
  {
    uint64_t v9 = [(HUServiceDetailsViewController *)v7 detailsItemManager];
    [v9 setShouldHideAccessoryItem:1];
  }
  else
  {
    id v10 = [v5 serviceContainingItem];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_6;
    }
    uint64_t v9 = [(HUServiceDetailsViewController *)v7 detailsItemManager];
    [v9 setShouldHideSeparateTileItem:1];
  }

LABEL_6:

  return v7;
}

- (BOOL)hasDetailsActionFor:(id)a3 item:(id)a4
{
  id v4 = a4;
  if ([v4 conformsToProtocol:&unk_1F1A3D558])
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (id)detailsViewControllerForContainedMediaAccessoryGridViewController:(id)a3 item:(id)a4
{
  id v4 = a4;
  id v5 = [[HUServiceDetailsViewController alloc] initWithServiceLikeItem:v4];

  return v5;
}

- (BOOL)hasDetailsActionForContainedServiceGridViewController:(id)a3 item:(id)a4
{
  return [a4 conformsToProtocol:&unk_1F1A3D558];
}

- (id)detailsViewControllerForContainedServiceGridViewController:(id)a3 item:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [[HUServiceDetailsViewController alloc] initWithServiceLikeItem:v6];

  id v8 = [v5 serviceContainerItem];
  objc_opt_class();
  LOBYTE(v6) = objc_opt_isKindOfClass();

  if (v6)
  {
    uint64_t v9 = [(HUServiceDetailsViewController *)v7 detailsItemManager];
    [v9 setShouldHideAccessoryItem:1];
  }
  else
  {
    id v10 = [v5 serviceContainerItem];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_6;
    }
    uint64_t v9 = [(HUServiceDetailsViewController *)v7 detailsItemManager];
    [v9 setShouldHideSeparateTileItem:1];
  }

LABEL_6:

  return v7;
}

- (void)editRoomViewControllerDidFinish:(id)a3 withNewRoom:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F69478]);
    uint64_t v9 = [v7 home];
    id v10 = (void *)[v8 initWithExistingObject:v7 inHome:v9];

    id v11 = [(HUServiceDetailsViewController *)self detailsItemManager];
    id v12 = [v11 selectRoom:v10];

    objc_initWeak(&location, self);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __78__HUServiceDetailsViewController_editRoomViewControllerDidFinish_withNewRoom___block_invoke;
    v17[3] = &unk_1E63874A0;
    objc_copyWeak(&v18, &location);
    id v13 = (id)[v12 addSuccessBlock:v17];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

    [(HUServiceDetailsViewController *)self dismissViewControllerAnimated:1 completion:0];
    if (v12)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __78__HUServiceDetailsViewController_editRoomViewControllerDidFinish_withNewRoom___block_invoke_2;
      v15[3] = &unk_1E63859F8;
      void v15[4] = self;
      id v16 = v7;
      id v14 = (id)[v12 addSuccessBlock:v15];
    }
  }
  else
  {
    [(HUServiceDetailsViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

void __78__HUServiceDetailsViewController_editRoomViewControllerDidFinish_withNewRoom___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v1 = [WeakRetained detailsItemManager];
  [v1 setShowRoomsList:0];
}

void __78__HUServiceDetailsViewController_editRoomViewControllerDidFinish_withNewRoom___block_invoke_2(uint64_t a1)
{
  int v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) name];
  [v1 _notifyOfHomeTheaterReconfigurationIfNecessary:v2];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(HUServiceDetailsViewController *)self tableView];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  id v10 = [(HUServiceDetailsViewController *)self tableView];
  id v11 = objc_msgSend(v10, "indexPathForRowAtPoint:", v7, v9);

  if (v11)
  {
    id v12 = [(HUItemTableViewController *)self itemManager];
    id v13 = [v12 displayedItemAtIndexPath:v11];

    id v14 = [(HUServiceDetailsViewController *)self detailsItemManager];
    long long v15 = [v14 accessoryInfoItemProvider];
    id v16 = [v15 items];
    char v17 = [v16 containsObject:v13];
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (void)_longPressRecognized:(id)a3
{
  id v17 = a3;
  if ([v17 state] == 1)
  {
    id v4 = [(HUServiceDetailsViewController *)self tableView];
    [v17 locationInView:v4];
    double v6 = v5;
    double v8 = v7;

    double v9 = [(HUServiceDetailsViewController *)self tableView];
    id v10 = objc_msgSend(v9, "indexPathForRowAtPoint:", v6, v8);

    objc_opt_class();
    id v11 = [(HUServiceDetailsViewController *)self tableView];
    id v12 = [v11 cellForRowAtIndexPath:v10];
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;

    if (v14 && [v14 allowCopyValueToPasteboard])
    {
      long long v15 = [MEMORY[0x1E4F42B88] sharedMenuController];
      [v14 becomeFirstResponder];
      id v16 = [(HUServiceDetailsViewController *)self view];
      [v14 frame];
      objc_msgSend(v15, "showMenuFromView:rect:", v16);
    }
  }
}

- (BOOL)_allowRowSelectionForItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || ([v4 isMemberOfClass:objc_opt_class()] & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || ([(HUServiceDetailsViewController *)self detailsItemManager],
        double v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 canToggleAccessoryInfoItem:v4],
        v5,
        (v6 & 1) != 0))
  {
    char v7 = 1;
  }
  else
  {
    double v9 = [MEMORY[0x1E4F1CA80] set];
    id v10 = [(HUServiceDetailsViewController *)self detailsItemManager];
    id v11 = [v10 addGroupItem];
    objc_msgSend(v9, "na_safeAddObject:", v11);

    id v12 = [(HUServiceDetailsViewController *)self detailsItemManager];
    id v13 = [v12 identifyHomePodItem];
    objc_msgSend(v9, "na_safeAddObject:", v13);

    id v14 = [(HUServiceDetailsViewController *)self detailsItemManager];
    long long v15 = [v14 separateTileItem];
    objc_msgSend(v9, "na_safeAddObject:", v15);

    id v16 = [(HUServiceDetailsViewController *)self detailsItemManager];
    id v17 = [v16 showContainedItems];
    objc_msgSend(v9, "na_safeAddObject:", v17);

    id v18 = [(HUServiceDetailsViewController *)self detailsItemManager];
    objc_super v19 = [v18 createNewRoomItem];
    objc_msgSend(v9, "na_safeAddObject:", v19);

    id v20 = [(HUServiceDetailsViewController *)self detailsItemManager];
    long long v21 = [v20 pairingModeItem];
    objc_msgSend(v9, "na_safeAddObject:", v21);

    uint64_t v22 = [(HUServiceDetailsViewController *)self detailsItemManager];
    long long v23 = [v22 exportDiagnosticsItem];
    int v24 = [v4 isEqual:v23];

    if (v24)
    {
      uint64_t v25 = [v4 latestResults];
      id v26 = [v25 objectForKeyedSubscript:*MEMORY[0x1E4F68898]];

      if (!v26 || [v26 isFinished])
      {
        id v27 = [(HUServiceDetailsViewController *)self detailsItemManager];
        id v28 = [v27 exportDiagnosticsItem];
        objc_msgSend(v9, "na_safeAddObject:", v28);
      }
    }
    uint64_t v29 = [(HUServiceDetailsViewController *)self detailsItemManager];
    unint64_t v30 = [v29 removeItem];
    objc_msgSend(v9, "na_safeAddObject:", v30);

    uint64_t v31 = [(HUServiceDetailsViewController *)self detailsItemManager];
    uint64_t v32 = [v31 removeFromGroupItem];
    objc_msgSend(v9, "na_safeAddObject:", v32);

    id v33 = [(HUServiceDetailsViewController *)self detailsItemManager];
    int v34 = [v33 resetItem];
    objc_msgSend(v9, "na_safeAddObject:", v34);

    id v35 = [(HUServiceDetailsViewController *)self detailsItemManager];
    id v36 = [v35 restartItem];
    objc_msgSend(v9, "na_safeAddObject:", v36);

    int v37 = [(HUServiceDetailsViewController *)self detailsItemManager];
    __int16 v38 = [v37 accessoryItem];
    objc_msgSend(v9, "na_safeAddObject:", v38);

    uint64_t v39 = [(HUServiceDetailsViewController *)self detailsItemManager];
    int v40 = [v39 alarmItem];
    objc_msgSend(v9, "na_safeAddObject:", v40);

    id v41 = [(HUServiceDetailsViewController *)self detailsItemManager];
    uint64_t v42 = [v41 lockPinCodesItem];
    objc_msgSend(v9, "na_safeAddObject:", v42);

    id v43 = [(HUServiceDetailsViewController *)self detailsItemManager];
    uint64_t v44 = [v43 statusAndNotificationItem];
    objc_msgSend(v9, "na_safeAddObject:", v44);

    uint64_t v45 = [(HUServiceDetailsViewController *)self detailsItemManager];
    v46 = [v45 homeTheaterAudioOutputItem];
    objc_msgSend(v9, "na_safeAddObject:", v46);

    id v47 = [(HUServiceDetailsViewController *)self detailsItemManager];
    id v48 = [v47 managedConfigurationProfilesItem];
    objc_msgSend(v9, "na_safeAddObject:", v48);

    v49 = [(HUServiceDetailsViewController *)self detailsItemManager];
    id v50 = [v49 roomItem];
    objc_msgSend(v9, "na_safeAddObject:", v50);

    int v51 = [(HUServiceDetailsViewController *)self detailsItemManager];
    id v52 = [v51 associatedServiceTypeItem];
    objc_msgSend(v9, "na_safeAddObject:", v52);

    int v53 = [(HUServiceDetailsViewController *)self detailsItemManager];
    int v54 = [v53 audioSettingsItem];
    objc_msgSend(v9, "na_safeAddObject:", v54);

    uint64_t v55 = [(HUServiceDetailsViewController *)self detailsItemManager];
    id v56 = [v55 internalDebuggingItem];
    objc_msgSend(v9, "na_safeAddObject:", v56);

    uint64_t v57 = [(HUServiceDetailsViewController *)self detailsItemManager];
    id v58 = [v57 splitMediaAccountUseDefaultAccountItem];
    objc_msgSend(v9, "na_safeAddObject:", v58);

    v59 = [(HUServiceDetailsViewController *)self detailsItemManager];
    int v60 = [v59 splitMediaAccountSignoutAccountItem];
    objc_msgSend(v9, "na_safeAddObject:", v60);

    v61 = [(HUServiceDetailsViewController *)self detailsItemManager];
    int v62 = [v61 cameraActivityZonesItem];
    objc_msgSend(v9, "na_safeAddObject:", v62);

    char v63 = [(HUServiceDetailsViewController *)self detailsItemManager];
    char v64 = [v63 cameraRecordingOptionsItem];
    objc_msgSend(v9, "na_safeAddObject:", v64);

    uint64_t v65 = [(HUServiceDetailsViewController *)self detailsItemManager];
    v66 = [v65 cameraFaceRecognitionItem];
    objc_msgSend(v9, "na_safeAddObject:", v66);

    v67 = [(HUServiceDetailsViewController *)self detailsItemManager];
    id v68 = [v67 collectDiagnosticsItem];
    objc_msgSend(v9, "na_safeAddObject:", v68);

    int v69 = [(HUServiceDetailsViewController *)self detailsItemManager];
    id v70 = [v69 lockAddHomeKeyToWalletItem];
    objc_msgSend(v9, "na_safeAddObject:", v70);

    if ([v9 containsObject:v4])
    {
      char v7 = 1;
    }
    else
    {
      uint64_t v71 = [(HUItemTableViewController *)self moduleControllerForItem:v4];
      int v72 = v71;
      if (v71 && ([v71 canSelectItem:v4] & 1) != 0) {
        goto LABEL_17;
      }
      id v73 = [(HUServiceDetailsViewController *)self detailsItemManager];
      v74 = [v73 existingRoomItemProvider];
      char v75 = [v74 items];
      char v76 = [v75 containsObject:v4];

      if (v76)
      {
LABEL_17:
        char v7 = 1;
      }
      else
      {
        int v77 = [(HUServiceDetailsViewController *)self detailsItemManager];
        v78 = [v77 suggestedRoomItemProvider];
        char v79 = [v78 items];
        char v7 = [v79 containsObject:v4];
      }
    }
  }
  return v7;
}

- (BOOL)_allowRowHighlightForItem:(id)a3
{
  id v4 = a3;
  double v5 = [(HUServiceDetailsViewController *)self detailsItemManager];
  char v6 = [v5 canToggleAccessoryInfoItem:v4];

  BOOL v7 = (v6 & 1) == 0
    && [(HUServiceDetailsViewController *)self _allowRowSelectionForItem:v4];

  return v7;
}

- (BOOL)_shouldShowDetailDisclosureForItem:(id)a3
{
  id v4 = a3;
  double v5 = [MEMORY[0x1E4F1CA80] set];
  char v6 = [(HUServiceDetailsViewController *)self detailsItemManager];
  BOOL v7 = [v6 showContainedItems];
  objc_msgSend(v5, "na_safeAddObject:", v7);

  double v8 = [(HUServiceDetailsViewController *)self detailsItemManager];
  double v9 = [v8 accessoryItem];
  objc_msgSend(v5, "na_safeAddObject:", v9);

  id v10 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v11 = [v10 alarmItem];
  objc_msgSend(v5, "na_safeAddObject:", v11);

  id v12 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v13 = [v12 lockPinCodesItem];
  objc_msgSend(v5, "na_safeAddObject:", v13);

  id v14 = [(HUServiceDetailsViewController *)self detailsItemManager];
  long long v15 = [v14 statusAndNotificationItem];
  objc_msgSend(v5, "na_safeAddObject:", v15);

  id v16 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v17 = [v16 homeTheaterAudioOutputItem];
  objc_msgSend(v5, "na_safeAddObject:", v17);

  id v18 = [(HUServiceDetailsViewController *)self detailsItemManager];
  objc_super v19 = [v18 audioSettingsItem];
  objc_msgSend(v5, "na_safeAddObject:", v19);

  id v20 = [(HUServiceDetailsViewController *)self detailsItemManager];
  long long v21 = [v20 internalDebuggingItem];
  objc_msgSend(v5, "na_safeAddObject:", v21);

  uint64_t v22 = [(HUServiceDetailsViewController *)self detailsItemManager];
  long long v23 = [v22 cameraRecordingOptionsItem];
  objc_msgSend(v5, "na_safeAddObject:", v23);

  int v24 = [(HUServiceDetailsViewController *)self detailsItemManager];
  uint64_t v25 = [v24 cameraFaceRecognitionItem];
  objc_msgSend(v5, "na_safeAddObject:", v25);

  id v26 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v27 = [v26 cameraActivityZonesItem];
  objc_msgSend(v5, "na_safeAddObject:", v27);

  if ([v5 containsObject:v4])
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char isKindOfClass = ![(HUServiceDetailsViewController *)self _shouldShowAddButtonForOptionItem:v4];
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
  }

  return isKindOfClass & 1;
}

- (BOOL)_shouldShowAddButtonForOptionItem:(id)a3
{
  id v3 = a3;
  id v4 = [v3 characteristics];
  double v5 = [v4 anyObject];

  char v6 = [v3 triggerValue];
  BOOL v7 = objc_msgSend(v5, "hf_designatedEventTriggerForProgrammableSwitchWithTriggerValue:", v6);

  double v8 = [v3 latestResults];

  double v9 = [v8 objectForKey:@"itemIsEditable"];
  char v10 = [v9 BOOLValue];

  if (v7) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = v10;
  }

  return v11;
}

- (void)checkForAccessoriesNeedingReprovisioning
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  id v3 = [(HUItemTableViewController *)self itemManager];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  char v6 = [v5 sourceItemAccessory];

  BOOL v7 = [v6 home];
  if (![v6 accessoryReprovisionState])
  {
    if (!objc_msgSend(v6, "hf_needsReprovisioningCheck")) {
      goto LABEL_10;
    }
    [v7 startSearchForAccessoriesNeedingReprovisioning];
  }
  double v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    char v10 = v6;
    __int16 v11 = 2048;
    uint64_t v12 = [v6 accessoryReprovisionState];
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "checkForAccessoriesNeedingReprovisioning accessory %@ state %lu", (uint8_t *)&v9, 0x16u);
  }

LABEL_10:
}

- (void)_restartGroupedHomePodAccessory
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    char v6 = "-[HUServiceDetailsViewController _restartGroupedHomePodAccessory]";
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(HUServiceDetailsViewController *)self detailsItemManager];
  [v4 restartAccessory];
}

- (void)_presentResetHomePodConfirmation:(id)a3
{
  id v4 = a3;
  int v5 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsRestartHomePodAlertButtonTitle", @"HUServiceDetailsRestartHomePodAlertButtonTitle", 1);
  char v6 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsRemoveDeviceName", @"HUServiceDetailsRemoveDeviceName", 1);
  uint64_t v7 = [(UITableViewController *)self hu_actionSheetWithTitle:0 message:0 indexPath:v4];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__HUServiceDetailsViewController__presentResetHomePodConfirmation___block_invoke;
  v17[3] = &unk_1E6385188;
  void v17[4] = self;
  double v8 = [MEMORY[0x1E4F42720] actionWithTitle:v5 style:0 handler:v17];
  [v7 addAction:v8];

  int v9 = (void *)MEMORY[0x1E4F42720];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__HUServiceDetailsViewController__presentResetHomePodConfirmation___block_invoke_667;
  v15[3] = &unk_1E6389708;
  void v15[4] = self;
  id v16 = v4;
  id v10 = v4;
  __int16 v11 = [v9 actionWithTitle:v6 style:2 handler:v15];
  [v7 addAction:v11];

  uint64_t v12 = (void *)MEMORY[0x1E4F42720];
  uint64_t v13 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsRemoveDeviceAlertCancelButton", @"HUServiceDetailsRemoveDeviceAlertCancelButton", 1);
  id v14 = [v12 actionWithTitle:v13 style:1 handler:&__block_literal_global_673];
  [v7 addAction:v14];

  [(HUServiceDetailsViewController *)self presentViewController:v7 animated:1 completion:0];
}

void __67__HUServiceDetailsViewController__presentResetHomePodConfirmation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [v3 title];
    int v6 = 136315394;
    uint64_t v7 = "-[HUServiceDetailsViewController _presentResetHomePodConfirmation:]_block_invoke";
    __int16 v8 = 2112;
    int v9 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped restart homepod button '%@' from alert", (uint8_t *)&v6, 0x16u);
  }
  [*(id *)(a1 + 32) _restartHomePod];
}

void __67__HUServiceDetailsViewController__presentResetHomePodConfirmation___block_invoke_667(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [v3 title];
    int v6 = 136315394;
    uint64_t v7 = "-[HUServiceDetailsViewController _presentResetHomePodConfirmation:]_block_invoke";
    __int16 v8 = 2112;
    int v9 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped remove accessory '%@' from alert", (uint8_t *)&v6, 0x16u);
  }
  [*(id *)(a1 + 32) _presentRemoveConfirmation:*(void *)(a1 + 40)];
}

void __67__HUServiceDetailsViewController__presentResetHomePodConfirmation___block_invoke_671(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v2 title];
    int v5 = 136315394;
    int v6 = "-[HUServiceDetailsViewController _presentResetHomePodConfirmation:]_block_invoke";
    __int16 v7 = 2112;
    __int16 v8 = v4;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "(%s) User tapped remove device '%@' from alert", (uint8_t *)&v5, 0x16u);
  }
}

- (void)_exportDiagnosticsForItem:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v24 = "-[HUServiceDetailsViewController _exportDiagnosticsForItem:]";
    __int16 v25 = 2112;
    id v26 = self;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%s(%@)initiating 'Export Diagnostics'", buf, 0x16u);
  }

  int v6 = [(HUServiceDetailsViewController *)self detailsItemManager];
  __int16 v7 = [v6 sourceItemAccessory];
  __int16 v8 = [v7 mediaProfile];

  uint64_t v9 = objc_msgSend(v8, "hf_settingsAdapterManager");
  uint64_t v10 = [v9 adapterForIdentifier:*MEMORY[0x1E4F67FA8]];
  __int16 v11 = &unk_1F1AD9270;
  if ([v10 conformsToProtocol:v11]) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  if (!v13) {
    NSLog(&cfstr_AdapterDoesnTE.isa);
  }
  id v14 = [v13 handleButtonPressForEntity:0];
  long long v15 = HFLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "Sysdiagnose request sent", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __60__HUServiceDetailsViewController__exportDiagnosticsForItem___block_invoke;
  v19[3] = &unk_1E638C7B8;
  objc_copyWeak(&v22, (id *)buf);
  id v16 = v4;
  id v20 = v16;
  id v17 = v13;
  id v21 = v17;
  id v18 = (id)[v14 flatMap:v19];
  [(HUServiceDetailsViewController *)self _registerButtonActionHandler:v14 item:v16];

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);
}

id __60__HUServiceDetailsViewController__exportDiagnosticsForItem___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_opt_class();
  id v5 = v3;
  if (objc_opt_isKindOfClass()) {
    int v6 = v5;
  }
  else {
    int v6 = 0;
  }
  id v7 = v6;

  __int16 v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v40 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "Sysdiagnose request completed with results: %@", buf, 0xCu);
  }

  id v9 = objc_alloc(MEMORY[0x1E4F42718]);
  uint64_t v10 = HFLocalizedString();
  __int16 v38 = v10;
  __int16 v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
  uint64_t v12 = (void *)[v9 initWithActivityItems:v11 applicationActivities:0];

  id v13 = [WeakRetained tableView];
  id v14 = [WeakRetained itemManager];
  long long v15 = [v14 indexPathForItem:*(void *)(a1 + 32)];
  id v16 = [v13 cellForRowAtIndexPath:v15];

  id v17 = [v12 popoverPresentationController];
  [v17 setSourceView:v16];

  [v16 frame];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  id v26 = [v12 popoverPresentationController];
  objc_msgSend(v26, "setSourceRect:", v19, v21, v23, v25);

  uint64_t v31 = MEMORY[0x1E4F143A8];
  uint64_t v32 = 3221225472;
  id v33 = __60__HUServiceDetailsViewController__exportDiagnosticsForItem___block_invoke_689;
  int v34 = &unk_1E6386340;
  id v35 = v12;
  id v36 = *(id *)(a1 + 40);
  id v37 = v7;
  id v27 = v7;
  id v28 = v12;
  [WeakRetained presentViewController:v28 animated:0 completion:&v31];
  uint64_t v29 = objc_msgSend(MEMORY[0x1E4F7A0D8], "futureWithNoResult", v31, v32, v33, v34);

  return v29;
}

void __60__HUServiceDetailsViewController__exportDiagnosticsForItem___block_invoke_689(id *a1)
{
  id v2 = [a1[4] presentingViewController];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__HUServiceDetailsViewController__exportDiagnosticsForItem___block_invoke_2;
  v3[3] = &unk_1E63850E0;
  id v4 = a1[5];
  id v5 = a1[6];
  [v2 dismissViewControllerAnimated:0 completion:v3];
}

void __60__HUServiceDetailsViewController__exportDiagnosticsForItem___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F69758] deviceAirDropIdentifier];
  if (v2)
  {
    id v3 = HFLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v2;
      _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "Share Sheet has generated AirPlayId (%@) making 'airdrop sysdiagnose' request...", (uint8_t *)&v8, 0xCu);
    }

    objc_opt_class();
    id v4 = *(id *)(a1 + 32);
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    int v6 = v5;

    id v7 = (id)[v6 airDropSysdiagnose:*(void *)(a1 + 40)];
  }
  else
  {
    NSLog(&cfstr_AirdropIdentif.isa);
    int v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8) = 0;
      _os_log_error_impl(&dword_1BE345000, v6, OS_LOG_TYPE_ERROR, "Share Sheet failed to generate AirPlayID", (uint8_t *)&v8, 2u);
    }
  }
}

- (void)_presentRemoveFromGroupConfirmation:(id)a3
{
  id v4 = a3;
  id v5 = [(HUServiceDetailsViewController *)self namingComponent];
  int v6 = [v5 name];
  id v13 = HULocalizedStringWithFormat(@"HURemoveFromGroupMessage", @"%@", v7, v8, v9, v10, v11, v12, (uint64_t)v6);

  id v14 = [(UITableViewController *)self hu_actionSheetWithTitle:0 message:v13 indexPath:v4];

  long long v15 = (void *)MEMORY[0x1E4F42720];
  id v16 = _HULocalizedStringWithDefaultValue(@"HURemoveTitle", @"HURemoveTitle", 1);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __70__HUServiceDetailsViewController__presentRemoveFromGroupConfirmation___block_invoke;
  v21[3] = &unk_1E6385188;
  v21[4] = self;
  id v17 = [v15 actionWithTitle:v16 style:2 handler:v21];
  [v14 addAction:v17];

  double v18 = (void *)MEMORY[0x1E4F42720];
  double v19 = _HULocalizedStringWithDefaultValue(@"HUCancelTitle", @"HUCancelTitle", 1);
  double v20 = [v18 actionWithTitle:v19 style:1 handler:&__block_literal_global_705];
  [v14 addAction:v20];

  [(HUServiceDetailsViewController *)self presentViewController:v14 animated:1 completion:0];
}

void __70__HUServiceDetailsViewController__presentRemoveFromGroupConfirmation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 title];
    int v7 = 136315394;
    uint64_t v8 = "-[HUServiceDetailsViewController _presentRemoveFromGroupConfirmation:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped remove button '%@' from alert", (uint8_t *)&v7, 0x16u);
  }
  id v6 = (id)[*(id *)(a1 + 32) _removeFromGroup];
}

void __70__HUServiceDetailsViewController__presentRemoveFromGroupConfirmation___block_invoke_703(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v2 title];
    int v5 = 136315394;
    id v6 = "-[HUServiceDetailsViewController _presentRemoveFromGroupConfirmation:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "(%s) User tapped cancel button '%@' from alert", (uint8_t *)&v5, 0x16u);
  }
}

- (void)_presentRemoveConfirmation:(id)a3
{
  id v7 = a3;
  id v4 = [(HUServiceDetailsViewController *)self detailsItemManager];
  int v5 = [v4 sourceItemAccessory];
  int v6 = [v5 supportsCHIP];

  if (v6) {
    [(HUServiceDetailsViewController *)self _presentEcosystemAccessoryRemoveConfirmation:v7];
  }
  else {
    [(HUServiceDetailsViewController *)self _presentHomeAccessoryRemoveConfirmation:v7];
  }
}

- (void)_presentEcosystemAccessoryRemoveConfirmation:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  objc_opt_class();
  int v5 = [(HUServiceDetailsViewController *)self detailsItemManager];
  int v6 = [v5 connectedServicesItemModule];
  id v7 = [v6 connectedServicesItemProvider];
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  uint64_t v10 = [v9 connectedEcosystemsFuture];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__HUServiceDetailsViewController__presentEcosystemAccessoryRemoveConfirmation___block_invoke;
  v13[3] = &unk_1E638C948;
  objc_copyWeak(&v15, &location);
  id v11 = v4;
  id v14 = v11;
  id v12 = (id)[v10 addCompletionBlock:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __79__HUServiceDetailsViewController__presentEcosystemAccessoryRemoveConfirmation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = [HUMatterAccessoryRemovalHelper alloc];
  id v9 = [WeakRetained item];
  uint64_t v10 = [v5 allKeys];
  id v11 = [(HUMatterAccessoryRemovalHelper *)v8 initWithItem:v9 connectedEcosystems:v10];

  if ([(HUMatterAccessoryRemovalHelper *)v11 shouldUseEcosystemRemovalConfirmation])
  {
    id v26 = v6;
    id v12 = [WeakRetained namingComponent];
    id v13 = [v12 name];
    [(HUMatterAccessoryRemovalHelper *)v11 matterAccessoryGenerateRemovalConfirmationForAccessoryName:v13];

    id v14 = [(HUMatterAccessoryRemovalHelper *)v11 title];
    id v15 = objc_msgSend(WeakRetained, "hu_actionSheetWithTitle:message:indexPath:", 0, v14, *(void *)(a1 + 32));

    id v16 = (void *)MEMORY[0x1E4F42720];
    id v17 = [(HUMatterAccessoryRemovalHelper *)v11 removalActionTitle];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __79__HUServiceDetailsViewController__presentEcosystemAccessoryRemoveConfirmation___block_invoke_2;
    v31[3] = &unk_1E6389218;
    objc_copyWeak(&v34, (id *)(a1 + 40));
    double v18 = v11;
    uint64_t v32 = v18;
    id v33 = *(id *)(a1 + 32);
    double v19 = [v16 actionWithTitle:v17 style:2 handler:v31];
    [v15 addAction:v19];

    double v20 = (void *)MEMORY[0x1E4F42720];
    double v21 = [(HUMatterAccessoryRemovalHelper *)v18 resetAllActionTitle];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __79__HUServiceDetailsViewController__presentEcosystemAccessoryRemoveConfirmation___block_invoke_712;
    v27[3] = &unk_1E6389218;
    objc_copyWeak(&v30, (id *)(a1 + 40));
    id v28 = v18;
    id v29 = *(id *)(a1 + 32);
    double v22 = [v20 actionWithTitle:v21 style:2 handler:v27];
    [v15 addAction:v22];

    double v23 = (void *)MEMORY[0x1E4F42720];
    double v24 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsRemoveDeviceAlertCancelButton", @"HUServiceDetailsRemoveDeviceAlertCancelButton", 1);
    double v25 = [v23 actionWithTitle:v24 style:1 handler:&__block_literal_global_720];
    [v15 addAction:v25];

    [WeakRetained presentViewController:v15 animated:1 completion:0];
    objc_destroyWeak(&v30);

    objc_destroyWeak(&v34);
    id v6 = v26;
  }
  else
  {
    [WeakRetained _presentHomeAccessoryRemoveConfirmation:*(void *)(a1 + 32)];
  }
}

void __79__HUServiceDetailsViewController__presentEcosystemAccessoryRemoveConfirmation___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    double v19 = "-[HUServiceDetailsViewController _presentEcosystemAccessoryRemoveConfirmation:]_block_invoke_2";
    __int16 v20 = 2112;
    id v21 = v3;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "(%s) User tapped '%@' from alert", buf, 0x16u);
  }

  id v7 = (id *)(a1 + 32);
  uint64_t v8 = [*(id *)(a1 + 32) removalActionConfirmationTitle];
  id v9 = objc_msgSend(WeakRetained, "hu_actionSheetWithTitle:message:indexPath:", 0, v8, *(void *)(a1 + 40));

  uint64_t v10 = (void *)MEMORY[0x1E4F42720];
  id v11 = [*v7 removalActionConfirmationButtonTitle];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__HUServiceDetailsViewController__presentEcosystemAccessoryRemoveConfirmation___block_invoke_708;
  v16[3] = &unk_1E638C920;
  objc_copyWeak(&v17, v4);
  id v12 = [v10 actionWithTitle:v11 style:2 handler:v16];
  [v9 addAction:v12];

  id v13 = (void *)MEMORY[0x1E4F42720];
  id v14 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsRemoveDeviceAlertCancelButton", @"HUServiceDetailsRemoveDeviceAlertCancelButton", 1);
  id v15 = [v13 actionWithTitle:v14 style:1 handler:&__block_literal_global_711];
  [v9 addAction:v15];

  [WeakRetained presentViewController:v9 animated:1 completion:0];
  objc_destroyWeak(&v17);
}

void __79__HUServiceDetailsViewController__presentEcosystemAccessoryRemoveConfirmation___block_invoke_708(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[HUServiceDetailsViewController _presentEcosystemAccessoryRemoveConfirmation:]_block_invoke";
    __int16 v9 = 2114;
    id v10 = v3;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "(%s) User tapped removal '%{public}@' from alert", (uint8_t *)&v7, 0x16u);
  }

  id v6 = (id)[WeakRetained _removeItem];
}

void __79__HUServiceDetailsViewController__presentEcosystemAccessoryRemoveConfirmation___block_invoke_709(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    id v5 = "-[HUServiceDetailsViewController _presentEcosystemAccessoryRemoveConfirmation:]_block_invoke";
    __int16 v6 = 2114;
    id v7 = v2;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "(%s) User tapped remove device '%{public}@' from alert", (uint8_t *)&v4, 0x16u);
  }
}

void __79__HUServiceDetailsViewController__presentEcosystemAccessoryRemoveConfirmation___block_invoke_712(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  __int16 v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v3 title];
    *(_DWORD *)buf = 136315394;
    __int16 v20 = "-[HUServiceDetailsViewController _presentEcosystemAccessoryRemoveConfirmation:]_block_invoke";
    __int16 v21 = 2112;
    uint64_t v22 = v7;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "(%s) User tapped reset all action '%@' from alert", buf, 0x16u);
  }
  uint64_t v8 = (id *)(a1 + 32);
  __int16 v9 = [*(id *)(a1 + 32) resetAllActionConfirmationTitle];
  id v10 = objc_msgSend(WeakRetained, "hu_actionSheetWithTitle:message:indexPath:", 0, v9, *(void *)(a1 + 40));

  uint64_t v11 = (void *)MEMORY[0x1E4F42720];
  id v12 = [*v8 resetAllActionConfirmationButtonTitle];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __79__HUServiceDetailsViewController__presentEcosystemAccessoryRemoveConfirmation___block_invoke_713;
  v17[3] = &unk_1E638C920;
  objc_copyWeak(&v18, v4);
  id v13 = [v11 actionWithTitle:v12 style:2 handler:v17];
  [v10 addAction:v13];

  id v14 = (void *)MEMORY[0x1E4F42720];
  id v15 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsRemoveDeviceAlertCancelButton", @"HUServiceDetailsRemoveDeviceAlertCancelButton", 1);
  id v16 = [v14 actionWithTitle:v15 style:1 handler:&__block_literal_global_717];
  [v10 addAction:v16];

  [WeakRetained presentViewController:v10 animated:1 completion:0];
  objc_destroyWeak(&v18);
}

void __79__HUServiceDetailsViewController__presentEcosystemAccessoryRemoveConfirmation___block_invoke_713(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v6 = [v3 title];
    *(_DWORD *)buf = 136315394;
    id v14 = "-[HUServiceDetailsViewController _presentEcosystemAccessoryRemoveConfirmation:]_block_invoke";
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "(%s) User tapped reset all action confirmation button '%@' from alert", buf, 0x16u);
  }
  id v7 = [WeakRetained itemManager];
  uint64_t v8 = [v7 home];
  __int16 v9 = [WeakRetained item];
  id v10 = [v9 accessories];
  uint64_t v11 = [v10 anyObject];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__HUServiceDetailsViewController__presentEcosystemAccessoryRemoveConfirmation___block_invoke_714;
  v12[3] = &unk_1E6386708;
  v12[4] = WeakRetained;
  [v8 resetAndRemoveAllCHIPPairingsFromAccessory:v11 completion:v12];
}

void __79__HUServiceDetailsViewController__presentEcosystemAccessoryRemoveConfirmation___block_invoke_714(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) setRequiresPresentingViewControllerDismissal:1];
  int v4 = [*(id *)(a1 + 32) presentationDelegate];
  id v5 = (id)[v4 finishPresentation:*(void *)(a1 + 32) animated:1];

  __int16 v6 = HFLogForCategory();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_error_impl(&dword_1BE345000, v7, OS_LOG_TYPE_ERROR, "failed to remove accessory from all connected ecosystems, error: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "Removed accessory from all connected ecosystems", (uint8_t *)&v8, 2u);
  }
}

void __79__HUServiceDetailsViewController__presentEcosystemAccessoryRemoveConfirmation___block_invoke_715(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    id v5 = "-[HUServiceDetailsViewController _presentEcosystemAccessoryRemoveConfirmation:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "(%s) User tapped '%@' from alert", (uint8_t *)&v4, 0x16u);
  }
}

void __79__HUServiceDetailsViewController__presentEcosystemAccessoryRemoveConfirmation___block_invoke_718(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    id v5 = "-[HUServiceDetailsViewController _presentEcosystemAccessoryRemoveConfirmation:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "(%s) User tapped '%@' from alert", (uint8_t *)&v4, 0x16u);
  }
}

- (void)_presentHomeAccessoryRemoveConfirmation:(id)a3
{
  id v4 = a3;
  id v5 = [(HUServiceDetailsViewController *)self item];
  if ([v5 conformsToProtocol:&unk_1F1A3D6E8]) {
    __int16 v6 = v5;
  }
  else {
    __int16 v6 = 0;
  }
  id v7 = v6;

  uint64_t v8 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsRemoveGroupAlertTitle", @"HUServiceDetailsRemoveGroupAlertTitle", 1);
  id v9 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsRemoveGroupAlertButton", @"HUServiceDetailsRemoveGroupAlertButton", 1);
  objc_opt_class();
  uint64_t v10 = [(HUServiceDetailsViewController *)self item];
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  char v13 = [v7 isItemGroup];
  if ((v13 & 1) == 0)
  {
    id v14 = [(HUServiceDetailsViewController *)self namingComponent];
    __int16 v15 = [v14 name];
    uint64_t v22 = HULocalizedStringWithFormat(@"HUServiceDetailsRemoveDeviceAlertTitle", @"%@", v16, v17, v18, v19, v20, v21, (uint64_t)v15);

    uint64_t v23 = _HULocalizedStringWithDefaultValue(@"HURemoveTitle", @"HURemoveTitle", 1);

    objc_opt_class();
    double v24 = [(HUServiceDetailsViewController *)self item];
    if (objc_opt_isKindOfClass()) {
      double v25 = v24;
    }
    else {
      double v25 = 0;
    }
    id v26 = v25;

    id v27 = [v26 profile];

    LODWORD(v26) = objc_msgSend(v27, "hf_supportsRecordingEvents");
    if (v26)
    {
      id v28 = [(HUServiceDetailsViewController *)self namingComponent];
      id v29 = [v28 name];
      uint64_t v36 = HULocalizedStringWithFormat(@"HUServiceDetailsRemoveCameraWithClipsAlertTitle", @"%@", v30, v31, v32, v33, v34, v35, (uint64_t)v29);

      uint64_t v37 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsRemoveDeviceAlertRemoveCameraButton", @"HUServiceDetailsRemoveDeviceAlertRemoveCameraButton", 1);

      uint64_t v23 = (void *)v37;
      uint64_t v22 = (void *)v36;
    }
    objc_opt_class();
    __int16 v38 = [(HUServiceDetailsViewController *)self item];
    if (objc_opt_isKindOfClass()) {
      uint64_t v39 = v38;
    }
    else {
      uint64_t v39 = 0;
    }

    id v114 = v4;
    if (v39)
    {
      id v40 = NSString;
      uint64_t v41 = HULocalizedWiFiString(@"HUServiceDetailsRemoveRouterAlertTitle");
      uint64_t v42 = [(HUServiceDetailsViewController *)self namingComponent];
      id v43 = [v42 name];
      uint64_t v44 = [v40 stringWithValidatedFormat:v41, @"%@", 0, v43 validFormatSpecifiers error];

      uint64_t v22 = (void *)v44;
    }
    uint64_t v45 = [v12 accessories];
    int v46 = objc_msgSend(v45, "na_any:", &__block_literal_global_742);

    id v47 = [v12 accessories];
    id v48 = objc_msgSend(v47, "na_firstObjectPassingTest:", &__block_literal_global_744);
    v49 = objc_msgSend(v48, "hf_displayName");

    if (v46)
    {
      uint64_t v56 = HULocalizedStringWithFormat(@"HUServiceDetailsRemoveHomePodAlertTitle", @"%@", v50, v51, v52, v53, v54, v55, (uint64_t)v49);

      uint64_t v22 = (void *)v56;
    }
    objc_opt_class();
    uint64_t v57 = [(HUServiceDetailsViewController *)self item];
    if (objc_opt_isKindOfClass()) {
      id v58 = v57;
    }
    else {
      id v58 = 0;
    }
    id v59 = v58;

    v113 = v23;
    if (v59)
    {
      int v60 = [v59 service];
      v61 = [v60 accessory];
      int v62 = objc_msgSend(v61, "hf_isHomePod");

      if (v62)
      {
        char v63 = [v59 service];
        char v64 = [v63 accessory];
        uint64_t v65 = objc_msgSend(v64, "hf_displayName");

        v66 = [v59 service];
        v67 = [v66 name];

        uint64_t v74 = HULocalizedStringWithFormat(@"HUServiceDetailsRemoveAccessoryWithServiceAlertTitle", @"%@%@", v68, v69, v70, v71, v72, v73, (uint64_t)v67);

        v49 = (void *)v65;
        uint64_t v22 = (void *)v74;
      }
    }
    char v75 = [v12 accessories];
    char v76 = [v75 allObjects];
    int v77 = [v76 firstObject];

    v78 = [v12 home];
    char v79 = objc_msgSend(v78, "hf_enabledResidentDevices");
    if ([v79 count] == 1)
    {
      v111 = v49;
      v112 = v22;
      int v80 = [v12 home];
      id v81 = objc_msgSend(v80, "hf_enabledResidentDevices");
      id v82 = objc_msgSend(v77, "hf_linkedResidentDevice");
      int v83 = [v81 containsObject:v82];

      if (!v83 || (objc_msgSend(v77, "hf_isHomePod") & 1) == 0 && !objc_msgSend(v77, "hf_isAppleTV"))
      {
        id v9 = v113;
        id v4 = v114;
        v49 = v111;
        uint64_t v22 = v112;
        goto LABEL_33;
      }
      v78 = objc_msgSend(v77, "hf_displayName");
      uint64_t v22 = HULocalizedStringWithFormat(@"HUServiceDetailsRemoveLastResidentAlertTitle", @"%@", v84, v85, v86, v87, v88, v89, (uint64_t)v78);
      v49 = v111;
      char v79 = v112;
    }

    id v9 = v113;
    id v4 = v114;
LABEL_33:

    uint64_t v8 = v22;
  }
  int v90 = [(HUServiceDetailsViewController *)self item];
  v91 = [v90 accessories];
  int v92 = objc_msgSend(v91, "na_any:", &__block_literal_global_755);

  if (v92)
  {
    v110 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsRemoveDeviceAlertTitleManualNetworkReconfiguration", @"HUServiceDetailsRemoveDeviceAlertTitleManualNetworkReconfiguration", 1);
    uint64_t v99 = HULocalizedStringWithFormat(@"HUServiceDetailsRemoveDeviceAlertTitleManualNetworkReconfiguration_Format", @"%@%@", v93, v94, v95, v96, v97, v98, (uint64_t)v8);

    uint64_t v8 = (void *)v99;
  }
  if ([v12 mediaAccessoryItemType] == 4)
  {
    uint64_t v100 = [(HUServiceDetailsViewController *)self detailsItemManager];
    v101 = [v100 home];
    int v102 = [v12 mediaProfileContainer];
    v103 = objc_msgSend(v101, "hf_relatedHomeTheaterMediaProfileContainerFor:", v102);

    if (v103)
    {
      uint64_t v104 = _HULocalizedStringWithDefaultValue(@"HUBreakHomeTheaterAlert_Body", @"HUBreakHomeTheaterAlert_Body", 1);

      uint64_t v8 = (void *)v104;
    }
  }
  BOOL v105 = [(UITableViewController *)self hu_actionSheetWithTitle:0 message:v8 indexPath:v4];
  v115[0] = MEMORY[0x1E4F143A8];
  v115[1] = 3221225472;
  v115[2] = __74__HUServiceDetailsViewController__presentHomeAccessoryRemoveConfirmation___block_invoke_5;
  v115[3] = &unk_1E6385188;
  v115[4] = self;
  v106 = [MEMORY[0x1E4F42720] actionWithTitle:v9 style:2 handler:v115];
  [v105 addAction:v106];

  v107 = (void *)MEMORY[0x1E4F42720];
  v108 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsRemoveDeviceAlertCancelButton", @"HUServiceDetailsRemoveDeviceAlertCancelButton", 1);
  int v109 = [v107 actionWithTitle:v108 style:1 handler:&__block_literal_global_770];
  [v105 addAction:v109];

  [(HUServiceDetailsViewController *)self presentViewController:v105 animated:1 completion:0];
}

uint64_t __74__HUServiceDetailsViewController__presentHomeAccessoryRemoveConfirmation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 category];
  id v3 = [v2 categoryType];
  uint64_t v4 = [v3 isEqualToString:*MEMORY[0x1E4F2C1D0]];

  return v4;
}

uint64_t __74__HUServiceDetailsViewController__presentHomeAccessoryRemoveConfirmation___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isHomePod");
}

uint64_t __74__HUServiceDetailsViewController__presentHomeAccessoryRemoveConfirmation___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(a2, "hf_networkConfigurationProfiles");
  uint64_t v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_758);

  return v3;
}

uint64_t __74__HUServiceDetailsViewController__presentHomeAccessoryRemoveConfirmation___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_requiresWiFiReconfiguration");
}

void __74__HUServiceDetailsViewController__presentHomeAccessoryRemoveConfirmation___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    id v9 = "-[HUServiceDetailsViewController _presentHomeAccessoryRemoveConfirmation:]_block_invoke_5";
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped '%@' from alert", (uint8_t *)&v8, 0x16u);
  }

  int v5 = [*(id *)(a1 + 32) _shouldPresentRemoveRouterConfirmation];
  __int16 v6 = *(void **)(a1 + 32);
  if (v5) {
    [v6 _presentRemoveRouterConfirmation];
  }
  else {
    id v7 = (id)[v6 _removeItem];
  }
}

void __74__HUServiceDetailsViewController__presentHomeAccessoryRemoveConfirmation___block_invoke_768(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    int v5 = "-[HUServiceDetailsViewController _presentHomeAccessoryRemoveConfirmation:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "(%s) User tapped '%@' from alert", (uint8_t *)&v4, 0x16u);
  }
}

- (BOOL)_shouldPresentRemoveRouterConfirmation
{
  objc_opt_class();
  id v3 = [(HUServiceDetailsViewController *)self item];
  if (objc_opt_isKindOfClass()) {
    int v4 = v3;
  }
  else {
    int v4 = 0;
  }
  id v5 = v4;
  if (v5)
  {
    __int16 v6 = [(HUItemTableViewController *)self itemManager];
    id v7 = [v6 home];
    uint64_t v8 = objc_msgSend(v7, "hf_accessoriesRequiringManualWiFiReconfiguration");
    BOOL v9 = [v8 count] != 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_presentRemoveRouterConfirmation
{
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__HUServiceDetailsViewController__presentRemoveRouterConfirmation__block_invoke;
  aBlock[3] = &unk_1E638C920;
  objc_copyWeak(&v26, &location);
  id v3 = _Block_copy(aBlock);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __66__HUServiceDetailsViewController__presentRemoveRouterConfirmation__block_invoke_2;
  v23[3] = &unk_1E638C920;
  objc_copyWeak(&v24, &location);
  int v4 = _Block_copy(v23);
  id v5 = [(HUItemTableViewController *)self itemManager];
  __int16 v6 = [v5 home];
  id v7 = objc_msgSend(v6, "hf_accessoriesRequiringManualWiFiReconfiguration");
  uint64_t v8 = [v7 count];

  BOOL v9 = HULocalizedWiFiString(@"HUNetworkRouterRemoveAlertTitle");
  __int16 v10 = NSString;
  id v11 = HULocalizedWiFiString(@"HUNetworkRouterRemoveAlertDescriptionFormat");
  uint64_t v12 = objc_msgSend(v10, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v11, @"%ld", 0, v8);

  char v13 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v9 message:v12 preferredStyle:1];
  id v14 = (void *)MEMORY[0x1E4F42720];
  __int16 v15 = _HULocalizedStringWithDefaultValue(@"HUNetworkRouterRemoveAlertButtonRemove", @"HUNetworkRouterRemoveAlertButtonRemove", 1);
  uint64_t v16 = [v14 actionWithTitle:v15 style:2 handler:v3];
  [v13 addAction:v16];

  uint64_t v17 = (void *)MEMORY[0x1E4F42720];
  uint64_t v18 = _HULocalizedStringWithDefaultValue(@"HUNetworkRouterRemoveAlertButtonMoreInformation", @"HUNetworkRouterRemoveAlertButtonMoreInformation", 1);
  uint64_t v19 = [v17 actionWithTitle:v18 style:0 handler:v4];
  [v13 addAction:v19];

  uint64_t v20 = (void *)MEMORY[0x1E4F42720];
  uint64_t v21 = _HULocalizedStringWithDefaultValue(@"HUNetworkRouterRemoveAlertButtonCancel", @"HUNetworkRouterRemoveAlertButtonCancel", 1);
  uint64_t v22 = [v20 actionWithTitle:v21 style:1 handler:0];
  [v13 addAction:v22];

  [(HUServiceDetailsViewController *)self presentViewController:v13 animated:1 completion:0];
  objc_destroyWeak(&v24);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __66__HUServiceDetailsViewController__presentRemoveRouterConfirmation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = (id)[WeakRetained _removeItem];
}

void __66__HUServiceDetailsViewController__presentRemoveRouterConfirmation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [HURemoveNetworkRouterMoreInformationViewController alloc];
  id v2 = [WeakRetained itemManager];
  id v3 = [v2 home];
  int v4 = [(HURemoveNetworkRouterMoreInformationViewController *)v1 initWithHome:v3];

  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v4];
  [WeakRetained presentViewController:v5 animated:1 completion:0];
}

- (id)_roomForItem:(id)a3
{
  id v3 = a3;
  if ([v3 conformsToProtocol:&unk_1F1A3D558]) {
    int v4 = v3;
  }
  else {
    int v4 = 0;
  }
  id v5 = [v4 homeKitObject];

  if ([v5 conformsToProtocol:&unk_1F1A6A1B0]) {
    __int16 v6 = v5;
  }
  else {
    __int16 v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    uint64_t v8 = objc_msgSend(v7, "hf_parentRoom");
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)_presentTriggerEditorForProgrammableSwitchEventOptionItem:(id)a3
{
  id v35 = a3;
  int v4 = [v35 characteristics];
  id v5 = [v4 anyObject];
  __int16 v6 = objc_msgSend(v5, "hf_home");

  id v7 = [v35 characteristics];
  uint64_t v8 = objc_msgSend(v7, "na_firstObjectPassingTest:", &__block_literal_global_792);

  if (v8)
  {
    if (objc_msgSend(v6, "hf_currentUserIsAdministrator"))
    {
      BOOL v9 = [v35 latestResults];
      __int16 v10 = [v9 objectForKey:@"itemIsEditable"];
      int v11 = [v10 BOOLValue];

      if (v11)
      {
        uint64_t v12 = [v35 triggerValue];
        char v13 = objc_msgSend(v8, "hf_designatedEventTriggerForProgrammableSwitchWithTriggerValue:", v12);

        id v14 = [HUTriggerBuilderContext alloc];
        __int16 v15 = [v35 latestResults];
        uint64_t v16 = [v15 objectForKey:@"triggerBuilderContext"];
        uint64_t v17 = [(HUTriggerBuilderContext *)v14 initWithTriggerBuilderContext:v16];

        if (v13)
        {
          uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F69130]) initWithExistingObject:v13 inHome:v6 context:v17];
          uint64_t v19 = [[HUTriggerSummaryViewController alloc] initWithTriggerBuilder:v18 mode:1 isPresentedModally:1 delegate:self];
        }
        else
        {
          uint64_t v20 = [(HUServiceDetailsViewController *)self home];
          int v21 = objc_msgSend(v20, "hf_currentUserIsAdministrator");

          if (v21)
          {
            NSLog(&cfstr_UserIsNotAnAdm.isa);
            uint64_t v19 = 0;
            uint64_t v18 = 0;
          }
          else
          {
            uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F69130]) initWithHome:v6 context:v17];
            uint64_t v22 = [v18 characteristicInterface];
            uint64_t v23 = [v35 triggerValue];
            [v22 setCharacteristic:v8 triggerValue:v23];

            uint64_t v19 = [[HUTriggerActionPickerViewController alloc] initWithTriggerBuilder:v18 mode:0 delegate:self];
            id v24 = objc_alloc(MEMORY[0x1E4F427C0]);
            double v25 = _HULocalizedStringWithDefaultValue(@"HUProgrammableSwitchTriggerSetupCancelTitle", @"HUProgrammableSwitchTriggerSetupCancelTitle", 1);
            uint64_t v34 = (void *)[v24 initWithTitle:v25 style:2 target:self action:sel_dismissTriggerActionEditorViewController_];

            id v26 = (void *)MEMORY[0x1E4F1CA48];
            id v27 = [(HUTriggerSummaryViewController *)v19 navigationItem];
            id v28 = [v27 leftBarButtonItems];
            id v29 = [v26 arrayWithArray:v28];

            [v29 addObject:v34];
            uint64_t v30 = [(HUTriggerSummaryViewController *)v19 navigationItem];
            [v30 setLeftBarButtonItems:v29];
          }
        }
        objc_msgSend(v18, "setShouldMarkTriggerAsHomeAppCreated:", 1, v34);
        uint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v19];
        [v31 setModalPresentationStyle:2];
        uint64_t v32 = [(HUServiceDetailsViewController *)self navigationController];
        id v33 = (id)objc_msgSend(v32, "hu_presentPreloadableViewController:animated:", v31, 1);
      }
    }
  }
  else
  {
    NSLog(&cfstr_UnableToFindHu.isa);
    objc_msgSend(v6, "hf_currentUserIsAdministrator");
  }
}

uint64_t __92__HUServiceDetailsViewController__presentTriggerEditorForProgrammableSwitchEventOptionItem___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 characteristicType];
  if ([v3 isEqualToString:*MEMORY[0x1E4F2CF08]])
  {
    int v4 = objc_msgSend(MEMORY[0x1E4F2EA88], "hf_programmableSwitchServiceTypes");
    id v5 = [v2 service];
    __int16 v6 = [v5 serviceType];
    uint64_t v7 = [v4 containsObject:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)triggerEditor:(id)a3 shouldCommitTriggerBuilder:(id)a4
{
  return 1;
}

- (void)triggerEditor:(id)a3 didFinishWithTriggerBuilder:(id)a4
{
  id v17 = a3;
  __int16 v6 = [(HUServiceDetailsViewController *)self navigationController];
  uint64_t v7 = [v6 viewControllers];
  int v8 = [v7 containsObject:v17];

  if (v8)
  {
    BOOL v9 = [(HUServiceDetailsViewController *)self navigationController];
    id v10 = (id)[v9 popToRootViewControllerAnimated:1];
    goto LABEL_11;
  }
  int v11 = [(HUServiceDetailsViewController *)self presentedViewController];
  uint64_t v12 = [v17 navigationController];
  id v13 = v11;
  id v14 = v12;
  if (v13 == v14)
  {

    goto LABEL_8;
  }
  __int16 v15 = v14;
  if (v13)
  {
    char v16 = [v13 isEqual:v14];

    if ((v16 & 1) == 0) {
      goto LABEL_10;
    }
LABEL_8:
    BOOL v9 = [(HUServiceDetailsViewController *)self navigationController];
    [v9 dismissViewControllerAnimated:1 completion:0];
    goto LABEL_11;
  }

LABEL_10:
  BOOL v9 = [MEMORY[0x1E4F28B00] currentHandler];
  [v9 handleFailureInMethod:a2 object:self file:@"HUServiceDetailsViewController.m" lineNumber:2805 description:@"triggerEditor:didFinishWithTriggerBuilder: shouldn't get here.  Ever."];
LABEL_11:
}

- (void)dismissTriggerActionEditorViewController:(id)a3
{
  id v3 = [(HUServiceDetailsViewController *)self navigationController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)_setupProgrammableSwitchCell:(id)a3 forItem:(id)a4
{
  id v19 = a3;
  id v5 = a4;
  __int16 v6 = [v5 characteristics];
  uint64_t v7 = [v6 anyObject];

  int v8 = [v5 triggerValue];
  BOOL v9 = objc_msgSend(v7, "hf_designatedEventTriggerForProgrammableSwitchWithTriggerValue:", v8);

  id v10 = [v5 latestResults];
  int v11 = [v10 objectForKey:@"itemIsEditable"];
  unsigned int v12 = [v11 BOOLValue];

  id v13 = [v5 latestResults];

  id v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F68C28]];
  LODWORD(v11) = [v14 BOOLValue];

  [v19 setHideIcon:1];
  [v19 setDisabled:v12 ^ 1];
  [v19 setHideDescriptionIcon:v11 ^ 1];
  if ([v19 isDisabled]) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = 3;
  }
  [v19 setSelectionStyle:v15];
  char v16 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_exclamationMarkImage");
  [v19 setDescriptionIcon:v16];

  [v19 setIconForegroundColorFollowsTintColor:1];
  [v19 setAccessoryView:0];
  [v19 setAccessoryType:v12];
  if (!v9 && v12)
  {
    id v17 = objc_opt_new();
    [v17 _setTextColorFollowsTintColor:1];
    uint64_t v18 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsProgrammableSwitchAdd", @"HUServiceDetailsProgrammableSwitchAdd", 1);
    [v17 setText:v18];

    [v17 sizeToFit];
    [v19 setAccessoryView:v17];
  }
}

- (void)setShouldTrackProgrammableSwitchActivations:(BOOL)a3
{
  if (self->_shouldTrackProgrammableSwitchActivations != a3) {
    self->_shouldTrackProgrammableSwitchActivations = a3;
  }
}

- (void)accessory:(id)a3 service:(id)a4 didUpdateValueForCharacteristic:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(HUServiceDetailsViewController *)self shouldTrackProgrammableSwitchActivations])
  {
    BOOL v9 = objc_msgSend(MEMORY[0x1E4F2EA88], "hf_programmableSwitchServiceTypes");
    id v10 = [v7 serviceType];
    if (([v9 containsObject:v10] & 1) == 0) {
      goto LABEL_7;
    }
    int v11 = [v8 characteristicType];
    int v12 = [v11 isEqualToString:*MEMORY[0x1E4F2CF08]];

    if (v12)
    {
      id v13 = +[HOActivationManager sharedInstance];
      BOOL v9 = [v13 lastEnteredForegroundDate];

      id v14 = [v8 valueUpdatedTime];
      uint64_t v15 = [v14 compare:v9];

      if (v15 == -1)
      {
LABEL_8:

        goto LABEL_9;
      }
      id v10 = [v8 value];
      if (v10)
      {
        char v16 = [(HUItemTableViewController *)self itemManager];
        id v17 = [v16 allDisplayedItems];
        uint64_t v19 = MEMORY[0x1E4F143A8];
        uint64_t v20 = 3221225472;
        int v21 = __84__HUServiceDetailsViewController_accessory_service_didUpdateValueForCharacteristic___block_invoke;
        uint64_t v22 = &unk_1E6387098;
        id v23 = v8;
        id v24 = v10;
        uint64_t v18 = objc_msgSend(v17, "na_firstObjectPassingTest:", &v19);

        -[HUItemTableViewController highlightItemAnimated:](self, "highlightItemAnimated:", v18, v19, v20, v21, v22);
      }
LABEL_7:

      goto LABEL_8;
    }
  }
LABEL_9:
}

BOOL __84__HUServiceDetailsViewController_accessory_service_didUpdateValueForCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6
    && ([v6 characteristics],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 containsObject:*(void *)(a1 + 32)],
        v7,
        v8))
  {
    BOOL v9 = [v6 triggerValue];
    BOOL v10 = [v9 compare:*(void *)(a1 + 40)] == 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)softwareUpdateModuleController:(id)a3 presentViewController:(id)a4
{
  return [(UIViewController *)self hu_presentPreloadableViewController:a4 animated:1];
}

- (id)softwareUpdateModuleController:(id)a3 dismissViewController:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__HUServiceDetailsViewController_softwareUpdateModuleController_dismissViewController___block_invoke;
  v8[3] = &unk_1E6386018;
  id v6 = v5;
  id v9 = v6;
  [(HUServiceDetailsViewController *)self dismissViewControllerAnimated:1 completion:v8];

  return v6;
}

uint64_t __87__HUServiceDetailsViewController_softwareUpdateModuleController_dismissViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithNoResult];
}

- (id)softwareUpdateModuleController:(id)a3 navigateToViewController:(id)a4
{
  id v5 = a4;
  id v6 = [(HUServiceDetailsViewController *)self navigationController];
  id v7 = objc_msgSend(v6, "hu_pushPreloadableViewController:animated:", v5, 1);

  return v7;
}

- (void)didRemoveCHIPPairingforAccessory:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    id v24 = v4;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "Receive CHIPPairing removal for: %@", (uint8_t *)&v23, 0xCu);
  }

  id v6 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v7 = [v6 sourceItem];
  if ([v7 conformsToProtocol:&unk_1F19E4798]) {
    int v8 = v7;
  }
  else {
    int v8 = 0;
  }
  id v9 = v8;
  BOOL v10 = [v9 homeKitObject];

  if ([v10 isEqual:v4]) {
    goto LABEL_7;
  }
  char v14 = [v10 isEqual:v4];
  if (v4)
  {
    if ((v14 & 1) == 0)
    {
      uint64_t v15 = [v4 cameraProfiles];
      char v16 = [v15 containsObject:v10];

      if (v16) {
        goto LABEL_7;
      }
      id v17 = [v4 mediaProfile];
      char v18 = [v17 isEqual:v10];

      if (v18) {
        goto LABEL_7;
      }
      uint64_t v19 = [v4 profiles];
      char v20 = [v19 containsObject:v10];

      if ((v20 & 1) != 0
        || ([v4 services],
            int v21 = objc_claimAutoreleasedReturnValue(),
            int v22 = [v21 containsObject:v10],
            v21,
            v22))
      {
LABEL_7:
        int v11 = HFLogForCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = 138412290;
          id v24 = v10;
          _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "Dismissing card after CHIPPairing removal of currently displayed homekitObject: %@", (uint8_t *)&v23, 0xCu);
        }

        [(HUServiceDetailsViewController *)self setRequiresPresentingViewControllerDismissal:1];
        int v12 = [(HUServiceDetailsViewController *)self presentationDelegate];
        id v13 = (id)[v12 finishPresentation:self animated:1];
      }
    }
  }
}

- (id)childServiceEditorModuleController:(id)a3 didSelectItem:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v6 = v5;
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    int v8 = v7;

    id v9 = [[HUValveEditorViewController alloc] initWithSourceItem:v8 editorMode:0];
    BOOL v10 = [(HUServiceDetailsViewController *)self navigationController];
    int v11 = objc_msgSend(v10, "hu_pushPreloadableViewController:animated:", v9, 1);
  }
  else
  {
    int v8 = [[HUServiceDetailsViewController alloc] initWithServiceLikeItem:v5];
    id v9 = [(HUServiceDetailsViewController *)self navigationController];
    int v11 = [(HUValveEditorViewController *)v9 hu_pushPreloadableViewController:v8 animated:1];
  }

  return v11;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a3;
  id v13 = HFLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412546;
    char v18 = self;
    __int16 v19 = 2112;
    id v20 = v11;
    _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v17, 0x16u);
  }

  char v14 = [(HUServiceDetailsViewController *)self textViewDelegate];
  char v15 = objc_msgSend(v14, "textView:shouldInteractWithURL:inRange:interaction:", v12, v11, location, length, a6);

  return v15;
}

- (void)moduleController:(id)a3 expandModule:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [[HUHomeKitAccessorySettingsDetailsViewController alloc] initWithCollapsedAccessorySettingItemModule:v5];
  id v7 = [(HUServiceDetailsViewController *)self navigationController];
  id v8 = (id)objc_msgSend(v7, "hu_pushPreloadableViewController:animated:", v6, 1);

  id v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v5;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "Now expanding module [%@] to show settings", (uint8_t *)&v11, 0xCu);
  }

  BOOL v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v5;
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "User tapped to expand module %@", (uint8_t *)&v11, 0xCu);
  }
}

- (void)moduleController:(id)a3 presentSettingDetailsViewController:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (v5)
  {
    id v6 = [(HUServiceDetailsViewController *)self navigationController];
    id v7 = (id)objc_msgSend(v6, "hu_pushPreloadableViewController:animated:", v5, 1);

    id v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "Now presenting settings details view controller [%@]", (uint8_t *)&v10, 0xCu);
    }

    id v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "User tapped to present settings details view controller [%@]", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_presentContainedItems
{
  BOOL v5 = [(HUServiceDetailsViewController *)self isItemGroup];
  if (v5)
  {
    id v6 = a2;
    int v7 = 0;
    int v8 = 0;
  }
  else
  {
    id v2 = [(HUServiceDetailsViewController *)self item];
    if ([v2 conformsToProtocol:&unk_1F1AA7778])
    {
      id v6 = a2;
      int v7 = 0;
      int v8 = 0;
    }
    else
    {
      id v9 = [(HUServiceDetailsViewController *)self item];
      id v25 = v9;
      if ([v9 conformsToProtocol:&unk_1F1AA7668])
      {
        id v6 = a2;
        int v7 = 0;
        int v8 = 1;
      }
      else
      {
        int v10 = [(HUServiceDetailsViewController *)self item];
        if (([v10 conformsToProtocol:&unk_1F1A3D6E8] & 1) == 0)
        {

LABEL_17:
          uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
          char v14 = [(HUServiceDetailsViewController *)self item];
          [v13 handleFailureInMethod:a2, self, @"HUServiceDetailsViewController.m", 2998, @"Selected 'showContainedServices' row, but the displayed item doesn't conform to the right protocols: %@", v14 object file lineNumber description];

          goto LABEL_18;
        }
        id v24 = v10;
        id v6 = a2;
        int v7 = 1;
        int v8 = 1;
      }
    }
  }
  id v11 = [(HUServiceDetailsViewController *)self item];
  char v12 = [v11 conformsToProtocol:&unk_1F19E4850];

  if (!v7)
  {
    if (!v8) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

  if (v8) {
LABEL_13:
  }

LABEL_14:
  if (!v5) {

  }
  a2 = v6;
  if ((v12 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_18:
  objc_opt_class();
  char v15 = [(HUServiceDetailsViewController *)self item];
  if (objc_opt_isKindOfClass()) {
    char v16 = v15;
  }
  else {
    char v16 = 0;
  }
  unint64_t v26 = v16;

  int v17 = [(HUServiceDetailsViewController *)self item];
  if ([v17 conformsToProtocol:&unk_1F1AA7778])
  {

LABEL_24:
    uint64_t v20 = [(HUServiceDetailsViewController *)self item];
    goto LABEL_26;
  }
  char v18 = [(HUServiceDetailsViewController *)self item];
  int v19 = [v18 conformsToProtocol:&unk_1F1AA7668];

  if (v19) {
    goto LABEL_24;
  }
  uint64_t v20 = 0;
LABEL_26:
  if (v26 | v20)
  {
    uint64_t v21 = [[HUContainedAccessoryElementsGridViewController alloc] initWithServiceContainingItem:v20 mediaItem:v26 isPresentedModally:0 shouldGroupByRoom:1 valueSource:0];
    [(HUContainedAccessoryElementsGridViewController *)v21 setServiceGridDelegate:self];
    [(HUContainedAccessoryElementsGridViewController *)v21 setPresentationDelegate:self];
    int v22 = [(HUServiceDetailsViewController *)self navigationController];
    id v23 = (id)objc_msgSend(v22, "hu_pushPreloadableViewController:animated:", v21, 1);
  }
  else
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [(id)v20 handleFailureInMethod:a2 object:self file:@"HUServiceDetailsViewController.m" lineNumber:3050 description:@"Unable to present grouped accessory view controller; please file a radar on \"Home App | New Bugs\""];
  }
}

- (void)_presentGroupPicker
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(HUServiceDetailsViewController *)self item];
    int v24 = 136315650;
    id v25 = "-[HUServiceDetailsViewController _presentGroupPicker]";
    __int16 v26 = 2112;
    id v27 = self;
    __int16 v28 = 2112;
    id v29 = v4;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "User selected %s(%@) for %@", (uint8_t *)&v24, 0x20u);
  }
  if ((_os_feature_enabled_impl() & 1) != 0
    || ([(HUServiceDetailsViewController *)self item],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) == 0))
  {
    char v14 = [(HUServiceDetailsViewController *)self item];
    int v8 = [v14 services];

    objc_opt_class();
    char v15 = [(HUServiceDetailsViewController *)self item];
    if (objc_opt_isKindOfClass()) {
      char v16 = v15;
    }
    else {
      char v16 = 0;
    }
    char v12 = v16;

    if (v12)
    {
      int v17 = [(HUMediaSystemEditorViewController *)v12 accessory];
      uint64_t v18 = objc_msgSend(v17, "hf_groupableServices");

      int v8 = (void *)v18;
    }
    int v19 = [v8 allObjects];
    uint64_t v20 = [(HUItemTableViewController *)self itemManager];
    uint64_t v21 = [v20 home];
    int v22 = +[HUServiceGroupEditorViewController forCreatingNewServiceGroupWithServices:v19 inHome:v21];

    [v22 setPresentationDelegate:self];
    [v22 setServiceGroupEditorDelegate:self];
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v22];
  }
  else
  {
    int v7 = [(HUServiceDetailsViewController *)self item];
    int v8 = [v7 accessories];

    id v9 = [HUMediaSystemEditorViewController alloc];
    int v10 = [(HUItemTableViewController *)self itemManager];
    id v11 = [v10 home];
    char v12 = [(HUMediaSystemEditorViewController *)v9 initWithAccessories:v8 home:v11];

    [(HUMediaSystemEditorViewController *)v12 setPresentationDelegate:self];
    [(HUMediaSystemEditorViewController *)v12 setDelegate:self];
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v12];
  }

  [v13 setModalPresentationStyle:2];
  id v23 = [(UIViewController *)self hu_presentPreloadableViewController:v13 animated:1];
}

- (void)_identifyHomePod
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(HUServiceDetailsViewController *)self homePodIdentifyFuture];
  if (v4
    && (BOOL v5 = (void *)v4,
        [(HUServiceDetailsViewController *)self homePodIdentifyFuture],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isFinished],
        v6,
        v5,
        (v7 & 1) == 0))
  {
    int v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = NSStringFromSelector(a2);
      char v12 = [(HUServiceDetailsViewController *)self homePodIdentifyFuture];
      uint64_t v13 = [(HUServiceDetailsViewController *)self homePodIdentifyFuture];
      *(_DWORD *)buf = 138413058;
      char v16 = self;
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      __int16 v21 = 1024;
      int v22 = [v13 isFinished];
      _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ Ignoring because previous Identify future not completed: %@ isFinished = %{BOOL}d", buf, 0x26u);
    }
  }
  else
  {
    int v8 = [(HUServiceDetailsViewController *)self detailsItemManager];
    id v14 = [v8 sourceItemAccessory];

    id v9 = objc_msgSend(v14, "hf_identifyHomePod");
    [(HUServiceDetailsViewController *)self setHomePodIdentifyFuture:v9];
  }
}

- (void)_separateOrUnifyTile
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  id v3 = [(HUServiceDetailsViewController *)self item];
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  objc_opt_class();
  id v6 = [(HUServiceDetailsViewController *)self item];
  if (objc_opt_isKindOfClass()) {
    char v7 = v6;
  }
  else {
    char v7 = 0;
  }
  id v8 = v7;

  objc_opt_class();
  id v9 = [(HUServiceDetailsViewController *)self item];
  if (objc_opt_isKindOfClass()) {
    int v10 = v9;
  }
  else {
    int v10 = 0;
  }
  id v11 = v10;

  if (v5)
  {
    char v12 = [v5 accessory];
    if (!v12) {
      goto LABEL_23;
    }
  }
  else
  {
    if (v8)
    {
      uint64_t v13 = [v8 service];
    }
    else
    {
      if (!v11) {
        goto LABEL_23;
      }
      uint64_t v13 = [v11 profile];
    }
    id v14 = v13;
    char v12 = [v13 accessory];

    if (!v12) {
      goto LABEL_23;
    }
  }
  int v15 = objc_msgSend(v12, "hf_showAsIndividualServices");
  char v16 = objc_msgSend(v12, "hf_setShowAsIndividualServices:", v15 ^ 1u);
  __int16 v17 = HFLogForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = @"YES";
    if (v15) {
      uint64_t v18 = @"NO";
    }
    *(_DWORD *)buf = 138412546;
    id v29 = v12;
    __int16 v30 = 2112;
    uint64_t v31 = v18;
    _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "Service Details Updating accessory %@ to show individual services %@", buf, 0x16u);
  }

  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  int v24 = __54__HUServiceDetailsViewController__separateOrUnifyTile__block_invoke;
  id v25 = &unk_1E63859F8;
  id v26 = v12;
  id v27 = self;
  id v19 = v12;
  id v20 = (id)[v16 addSuccessBlock:&v22];
  id v21 = (id)objc_msgSend(v16, "addFailureBlock:", &__block_literal_global_857, v22, v23, v24, v25);

LABEL_23:
}

void __54__HUServiceDetailsViewController__separateOrUnifyTile__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__HUServiceDetailsViewController__separateOrUnifyTile__block_invoke_2;
  v15[3] = &unk_1E638C990;
  id v16 = *(id *)(a1 + 32);
  [v2 dispatchAccessoryObserverMessage:v15 sender:0];

  id v3 = [*(id *)(a1 + 40) presentationDelegate];
  id v4 = (id)[v3 finishPresentation:*(void *)(a1 + 40) animated:1];

  if (([*(id *)(a1 + 40) shouldDisableAdditionalDismissalForTogglingSeparatingTiles] & 1) == 0)
  {
    id v5 = [*(id *)(a1 + 40) presentingViewController];
    id v6 = [v5 presentingViewController];

    if (v6)
    {
      do
      {
        char v7 = [v5 childViewControllers];
        id v8 = objc_msgSend(v7, "na_firstObjectPassingTest:", &__block_literal_global_855);

        if (v8)
        {
          objc_opt_class();
          id v9 = v8;
          if (objc_opt_isKindOfClass()) {
            int v10 = v9;
          }
          else {
            int v10 = 0;
          }
          id v11 = v10;

          id v12 = (id)[v11 requestDismissal];
        }
        else
        {
          [v5 dismissViewControllerAnimated:1 completion:0];
        }
        uint64_t v13 = [v5 presentingViewController];

        id v14 = [v13 presentingViewController];

        id v5 = v13;
      }
      while (v14);
    }
    else
    {
      uint64_t v13 = v5;
    }
  }
}

void __54__HUServiceDetailsViewController__separateOrUnifyTile__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 accessoryDidUpdateApplicationData:*(void *)(a1 + 32)];
  }
}

uint64_t __54__HUServiceDetailsViewController__separateOrUnifyTile__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __54__HUServiceDetailsViewController__separateOrUnifyTile__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F69110];
  id v3 = a2;
  id v4 = [v2 sharedHandler];
  [v4 handleError:v3];
}

- (void)_didSelectRoomItem:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(HUServiceDetailsViewController *)self detailsItemManager];
    id v6 = [v5 serviceLikeBuilder];
    char v7 = [v6 room];

    id v8 = [v4 latestResults];
    id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F68BE0]];

    int v10 = [v7 room];
    id v11 = [v10 uniqueIdentifier];
    id v12 = [v9 room];
    uint64_t v13 = [v12 uniqueIdentifier];
    char v14 = [v11 isEqual:v13];

    if ((v14 & 1) == 0)
    {
      int v15 = [(HUServiceDetailsViewController *)self detailsItemManager];
      id v16 = [v15 selectRoom:v9];

      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      id v25 = __53__HUServiceDetailsViewController__didSelectRoomItem___block_invoke;
      id v26 = &unk_1E63859F8;
      id v27 = self;
      id v28 = v9;
      id v17 = (id)[v16 addSuccessBlock:&v23];
      uint64_t v18 = [(HUServiceDetailsViewController *)self detailsItemManager];
      id v19 = [v18 suggestedRoomItemProvider];
      id v20 = [v19 items];
      int v21 = [v20 containsObject:v4];

      if (v21) {
        id v22 = (id)[v16 addFailureBlock:&__block_literal_global_859];
      }
    }
  }
}

void __53__HUServiceDetailsViewController__didSelectRoomItem___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) room];
  [v2 _notifyOfHomePodPairingIfNecessary:v3];

  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) name];
  LOBYTE(v4) = [v4 _notifyOfHomeTheaterReconfigurationIfNecessary:v5];

  if ((v4 & 1) == 0)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [*(id *)(a1 + 40) room];
    [v6 _offerToCreateHomeTheaterIfPossible:v7];
  }
}

void __53__HUServiceDetailsViewController__didSelectRoomItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F69110];
  id v3 = a2;
  id v4 = [v2 sharedHandler];
  [v4 handleError:v3 operationType:*MEMORY[0x1E4F68758] options:0 retryBlock:0 cancelBlock:0];
}

- (void)_notifyOfHomePodPairingIfNecessary:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(HUItemTableViewController *)self itemManager];
  id v7 = [v6 home];

  objc_opt_class();
  id v8 = [(HUServiceDetailsViewController *)self item];
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    id v11 = [v10 mediaProfileContainer];
    id v12 = [v11 accessories];
    unint64_t v13 = [v12 count];

    if (v13 <= 1 && objc_msgSend(v11, "hf_supportsStereoPairing"))
    {
      char v14 = objc_msgSend(v11, "hf_backingAccessory");
      uint64_t v15 = [v14 supportedStereoPairVersions];

      if (v15)
      {
        id v16 = (void *)MEMORY[0x1E4F1CAD0];
        id v17 = [v5 availableHomePodsSupportingStereoPairingVersions:v15];
        uint64_t v18 = [v16 setWithArray:v17];

        id v19 = [v10 accessories];
        id v20 = [v18 na_setByRemovingObjectsFromSet:v19];

        char v21 = objc_msgSend(v20, "na_any:", &__block_literal_global_861);
        if ([v20 count] && (v21 & 1) == 0)
        {
          id v22 = (void *)MEMORY[0x1E4F42728];
          uint64_t v23 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsViewControllerHomePodRoomChangePromptTitle", @"HUServiceDetailsViewControllerHomePodRoomChangePromptTitle", 1);
          uint64_t v24 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsViewControllerHomePodRoomChangePromptMessage", @"HUServiceDetailsViewControllerHomePodRoomChangePromptMessage", 1);
          id v25 = [v22 alertControllerWithTitle:v23 message:v24 preferredStyle:1];

          objc_initWeak((id *)location, self);
          id v26 = (void *)MEMORY[0x1E4F42720];
          id v27 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsViewControllerHomePodRoomChangePromptActionUseAsPair", @"HUServiceDetailsViewControllerHomePodRoomChangePromptActionUseAsPair", 1);
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          v33[2] = __69__HUServiceDetailsViewController__notifyOfHomePodPairingIfNecessary___block_invoke_2;
          v33[3] = &unk_1E6389980;
          objc_copyWeak(&v37, (id *)location);
          id v34 = v20;
          id v35 = v10;
          id v36 = v7;
          id v28 = [v26 actionWithTitle:v27 style:0 handler:v33];
          [v25 addAction:v28];

          id v29 = (void *)MEMORY[0x1E4F42720];
          __int16 v30 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsViewControllerHomePodRoomChangePromptActionNotNow", @"HUServiceDetailsViewControllerHomePodRoomChangePromptActionNotNow", 1);
          uint64_t v31 = [v29 actionWithTitle:v30 style:0 handler:0];
          [v25 addAction:v31];

          [(HUServiceDetailsViewController *)self presentViewController:v25 animated:1 completion:0];
          objc_destroyWeak(&v37);
          objc_destroyWeak((id *)location);
        }
      }
      else
      {
        uint64_t v18 = HFLogForCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          uint64_t v32 = NSStringFromSelector(a2);
          *(_DWORD *)NSUInteger location = 138412802;
          *(void *)&location[4] = self;
          __int16 v39 = 2112;
          id v40 = v32;
          __int16 v41 = 2112;
          uint64_t v42 = v11;
          _os_log_error_impl(&dword_1BE345000, v18, OS_LOG_TYPE_ERROR, "%@:%@ HomePod has no stereo pairing versions: %@", location, 0x20u);
        }
      }
    }
  }
}

uint64_t __69__HUServiceDetailsViewController__notifyOfHomePodPairingIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_needsSoftwareUpdateToSupportBeingAddedToMediaSystem");
}

void __69__HUServiceDetailsViewController__notifyOfHomePodPairingIfNecessary___block_invoke_2(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v3 = [WeakRetained _commitBuilder];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __69__HUServiceDetailsViewController__notifyOfHomePodPairingIfNecessary___block_invoke_3;
  v5[3] = &unk_1E638C9E0;
  id v6 = a1[4];
  id v7 = a1[5];
  id v8 = WeakRetained;
  id v9 = a1[6];
  id v4 = (id)[v3 addSuccessBlock:v5];
}

void __69__HUServiceDetailsViewController__notifyOfHomePodPairingIfNecessary___block_invoke_3(uint64_t a1)
{
  v34[1] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count] != 1) {
    goto LABEL_3;
  }
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [*(id *)(a1 + 40) accessories];
  id v4 = [v3 anyObject];
  id v5 = [*(id *)(a1 + 32) anyObject];
  id v6 = objc_msgSend(v2, "setWithObjects:", v4, v5, 0);
  BOOL v7 = +[HUMediaSystemEditorUtilities wouldPairingAccessoriesNecessitateConfiguration:v6];

  if (!v7)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F692C8]);
    id v17 = [*(id *)(a1 + 32) anyObject];
    uint64_t v18 = [v17 home];
    id v11 = (void *)[v16 initWithHome:v18];

    id v19 = [*(id *)(a1 + 32) anyObject];
    [v11 addAccessory:v19];

    id v20 = [*(id *)(a1 + 40) accessories];
    char v21 = [v20 anyObject];
    [v11 addAccessory:v21];

    id v22 = objc_alloc(MEMORY[0x1E4F69478]);
    uint64_t v23 = [*(id *)(a1 + 32) anyObject];
    uint64_t v24 = [v23 room];
    id v25 = [*(id *)(a1 + 32) anyObject];
    id v26 = [v25 home];
    id v27 = (void *)[v22 initWithExistingObject:v24 inHome:v26];
    [v11 setRoom:v27];

    id v28 = [v11 commitItem];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __69__HUServiceDetailsViewController__notifyOfHomePodPairingIfNecessary___block_invoke_4;
    v33[3] = &unk_1E638C9B8;
    void v33[4] = *(void *)(a1 + 48);
    id v29 = (id)[v28 addCompletionBlock:v33];
  }
  else
  {
LABEL_3:
    id v8 = [HUMediaSystemEditorViewController alloc];
    id v9 = [*(id *)(a1 + 40) accessories];
    id v10 = [(HUMediaSystemEditorViewController *)v8 initWithAccessories:v9 home:*(void *)(a1 + 56)];

    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v10];
    [(HUMediaSystemEditorViewController *)v10 setPresentationDelegate:*(void *)(a1 + 48)];
    v34[0] = v10;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
    [v11 setViewControllers:v12];

    [v11 setModalPresentationStyle:2];
    unint64_t v13 = objc_msgSend(*(id *)(a1 + 48), "hu_presentPreloadableViewController:animated:", v11, 1);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __69__HUServiceDetailsViewController__notifyOfHomePodPairingIfNecessary___block_invoke_5;
    v30[3] = &unk_1E63859F8;
    id v31 = *(id *)(a1 + 32);
    uint64_t v32 = v10;
    char v14 = v10;
    id v15 = (id)[v13 addSuccessBlock:v30];
  }
}

void __69__HUServiceDetailsViewController__notifyOfHomePodPairingIfNecessary___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v5 = [MEMORY[0x1E4F69110] sharedHandler];
    [v5 handleError:v6];
  }
  else
  {
    [*(id *)(a1 + 32) mediaSystemEditor:0 didCreate:a2];
  }
}

void __69__HUServiceDetailsViewController__notifyOfHomePodPairingIfNecessary___block_invoke_5(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count] == 1)
  {
    id v2 = [*(id *)(a1 + 32) anyObject];
    [*(id *)(a1 + 40) createMediaSystemWithAccessory:v2];
  }
}

- (BOOL)_notifyOfHomeTheaterReconfigurationIfNecessary:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(HUServiceDetailsViewController *)self _shouldShowHomeTheaterPrompt])
  {
    id v6 = (void *)MEMORY[0x1E4F692A8];
    BOOL v7 = [(HUServiceDetailsViewController *)self item];
    id v8 = [v6 mediaProfileContainerForItem:v7 forTopLevel:1];

    int v9 = [MEMORY[0x1E4F692A8] isAppleTV:v8];
    id v10 = [(HUItemTableViewController *)self itemManager];
    id v11 = [v10 home];
    id v12 = objc_msgSend(v11, "hf_relatedHomeTheaterMediaProfileContainerFor:", v8);

    unint64_t v13 = HFLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      char v14 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413058;
      uint64_t v54 = self;
      __int16 v55 = 2112;
      uint64_t v56 = v14;
      __int16 v57 = 2112;
      id v58 = v8;
      __int16 v59 = 2112;
      int v60 = v12;
      _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_INFO, "%@:%@ Looking for Odeon config. mediaProfileContainer: %@ relatedHomeTheaterMediaProfileContainer: %@", buf, 0x2Au);
    }
    objc_opt_class();
    id v15 = [(HUServiceDetailsViewController *)self item];
    if (objc_opt_isKindOfClass()) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }

    BOOL v17 = v12 != 0;
    uint64_t v18 = HFLogForCategory();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      int v41 = v9;
      if (v19)
      {
        NSStringFromSelector(a2);
        id v20 = (HUServiceDetailsViewController *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        uint64_t v54 = v20;
        __int16 v55 = 2112;
        uint64_t v56 = v8;
        __int16 v57 = 2112;
        id v58 = v12;
        _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "%@: Moving A, which is in a home theater group with B:\n\tA: %@\n\tB: %@", buf, 0x20u);

        int v9 = v41;
      }

      id v40 = v5;
      if (v9)
      {
        uint64_t v18 = HULocalizedStringWithFormat(@"HUMoveHomeTheaterAlert_AppleTV_Body", @"%@", v21, v22, v23, v24, v25, v26, (uint64_t)v5);
        id v27 = @"HUMoveHomeTheaterAlert_AppleTV_Button";
      }
      else
      {
        if (v16) {
          HULocalizedStringWithFormat(@"HUMoveHomeTheaterAlert_HomePod_Sensor_Body", @"%@", v21, v22, v23, v24, v25, v26, (uint64_t)v5);
        }
        else {
        uint64_t v18 = HULocalizedStringWithFormat(@"HUMoveHomeTheaterAlert_HomePod_Body", @"%@", v21, v22, v23, v24, v25, v26, (uint64_t)v5);
        }
        id v27 = @"HUMoveHomeTheaterAlert_HomePod_Button";
      }
      uint64_t v42 = _HULocalizedStringWithDefaultValue(v27, v27, 1);
      id v29 = (void *)MEMORY[0x1E4F42728];
      __int16 v30 = _HULocalizedStringWithDefaultValue(@"HUMoveHomeTheaterAlert_Title", @"HUMoveHomeTheaterAlert_Title", 1);
      id v31 = [v29 alertControllerWithTitle:v30 message:v18 preferredStyle:1];

      uint64_t v32 = (void *)MEMORY[0x1E4F42720];
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __81__HUServiceDetailsViewController__notifyOfHomeTheaterReconfigurationIfNecessary___block_invoke;
      v48[3] = &unk_1E638CA30;
      void v48[4] = self;
      SEL v51 = a2;
      id v33 = v8;
      id v49 = v33;
      char v52 = v41;
      id v34 = v12;
      id v50 = v34;
      id v35 = [v32 actionWithTitle:v42 style:0 handler:v48];
      [v31 addAction:v35];

      id v36 = (void *)MEMORY[0x1E4F42720];
      id v37 = _HULocalizedStringWithDefaultValue(@"HUMoveHomeTheaterAlert_All_Button", @"HUMoveHomeTheaterAlert_All_Button", 1);
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __81__HUServiceDetailsViewController__notifyOfHomeTheaterReconfigurationIfNecessary___block_invoke_898;
      v43[3] = &unk_1E638CAD0;
      v43[4] = self;
      SEL v47 = a2;
      id v44 = v40;
      id v45 = v33;
      id v46 = v34;
      __int16 v38 = [v36 actionWithTitle:v37 style:0 handler:v43];
      [v31 addAction:v38];

      [(HUServiceDetailsViewController *)self presentViewController:v31 animated:1 completion:0];
      id v5 = v40;
      BOOL v17 = v12 != 0;
    }
    else if (v19)
    {
      id v28 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      uint64_t v54 = self;
      __int16 v55 = 2112;
      uint64_t v56 = v28;
      _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "%@:%@ Did not find any related Home Theaters, skipping move prompt.", buf, 0x16u);
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

void __81__HUServiceDetailsViewController__notifyOfHomeTheaterReconfigurationIfNecessary___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    uint64_t v16 = v3;
    __int16 v17 = 2112;
    uint64_t v18 = v4;
    __int16 v19 = 2112;
    uint64_t v20 = v5;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "%@:%@ Moving home theater accessory %@ out of group.", buf, 0x20u);
  }
  uint64_t v6 = 40;
  if (!*(unsigned char *)(a1 + 64)) {
    uint64_t v6 = 48;
  }
  BOOL v7 = objc_msgSend(*(id *)(a1 + v6), "hf_backingAccessory");
  id v8 = [v7 audioDestinationController];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__HUServiceDetailsViewController__notifyOfHomeTheaterReconfigurationIfNecessary___block_invoke_894;
  v12[3] = &unk_1E638CA08;
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 56);
  id v13 = v8;
  uint64_t v14 = v10;
  v12[4] = v9;
  id v11 = v8;
  [v11 updateDestination:0 completionHandler:v12];
}

void __81__HUServiceDetailsViewController__notifyOfHomeTheaterReconfigurationIfNecessary___block_invoke_894(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138413058;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ AppleTV destination controller %@ destination cleared, with error: %@", (uint8_t *)&v8, 0x2Au);
  }
}

void __81__HUServiceDetailsViewController__notifyOfHomeTheaterReconfigurationIfNecessary___block_invoke_898(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    uint64_t v16 = v3;
    __int16 v17 = 2112;
    uint64_t v18 = v4;
    __int16 v19 = 2112;
    uint64_t v20 = v5;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "%@:%@ Moving all home theater accessories in this group to room: %@", buf, 0x20u);
  }
  uint64_t v6 = [*(id *)(a1 + 32) _roomUpdateBuilderFor:*(void *)(a1 + 48)];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __81__HUServiceDetailsViewController__notifyOfHomeTheaterReconfigurationIfNecessary___block_invoke_899;
  v10[3] = &unk_1E638CAA8;
  uint64_t v7 = *(void *)(a1 + 64);
  int v8 = *(void **)(a1 + 40);
  void v10[4] = *(void *)(a1 + 32);
  uint64_t v14 = v7;
  id v11 = v8;
  id v12 = *(id *)(a1 + 56);
  id v13 = *(id *)(a1 + 48);
  id v9 = (id)[v6 addSuccessBlock:v10];
}

void __81__HUServiceDetailsViewController__notifyOfHomeTheaterReconfigurationIfNecessary___block_invoke_899(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 40);
    int v8 = [*(id *)(a1 + 48) accessories];
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v5;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v26 = v7;
    LOWORD(v27) = 2048;
    *(void *)((char *)&v27 + 2) = [v8 count];
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_INFO, "%@:%@ Moved accessory to room. accessory: %@ room: %lu", buf, 0x2Au);
  }
  id v9 = [*(id *)(a1 + 48) accessories];
  BOOL v10 = [v9 count] == 0;

  if (!v10)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v26 = __Block_byref_object_copy__19;
    *(void *)&long long v27 = __Block_byref_object_dispose__19;
    *((void *)&v27 + 1) = 0;
    id v11 = [*(id *)(a1 + 56) accessories];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __81__HUServiceDetailsViewController__notifyOfHomeTheaterReconfigurationIfNecessary___block_invoke_900;
    v24[3] = &unk_1E638CA58;
    v24[4] = buf;
    objc_msgSend(v11, "na_any:", v24);

    if (*(void *)(*(void *)&buf[8] + 40))
    {
      id v12 = objc_alloc(MEMORY[0x1E4F69478]);
      id v13 = *(void **)(*(void *)&buf[8] + 40);
      uint64_t v14 = [v13 home];
      id v15 = (void *)[v12 initWithExistingObject:v13 inHome:v14];

      uint64_t v16 = [*(id *)(a1 + 48) accessories];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __81__HUServiceDetailsViewController__notifyOfHomeTheaterReconfigurationIfNecessary___block_invoke_2;
      v20[3] = &unk_1E638CA80;
      uint64_t v17 = *(void *)(a1 + 64);
      void v20[4] = *(void *)(a1 + 32);
      uint64_t v22 = buf;
      uint64_t v23 = v17;
      id v18 = v15;
      id v21 = v18;
      objc_msgSend(v16, "na_each:", v20);

      id v19 = (id)[v18 commitItem];
      _Block_object_dispose(buf, 8);
    }
    else
    {
      _Block_object_dispose(buf, 8);
    }
  }
}

BOOL __81__HUServiceDetailsViewController__notifyOfHomeTheaterReconfigurationIfNecessary___block_invoke_900(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 room];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

void __81__HUServiceDetailsViewController__notifyOfHomeTheaterReconfigurationIfNecessary___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) name];
    int v8 = 138413058;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v3;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_INFO, "%@:%@ Moving %@ to room %@", (uint8_t *)&v8, 0x2Au);
  }
  [*(id *)(a1 + 40) addAccessory:v3];
}

- (void)_offerToCreateHomeTheaterIfPossible:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5 && [(HUServiceDetailsViewController *)self _shouldShowHomeTheaterPrompt])
  {
    objc_opt_class();
    uint64_t v6 = [(HUServiceDetailsViewController *)self item];
    uint64_t v7 = (objc_opt_isKindOfClass() & 1) != 0 ? v6 : 0;
    id v8 = v7;

    if (!v8)
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F692A8];
      __int16 v10 = [(HUServiceDetailsViewController *)self item];
      id v11 = [v9 mediaProfileContainerForItem:v10 forTopLevel:1];

      int v12 = [MEMORY[0x1E4F692A8] isAppleTV:v11];
      id v13 = [v5 availableHomeTheaterMediaPartnerFor:v11];
      if (objc_msgSend(v13, "hf_supportsHomeTheater"))
      {
        __int16 v14 = HFLogForCategory();
        BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if (v13)
        {
          if (v15)
          {
            uint64_t v16 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138413058;
            int v41 = self;
            __int16 v42 = 2112;
            uint64_t v43 = v16;
            __int16 v44 = 2112;
            id v45 = v11;
            __int16 v46 = 2112;
            SEL v47 = v13;
            _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@ Moving A into room with B:\n\tA: %@\n\tB: %@", buf, 0x2Au);
          }
          if (v12) {
            _HULocalizedStringWithDefaultValue(@"HUCreateHomeTheaterAlert_AppleTV_Title", @"HUCreateHomeTheaterAlert_AppleTV_Title", 1);
          }
          else {
          __int16 v14 = _HULocalizedStringWithDefaultValue(@"HUCreateHomeTheaterAlert_HomePod_Title", @"HUCreateHomeTheaterAlert_HomePod_Title", 1);
          }
          id v18 = (void *)MEMORY[0x1E4F42728];
          id v19 = _HULocalizedStringWithDefaultValue(@"HUCreateHomeTheaterAlert_Body", @"HUCreateHomeTheaterAlert_Body", 1);
          id v34 = [v18 alertControllerWithTitle:v14 message:v19 preferredStyle:1];

          objc_initWeak((id *)buf, self);
          uint64_t v20 = (void *)MEMORY[0x1E4F42720];
          id v21 = _HULocalizedStringWithDefaultValue(@"HUCreateHomeTheaterAlert_Use_Button", @"HUCreateHomeTheaterAlert_Use_Button", 1);
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = __70__HUServiceDetailsViewController__offerToCreateHomeTheaterIfPossible___block_invoke;
          v35[3] = &unk_1E638CB20;
          objc_copyWeak(v38, (id *)buf);
          id v36 = v11;
          char v39 = v12;
          id v37 = v13;
          v38[1] = (id)a2;
          uint64_t v22 = [v20 actionWithTitle:v21 style:0 handler:v35];
          [v34 addAction:v22];

          uint64_t v23 = (void *)MEMORY[0x1E4F42720];
          uint64_t v24 = _HULocalizedStringWithDefaultValue(@"HUCreateHomeTheaterAlert_DontUse_Button", @"HUCreateHomeTheaterAlert_DontUse_Button", 1);
          uint64_t v25 = [v23 actionWithTitle:v24 style:0 handler:0];
          [v34 addAction:v25];

          [(HUServiceDetailsViewController *)self presentViewController:v34 animated:1 completion:0];
          id v26 = objc_alloc(MEMORY[0x1E4F69710]);
          long long v27 = [(HUItemTableViewController *)self itemManager];
          uint64_t v28 = [v27 home];
          id v29 = [(HUItemTableViewController *)self itemManager];
          __int16 v30 = [v29 home];
          id v31 = [v30 currentUser];
          uint64_t v32 = (void *)[v26 initWithHome:v28 user:v31 nameStyle:0];

          id v33 = (id)[v32 setDismissHomeTheaterOnboarding:1];
          objc_destroyWeak(v38);
          objc_destroyWeak((id *)buf);
        }
        else if (v15)
        {
          uint64_t v17 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          int v41 = self;
          __int16 v42 = 2112;
          uint64_t v43 = v17;
          _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@ Did not find any Home Theater candidates, skipping creation prompt.", buf, 0x16u);
        }
      }
    }
  }
}

void __70__HUServiceDetailsViewController__offerToCreateHomeTheaterIfPossible___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained _roomUpdateBuilderFor:*(void *)(a1 + 32)];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __70__HUServiceDetailsViewController__offerToCreateHomeTheaterIfPossible___block_invoke_2;
  v5[3] = &unk_1E638CAF8;
  char v10 = *(unsigned char *)(a1 + 64);
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = WeakRetained;
  uint64_t v9 = *(void *)(a1 + 56);
  id v4 = (id)[v3 addSuccessBlock:v5];
}

void __70__HUServiceDetailsViewController__offerToCreateHomeTheaterIfPossible___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 64))
  {
    id v4 = objc_msgSend(*(id *)(a1 + 32), "hf_backingAccessory");
    id v5 = [v4 audioDestinationController];

    id v6 = (id *)(a1 + 40);
    id v7 = @"AppleTV to room with available HomePod or HomePod Stereo Pair";
  }
  else
  {
    id v8 = objc_msgSend(*(id *)(a1 + 40), "hf_backingAccessory");
    id v5 = [v8 audioDestinationController];

    id v6 = (id *)(a1 + 32);
    id v7 = @"HomePod or HomePod Stereo Pair to room with available AppleTV";
  }
  uint64_t v9 = objc_msgSend(*v6, "hf_destination");
  char v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 48);
    int v12 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 138413314;
    uint64_t v19 = v11;
    __int16 v20 = 2112;
    id v21 = v12;
    __int16 v22 = 2112;
    uint64_t v23 = v7;
    __int16 v24 = 2112;
    uint64_t v25 = v5;
    __int16 v26 = 2112;
    long long v27 = v9;
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ Moving %@: audioDestinationController = %@ new destination = %@", buf, 0x34u);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__HUServiceDetailsViewController__offerToCreateHomeTheaterIfPossible___block_invoke_920;
  v15[3] = &unk_1E638CA08;
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 56);
  uint64_t v16 = v7;
  uint64_t v17 = v14;
  void v15[4] = v13;
  [v5 updateDestination:v9 options:1 completionHandler:v15];
}

void __70__HUServiceDetailsViewController__offerToCreateHomeTheaterIfPossible___block_invoke_920(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138413058;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ Moved %@ with error: %@", (uint8_t *)&v8, 0x2Au);
  }
}

- (id)_roomUpdateBuilderFor:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![MEMORY[0x1E4F692A8] isHomePodMediaSystem:v5]) {
    goto LABEL_3;
  }
  id v6 = [(HUServiceDetailsViewController *)self detailsItemManager];
  uint64_t v7 = [v6 serviceLikeBuilder];
  uint64_t v8 = objc_opt_class();
  LOBYTE(v8) = [(id)v8 isEqual:objc_opt_class()];

  if ((v8 & 1) == 0)
  {
    __int16 v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = NSStringFromSelector(a2);
      __int16 v12 = [(HUServiceDetailsViewController *)self detailsItemManager];
      uint64_t v13 = [v12 serviceLikeBuilder];
      int v25 = 138412802;
      __int16 v26 = self;
      __int16 v27 = 2112;
      uint64_t v28 = v11;
      __int16 v29 = 2112;
      uint64_t v30 = objc_opt_class();
      _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ Using HFMediaSystemBuilder instead of %@ to commit changes.", (uint8_t *)&v25, 0x20u);
    }
    id v14 = objc_alloc(MEMORY[0x1E4F692C8]);
    id v15 = [(HUItemTableViewController *)self itemManager];
    uint64_t v16 = [v15 home];
    uint64_t v17 = (void *)[v14 initWithExistingObject:v5 inHome:v16];

    id v18 = [(HUServiceDetailsViewController *)self detailsItemManager];
    uint64_t v19 = [v18 serviceLikeBuilder];
    __int16 v20 = [v19 room];
    [v17 setRoom:v20];

    objc_opt_class();
    id v21 = [(HUServiceDetailsViewController *)self item];
    if (objc_opt_isKindOfClass()) {
      __int16 v22 = v21;
    }
    else {
      __int16 v22 = 0;
    }
    id v23 = v22;
    uint64_t v9 = [(HUServiceDetailsViewController *)self _commitBuilderFor:v23 with:v17];
  }
  else
  {
LABEL_3:
    uint64_t v9 = [(HUServiceDetailsViewController *)self _commitBuilder];
  }

  return v9;
}

- (BOOL)_shouldShowHomeTheaterPrompt
{
  id v2 = (void *)MEMORY[0x1E4F692A8];
  id v3 = [(HUServiceDetailsViewController *)self item];
  id v4 = [v2 mediaProfileContainerForItem:v3 forTopLevel:1];

  if (v4) {
    char v5 = objc_msgSend(v4, "hf_supportsHomeTheater");
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void)_executeSilentSoftwareUpdateCheck
{
  id v2 = [(HUServiceDetailsViewController *)self item];
  if ([v2 conformsToProtocol:&unk_1F1A3D770]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  char v5 = [v4 accessoriesSupportingSoftwareUpdate];

  if ([v5 count])
  {
    id v6 = [v5 anyObject];
    uint64_t v7 = [v6 home];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __67__HUServiceDetailsViewController__executeSilentSoftwareUpdateCheck__block_invoke;
    v10[3] = &unk_1E63869C8;
    id v11 = v7;
    id v8 = v7;
    if ((objc_msgSend(v5, "na_all:", v10) & 1) == 0) {
      NSLog(&cfstr_AccessoriesSho.isa);
    }

    uint64_t v9 = +[HUSoftwareUpdateUIManager sharedManager];
    [v9 startSilentBackgroundCheckForHome:v8];
  }
}

BOOL __67__HUServiceDetailsViewController__executeSilentSoftwareUpdateCheck__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 home];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)_fetchAccessoryDiagnosticInfo
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  id v3 = [(HUServiceDetailsViewController *)self item];
  if (objc_opt_isKindOfClass()) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = 0;
  }
  id v5 = v4;

  id v6 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  uint64_t v7 = [v6 home];
  int v8 = objc_msgSend(v7, "hf_currentUserIsOwner");

  if (v8) {
    BOOL v9 = v5 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    id v14 = HFLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = NSNumber;
      id v11 = [MEMORY[0x1E4F691A0] sharedDispatcher];
      __int16 v12 = [v11 home];
      uint64_t v13 = objc_msgSend(v10, "numberWithBool:", objc_msgSend(v12, "hf_currentUserIsOwner"));
      int v15 = 138412546;
      uint64_t v16 = v13;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "Not fetching diagnostic info: [isOwner:%@], [mediaAccessoryItem:%@]", (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
    id v14 = [v5 accessories];
    [v14 na_each:&__block_literal_global_934];
  }
}

void __63__HUServiceDetailsViewController__fetchAccessoryDiagnosticInfo__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v2 = objc_msgSend(v6, "hf_linkedResidentDevice");
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    BOOL v4 = [v3 diagnosticInfoManager];
    id v5 = (id)[v4 fetchDiagnosticInfoForAccessory:v6];
  }
}

- (void)didSelectHeaderWarningAction:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v61 = self;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@: User tapped header warning/symptom", buf, 0xCu);
  }

  objc_opt_class();
  uint64_t v7 = [(HUItemTableViewController *)self itemManager];
  if (objc_opt_isKindOfClass()) {
    int v8 = v7;
  }
  else {
    int v8 = 0;
  }
  id v9 = v8;

  __int16 v10 = [v9 sourceItemAccessory];
  int v11 = objc_msgSend(v10, "hf_needsReprovisioningCheck");

  if (v11)
  {
    __int16 v12 = [v9 sourceItemAccessory];
    uint64_t v13 = [v12 home];

    id v14 = [v9 sourceItemAccessory];
    [(HUServiceDetailsViewController *)v13 hf_startReprovisioningAccessory:v14];

    int v15 = (void *)MEMORY[0x1E4F1CAD0];
    id v16 = [v9 sourceItem];
    __int16 v17 = [v15 setWithObject:v16];
    id v18 = (id)[v9 updateResultsForItems:v17 senderSelector:a2];
LABEL_37:

    goto LABEL_38;
  }
  objc_opt_class();
  uint64_t v19 = [v9 headerItem];
  __int16 v20 = [v19 latestResults];
  id v21 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F68C18]];
  if (objc_opt_isKindOfClass()) {
    __int16 v22 = v21;
  }
  else {
    __int16 v22 = 0;
  }
  uint64_t v13 = v22;

  char v52 = self;
  id v23 = [(HUItemTableViewController *)self itemManager];
  __int16 v24 = [v23 sourceItem];
  int v25 = [v24 latestResults];
  id v16 = [v25 objectForKey:*MEMORY[0x1E4F68740]];

  if (!v16)
  {
    id obj = [v9 sourceItem];
    id v34 = [obj accessories];
    id v16 = [v34 anyObject];
LABEL_26:

LABEL_27:
    goto LABEL_28;
  }
  if ([(HUServiceDetailsViewController *)v13 type] == 1
    || [(HUServiceDetailsViewController *)v13 type] == 2
    || [(HUServiceDetailsViewController *)v13 type] == 20)
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id obj = [v16 accessories];
    uint64_t v26 = [obj countByEnumeratingWithState:&v56 objects:v66 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      id v49 = v21;
      id v50 = v16;
      id v51 = v5;
      uint64_t v28 = *(void *)v57;
      while (2)
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v57 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v30 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          uint64_t v31 = [v30 symptomsHandler];
          uint64_t v32 = [v31 symptoms];
          v54[0] = MEMORY[0x1E4F143A8];
          v54[1] = 3221225472;
          v54[2] = __63__HUServiceDetailsViewController_didSelectHeaderWarningAction___block_invoke;
          v54[3] = &unk_1E638CB68;
          __int16 v55 = v13;
          id v33 = objc_msgSend(v32, "na_firstObjectPassingTest:", v54);

          if (v33)
          {
            id v16 = v30;

            id v34 = v55;
            id v5 = v51;
            id v21 = v49;
            goto LABEL_26;
          }
        }
        uint64_t v27 = [obj countByEnumeratingWithState:&v56 objects:v66 count:16];
        if (v27) {
          continue;
        }
        break;
      }
      id v5 = v51;
      id v21 = v49;
    }
    goto LABEL_27;
  }
LABEL_28:
  id v35 = HFLogForCategory();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v36 = [(HUServiceDetailsViewController *)v13 type];
    *(_DWORD *)buf = 138412802;
    uint64_t v61 = v13;
    __int16 v62 = 2048;
    uint64_t v63 = v36;
    __int16 v64 = 2112;
    id v65 = v16;
    _os_log_impl(&dword_1BE345000, v35, OS_LOG_TYPE_DEFAULT, "Trying to fix symptom %@ (type %lu) for object %@", buf, 0x20u);
  }

  if (v16)
  {
    if ([(HUServiceDetailsViewController *)v13 type] == 7)
    {
      id v37 = HFLocalizedString();
      __int16 v17 = objc_msgSend(MEMORY[0x1E4F42728], "hu_actionSheetWithTitle:message:anchorView:", v37, 0, v5);
      __int16 v38 = (void *)MEMORY[0x1E4F42720];
      char v39 = HFLocalizedString();
      id v40 = [v38 actionWithTitle:v39 style:0 handler:&__block_literal_global_945];
      [v17 addAction:v40];

      int v41 = (void *)MEMORY[0x1E4F42720];
      __int16 v42 = HFLocalizedString();
      uint64_t v43 = [v41 actionWithTitle:v42 style:0 handler:&__block_literal_global_955];
      [v17 addAction:v43];

      __int16 v44 = (void *)MEMORY[0x1E4F42720];
      id v45 = HFLocalizedString();
      __int16 v46 = [v44 actionWithTitle:v45 style:1 handler:0];
      [v17 addAction:v46];

      [(HUServiceDetailsViewController *)v52 presentViewController:v17 animated:0 completion:0];
      goto LABEL_37;
    }
    if ([(HUServiceDetailsViewController *)v13 type] == 14)
    {
      __int16 v17 = [MEMORY[0x1E4F69378] sharedInstance];
      SEL v47 = objc_msgSend(MEMORY[0x1E4F1CB10], "hf_wifiSettingsURL");
      id v48 = (id)[v17 openURL:v47];

      goto LABEL_37;
    }
    if (v13)
    {
      __int16 v17 = [MEMORY[0x1E4F69608] sharedManager];
      [v17 fixSymptom:v13 forFixableObject:v16 presentingViewController:v52];
      uint64_t v13 = v21;
      goto LABEL_37;
    }
  }
LABEL_38:
}

BOOL __63__HUServiceDetailsViewController_didSelectHeaderWarningAction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 type];
  return v3 == [*(id *)(a1 + 32) type];
}

void __63__HUServiceDetailsViewController_didSelectHeaderWarningAction___block_invoke_943()
{
  id v2 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com"];
  v0 = [MEMORY[0x1E4F69378] sharedInstance];
  id v1 = (id)[v0 openURL:v2];
}

void __63__HUServiceDetailsViewController_didSelectHeaderWarningAction___block_invoke_2()
{
  id v2 = [MEMORY[0x1E4F1CB10] URLWithString:@"tel://800-692-7753"];
  v0 = [MEMORY[0x1E4F69378] sharedInstance];
  id v1 = (id)[v0 openURL:v2];
}

- (id)_recoverItemBuilder:(id)a3 fromError:(id)a4
{
  id v5 = a4;
  id v6 = [(HUServiceDetailsViewController *)self detailsItemManager];
  uint64_t v7 = [v6 sourceItem];
  if ([v7 conformsToProtocol:&unk_1F19E4798]) {
    int v8 = v7;
  }
  else {
    int v8 = 0;
  }
  id v9 = v8;

  __int16 v10 = [v9 homeKitObject];

  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v10, "hf_isValidObject") & 1) == 0)
  {
    uint64_t v11 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F7A0D8] futureWithError:v5];
  }
  __int16 v12 = (void *)v11;

  return v12;
}

- (void)home:(id)a3 didRemoveMediaSystem:(id)a4
{
}

- (void)home:(id)a3 didRemoveServiceGroup:(id)a4
{
}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
}

- (void)accessoryDidUpdateControllable:(id)a3
{
  id v5 = a3;
  id v6 = [(HUServiceDetailsViewController *)self detailsItemManager];
  uint64_t v7 = [v6 sourceItem];
  if ([v7 conformsToProtocol:&unk_1F19E4798]) {
    int v8 = v7;
  }
  else {
    int v8 = 0;
  }
  id v9 = v8;
  __int16 v10 = [v9 homeKitObject];

  uint64_t v11 = [(HUServiceDetailsViewController *)self detailsItemManager];
  __int16 v12 = [v11 sourceItem];
  if ([v12 conformsToProtocol:&unk_1F1A3D190]) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  id v14 = v13;
  id v15 = [v14 accessoryRepresentableObject];

  if (v15
    || ((id v15 = v10, ![v15 conformsToProtocol:&unk_1F1AD8588])
      ? (id v16 = 0)
      : (id v16 = v15),
        id v17 = v16,
        v15,
        v17))
  {
    id v18 = objc_msgSend(v15, "hf_associatedAccessories");
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __65__HUServiceDetailsViewController_accessoryDidUpdateControllable___block_invoke;
    v22[3] = &unk_1E63869C8;
    id v23 = v5;
    int v19 = objc_msgSend(v18, "na_any:", v22);

    if (v19)
    {
      __int16 v20 = [(HUItemTableViewController *)self itemManager];
      id v21 = (id)[v20 reloadAndUpdateAllItemsFromSenderSelector:a2];
    }
  }
}

uint64_t __65__HUServiceDetailsViewController_accessoryDidUpdateControllable___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isEqual:v3])
  {
    uint64_t v4 = 1;
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) uniqueIdentifier];
    id v6 = [v3 uniqueIdentifier];
    uint64_t v4 = [v5 isEqual:v6];
  }
  return v4;
}

- (void)accessoryDidUpdateServices:(id)a3
{
  uint64_t v4 = [(HUServiceDetailsViewController *)self detailsItemManager];
  id v5 = [v4 sourceItem];
  if ([v5 conformsToProtocol:&unk_1F19E4798]) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v11 = v6;

  uint64_t v7 = v11;
  if (v11)
  {
    objc_opt_class();
    int v8 = [v11 homeKitObject];
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    if (v10 && (objc_msgSend(v10, "hf_isValidObject") & 1) == 0) {
      [(HUServiceDetailsViewController *)self _didRemoveHomeKitObject:v10];
    }

    uint64_t v7 = v11;
  }
}

- (void)_didRemoveHomeKitObject:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    int v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"HUServiceDetailsViewController.m", 3767, @"Invalid parameter not satisfying: %@", @"homeKitObject" object file lineNumber description];
  }
  id v6 = [(HUServiceDetailsViewController *)self detailsItemManager];
  uint64_t v7 = [v6 sourceItem];
  if ([v7 conformsToProtocol:&unk_1F19E4798]) {
    int v8 = v7;
  }
  else {
    int v8 = 0;
  }
  id v9 = v8;
  id v10 = [v9 homeKitObject];

  if (v10 == v5) {
    goto LABEL_15;
  }
  objc_opt_class();
  id v11 = v5;
  if (objc_opt_isKindOfClass()) {
    __int16 v12 = v11;
  }
  else {
    __int16 v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    id v14 = [v13 cameraProfiles];
    char v15 = [v14 containsObject:v10];

    if (v15) {
      goto LABEL_14;
    }
    id v16 = [v13 mediaProfile];
    char v17 = [v16 isEqual:v10];

    if ((v17 & 1) != 0
      || ([v13 profiles],
          id v18 = objc_claimAutoreleasedReturnValue(),
          int v19 = [v18 containsObject:v10],
          v18,
          v19))
    {
LABEL_14:

LABEL_15:
      if (objc_msgSend(v5, "hf_isValidObject")) {
        NSLog(&cfstr_ThisObjectIsVa.isa);
      }
      __int16 v20 = HFLogForCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v5;
        _os_log_impl(&dword_1BE345000, v20, OS_LOG_TYPE_DEFAULT, "HomeKit Object '%@' was removed; dismissing presented serviceDetailsViewController",
          buf,
          0xCu);
      }

      [(HUServiceDetailsViewController *)self setRequiresPresentingViewControllerDismissal:1];
      id v21 = [(HUServiceDetailsViewController *)self presentationDelegate];
      id v22 = (id)[v21 finishPresentation:self animated:1];
      goto LABEL_20;
    }
    id v23 = [v13 services];
    int v24 = [v23 containsObject:v10];

    if (v24) {
      goto LABEL_15;
    }
  }
  id v21 = HFLogForCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v11;
    _os_log_impl(&dword_1BE345000, v21, OS_LOG_TYPE_DEFAULT, "HomeKit Object '%@' was not removed; Unable to validate backing source item.",
      buf,
      0xCu);
  }
LABEL_20:
}

- (void)didSelectHomeAssistantDeviceSplitAccountAction:(unint64_t)a3
{
  if (a3 != 1)
  {
    if (a3 != 2)
    {
      id v13 = HFLogForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)char v15 = 0;
        _os_log_error_impl(&dword_1BE345000, v13, OS_LOG_TYPE_ERROR, "Invalid split, media account action", v15, 2u);
      }
      goto LABEL_10;
    }
    uint64_t v4 = [(HUServiceDetailsViewController *)self detailsItemManager];
    int v5 = [v4 sourceItemIsHomePod];

    if (v5)
    {
      objc_opt_class();
      id v6 = [(HUServiceDetailsViewController *)self item];
      if (objc_opt_isKindOfClass()) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0;
      }
      id v8 = v7;

      id v9 = (void *)MEMORY[0x1E4F68EF8];
      id v10 = [v8 mediaProfileContainer];
      id v11 = [v10 accessories];
      __int16 v12 = [v9 logoutAccessories:v11];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __81__HUServiceDetailsViewController_didSelectHomeAssistantDeviceSplitAccountAction___block_invoke;
      v16[3] = &unk_1E63852A8;
      id v17 = v8;
      id v18 = self;
      id v13 = v8;
      id v14 = (id)[v12 addCompletionBlock:v16];

LABEL_10:
    }
  }
  [(HUServiceDetailsViewController *)self _setDismissedHomePodHasNonMemberMediaAccountWarning:1];
}

void __81__HUServiceDetailsViewController_didSelectHomeAssistantDeviceSplitAccountAction___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    int v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = [*(id *)(a1 + 32) mediaProfileContainer];
      int v7 = 138412546;
      id v8 = v6;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "Error logging out media account for [%@]:[%@]", (uint8_t *)&v7, 0x16u);
    }
    [*(id *)(a1 + 40) _setDismissedHomePodHasNonMemberMediaAccountWarning:0];
  }
}

- (void)_setDismissedHomePodHasNonMemberMediaAccountWarning:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  id v6 = [(HUServiceDetailsViewController *)self item];
  if (objc_opt_isKindOfClass()) {
    int v7 = v6;
  }
  else {
    int v7 = 0;
  }
  id v8 = v7;

  __int16 v9 = [v8 mediaProfileContainer];

  id v10 = objc_msgSend(v9, "hf_settingsValueManager");
  uint64_t v11 = [v10 settings];

  __int16 v12 = objc_msgSend(v11, "hf_accessorySettingAtKeyPath:", *MEMORY[0x1E4F684A8]);
  id v13 = [NSNumber numberWithBool:v3];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __86__HUServiceDetailsViewController__setDismissedHomePodHasNonMemberMediaAccountWarning___block_invoke;
  v14[3] = &unk_1E6386978;
  v14[4] = self;
  void v14[5] = a2;
  [v12 updateValue:v13 completionHandler:v14];
}

void __86__HUServiceDetailsViewController__setDismissedHomePodHasNonMemberMediaAccountWarning___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "Error setting HFHMSettingKeyPath_DismissedHomePodHasNonMemberMediaAccountWarning to YES", (uint8_t *)location, 2u);
    }
  }
  else
  {
    objc_initWeak(location, *(id *)(a1 + 32));
    int v5 = (void *)MEMORY[0x1E4F7A0D8];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __86__HUServiceDetailsViewController__setDismissedHomePodHasNonMemberMediaAccountWarning___block_invoke_2;
    v7[3] = &unk_1E638CB90;
    objc_copyWeak(v8, location);
    v8[1] = *(id *)(a1 + 40);
    id v6 = (id)[v5 futureWithBlock:v7];
    objc_destroyWeak(v8);
    objc_destroyWeak(location);
  }
}

void __86__HUServiceDetailsViewController__setDismissedHomePodHasNonMemberMediaAccountWarning___block_invoke_2(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained detailsItemManager];
  id v4 = (id)[v3 reloadAndUpdateAllItemsFromSenderSelector:*(void *)(a1 + 40)];

  int v5 = [WeakRetained detailsItemManager];
  LODWORD(v3) = [v5 diffableDataSourceDisabled];

  if (v3)
  {
    id v6 = [WeakRetained tableView];
    int v7 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
    [v6 reloadSections:v7 withRowAnimation:5];
LABEL_5:

    goto LABEL_6;
  }
  id v8 = [WeakRetained itemManager];
  id v6 = [v8 itemSectionForSectionIndex:0];

  if (v6)
  {
    int v7 = [WeakRetained detailsItemManager];
    v10[0] = v6;
    __int16 v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v7 reloadUIRepresentationForSections:v9 withAnimation:0];

    goto LABEL_5;
  }
LABEL_6:
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)showConnectedEcosystems
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__HUServiceDetailsViewController_showConnectedEcosystems__block_invoke;
  v7[3] = &unk_1E6385108;
  void v7[4] = self;
  id v3 = [MEMORY[0x1E4F7A0D8] futureWithBlock:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__HUServiceDetailsViewController_showConnectedEcosystems__block_invoke_2;
  v6[3] = &unk_1E638CBB8;
  v6[4] = self;
  id v4 = [v3 flatMap:v6];

  return v4;
}

void __57__HUServiceDetailsViewController_showConnectedEcosystems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [HUMatterConnectedServicesViewController alloc];
  int v5 = [*(id *)(a1 + 32) detailsItemManager];
  id v6 = [v5 connectedServicesItemModule];
  int v7 = [v6 connectedServicesItemProvider];
  id v8 = [(HUMatterConnectedServicesViewController *)v4 initWithConnectedServicesItemProvider:v7];

  [(HUMatterConnectedServicesViewController *)v8 setDelegate:*(void *)(a1 + 32)];
  [v3 finishWithResult:v8];
}

id __57__HUServiceDetailsViewController_showConnectedEcosystems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 navigationController];
  int v5 = objc_msgSend(v4, "hu_pushPreloadableViewController:animated:", v3, 1);

  return v5;
}

- (HUPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);

  return (HUPresentationDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (BOOL)requiresPresentingViewControllerDismissal
{
  return self->_requiresPresentingViewControllerDismissal;
}

- (void)setRequiresPresentingViewControllerDismissal:(BOOL)a3
{
  self->_requiresPresentingViewControllerDismissal = a3;
}

- (BOOL)shouldIncludeRoomNameInHeaderTitle
{
  return self->_shouldIncludeRoomNameInHeaderTitle;
}

- (BOOL)shouldDisableAdditionalDismissalForTogglingSeparatingTiles
{
  return self->_shouldDisableAdditionalDismissalForTogglingSeparatingTiles;
}

- (void)setShouldDisableAdditionalDismissalForTogglingSeparatingTiles:(BOOL)a3
{
  self->_shouldDisableAdditionalDismissalForTogglingSeparatingTiles = a3;
}

- (HUNameItemModuleController)nameItemModuleController
{
  return self->_nameItemModuleController;
}

- (void)setNameItemModuleController:(id)a3
{
}

- (HUAccessorySettingsItemModuleController)accessorySettingsItemModuleController
{
  return self->_accessorySettingsItemModuleController;
}

- (void)setAccessorySettingsItemModuleController:(id)a3
{
}

- (NSMapTable)moduleToModuleControllerMap
{
  return self->_moduleToModuleControllerMap;
}

- (void)setModuleToModuleControllerMap:(id)a3
{
}

- (HUSoftwareUpdateItemModuleController)softwareUpdateItemModuleController
{
  return self->_softwareUpdateItemModuleController;
}

- (void)setSoftwareUpdateItemModuleController:(id)a3
{
}

- (HUAvailableRelatedTriggerItemModuleController)associatedTriggerModuleController
{
  return self->_associatedTriggerModuleController;
}

- (void)setAssociatedTriggerModuleController:(id)a3
{
}

- (HUChildServiceItemModuleController)valveEditorItemModuleController
{
  return self->_valveEditorItemModuleController;
}

- (void)setValveEditorItemModuleController:(id)a3
{
}

- (HUChildServiceItemModuleController)accessoryServicesEditorItemModuleController
{
  return self->_accessoryServicesEditorItemModuleController;
}

- (void)setAccessoryServicesEditorItemModuleController:(id)a3
{
}

- (HUAssociatedSceneAndTriggerModuleController)sceneAndTriggerModuleController
{
  return self->_sceneAndTriggerModuleController;
}

- (void)setSceneAndTriggerModuleController:(id)a3
{
}

- (HUTelevisionSettingsItemModuleController)televisionSettingsItemModuleController
{
  return self->_televisionSettingsItemModuleController;
}

- (void)setTelevisionSettingsItemModuleController:(id)a3
{
}

- (HUChildServiceItemModuleController)inputSourceItemModuleController
{
  return self->_inputSourceItemModuleController;
}

- (void)setInputSourceItemModuleController:(id)a3
{
}

- (HUMatterConnectedServicesItemModuleController)connectedServicesItemModuleController
{
  return self->_connectedServicesItemModuleController;
}

- (void)setConnectedServicesItemModuleController:(id)a3
{
}

- (HUServiceDetailsItemManager)detailsItemManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_detailsItemManager);

  return (HUServiceDetailsItemManager *)WeakRetained;
}

- (void)setDetailsItemManager:(id)a3
{
}

- (HUControlPanelController)controlPanelController
{
  return self->_controlPanelController;
}

- (NSHashTable)expandedControlPanelItems
{
  return self->_expandedControlPanelItems;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (BOOL)isMultiServiceAccessory
{
  return self->_isMultiServiceAccessory;
}

- (BOOL)isItemGroup
{
  return self->_isItemGroup;
}

- (BOOL)supportsCustomIconEditing
{
  return self->_supportsCustomIconEditing;
}

- (UILongPressGestureRecognizer)longPressRecognizer
{
  return self->_longPressRecognizer;
}

- (void)setLongPressRecognizer:(id)a3
{
}

- (HUServiceDetailsTextViewDelegate)textViewDelegate
{
  return self->_textViewDelegate;
}

- (void)setTextViewDelegate:(id)a3
{
}

- (HFNamingComponents)namingComponent
{
  return self->_namingComponent;
}

- (void)setNamingComponent:(id)a3
{
}

- (HUQuickControlSummaryNavigationBarTitleView)navigationBarTitleView
{
  return self->_navigationBarTitleView;
}

- (void)setNavigationBarTitleView:(id)a3
{
}

- (HUQuickControlProxHandOffSummaryViewUpdater)proxHandOffSummaryViewUpdater
{
  return self->_proxHandOffSummaryViewUpdater;
}

- (void)setProxHandOffSummaryViewUpdater:(id)a3
{
}

- (BOOL)shouldTrackProgrammableSwitchActivations
{
  return self->_shouldTrackProgrammableSwitchActivations;
}

- (BOOL)isPresentingRoomsList
{
  return self->_isPresentingRoomsList;
}

- (void)setIsPresentingRoomsList:(BOOL)a3
{
  self->_isPresentingRoomsList = a3;
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
}

- (int64_t)inProgressExportDiagnosticsIndex
{
  return self->_inProgressExportDiagnosticsIndex;
}

- (void)setInProgressExportDiagnosticsIndex:(int64_t)a3
{
  self->_inProgressExportDiagnosticsIndex = a3;
}

- (NSMutableSet)registeredButtonFutures
{
  return self->_registeredButtonFutures;
}

- (void)setRegisteredButtonFutures:(id)a3
{
}

- (NAFuture)accountFuture
{
  return self->_accountFuture;
}

- (void)setAccountFuture:(id)a3
{
}

- (NAFuture)homePodIdentifyFuture
{
  return self->_homePodIdentifyFuture;
}

- (void)setHomePodIdentifyFuture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homePodIdentifyFuture, 0);
  objc_storeStrong((id *)&self->_accountFuture, 0);
  objc_storeStrong((id *)&self->_registeredButtonFutures, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_proxHandOffSummaryViewUpdater, 0);
  objc_storeStrong((id *)&self->_navigationBarTitleView, 0);
  objc_storeStrong((id *)&self->_namingComponent, 0);
  objc_storeStrong((id *)&self->_textViewDelegate, 0);
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_expandedControlPanelItems, 0);
  objc_storeStrong((id *)&self->_controlPanelController, 0);
  objc_destroyWeak((id *)&self->_detailsItemManager);
  objc_storeStrong((id *)&self->_connectedServicesItemModuleController, 0);
  objc_storeStrong((id *)&self->_inputSourceItemModuleController, 0);
  objc_storeStrong((id *)&self->_televisionSettingsItemModuleController, 0);
  objc_storeStrong((id *)&self->_sceneAndTriggerModuleController, 0);
  objc_storeStrong((id *)&self->_accessoryServicesEditorItemModuleController, 0);
  objc_storeStrong((id *)&self->_valveEditorItemModuleController, 0);
  objc_storeStrong((id *)&self->_associatedTriggerModuleController, 0);
  objc_storeStrong((id *)&self->_softwareUpdateItemModuleController, 0);
  objc_storeStrong((id *)&self->_moduleToModuleControllerMap, 0);
  objc_storeStrong((id *)&self->_accessorySettingsItemModuleController, 0);
  objc_storeStrong((id *)&self->_nameItemModuleController, 0);

  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end