@interface CKDetailsController
+ (void)saveGroupPhotoDataAndUpdateParticipants:(id)a3 forConversation:(id)a4;
+ (void)updateParticipantsWithGroupPhotoAtPath:(id)a3 forConversation:(id)a4;
- (BOOL)_atLeastOneEmailPresentInHandles:(id)a3;
- (BOOL)_canRemoveRecipientAtIndexPath:(id)a3;
- (BOOL)_fmfExpirationDateIsValid;
- (BOOL)_moreThanMinNumberOfParticipantsInGroup;
- (BOOL)allRecipientsAlreadyFollowingLocation;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canLeaveConversation;
- (BOOL)conversationHasLeft;
- (BOOL)didPerformPurgedAttachmentsCheck;
- (BOOL)fmfEnabled;
- (BOOL)fmfRestricted;
- (BOOL)hasTUConversation;
- (BOOL)isContactViewController:(id)a3;
- (BOOL)isContactsSectionCollapsed;
- (BOOL)isContactsSectionCollapsible;
- (BOOL)isDisplayingPhotos;
- (BOOL)isGroupChat;
- (BOOL)needsContactsReload;
- (BOOL)shouldAddToVisibleContactRowCountForTUConversation;
- (BOOL)shouldCollapseContactsSection;
- (BOOL)shouldDisplayFooterForSection:(unint64_t)a3;
- (BOOL)shouldDisplayHeaderForSection:(unint64_t)a3;
- (BOOL)shouldEnableAddContactButton;
- (BOOL)shouldForceGroupPhotoHeaderReload;
- (BOOL)shouldShowActiveDeviceSwitchFooter;
- (BOOL)shouldShowAddMemberCell;
- (BOOL)shouldShowBusinessInfoFooter;
- (BOOL)shouldShowDownloadMoreCell;
- (BOOL)shouldShowEnhancedGroupFeatures;
- (BOOL)shouldShowExpanseFeatures;
- (BOOL)shouldShowFMFView;
- (BOOL)shouldShowFooterInLocationSection:(int64_t)a3;
- (BOOL)shouldShowGroupCount;
- (BOOL)shouldShowGroupPhotoActionTitle;
- (BOOL)shouldShowKTSection;
- (BOOL)shouldShowKeyTransparency;
- (BOOL)shouldShowLocationStringForOneToOneConversation;
- (BOOL)shouldShowSIMTypeSection;
- (BOOL)shouldShowSharedWithYouFeatures;
- (BOOL)supportsChatNameAndPhotoHeader;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5;
- (BOOL)wasShowingReadReceiptSwitch;
- (CGSize)computedPreferredContentSize;
- (CGSize)screenSize;
- (CKBusinessInfoView)businessInfoView;
- (CKConversation)conversation;
- (CKDetailsAddGroupNameView)groupNameView;
- (CKDetailsCell)changeGroupNamePhotoCell;
- (CKDetailsContactsManager)contactsManager;
- (CKDetailsController)initWithConversation:(id)a3;
- (CKDetailsControllerDelegate)detailsControllerDelegate;
- (CKDetailsDownloadAttachmentsHeaderFooterView)downloadAttachmentsFooterView;
- (CKDetailsGroupNameCell)groupNameCell;
- (CKDetailsLocationShareCell)locationShareCell;
- (CKDetailsLocationStringCell)locationStringCell;
- (CKDetailsMapViewCell)mapViewCell;
- (CKDetailsSIMCell)simCell;
- (CKDetailsSIMCell)simSwitchCell;
- (CKDetailsSearchViewController)searchViewController;
- (CKDetailsTableView)tableView;
- (CKEnableEnhancedProtectionCell)ktEnableEnhancedProtectionCell;
- (CKEntity)presentedEntity;
- (CKGroupPhotoCell)groupPhotoCell;
- (CKGroupRecipientSelectionController)addRecipientsController;
- (CKKTEnhancedProtectionStatusCell)ktEnhancedProtectionStateCell;
- (CKKTVerifyConversationTableViewCell)ktVerifyConversationCell;
- (CKNavigationController)groupNavigationController;
- (CKTranscriptDetailsResizableCell)locationSendOrRequestCell;
- (CKTranscriptDetailsResizableCell)locationStartShareCell;
- (CKTranscriptDetailsResizableCell)openInContactsCell;
- (CKTranscriptDetailsResizableCell)sendCurrentLocationCell;
- (CNContactStore)suggestionsEnabledContactStore;
- (CNGroupIdentityHeaderViewController)groupPhotoHeaderViewController;
- (FMFMapViewController)mapViewController;
- (NSArray)actions;
- (NSArray)ktHandlesForKtChatStatus;
- (NSData)selectedImageData;
- (NSNumber)canShareFocusStatus;
- (NSNumber)isSharingFocusStatus;
- (NSTimer)fmfUpdateTimer;
- (UIButton)screenShareContextButton;
- (UITextView)expanseActivityTextView;
- (UITextView)ktSecurityFooterTextView;
- (UITextView)locationSharingTextView;
- (UITextView)sharedWithYouFooterTextView;
- (UIViewController)findMyWaldoMapViewController;
- (UIVisualEffectView)visualEffectView;
- (double)_heightForAuxContactCellAtIndexPath:(id)a3;
- (double)_heightForContactCellAtIndexPath:(id)a3;
- (double)_heightForExpanseActivityCell;
- (double)addContactCellHeight;
- (double)calculateHeightForExpanseActivityHeader;
- (double)calculateHeightForGroupPhotoHeader;
- (double)calculateHeightForKTFooter;
- (double)calculateHeightForLocationSharingFooter;
- (double)calculateHeightForShareAutomaticallyFooter;
- (double)contentOffsetYShiftAfterKeyboardNotification;
- (double)groupPhotoHeaderHeight;
- (double)showMoreContactCellHeight;
- (double)simLabelCellHeight;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (double)tuConversationCellHeight;
- (id)_conversationOfferTimeExpiration;
- (id)_generateGroupImagePickerViewController;
- (id)_groupPhotoHeaderRequiredContactKeys;
- (id)_menuConfigForContactsCell:(id)a3;
- (id)_navigationBarTitle;
- (id)_tableViewCellForSendCurrentLocation;
- (id)_tableViewCellForSendOrRequestLocation;
- (id)_tableViewCellForSharingLocation:(BOOL)a3;
- (id)annotationContactForHandle:(id)a3;
- (id)annotationImageForHandle:(id)a3;
- (id)avatarView:(id)a3 orderedPropertiesForProperties:(id)a4 category:(id)a5;
- (id)businessInfoFooterViewForSection:(int64_t)a3;
- (id)chatOptionsCellForIndexPath:(id)a3;
- (id)childViewController:(id)a3 cellForIndexPath:(id)a4;
- (id)contactsManagerCellForIndexPath:(id)a3;
- (id)createAudioCallActionItemForChat:(id)a3;
- (id)createDNDCellAtIndexPath:(id)a3;
- (id)createReadReceiptsCellAtIndexPath:(id)a3;
- (id)createShareFocusStatusCellAtIndexPath:(id)a3;
- (id)createVideoCallActionItemForChat:(id)a3;
- (id)currentLocationDeniedAlert;
- (id)currentlyActiveFMFDevice;
- (id)defaultNavBarAppearance;
- (id)deleteAndBlockCellForIndexPath:(id)a3;
- (id)downloadAttachmentsFooterViewForSection:(int64_t)a3;
- (id)downloadAttachmentsText;
- (id)downloadButtonText;
- (id)editConversationCellForIndexPath:(id)a3;
- (id)emailAddressesForChat:(id)a3;
- (id)expanseActivityCellForIndexPath:(id)a3;
- (id)expanseActivityHeaderViewForSection:(int64_t)a3;
- (id)fmfHandlesFromIMHandles:(id)a3;
- (id)fmfViewControllerCellForIndexPath:(id)a3 shouldShowLocation:(BOOL)a4;
- (id)groupCountCellForIndexPath:(id)a3;
- (id)groupHeaderCellForIndexPath:(id)a3;
- (id)groupNameCellForIndexPath:(id)a3;
- (id)groupPhotoCellForIndexPath:(id)a3;
- (id)indexPathForCell:(id)a3;
- (id)inputAccessoryViewController;
- (id)keyCommands;
- (id)ktCellForRow:(int64_t)a3;
- (id)ktSecurityFooterView;
- (id)labelForChat;
- (id)leaveCellForIndexPath:(id)a3;
- (id)locationFooterViewForSection:(int64_t)a3;
- (id)locationShareCellForIndexPathRow:(int64_t)a3;
- (id)locationShareMenu;
- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4;
- (id)reuseIdentifierForCellInSection:(unint64_t)a3;
- (id)screenShareContextMenuForEntity:(id)a3;
- (id)screenSharingActionView;
- (id)searchAttachmentViewControllerCellForIndexPath:(id)a3;
- selfWeakWrapper;
- (id)setupAlternativeCommunicationActionsForChat:(id)a3;
- (id)sharedWithYouCellForIndexPath:(id)a3;
- (id)sharedWithYouFooterView;
- (id)simCellText:(id)a3;
- (id)simSwitcherMenu;
- (id)simTypeCellForIndexPath:(id)a3;
- (id)switchSubscriptionCellForIndexPathRow:(int64_t)a3;
- (id)switchToLabelForChat;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)tableView:(id)a3 editActionsForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (id)titleForBackButton;
- (id)transparentNavBarAppearance;
- (id)tuConversation;
- (id)tuConversationCellForIndexPath:(id)a3;
- (int64_t)_targetToggleIndexForOptionRow:(unint64_t)a3;
- (int64_t)adjustedViewModelIndexForIndexPath:(id)a3;
- (int64_t)ktEnhancedProtectionStatusCellState;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)rowForAddMemberCell;
- (int64_t)rowForFirstContactCell;
- (int64_t)rowForLastContact;
- (int64_t)rowForShowMoreContactsCell;
- (int64_t)rowForTUConversationCell;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)visibleContactsRows;
- (unint64_t)_optionRowForIndexPath:(id)a3;
- (unint64_t)_purgedAttachmentCount;
- (unint64_t)countOfContactViewModels;
- (unint64_t)downloadButtonState;
- (unint64_t)ktChatState;
- (unint64_t)undownloadedPhotoAttachmentCount;
- (void)_batchDownloadNotificationFired:(id)a3;
- (void)_chatAllowedByScreenTimeChanged:(id)a3;
- (void)_chatAutoDonatingHandleUpdateNotification:(id)a3;
- (void)_chatParticipantsChangedNotification:(id)a3;
- (void)_configureGroupPhotoHeader;
- (void)_configureSeparatorForContactCell:(id)a3 indexPath:(id)a4;
- (void)_configureSeparatorForOptionCell:(id)a3 indexPath:(id)a4;
- (void)_conversationListFinishedMerging:(id)a3;
- (void)_determineFocusStatusSharingState;
- (void)_dismissIdentityPicker:(id)a3;
- (void)_evaluateMetricsForStagingLocation;
- (void)_handleAddingHandles:(id)a3 allRecipientsAddresses:(id)a4 sender:(id)a5;
- (void)_handleAddressBookChanged:(id)a3;
- (void)_handleGroupDisplayNameChanged:(id)a3;
- (void)_handleGroupPhotoChanged:(id)a3;
- (void)_handleKeyTransparencyStatusChangedNotification:(id)a3;
- (void)_handleKeyboardWillHideNotification:(id)a3;
- (void)_handleKeyboardWillShowNotification:(id)a3;
- (void)_handleLocationChanged:(id)a3;
- (void)_handleMultiWayStateChange:(id)a3;
- (void)_hideAllContactCellButtons;
- (void)_lastAddressedHandleUpdateNotification:(id)a3;
- (void)_notifyDelegateDidSelectStopSharingLocation;
- (void)_presentGroupNameAndPhotoEditor;
- (void)_presentRemoveRecipientSheetForHandle:(id)a3 fromView:(id)a4;
- (void)_reloadForReadReceiptVisibilityChangeIfNeeded:(id)a3;
- (void)_resetPurgedAttachmentCount;
- (void)_showBrandCard;
- (void)_stageCurrentLocationInEntryViewForURL:(id)a3;
- (void)_stageLocationShareComposition:(int64_t)a3;
- (void)_toggleSharingStateFromABCard;
- (void)_updateDownloadButtonStateIfNeeded;
- (void)_updateDownloadFooterView;
- (void)adjustContentOffsetReloadingSharedAssetsContentViewCell;
- (void)autoDonationSwitchValueChanged:(id)a3;
- (void)businessInfoView:(id)a3 infoButtonTapped:(id)a4;
- (void)collapseContactsSection;
- (void)contactsCell:(id)a3 didHoverWithState:(int64_t)a4;
- (void)contactsCellDidTapFaceTimeVideoButton:(id)a3;
- (void)contactsCellDidTapMessagesButton:(id)a3;
- (void)contactsCellDidTapPhoneButton:(id)a3;
- (void)contactsManagerViewModelsDidChange:(id)a3;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)dealloc;
- (void)detailsAddGroupNameView:(id)a3 didCommitGroupName:(id)a4;
- (void)detailsController:(id)a3 didSelectSendLocationMessage:(id)a4 completion:(id)a5;
- (void)detailsSearchController:(id)a3 requestsPushOfSearchController:(id)a4;
- (void)detailsSearchControllerContentDidChange:(id)a3;
- (void)doNotDisturbValueChange:(id)a3;
- (void)enableEnhancedProtection;
- (void)expandContactsSection;
- (void)fmfMapViewController:(id)a3 didDeselectHandle:(id)a4;
- (void)fmfMapViewController:(id)a3 didSelectHandle:(id)a4;
- (void)getKTStatus;
- (void)groupCellDidTapFaceTimeVideoButton:(id)a3;
- (void)groupCellDidTapPhoneButton:(id)a3;
- (void)groupIdentityHeaderViewController:(id)a3 didDismissSharedProfileBannerWithUpdatedContact:(id)a4 forAction:(unint64_t)a5;
- (void)handleActiveDeviceChanged:(id)a3;
- (void)handleCancelAction:(id)a3;
- (void)handleDoneAction:(id)a3;
- (void)handleDoneButton:(id)a3;
- (void)handleFriendshipStatusChanged:(id)a3;
- (void)handleTapOnChromeAvatar:(id)a3;
- (void)initializeBusinessInfoViewIfNecessary;
- (void)initializeLocationSharingTextViewIfNecessary;
- (void)initializeSearchController;
- (void)keyTransparencyConversationViewControllerDidComplete:(id)a3;
- (void)keyTransparencyDetailsStatusCellDidRequestReportToApple:(id)a3;
- (void)keyTransparencyDetailsStatusCellDidSelectIgnoreFailures:(id)a3;
- (void)keyTransparencyDetailsStatusCellDidSelectLearnMore:(id)a3;
- (void)loadView;
- (void)metricDSDSLineSwitchWithPreviousServiceName:(id)a3 newServiceName:(id)a4 isGroupConversation:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)openInContacts;
- (void)presentDeleteAndBlockActionSheetFromView:(id)a3;
- (void)presentFullFMFMapViewController;
- (void)presentGroupRecipientSelectionControllerAtIndexPath:(id)a3;
- (void)presentLeaveActionSheetFromView:(id)a3;
- (void)previewingContext:(id)a3 commitViewController:(id)a4;
- (void)readReceiptsSwitchValueChanged:(id)a3;
- (void)reloadTableView;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)sendCurrentLocation;
- (void)setActions:(id)a3;
- (void)setAddContactCellHeight:(double)a3;
- (void)setAddRecipientsController:(id)a3;
- (void)setBusinessInfoView:(id)a3;
- (void)setCanShareFocusStatus:(id)a3;
- (void)setChangeGroupNamePhotoCell:(id)a3;
- (void)setContactsManager:(id)a3;
- (void)setContentOffsetYShiftAfterKeyboardNotification:(double)a3;
- (void)setConversation:(id)a3;
- (void)setDetailsControllerDelegate:(id)a3;
- (void)setDidPerformPurgedAttachmentsCheck:(BOOL)a3;
- (void)setDownloadAttachmentsFooterView:(id)a3;
- (void)setDownloadButtonState:(unint64_t)a3;
- (void)setExpanseActivityTextView:(id)a3;
- (void)setFindMyWaldoMapViewController:(id)a3;
- (void)setFmfUpdateTimer:(id)a3;
- (void)setGroupNameCell:(id)a3;
- (void)setGroupNameView:(id)a3;
- (void)setGroupNavigationController:(id)a3;
- (void)setGroupPhotoCell:(id)a3;
- (void)setGroupPhotoHeaderHeight:(double)a3;
- (void)setGroupPhotoHeaderViewController:(id)a3;
- (void)setHideAlerts:(BOOL)a3 reload:(BOOL)a4;
- (void)setIsContactsSectionCollapsed:(BOOL)a3;
- (void)setIsDisplayingPhotos:(BOOL)a3;
- (void)setIsSharingFocusStatus:(id)a3;
- (void)setKtChatState:(unint64_t)a3;
- (void)setKtEnableEnhancedProtectionCell:(id)a3;
- (void)setKtEnhancedProtectionStateCell:(id)a3;
- (void)setKtEnhancedProtectionStatusCellState:(int64_t)a3;
- (void)setKtHandlesForKtChatStatus:(id)a3;
- (void)setKtSecurityFooterTextView:(id)a3;
- (void)setKtVerifyConversationCell:(id)a3;
- (void)setLocationSendOrRequestCell:(id)a3;
- (void)setLocationShareCell:(id)a3;
- (void)setLocationSharingTextView:(id)a3;
- (void)setLocationStartShareCell:(id)a3;
- (void)setLocationStringCell:(id)a3;
- (void)setMapViewCell:(id)a3;
- (void)setMapViewController:(id)a3;
- (void)setNeedsContactsReload:(BOOL)a3;
- (void)setOpenInContactsCell:(id)a3;
- (void)setPresentedEntity:(id)a3;
- (void)setScreenShareContextButton:(id)a3;
- (void)setSearchViewController:(id)a3;
- (void)setSelectedImageData:(id)a3;
- (void)setSelfWeakWrapper:(id)a3;
- (void)setSendCurrentLocationCell:(id)a3;
- (void)setSendReadReceipts:(BOOL)a3 reload:(BOOL)a4;
- (void)setShareFocusStatus:(BOOL)a3 reload:(BOOL)a4;
- (void)setSharedWithYouFooterTextView:(id)a3;
- (void)setShouldCollapseContactsSection:(BOOL)a3;
- (void)setShouldForceGroupPhotoHeaderReload:(BOOL)a3;
- (void)setShowInSharedWithYou:(BOOL)a3 reload:(BOOL)a4;
- (void)setShowMoreContactCellHeight:(double)a3;
- (void)setSimCell:(id)a3;
- (void)setSimLabelCellHeight:(double)a3;
- (void)setSimSwitchCell:(id)a3;
- (void)setSuggestionsEnabledContactStore:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTuConversationCellHeight:(double)a3;
- (void)setUndownloadedPhotoAttachmentCount:(unint64_t)a3;
- (void)setVisualEffectView:(id)a3;
- (void)setWasShowingReadReceiptSwitch:(BOOL)a3;
- (void)setupContactsManager;
- (void)setupFMF;
- (void)setupFMFTimerIfNecessary;
- (void)setupKT;
- (void)shareFocusStatusSwitchValueChanged:(id)a3;
- (void)shareLocationAction;
- (void)showContactCardForEntity:(id)a3 fromView:(id)a4;
- (void)showKTContactVerificationUI;
- (void)spacePressed:(id)a3;
- (void)stageCurrentLocation;
- (void)stageLocationRequest;
- (void)switchSubscriptionToContext:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)toggleHideAlertsWithReload:(BOOL)a3;
- (void)toggleSendReadReceiptsWithReload:(BOOL)a3;
- (void)toggleShareFocusStatusWithReload:(BOOL)a3;
- (void)toggleShowInSharedWithYouWithReload:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateContactsHeaderVerificationState;
- (void)updateLocationForRecipient:(id)a3;
- (void)updateLocationStringCellWithString:(id)a3;
- (void)updateManualScrollEdgeProgress;
- (void)userDidTapDownloadForAttachmentsFooterView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)visualIdentityPicker:(id)a3 didUpdatePhotoForVisualIdentity:(id)a4 withContactImage:(id)a5;
@end

@implementation CKDetailsController

- (BOOL)fmfEnabled
{
  v2 = [(CKDetailsController *)self conversation];
  v3 = [v2 chat];
  char v4 = [v3 isSMS];

  v5 = [MEMORY[0x1E4F6BCB8] sharedInstance];
  LOBYTE(v3) = ([v5 disableLocationSharing] | v4) ^ 1;

  return (char)v3;
}

- (BOOL)fmfRestricted
{
  v2 = [MEMORY[0x1E4F6BCB8] sharedInstance];
  char v3 = [v2 restrictLocationSharing];

  return v3;
}

- (BOOL)shouldShowFooterInLocationSection:(int64_t)a3
{
  BOOL v5 = [(CKDetailsController *)self shouldShowFMFView];
  BOOL v6 = [(CKDetailsController *)self allRecipientsAlreadyFollowingLocation];
  v7 = [(CKDetailsController *)self conversation];
  uint64_t v8 = +[CKDetailsControllerLocationHelper numberOfCellsInLocationSectionWithConversation:v7 isFMFEnabled:[(CKDetailsController *)self fmfEnabled] isSharingLocation:v6 shouldShowFMFView:[(CKDetailsController *)self shouldShowFMFView]];

  if ((a3 != 3 || !v5) && (a3 != 7 || v5 || v8 < 1)) {
    return 0;
  }

  return [(CKDetailsController *)self shouldShowActiveDeviceSwitchFooter];
}

- (void)stageCurrentLocation
{
  char v3 = [MEMORY[0x1E4F6BD00] sharedInstance];
  char v4 = [v3 currentLocation];
  if (v4
    && [v3 locationAuthorizationDetermined]
    && ([v3 locationAuthorizationDenied] & 1) == 0)
  {
    BOOL v5 = [(CKDetailsController *)self conversation];
    BOOL v6 = +[CKDetailsControllerLocationHelper mapURLFor:v4 in:v5];

    [(CKDetailsController *)self _stageCurrentLocationInEntryViewForURL:v6];
  }
  else
  {
    id location = 0;
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__CKDetailsController_Location__stageCurrentLocation__block_invoke_2;
    v7[3] = &unk_1E5621AD0;
    id v8 = v4;
    objc_copyWeak(&v9, &location);
    [v3 startUpdatingCurrentLocationWithAuthorizedHandler:&__block_literal_global_11 updateHandler:v7];
    objc_destroyWeak(&v9);

    objc_destroyWeak(&location);
  }
}

void __53__CKDetailsController_Location__stageCurrentLocation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v6 && [v6 code] != 42)
  {
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v15 = 138412290;
        v16 = v7;
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Received unknown error while trying to send current location: %@. Aborting _stageCurrentLocation.", (uint8_t *)&v15, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = (id *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained(v9);
    v11 = [WeakRetained conversation];
    v12 = +[CKDetailsControllerLocationHelper mapURLFor:v8 in:v11];

    id v13 = objc_loadWeakRetained(v9);
    [v13 _stageCurrentLocationInEntryViewForURL:v12];
  }
}

- (void)_stageCurrentLocationInEntryViewForURL:(id)a3
{
  id v4 = a3;
  id v5 = [(CKDetailsController *)self conversation];
  id v6 = [v5 chat];

  if ([v6 authorizationToSendCurrentLocationMessageDenied])
  {
    v7 = [(CKDetailsController *)self currentLocationDeniedAlert];
    [v7 presentFromViewController:self animated:1 completion:0];
  }
  else if ([v6 canSendCurrentLocationMessage])
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F30AB0]);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__CKDetailsController_Location___stageCurrentLocationInEntryViewForURL___block_invoke;
    block[3] = &unk_1E5620AA8;
    id v11 = v8;
    id v12 = v4;
    id v13 = self;
    id v9 = v8;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __72__CKDetailsController_Location___stageCurrentLocationInEntryViewForURL___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __72__CKDetailsController_Location___stageCurrentLocationInEntryViewForURL___block_invoke_2;
  v3[3] = &unk_1E5621B20;
  int8x16_t v2 = *(int8x16_t *)(a1 + 40);
  int8x16_t v4 = vextq_s8(v2, v2, 8uLL);
  [v1 startFetchingMetadataForURL:(id)v2.i64[0] completionHandler:v3];
}

void __72__CKDetailsController_Location___stageCurrentLocationInEntryViewForURL___block_invoke_2(uint64_t a1, void *a2)
{
  char v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 conversation];
  id v6 = [v5 chat];
  v7 = [v6 account];
  id v8 = [v7 loginIMHandle];

  id v9 = [v8 name];
  [v4 setTitle:v9];

  [v4 setURL:*(void *)(a1 + 40)];
  v10 = +[CKBrowserItemPayload createBrowserItemPayloadWithRichLinkMetadata:v4];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__CKDetailsController_Location___stageCurrentLocationInEntryViewForURL___block_invoke_3;
  v11[3] = &unk_1E5621AF8;
  v11[4] = *(void *)(a1 + 32);
  +[CKComposition compositionWithShelfPluginPayload:v10 completionHandler:v11];
}

void __72__CKDetailsController_Location___stageCurrentLocationInEntryViewForURL___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  char v3 = [*(id *)(a1 + 32) detailsControllerDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) detailsControllerDelegate];
    [v5 detailsController:*(void *)(a1 + 32) wantsToStageComposition:v6];
  }
}

- (id)currentLocationDeniedAlert
{
  int8x16_t v2 = CKFrameworkBundle();
  char v3 = [v2 localizedStringForKey:@"TURN_ON_LOCATION_SERVICES_TO_SEND_LOCATION" value:&stru_1EDE4CA38 table:@"ChatKit"];
  char v4 = +[CKAlertController alertControllerWithTitle:v3 message:0 preferredStyle:1];

  id v5 = CKFrameworkBundle();
  id v6 = [v5 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v7 = +[CKAlertAction actionWithTitle:v6 style:1 handler:0];
  [v4 addAction:v7];

  id v8 = CKFrameworkBundle();
  id v9 = [v8 localizedStringForKey:@"SETTINGS" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v10 = +[CKAlertAction actionWithTitle:v9 style:0 handler:&__block_literal_global_102_0];

  [v4 addAction:v10];

  return v4;
}

void __59__CKDetailsController_Location__currentLocationDeniedAlert__block_invoke()
{
  id v1 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v0 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=Privacy&path=LOCATION"];
  [v1 openSensitiveURL:v0 withOptions:0];
}

- (void)shareLocationAction
{
  if ([(CKDetailsController *)self allRecipientsAlreadyFollowingLocation])
  {
    char v3 = [(CKDetailsController *)self conversation];
    char v4 = [v3 chat];
    [v4 stopSharingLocation];

    [(CKDetailsController *)self reloadTableView];
    [(CKDetailsController *)self _notifyDelegateDidSelectStopSharingLocation];
  }
  else if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "We reached -[CKDetailsController tableView:didSelectRowAtIndexPath:] for CKDetailsLocationShareSection, CKLocationShareFMFRow while currently sharing the user's location, but this should have been handled by the cell's embedded UIButton.", v6, 2u);
    }
  }
}

- (BOOL)allRecipientsAlreadyFollowingLocation
{
  int8x16_t v2 = [(CKDetailsController *)self conversation];
  char v3 = [v2 chat];
  char v4 = [v3 allRecipientsFollowingLocation];

  return v4;
}

- (void)detailsController:(id)a3 didSelectSendLocationMessage:(id)a4 completion:(id)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *))a5;
  id v11 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v12 = [v11 isWaldoEnabled];

  if (v12)
  {
    id v13 = [(CKDetailsController *)self findMyWaldoMapViewController];

    if (v13 == v8)
    {
      v18 = +[CKComposition compositionWithMSMessage:v9 appExtensionIdentifier:*MEMORY[0x1E4F6CB30]];
      v19 = [(CKDetailsController *)self detailsControllerDelegate];
      char v20 = objc_opt_respondsToSelector();

      if (v20)
      {
        v21 = [(CKDetailsController *)self detailsControllerDelegate];
        [v21 detailsController:self wantsToStageComposition:v18];
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v22 = 0;
          _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "CKDetails detailsController:didSelectSendLocationMessage: details controller is not our current map controller. Aborting.", v22, 2u);
        }
      }
      int v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F28228];
      v24[0] = @"FMFMapViewController is not referenced by CKDetailsController. Aborting message send.";
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
      uint64_t v17 = [v15 errorWithDomain:@"com.apple.ChatKit.CKDetailsController" code:0 userInfo:v16];

      v10[2](v10, v17);
    }
  }
}

- (void)_notifyDelegateDidSelectStopSharingLocation
{
  char v3 = [(CKDetailsController *)self detailsControllerDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CKDetailsController *)self detailsControllerDelegate];
    [v5 detailsControllerDidSelectStopSharingLocation:self];
  }
}

- (void)setupFMF
{
  if ([(CKDetailsController *)self fmfEnabled])
  {
    char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:self selector:sel_handleActiveDeviceChanged_ name:*MEMORY[0x1E4F6BAE8] object:0];

    char v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:self selector:sel_handleFriendshipStatusChanged_ name:*MEMORY[0x1E4F6BB00] object:0];

    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:self selector:sel__handleLocationChanged_ name:*MEMORY[0x1E4F6BAF8] object:0];

    [(CKDetailsController *)self setupFMFTimerIfNecessary];
  }
}

- (void)setupFMFTimerIfNecessary
{
  if ([(CKDetailsController *)self fmfEnabled])
  {
    BOOL v3 = [(CKDetailsController *)self _fmfExpirationDateIsValid];
    id v5 = [(CKDetailsController *)self fmfUpdateTimer];
    if ([(CKDetailsController *)self allRecipientsAlreadyFollowingLocation]
      || v3)
    {
      char v4 = v5;
      if (!v5)
      {
        id v6 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_updateTimedFMFState selector:0 userInfo:1 repeats:60.0];
        [(CKDetailsController *)self setFmfUpdateTimer:v6];
        char v4 = v6;
      }
    }
    else
    {
      [v5 invalidate];

      char v4 = 0;
    }
  }
}

- (void)sendCurrentLocation
{
  BOOL v3 = [(CKDetailsController *)self conversation];
  id v5 = [v3 chat];

  if ([v5 authorizationToSendCurrentLocationMessageDenied])
  {
    char v4 = [(CKDetailsController *)self currentLocationDeniedAlert];
    [v4 presentFromViewController:self animated:1 completion:0];
  }
  else if ([v5 canSendCurrentLocationMessage])
  {
    [v5 sendCurrentLocationMessage];
    [(CKDetailsController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (id)locationShareMenu
{
  BOOL v3 = [(CKDetailsController *)self conversation];
  char v4 = [v3 chat];
  int v5 = [v4 supportsCapabilities:4096];

  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    location[0] = 0;
    objc_initWeak(location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__CKDetailsController_Location__locationShareMenu__block_invoke;
    aBlock[3] = &unk_1E5621B68;
    objc_copyWeak(&v38, location);
    v7 = _Block_copy(aBlock);
    id v8 = (void *)MEMORY[0x1E4F426E8];
    id v9 = CKFrameworkBundle();
    v10 = [v9 localizedStringForKey:@"SHARE_LOCATION_ONE_HOUR" value:&stru_1EDE4CA38 table:@"ChatKit"];
    id v11 = [MEMORY[0x1E4F42A80] systemImageNamed:@"clock"];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __50__CKDetailsController_Location__locationShareMenu__block_invoke_2;
    v34[3] = &unk_1E5621B90;
    objc_copyWeak(&v36, location);
    id v12 = v7;
    id v35 = v12;
    id v13 = [v8 actionWithTitle:v10 image:v11 identifier:0 handler:v34];

    [v6 addObject:v13];
    v14 = (void *)MEMORY[0x1E4F426E8];
    int v15 = CKFrameworkBundle();
    v16 = [v15 localizedStringForKey:@"SHARE_LOCATION_EOD" value:&stru_1EDE4CA38 table:@"ChatKit"];
    uint64_t v17 = [MEMORY[0x1E4F42A80] systemImageNamed:@"calendar"];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __50__CKDetailsController_Location__locationShareMenu__block_invoke_3;
    v31[3] = &unk_1E5621B90;
    objc_copyWeak(&v33, location);
    id v18 = v12;
    id v32 = v18;
    v19 = [v14 actionWithTitle:v16 image:v17 identifier:0 handler:v31];

    [v6 addObject:v19];
    char v20 = (void *)MEMORY[0x1E4F426E8];
    v21 = CKFrameworkBundle();
    v22 = [v21 localizedStringForKey:@"SHARE_INDEFINITELY" value:&stru_1EDE4CA38 table:@"ChatKit"];
    uint64_t v23 = [MEMORY[0x1E4F42A80] systemImageNamed:@"infinity"];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __50__CKDetailsController_Location__locationShareMenu__block_invoke_4;
    v28[3] = &unk_1E5621B90;
    objc_copyWeak(&v30, location);
    id v24 = v18;
    id v29 = v24;
    v25 = [v20 actionWithTitle:v22 image:v23 identifier:0 handler:v28];

    [v6 addObject:v25];
    v26 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EDE4CA38 children:v6];

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v33);

    objc_destroyWeak(&v36);
    objc_destroyWeak(&v38);
    objc_destroyWeak(location);
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

void __50__CKDetailsController_Location__locationShareMenu__block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v5 = [WeakRetained conversation];
  id v6 = [v5 chat];
  [v6 shareLocationWithDuration:a2];

  id v7 = objc_loadWeakRetained(v3);
  [v7 reloadTableView];
}

void __50__CKDetailsController_Location__locationShareMenu__block_invoke_2(uint64_t a1)
{
  int8x16_t v2 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v3 = [v2 isWaldoEnabled];

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _stageLocationShareComposition:0];
  }
  else
  {
    char v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
}

void __50__CKDetailsController_Location__locationShareMenu__block_invoke_3(uint64_t a1)
{
  int8x16_t v2 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v3 = [v2 isWaldoEnabled];

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _stageLocationShareComposition:1];
  }
  else
  {
    char v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
}

void __50__CKDetailsController_Location__locationShareMenu__block_invoke_4(uint64_t a1)
{
  int8x16_t v2 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v3 = [v2 isWaldoEnabled];

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _stageLocationShareComposition:2];
  }
  else
  {
    char v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
}

- (void)_stageLocationShareComposition:(int64_t)a3
{
  int v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isWaldoEnabled];

  if (v6)
  {
    id MSMessageClass = getMSMessageClass();
    if (objc_opt_respondsToSelector())
    {
      id v12 = [MSMessageClass findMyLocationShareMessageWithDuration:a3];
      id v8 = +[CKComposition compositionWithMSMessage:appExtensionIdentifier:](CKComposition, "compositionWithMSMessage:appExtensionIdentifier:");
      id v9 = [(CKDetailsController *)self detailsControllerDelegate];
      char v10 = objc_opt_respondsToSelector();

      if (v10)
      {
        [(CKDetailsController *)self _evaluateMetricsForStagingLocation];
        id v11 = [(CKDetailsController *)self detailsControllerDelegate];
        [v11 detailsController:self wantsToStageComposition:v8];
      }
    }
  }
}

- (void)stageLocationRequest
{
  int v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isWaldoEnabled];

  if (v4)
  {
    int v5 = [(CKDetailsController *)self conversation];
    int v6 = [v5 chat];
    int v7 = [v6 supportsCapabilities:4096];

    if (v7)
    {
      id MSMessageClass = getMSMessageClass();
      if (objc_opt_respondsToSelector())
      {
        id v13 = [MSMessageClass findMyLocationRequestMessage];
        id v9 = +[CKComposition compositionWithMSMessage:appExtensionIdentifier:](CKComposition, "compositionWithMSMessage:appExtensionIdentifier:");
        char v10 = [(CKDetailsController *)self detailsControllerDelegate];
        char v11 = objc_opt_respondsToSelector();

        if (v11)
        {
          [(CKDetailsController *)self _evaluateMetricsForStagingLocation];
          id v12 = [(CKDetailsController *)self detailsControllerDelegate];
          [v12 detailsController:self wantsToStageComposition:v9];
        }
      }
    }
  }
}

- (void)handleFriendshipStatusChanged:(id)a3
{
  [(CKDetailsController *)self setupFMFTimerIfNecessary];

  [(CKDetailsController *)self reloadTableView];
}

- (void)_handleLocationChanged:(id)a3
{
  id v12 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v4 = [v12 fmfHandle];
    if (v4)
    {
      int v5 = [(CKDetailsController *)self conversation];
      int v6 = [v5 chat];
      int v7 = [v6 allSiblingFMFHandles];
      int v8 = [v7 containsObject:v4];

      if (v8)
      {
        id v9 = [(CKDetailsController *)self conversation];
        char v10 = [v9 recipients];
        char v11 = [v10 firstObject];

        [(CKDetailsController *)self updateLocationForRecipient:v11];
      }
    }
  }
  else
  {
    int v4 = 0;
  }
}

- (void)updateLocationForRecipient:(id)a3
{
  int v4 = (void *)MEMORY[0x1E4F6BCB8];
  id v5 = a3;
  int v6 = [v4 sharedInstance];
  int v7 = [v5 defaultIMHandle];

  id v14 = [v6 findMyLocationForHandleOrSibling:v7];

  int v8 = [v14 fmfLocation];
  id v9 = v8;
  if (v8)
  {
    char v10 = [v8 locationShortAddressWithAgeIncludeLocating];
    char v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [v14 shortAddress];
    }
    id v13 = v12;

    [(CKDetailsController *)self updateLocationStringCellWithString:v13];
  }
}

- (id)currentlyActiveFMFDevice
{
  int8x16_t v2 = [MEMORY[0x1E4F6BCB8] sharedInstance];
  int v3 = [v2 activeDevice];

  return v3;
}

- (BOOL)_fmfExpirationDateIsValid
{
  int v3 = [MEMORY[0x1E4F6BCB8] sharedInstance];
  int v4 = [(CKDetailsController *)self conversation];
  id v5 = [v4 chat];
  int v6 = [v3 timedOfferExpirationForChat:v5];

  if (v6)
  {
    int v7 = [MEMORY[0x1E4F1C9C8] distantFuture];
    if ([v6 isEqualToDate:v7])
    {
      BOOL v8 = 0;
    }
    else
    {
      id v9 = [MEMORY[0x1E4F1C9C8] date];
      [v6 timeIntervalSinceDate:v9];
      BOOL v8 = v10 > 0.0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_evaluateMetricsForStagingLocation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setValue:&unk_1EDF15FC8 forKey:*MEMORY[0x1E4F6DD50]];
  [v3 setValue:*MEMORY[0x1E4F6CB30] forKey:*MEMORY[0x1E4F6DD58]];
  int8x16_t v2 = [MEMORY[0x1E4F6E890] sharedInstance];
  [v2 trackEvent:*MEMORY[0x1E4F6DA50] withDictionary:v3];
}

- (BOOL)shouldShowFMFView
{
  id v3 = [(CKDetailsController *)self conversation];
  int v4 = [v3 chat];

  if ([v4 hasSiblingRecipientsSharingLocation]) {
    BOOL v5 = [(CKDetailsController *)self fmfEnabled];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)shouldShowActiveDeviceSwitchFooter
{
  int8x16_t v2 = self;
  id v3 = [(CKDetailsController *)self conversation];
  char v4 = [v3 isBusinessConversation];

  if (v4)
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    BOOL v5 = [(CKDetailsController *)v2 currentlyActiveFMFDevice];
    BOOL v6 = [(CKDetailsController *)v2 fmfEnabled];
    LOBYTE(v2) = 0;
    if (v6 && v5) {
      LODWORD(v2) = [v5 isThisDevice] ^ 1;
    }
  }
  return (char)v2;
}

- (BOOL)shouldShowLocationStringForOneToOneConversation
{
  if ([(CKDetailsController *)self shouldShowFMFView]
    && ![(CKDetailsController *)self isGroupChat])
  {
    char v4 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v3 = [v4 isWaldoEnabled] ^ 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (unint64_t)countOfContactViewModels
{
  int8x16_t v2 = [(CKDetailsController *)self contactsManager];
  int v3 = [v2 contactsViewModels];
  unint64_t v4 = [v3 count];

  return v4;
}

- (int64_t)rowForShowMoreContactsCell
{
  if (CKIsRunningInMacCatalyst() || ![(CKDetailsController *)self isGroupChat]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return [(CKDetailsController *)self hasTUConversation];
  }
}

- (int64_t)rowForAddMemberCell
{
  BOOL v3 = [(CKDetailsController *)self hasTUConversation];
  if (![(CKDetailsController *)self isContactsSectionCollapsible])
  {
    BOOL v5 = [(CKDetailsController *)self contactsManager];
    BOOL v6 = [v5 contactsViewModels];
    int64_t v4 = [v6 count] + v3;
LABEL_8:

    return v4;
  }
  if (![(CKDetailsController *)self isContactsSectionCollapsed])
  {
    BOOL v5 = [(CKDetailsController *)self contactsManager];
    BOOL v6 = [v5 contactsViewModels];
    uint64_t v7 = [v6 count];
    uint64_t v8 = 1;
    if (v3) {
      uint64_t v8 = 2;
    }
    int64_t v4 = v8 + v7;
    goto LABEL_8;
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)rowForFirstContactCell
{
  if (![(CKDetailsController *)self isContactsSectionCollapsible]) {
    return 0;
  }
  if ([(CKDetailsController *)self isContactsSectionCollapsed]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if ([(CKDetailsController *)self hasTUConversation]) {
    return 2;
  }
  return 1;
}

- (int64_t)rowForLastContact
{
  int64_t v3 = [(CKDetailsController *)self visibleContactsRows];
  int v4 = CKIsRunningInMacCatalyst();
  BOOL v5 = [(CKDetailsController *)self hasTUConversation];
  uint64_t v6 = v5;
  uint64_t v7 = 1;
  if (v5) {
    uint64_t v7 = 2;
  }
  if (!v4) {
    uint64_t v6 = v7;
  }
  return v6 + v3;
}

- (BOOL)shouldShowAddMemberCell
{
  if ([(CKDetailsController *)self conversationHasLeft])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    int v4 = [(CKDetailsController *)self conversation];
    if ([v4 isGroupConversation]
      && ![(CKDetailsController *)self isContactsSectionCollapsed])
    {
      BOOL v5 = [(CKDetailsController *)self conversation];
      uint64_t v6 = [v5 chat];
      if ([v6 isBusinessChat])
      {
        LOBYTE(v3) = 0;
      }
      else
      {
        uint64_t v7 = [(CKDetailsController *)self conversation];
        uint64_t v8 = [v7 chat];
        int v3 = [v8 _suppressesMutationsFromLocalDevice] ^ 1;
      }
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (int64_t)visibleContactsRows
{
  if ([(CKDetailsController *)self isContactsSectionCollapsed]) {
    return 0;
  }
  int v4 = [(CKDetailsController *)self contactsManager];
  BOOL v5 = [v4 contactsViewModels];
  int64_t v6 = [v5 count];

  return v6;
}

- (BOOL)isContactsSectionCollapsible
{
  int v3 = [(CKDetailsController *)self conversation];
  int v4 = [v3 chat];
  if ([v4 isBusinessChat])
  {
    BOOL v5 = 0;
  }
  else
  {
    int64_t v6 = [(CKDetailsController *)self contactsManager];
    uint64_t v7 = [v6 contactsViewModels];
    BOOL v5 = [v7 count] != 0;
  }
  return v5;
}

- (id)tuConversation
{
  int8x16_t v2 = [(CKDetailsController *)self conversation];
  int v3 = [v2 chat];
  int v4 = [v3 conversation];

  return v4;
}

- (BOOL)hasTUConversation
{
  int v3 = [(CKDetailsController *)self tuConversation];

  if (!v3) {
    return 0;
  }
  int v4 = [(CKDetailsController *)self tuConversation];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)shouldAddToVisibleContactRowCountForTUConversation
{
  BOOL v3 = [(CKDetailsController *)self isContactsSectionCollapsible];
  BOOL v4 = [(CKDetailsController *)self hasTUConversation];
  if (v3) {
    LOBYTE(v4) = v4
  }
              && ([(CKDetailsController *)self isContactsSectionCollapsed]
               || ![(CKDetailsController *)self isContactsSectionCollapsed]
               && [(CKDetailsController *)self visibleContactsRows] > 0);
  return v4;
}

- (int64_t)rowForTUConversationCell
{
  if ([(CKDetailsController *)self hasTUConversation]) {
    return 0;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  BOOL v4 = [MEMORY[0x1E4F42948] currentDevice];
  int v5 = [v4 _supportsForceTouch];

  if (v5)
  {
    int64_t v6 = [(CKDetailsController *)self view];
    [(CKDetailsController *)self unregisterPreviewSourceView:v6];
  }
  v7.receiver = self;
  v7.super_class = (Class)CKDetailsController;
  [(CKDetailsController *)&v7 dealloc];
}

- (CKDetailsController)initWithConversation:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)CKDetailsController;
  int v5 = [(CKDetailsController *)&v39 initWithNibName:0 bundle:0];
  int64_t v6 = v5;
  if (v5)
  {
    [(CKDetailsController *)v5 setConversation:v4];
    [(CKDetailsController *)v6 setupFMF];
    [(CKDetailsController *)v6 setupKT];
    objc_super v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v6 selector:sel__handleKeyboardWillShowNotification_ name:*MEMORY[0x1E4F43B88] object:0];

    uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v6 selector:sel__handleKeyboardWillHideNotification_ name:*MEMORY[0x1E4F43B80] object:0];

    id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v10 = *MEMORY[0x1E4F6B9A0];
    char v11 = [(CKDetailsController *)v6 conversation];
    id v12 = [v11 chat];
    [v9 addObserver:v6 selector:sel__lastAddressedHandleUpdateNotification_ name:v10 object:v12];

    id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v6 selector:sel__chatAutoDonatingHandleUpdateNotification_ name:*MEMORY[0x1E4F6BA08] object:0];

    id v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v15 = *MEMORY[0x1E4F6B9F8];
    v16 = [v4 chat];
    [v14 addObserver:v6 selector:sel__batchDownloadNotificationFired_ name:v15 object:v16];

    uint64_t v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v18 = *MEMORY[0x1E4F6BA00];
    v19 = [v4 chat];
    [v17 addObserver:v6 selector:sel__batchDownloadNotificationFired_ name:v18 object:v19];

    char v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 addObserver:v6 selector:sel__reloadForReadReceiptVisibilityChangeIfNeeded_ name:*MEMORY[0x1E4F6B858] object:0];

    v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v22 = *MEMORY[0x1E4F6BA80];
    uint64_t v23 = [v4 chat];
    [v21 addObserver:v6 selector:sel__reloadForReadReceiptVisibilityChangeIfNeeded_ name:v22 object:v23];

    id v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v24 addObserver:v6 selector:sel__handleAddressBookChanged_ name:*MEMORY[0x1E4F6CA50] object:0];

    v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v25 addObserver:v6 selector:sel__conversationListFinishedMerging_ name:@"CKConversationListFinishedMergingChatsNotification" object:0];

    v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v26 addObserver:v6 selector:sel__handleGroupPhotoChanged_ name:*MEMORY[0x1E4F6B8B0] object:0];

    v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v27 addObserver:v6 selector:sel__handleGroupDisplayNameChanged_ name:*MEMORY[0x1E4F6B898] object:0];

    v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v28 addObserver:v6 selector:sel__chatParticipantsChangedNotification_ name:*MEMORY[0x1E4F6B9C8] object:0];

    id v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v29 addObserver:v6 selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x1E4F43788] object:0];

    id v30 = [v4 chat];
    char v31 = [v30 allowedByScreenTime];

    if ((v31 & 1) == 0) {
      [(CKDetailsController *)v6 dismissViewControllerAnimated:1 completion:0];
    }
    id v32 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v33 = *MEMORY[0x1E4F6B888];
    v34 = [v4 chat];
    [v32 addObserver:v6 selector:sel__chatAllowedByScreenTimeChanged_ name:v33 object:v34];

    id v35 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:v6 action:sel_handleDoneButton_];
    id v36 = [(CKDetailsController *)v6 navigationItem];
    [v36 setRightBarButtonItem:v35];

    [(CKDetailsController *)v6 setTuConversationCellHeight:-1.0];
    v37 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v37 addObserver:v6 selector:sel__handleMultiWayStateChange_ name:*MEMORY[0x1E4F6B9C0] object:0];

    [(CKDetailsController *)v6 setAddContactCellHeight:-1.0];
    [(CKDetailsController *)v6 setShowMoreContactCellHeight:-1.0];
    [(CKDetailsController *)v6 setGroupPhotoHeaderHeight:-1.0];
    [(CKDetailsController *)v6 setSimLabelCellHeight:-1.0];
  }
  return v6;
}

- (void)loadView
{
  BOOL v3 = [CKDetailsTableView alloc];
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v21 = -[CKDetailsTableView initWithFrame:style:](v3, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], v5, v6, v7);
  [(CKDetailsTableView *)v21 setAutoresizingMask:18];
  [(CKDetailsTableView *)v21 setDelegate:self];
  [(CKDetailsTableView *)v21 setDataSource:self];
  [(CKDetailsTableView *)v21 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"locationShareTextView"];
  [(CKDetailsTableView *)v21 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"CKDetailsSharedWithYouHeaderFooterView_reuseIdentifier"];
  uint64_t v8 = objc_opt_class();
  id v9 = +[CKGroupPhotoCell reuseIdentifier];
  [(CKDetailsTableView *)v21 registerClass:v8 forCellReuseIdentifier:v9];

  [(CKDetailsTableView *)v21 setTableHeaderViewShouldAutoHide:1];
  [(CKDetailsTableView *)v21 setContentInsetAdjustmentBehavior:2];
  [(CKDetailsTableView *)v21 _setPinsTableHeaderView:0];
  [(CKDetailsTableView *)v21 setBackgroundView:0];
  uint64_t v10 = [MEMORY[0x1E4F428B8] clearColor];
  [(CKDetailsTableView *)v21 setBackgroundColor:v10];

  [(CKDetailsTableView *)v21 setEstimatedSectionHeaderHeight:0.0];
  [(CKDetailsTableView *)v21 setEstimatedSectionFooterHeight:0.0];
  [(CKDetailsTableView *)v21 setSeparatorStyle:0];
  -[CKDetailsTableView setLayoutMargins:](v21, "setLayoutMargins:", *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));
  [(CKDetailsTableView *)v21 setPreservesSuperviewLayoutMargins:1];
  [(CKDetailsTableView *)v21 setSectionHeaderHeight:0.0];
  [(CKDetailsTableView *)v21 setSectionFooterHeight:0.0];
  [(CKDetailsTableView *)v21 setEstimatedRowHeight:0.0];
  char v11 = +[CKUIBehavior sharedBehaviors];
  id v12 = [v11 theme];
  id v13 = [v12 detailsHeaderFooterContentViewBackgroundColor];

  [(CKDetailsTableView *)v21 setBackgroundColor:v13];
  id v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v4, v5, v6, v7);
  [v14 setBackgroundColor:v13];
  [(CKDetailsTableView *)v21 setTableFooterView:v14];
  [(CKDetailsController *)self setTableView:v21];
  [(CKDetailsController *)self setView:v21];
  uint64_t v15 = [MEMORY[0x1E4F42948] currentDevice];
  int v16 = [v15 _supportsForceTouch];

  if (v16)
  {
    uint64_t v17 = [(CKDetailsController *)self view];
    [(CKDetailsController *)self registerPreviewSourceView:v17 previewingDelegate:self];
  }
  if (CKIsRunningInMacCatalyst())
  {
    uint64_t v18 = [MEMORY[0x1E4F427E0] buttonWithType:0];
    [(CKDetailsController *)self setScreenShareContextButton:v18];

    v19 = [MEMORY[0x1E4F428B8] clearColor];
    char v20 = [(CKDetailsController *)self screenShareContextButton];
    [v20 setBackgroundColor:v19];
  }
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)CKDetailsController;
  [(CKDetailsController *)&v17 viewDidLoad];
  [(CKDetailsController *)self setupContactsManager];
  [(CKDetailsController *)self setIsContactsSectionCollapsed:[(CKDetailsController *)self isContactsSectionCollapsible]];
  [(CKDetailsController *)self _determineFocusStatusSharingState];
  BOOL v3 = [(CKDetailsController *)self navigationItem];
  [v3 _setManualScrollEdgeAppearanceProgress:0.0];

  double v4 = [(CKDetailsController *)self navigationItem];
  [v4 _setManualScrollEdgeAppearanceEnabled:1];

  double v5 = [(CKDetailsController *)self navigationItem];
  [v5 _setAlwaysUseManualScrollEdgeAppearance:1];

  double v6 = [(CKDetailsController *)self navigationItem];
  double v7 = [(CKDetailsController *)self transparentNavBarAppearance];
  [v6 setScrollEdgeAppearance:v7];

  uint64_t v8 = [(CKDetailsController *)self navigationItem];
  id v9 = [(CKDetailsController *)self defaultNavBarAppearance];
  [v8 setStandardAppearance:v9];

  if (CKIsRunningInMacCatalyst())
  {
    uint64_t v10 = [(CKDetailsController *)self detailsControllerDelegate];
    char v11 = [v10 isDetailsNavigationControllerDetached];

    if ((v11 & 1) == 0)
    {
      [(CKDetailsController *)self computedPreferredContentSize];
      -[CKDetailsController setPreferredContentSize:](self, "setPreferredContentSize:");
    }
  }
  if (!self->_groupPhotoHeaderViewController) {
    [(CKDetailsController *)self _configureGroupPhotoHeader];
  }
  id v12 = [MEMORY[0x1E4F6BD50] sharedInstance];
  id v13 = [(CKDetailsController *)self conversation];
  id v14 = [v13 recipientStrings];
  uint64_t v15 = [v12 createSharedProfileStateOracleForHandles:v14];

  int v16 = [(CKDetailsController *)self groupPhotoHeaderViewController];
  [v16 setSharedProfileStateOracle:v15];
}

- (void)reloadTableView
{
  id v2 = [(CKDetailsController *)self tableView];
  [v2 reloadData];
}

- (void)_determineFocusStatusSharingState
{
  BOOL v3 = [(CKDetailsController *)self conversation];
  double v4 = [v3 chat];

  id location = 0;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__CKDetailsController__determineFocusStatusSharingState__block_invoke;
  v6[3] = &unk_1E5624978;
  objc_copyWeak(&v9, &location);
  id v5 = v4;
  id v7 = v5;
  uint64_t v8 = self;
  [v5 canShareFocusStatusWithCompletion:v6];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __56__CKDetailsController__determineFocusStatusSharingState__block_invoke(uint64_t a1, int a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [MEMORY[0x1E4F6BC48] sharedInstance];
  int v5 = [(id)v4 isSatelliteConnectionActive];

  LOBYTE(v4) = a2 & ~(_BYTE)v5;
  double v6 = [NSNumber numberWithBool:a2 & ~v5];
  id v7 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setCanShareFocusStatus:v6];

  int v9 = IMOSLoggingEnabled();
  if (v4)
  {
    if (v9)
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        char v11 = [*(id *)(a1 + 32) guid];
        *(_DWORD *)buf = 138412290;
        char v20 = v11;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Checking to see if focus status is shared with chat: %@", buf, 0xCu);
      }
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __56__CKDetailsController__determineFocusStatusSharingState__block_invoke_178;
    v17[3] = &unk_1E5624950;
    id v12 = *(void **)(a1 + 32);
    v17[4] = *(void *)(a1 + 40);
    objc_copyWeak(&v18, v7);
    [v12 isInvitedToViewMyFocusStatusWithCompletion:v17];
    objc_destroyWeak(&v18);
  }
  else
  {
    if (v9)
    {
      id v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Cannot share focus status with chat, not checking to see if focus status is already shared", buf, 2u);
      }
    }
    id v14 = objc_loadWeakRetained(v7);
    [v14 setIsSharingFocusStatus:0];

    id v15 = objc_loadWeakRetained(v7);
    int v16 = [v15 tableView];
    [v16 reloadData];
  }
}

void __56__CKDetailsController__determineFocusStatusSharingState__block_invoke_178(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__CKDetailsController__determineFocusStatusSharingState__block_invoke_2;
  v8[3] = &unk_1E5624928;
  char v12 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  id v7 = v5;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E4F14428], v8);
  objc_destroyWeak(&v11);
}

void __56__CKDetailsController__determineFocusStatusSharingState__block_invoke_2(uint64_t a1)
{
  id v1 = (uint64_t *)(a1 + 32);
  if (!*(void *)(a1 + 32))
  {
    int v4 = *(unsigned __int8 *)(a1 + 56);
    int v5 = IMOSLoggingEnabled();
    if (v4)
    {
      if (v5)
      {
        uint64_t v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          __int16 v12 = 0;
          id v7 = "Determined focus status is shared with chat, enabling and updating switch";
          uint64_t v8 = (uint8_t *)&v12;
LABEL_11:
          _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, v7, v8, 2u);
          goto LABEL_12;
        }
        goto LABEL_12;
      }
    }
    else if (v5)
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        id v7 = "Determined focus status is NOT shared with chat, enabling and updating switch";
        uint64_t v8 = (uint8_t *)&v11;
        goto LABEL_11;
      }
LABEL_12:
    }
    id v9 = objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 56), v11);
    [*(id *)(a1 + 40) setIsSharingFocusStatus:v9];

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v10 = [WeakRetained tableView];
    [v10 reloadData];

    goto LABEL_14;
  }
  id WeakRetained = IMLogHandleForCategory();
  if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
    __56__CKDetailsController__determineFocusStatusSharingState__block_invoke_2_cold_1(v1, WeakRetained);
  }
LABEL_14:
}

- (id)transparentNavBarAppearance
{
  v13[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CKDetailsController *)self groupPhotoHeaderViewController];
  int v4 = [v3 group];
  int v5 = [v4 groupName];

  uint64_t v6 = CKFrameworkBundle();
  id v7 = [v6 localizedStringForKey:v5 value:&stru_1EDE4CA38 table:@"ChatKit"];
  [(CKDetailsController *)self setTitle:v7];

  id v8 = objc_alloc_init(MEMORY[0x1E4F42BF0]);
  uint64_t v12 = *MEMORY[0x1E4FB0700];
  id v9 = [MEMORY[0x1E4F428B8] clearColor];
  v13[0] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

  [v8 setTitleTextAttributes:v10];
  [v8 configureWithTransparentBackground];

  return v8;
}

- (id)defaultNavBarAppearance
{
  v7[1] = *MEMORY[0x1E4F143B8];
  [(CKDetailsController *)self setTitle:0];
  id v2 = objc_alloc_init(MEMORY[0x1E4F42BF0]);
  uint64_t v6 = *MEMORY[0x1E4FB0700];
  BOOL v3 = [MEMORY[0x1E4F428B8] labelColor];
  v7[0] = v3;
  int v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  [v2 setTitleTextAttributes:v4];
  [v2 configureWithDefaultBackground];

  return v2;
}

- (void)updateManualScrollEdgeProgress
{
  if (CKIsRunningInMacCatalyst())
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    BOOL v3 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    int v4 = "Not updating manual scroll edge appearance progress because it does not apply to Mac.";
LABEL_13:
    _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, v4, buf, 2u);
LABEL_14:

    return;
  }
  int v5 = [(CKDetailsController *)self navigationItem];
  char v6 = [v5 _isManualScrollEdgeAppearanceEnabled];

  if ((v6 & 1) == 0)
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    BOOL v3 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    int v4 = "Not updating manual scroll edge appearance progress because it is not enabled on the navigation item.";
    goto LABEL_13;
  }
  id v7 = [(CKDetailsController *)self groupPhotoHeaderViewController];
  id v8 = [v7 view];
  [v8 frame];
  double v10 = v9;

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__CKDetailsController_updateManualScrollEdgeProgress__block_invoke;
  block[3] = &unk_1E5620C40;
  void block[4] = self;
  if (updateManualScrollEdgeProgress_onceToken != -1) {
    dispatch_once(&updateManualScrollEdgeProgress_onceToken, block);
  }
  int v11 = updateManualScrollEdgeProgress_hasNewContactsAPI;
  uint64_t v12 = [(CKDetailsController *)self groupPhotoHeaderViewController];
  id v13 = v12;
  if (v11)
  {
    [v12 titleLabelBaselineOffset];
    double v15 = v10 + v14;
  }
  else
  {
    int v16 = [v12 view];
    [v16 bounds];
    double v15 = v10 + v17 * 0.5;
  }
  id v18 = [(CKDetailsController *)self tableView];
  [v18 contentOffset];
  double v20 = v19;
  uint64_t v21 = [(CKDetailsController *)self tableView];
  [v21 adjustedContentInset];
  double v23 = v20 + v22;

  if (v23 <= 0.0)
  {
    v27 = [(CKDetailsController *)self navigationItem];
    [v27 _setManualScrollEdgeAppearanceProgress:0.0];

    [(CKDetailsController *)self setTitle:0];
  }
  else
  {
    id v24 = [(CKDetailsController *)self navigationItem];
    objc_msgSend(v24, "_setManualScrollEdgeAppearanceProgress:", fmin(v23, 14.0) / 14.0);

    if (updateManualScrollEdgeProgress_hasNewContactsAPI)
    {
      v25 = [(CKDetailsController *)self groupPhotoHeaderViewController];
      [v25 hideTitleLabel:v23 > v15];
    }
    if (v23 <= v15)
    {
      v26 = &stru_1EDE4CA38;
    }
    else
    {
      v26 = [(CKDetailsController *)self _navigationBarTitle];
    }
    [(CKDetailsController *)self setTitle:v26];
  }
}

void __53__CKDetailsController_updateManualScrollEdgeProgress__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) groupPhotoHeaderViewController];
  updateManualScrollEdgeProgress_hasNewContactsAPI = objc_opt_respondsToSelector() & 1;
}

- (id)_navigationBarTitle
{
  if (![(CKDetailsController *)self supportsChatNameAndPhotoHeader]) {
    goto LABEL_4;
  }
  BOOL v3 = [(CKDetailsController *)self groupPhotoHeaderViewController];
  int v4 = [v3 group];
  int v5 = [v4 groupName];

  if (!v5)
  {
    char v6 = [(CKDetailsController *)self conversation];
    int v5 = [v6 name];

    if (!v5)
    {
LABEL_4:
      id v7 = CKFrameworkBundle();
      int v5 = [v7 localizedStringForKey:@"DETAILS" value:&stru_1EDE4CA38 table:@"ChatKit"];
    }
  }

  return v5;
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)CKDetailsController;
  [(CKDetailsController *)&v6 viewDidLayoutSubviews];
  if (CKIsRunningInMacCatalyst())
  {
    [(CKDetailsController *)self updateScreenSharingStatusAndViews];
    [(CKDetailsController *)self initializeSearchController];
  }
  else
  {
    BOOL v3 = [(CKDetailsController *)self navigationController];
    int v4 = [v3 navigationBar];

    [v4 frame];
    [(CKDetailsTableView *)self->_tableView _setTopPadding:v5];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CKDetailsController;
  [(CKViewController *)&v9 viewWillAppear:a3];
  if (CKIsRunningInMacCatalyst())
  {
    int v4 = [(CKDetailsController *)self navigationController];
    [v4 setNavigationBarHidden:1 animated:0];
  }
  double v5 = +[CKUIBehavior sharedBehaviors];
  objc_super v6 = [v5 theme];
  id v7 = [v6 detailsBackgroundColor];
  id v8 = [(CKDetailsController *)self view];
  [v8 setBackgroundColor:v7];

  [(CKScrollViewController *)self updateScrollGeometryWithoutAnimationForReason:@"DetailsViewWillAppear"];
  [(CKDetailsController *)self _resetPurgedAttachmentCount];
}

- (void)viewDidAppear:(BOOL)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CKDetailsController;
  [(CKViewController *)&v17 viewDidAppear:a3];
  [(CKDetailsController *)self becomeFirstResponder];
  int v4 = [(CKDetailsController *)self tableView];
  [v4 reloadData];

  double v5 = [MEMORY[0x1E4F6E890] sharedInstance];
  [v5 trackEvent:*MEMORY[0x1E4F6D830]];

  [(CKDetailsController *)self _updateDownloadButtonStateIfNeeded];
  if (CKIsRunningInMacCatalyst())
  {
    objc_super v6 = [(CKDetailsController *)self detailsControllerDelegate];
    int v7 = [v6 isDetailsNavigationControllerDetached];

    if (v7)
    {
      [(CKDetailsController *)self computedPreferredContentSize];
      double v9 = v8;
      double v11 = v10;
      uint64_t v12 = [(CKDetailsController *)self view];
      id v13 = [v12 window];
      double v14 = [v13 windowScene];

      double v15 = [v14 sizeRestrictions];
      objc_msgSend(v15, "setMinimumSize:", v9, v11);

      int v16 = [v14 sizeRestrictions];
      objc_msgSend(v16, "setMaximumSize:", v9, v11);
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKDetailsController;
  [(CKViewController *)&v6 viewWillDisappear:a3];
  int v4 = [(CKDetailsController *)self groupNameCell];
  double v5 = [v4 groupNameView];
  [v5 commitGroupName];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CKDetailsController;
  [(CKViewController *)&v9 viewDidDisappear:a3];
  int v4 = [MEMORY[0x1E4F6E890] sharedInstance];
  [v4 trackEvent:*MEMORY[0x1E4F6D828]];

  double v5 = [(CKDetailsController *)self fmfUpdateTimer];
  [v5 invalidate];

  if (([(CKDetailsController *)self isBeingDismissed] & 1) != 0
    || ([(CKDetailsController *)self navigationController],
        objc_super v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isBeingDismissed],
        v6,
        v7))
  {
    double v8 = [(CKDetailsController *)self detailsControllerDelegate];
    [v8 detailsControllerDidDismiss:self];
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)keyCommands
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [(CKDetailsController *)self searchViewController];
  if (v4)
  {
    double v5 = (void *)v4;
    objc_super v6 = [(CKDetailsController *)self searchViewController];
    int v7 = [v6 wantsSpaceKeyCommandActive];

    if (v7)
    {
      double v8 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:@" " modifierFlags:0 action:sel_spacePressed_];
      [v3 addObject:v8];
    }
  }
  objc_super v9 = (void *)[v3 copy];

  return v9;
}

- (void)spacePressed:(id)a3
{
  id v3 = [(CKDetailsController *)self searchViewController];
  [v3 handleSpacePressed];
}

- (id)inputAccessoryViewController
{
  return 0;
}

- (CGSize)computedPreferredContentSize
{
  id v3 = [(CKDetailsController *)self conversation];
  int v4 = [v3 isBusinessConversation];

  if (v4)
  {
    double v5 = [(CKDetailsController *)self view];
    objc_super v6 = +[CKUIBehavior sharedBehaviors];
    [v6 detailsPreferredContentSizeWidth];
    objc_msgSend(v5, "sizeThatFits:");
    double v8 = v7;
    double v10 = v9;

    double v11 = v10 + 40.0;
  }
  else
  {
    uint64_t v12 = +[CKUIBehavior sharedBehaviors];
    [v12 detailsPreferredContentSizeHeight];
    double v11 = v13;

    if ([(CKDetailsController *)self shouldShowExpanseFeatures])
    {
      double v14 = +[CKUIBehavior sharedBehaviors];
      [v14 detailsExpanseScreenShareCellHeight];
      double v11 = v11 + v15;
    }
    int v16 = +[CKUIBehavior sharedBehaviors];
    [v16 detailsPreferredContentSizeWidth];
    double v8 = v17;
  }
  double v18 = v8;
  double v19 = v11;
  result.height = v19;
  result.width = v18;
  return result;
}

- (void)handleDoneButton:(id)a3
{
  int v4 = [(CKDetailsController *)self detailsControllerDelegate];

  if (v4)
  {
    double v5 = [(CKDetailsController *)self detailsControllerDelegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      double v7 = [(CKDetailsController *)self detailsControllerDelegate];
      [v7 detailsControllerWillDismiss:self];
    }
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__CKDetailsController_handleDoneButton___block_invoke;
  v8[3] = &unk_1E5620C40;
  void v8[4] = self;
  [(CKDetailsController *)self dismissViewControllerAnimated:1 completion:v8];
}

void __40__CKDetailsController_handleDoneButton___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) detailsControllerDelegate];
  [v2 detailsControllerDidDismiss:*(void *)(a1 + 32)];
}

- (void)_handleKeyboardWillShowNotification:(id)a3
{
  int v4 = [a3 userInfo];
  double v5 = [v4 objectForKey:*MEMORY[0x1E4F43AF0]];
  [v5 CGRectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = [(CKDetailsController *)self view];
  double v15 = [v14 window];
  objc_msgSend(v15, "convertRect:fromWindow:", 0, v7, v9, v11, v13);
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  id v24 = [(CKDetailsController *)self view];
  v25 = [v24 window];
  v26 = [(CKDetailsController *)self groupNameCell];
  [v26 frame];
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  id v35 = [(CKDetailsController *)self groupNameCell];
  id v36 = [v35 superview];
  objc_msgSend(v25, "convertRect:fromView:", v36, v28, v30, v32, v34);
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  CGFloat v42 = v41;
  CGFloat v44 = v43;

  v55.origin.CGFloat x = v17;
  v55.origin.CGFloat y = v19;
  v55.size.CGFloat width = v21;
  v55.size.CGFloat height = v23;
  v60.origin.CGFloat x = v38;
  v60.origin.CGFloat y = v40;
  v60.size.CGFloat width = v42;
  v60.size.CGFloat height = v44;
  if (CGRectIntersectsRect(v55, v60))
  {
    id v53 = [(CKDetailsController *)self tableView];
    v56.origin.CGFloat x = v38;
    v56.origin.CGFloat y = v40;
    v56.size.CGFloat width = v42;
    v56.size.CGFloat height = v44;
    v61.origin.CGFloat x = v17;
    v61.origin.CGFloat y = v19;
    v61.size.CGFloat width = v21;
    v61.size.CGFloat height = v23;
    CGRect v57 = CGRectIntersection(v56, v61);
    CGFloat x = v57.origin.x;
    CGFloat y = v57.origin.y;
    CGFloat width = v57.size.width;
    CGFloat height = v57.size.height;
    [v53 contentOffset];
    double v50 = v49;
    double v52 = v51;
    v58.origin.CGFloat x = x;
    v58.origin.CGFloat y = y;
    v58.size.CGFloat width = width;
    v58.size.CGFloat height = height;
    [(CKDetailsController *)self setContentOffsetYShiftAfterKeyboardNotification:CGRectGetHeight(v58)];
    v59.origin.CGFloat x = x;
    v59.origin.CGFloat y = y;
    v59.size.CGFloat width = width;
    v59.size.CGFloat height = height;
    objc_msgSend(v53, "setContentOffset:animated:", 1, v50, v52 + CGRectGetHeight(v59));
  }
}

- (void)_handleKeyboardWillHideNotification:(id)a3
{
  id v9 = [(CKDetailsController *)self tableView];
  [v9 contentOffset];
  double v5 = v4;
  double v7 = v6;
  [(CKDetailsController *)self contentOffsetYShiftAfterKeyboardNotification];
  objc_msgSend(v9, "setContentOffset:animated:", 1, v5, v7 - v8);
  [(CKDetailsController *)self setContentOffsetYShiftAfterKeyboardNotification:0.0];
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v13 = a3;
  double v7 = (CKDetailsController *)a4;
  if (v7 != self)
  {
    double v8 = [(CKDetailsController *)self navigationItem];
    id v9 = [(CKDetailsController *)self titleForBackButton];
    [v8 setBackButtonTitle:v9];

    LODWORD(v8) = [(CKDetailsController *)self isContactViewController:v7];
    double v10 = [(CKDetailsController *)self navigationItem];
    double v11 = v10;
    if (v8) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 0;
    }
    [v10 setBackButtonDisplayMode:v12];
  }
}

- (id)titleForBackButton
{
  id v2 = [(CKDetailsController *)self groupPhotoHeaderViewController];
  id v3 = [v2 displayNameForGroupIdentity];

  return v3;
}

- (BOOL)isContactViewController:(id)a3
{
  id v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();

  return [v3 isEqual:v4];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5
{
  double v7 = (UITextView *)a3;
  id v8 = a4;
  if (self->_locationSharingTextView == v7)
  {
    double v11 = [MEMORY[0x1E4F6BCB8] sharedInstance];
    [v11 makeThisDeviceActiveDevice];

    uint64_t v12 = [(CKDetailsController *)self locationSharingTextView];
    [v12 setDelegate:0];

    [(CKDetailsController *)self setLocationSharingTextView:0];
    id v9 = [(CKDetailsController *)self tableView];
    [v9 reloadData];
    goto LABEL_5;
  }
  if (self->_sharedWithYouFooterTextView == v7)
  {
    id v9 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=MESSAGES&path=SHARED_WITH_YOU_BUTTON"];
    double v10 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v10 openSensitiveURL:v9 withOptions:0];

LABEL_5:
  }
  id v13 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v14 = [v13 isKeyTransparencyEnabled];

  if (v14 && self->_ktSecurityFooterTextView == v7) {
    +[CKKeyTransparencyErrorUtilities learnMorePressedFromError:0];
  }

  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v4 = +[CKUIBehavior sharedBehaviors];
  uint64_t v5 = [v4 detailsSectionCount];

  int64_t v6 = v5 + [(CKDetailsController *)self shouldShowSIMTypeSection];
  if ([(CKDetailsController *)self shouldShowExpanseFeatures])
  {
    int v7 = CKIsRunningInMacCatalyst();
    uint64_t v8 = 1;
    if (v7) {
      uint64_t v8 = 2;
    }
    v6 += v8;
  }
  id v9 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v10 = [v9 isKeyTransparencyEnabled];

  if (v10) {
    v6 += [(CKDetailsController *)self shouldShowKTSection];
  }
  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v6 = [(CKDetailsController *)self conversation];
  int v7 = [v6 chat];
  int v8 = [v7 isBusinessChat];

  if (v8) {
    return a4 == 6 || a4 == 9;
  }
  int64_t result = 0;
  switch(a4)
  {
    case 0:
      LODWORD(result) = [(CKDetailsController *)self supportsChatNameAndPhotoHeader];
      goto LABEL_25;
    case 1:
      LODWORD(result) = [(CKDetailsController *)self shouldShowExpanseFeatures];
      goto LABEL_25;
    case 2:
      LODWORD(result) = [(CKDetailsController *)self shouldShowSIMTypeSection];
      goto LABEL_25;
    case 3:
      int v14 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v15 = [v14 isWaldoEnabled];

      LODWORD(result) = [(CKDetailsController *)self shouldShowFMFView];
      if (v15) {
        goto LABEL_25;
      }
      if (result) {
        int64_t result = 3;
      }
      else {
        int64_t result = 0;
      }
      break;
    case 5:
      LODWORD(result) = [(CKDetailsController *)self shouldShowGroupCount];
      goto LABEL_25;
    case 6:
      int64_t v16 = [(CKDetailsController *)self visibleContactsRows];
      CGFloat v17 = [(CKDetailsController *)self conversation];
      double v18 = [v17 chat];
      CGFloat v19 = [v18 participants];
      unint64_t v20 = [v19 count];

      if (v20 < 2) {
        goto LABEL_31;
      }
      int64_t v21 = v16 + [(CKDetailsController *)self isContactsSectionCollapsible];
      int64_t v22 = v21 + [(CKDetailsController *)self shouldShowAddMemberCell];
      int64_t result = v22 + [(CKDetailsController *)self hasTUConversation];
      break;
    case 7:
      BOOL v23 = [(CKDetailsController *)self allRecipientsAlreadyFollowingLocation];
      id v24 = [(CKDetailsController *)self conversation];
      int64_t v25 = +[CKDetailsControllerLocationHelper numberOfCellsInLocationSectionWithConversation:v24 isFMFEnabled:[(CKDetailsController *)self fmfEnabled] isSharingLocation:v23 shouldShowFMFView:[(CKDetailsController *)self shouldShowFMFView]];

      return v25;
    case 8:
      LODWORD(result) = [(CKDetailsController *)self shouldShowSharedWithYouFeatures];
      goto LABEL_25;
    case 9:
      v26 = [(CKDetailsController *)self conversation];
      if ([v26 isGroupConversation])
      {
        int v27 = 0;
      }
      else
      {
        double v34 = [(CKDetailsController *)self conversation];
        id v35 = [v34 chat];
        int v27 = [v35 supportsSendingReadReceipts];
      }
      id v36 = [MEMORY[0x1E4F6BC48] sharedInstance];
      int v37 = [v36 isSatelliteConnectionActive];

      uint64_t v38 = v27 & ~v37;
      if ((v27 & ~v37) != 0) {
        uint64_t v39 = 2;
      }
      else {
        uint64_t v39 = 1;
      }
      [(CKDetailsController *)self setWasShowingReadReceiptSwitch:v38];
      CGFloat v40 = [(CKDetailsController *)self canShareFocusStatus];
      unsigned int v41 = [v40 BOOLValue];

      return v39 + v41;
    case 10:
      LODWORD(result) = [(CKDetailsController *)self shouldShowEnhancedGroupFeatures];
LABEL_25:
      int64_t result = result;
      break;
    case 11:
      double v11 = [(CKDetailsController *)self conversation];
      uint64_t v12 = [v11 chat];
      unsigned int v13 = [v12 supportsCapabilities:256];

      int64_t result = v13;
      break;
    case 12:
      int64_t result = 1;
      break;
    case 13:
      double v28 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v29 = [v28 isKeyTransparencyEnabled];

      if (v29 && [(CKDetailsController *)self shouldShowKTSection])
      {
        unint64_t ktChatState = self->_ktChatState;
        double v31 = [(CKDetailsController *)self conversation];
        double v32 = [v31 chat];
        int64_t v33 = +[CKKTDetailsViewUtilities numberOfRowsInKTSectionForStatus:isGroupChat:](CKKTDetailsViewUtilities, "numberOfRowsInKTSectionForStatus:isGroupChat:", ktChatState, [v32 isGroupChat]);

        int64_t result = v33;
      }
      else
      {
LABEL_31:
        int64_t result = 0;
      }
      break;
    default:
      return result;
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  switch([v5 section])
  {
    case 0:
      uint64_t v6 = [(CKDetailsController *)self groupPhotoCellForIndexPath:v5];
      goto LABEL_25;
    case 1:
      uint64_t v6 = [(CKDetailsController *)self expanseActivityCellForIndexPath:v5];
      goto LABEL_25;
    case 2:
      if (![(CKDetailsController *)self shouldShowSIMTypeSection]) {
        goto LABEL_13;
      }
      uint64_t v6 = -[CKDetailsController switchSubscriptionCellForIndexPathRow:](self, "switchSubscriptionCellForIndexPathRow:", [v5 row]);
      goto LABEL_25;
    case 3:
      uint64_t v6 = [(CKDetailsController *)self fmfViewControllerCellForIndexPath:v5 shouldShowLocation:[(CKDetailsController *)self shouldShowLocationStringForOneToOneConversation]];
      goto LABEL_25;
    case 4:
      uint64_t v6 = [(CKDetailsController *)self groupNameCellForIndexPath:v5];
      goto LABEL_25;
    case 5:
      uint64_t v6 = [(CKDetailsController *)self groupCountCellForIndexPath:v5];
      goto LABEL_25;
    case 6:
      uint64_t v6 = [(CKDetailsController *)self contactsManagerCellForIndexPath:v5];
      goto LABEL_25;
    case 7:
      uint64_t v6 = -[CKDetailsController locationShareCellForIndexPathRow:](self, "locationShareCellForIndexPathRow:", [v5 row]);
      goto LABEL_25;
    case 8:
      uint64_t v6 = [(CKDetailsController *)self sharedWithYouCellForIndexPath:v5];
      goto LABEL_25;
    case 9:
      uint64_t v6 = [(CKDetailsController *)self chatOptionsCellForIndexPath:v5];
      goto LABEL_25;
    case 10:
      uint64_t v6 = [(CKDetailsController *)self leaveCellForIndexPath:v5];
      goto LABEL_25;
    case 11:
      uint64_t v6 = [(CKDetailsController *)self deleteAndBlockCellForIndexPath:v5];
      goto LABEL_25;
    case 12:
      int v7 = [(CKDetailsController *)self searchAttachmentViewControllerCellForIndexPath:v5];
      if (CKIsRunningInMacCatalyst())
      {
        v19[0] = v7;
        int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
        id v9 = [(CKDetailsController *)self popoverPresentationController];
        [v9 setPassthroughViews:v8];
      }
      break;
    case 13:
      int v10 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v11 = [v10 isKeyTransparencyEnabled];

      if (!v11) {
        goto LABEL_12;
      }
      uint64_t v6 = -[CKDetailsController ktCellForRow:](self, "ktCellForRow:", [v5 row]);
LABEL_25:
      int v7 = (void *)v6;
      break;
    case 15:
      int v14 = [(CKDetailsController *)self conversation];
      int v15 = [v14 chat];
      int64_t v16 = [v15 participants];
      unint64_t v17 = [v16 count];

      if (v17 < 2) {
        [(CKDetailsController *)self openInContactsCell];
      }
      else {
      uint64_t v6 = [(CKDetailsController *)self changeGroupNamePhotoCell];
      }
      goto LABEL_25;
    default:
LABEL_12:
      uint64_t v12 = [NSString stringWithFormat:@"*** %s: Unsupported section in indexPath %@", "-[CKDetailsController tableView:cellForRowAtIndexPath:]", v5];
      unsigned int v13 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v12 userInfo:0];
      [v13 raise];

LABEL_13:
      int v7 = 0;
      break;
  }

  return v7;
}

- (id)_groupPhotoHeaderRequiredContactKeys
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1BBD0] descriptorForRequiredKeys];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (BOOL)shouldShowGroupPhotoActionTitle
{
  id v2 = [(CKDetailsController *)self conversation];
  char v3 = [v2 supportsMutatingGroupIdentity];

  return v3;
}

- (void)_configureGroupPhotoHeader
{
  if (!self->_groupPhotoCell)
  {
    char v3 = [CKGroupPhotoCell alloc];
    uint64_t v4 = +[CKGroupPhotoCell reuseIdentifier];
    id v5 = [(CKGroupPhotoCell *)v3 initWithStyle:0 reuseIdentifier:v4];
    groupPhotoCell = self->_groupPhotoCell;
    self->_groupPhotoCell = v5;
  }
  if (!self->_groupPhotoHeaderViewController || self->_needsContactsReload)
  {
    int v7 = [(CKDetailsController *)self conversation];
    int v8 = [v7 chat];

    id v9 = [(CKDetailsController *)self setupAlternativeCommunicationActionsForChat:v8];
    actions = self->_actions;
    self->_actions = v9;

    int v11 = +[CKUIBehavior sharedBehaviors];
    uint64_t v12 = [v11 detailsActionViewStyle];

    unsigned int v13 = (void *)[objc_alloc(MEMORY[0x1E4F1BBD8]) initWithDefaultActionItems:self->_actions displaysUnavailableActionTypes:1 actionViewStyle:v12];
    if (objc_opt_respondsToSelector())
    {
      int v14 = [(CKDetailsController *)self conversation];
      int v15 = [v14 chat];
      int64_t v16 = [v15 lastAddressedSIMID];
      [v13 setGeminiChannelIdentifier:v16];
    }
    unint64_t v17 = [(CKDetailsController *)self _groupPhotoHeaderRequiredContactKeys];
    uint64_t v18 = [(id)objc_opt_class() maxContactAvatars];
    CGFloat v19 = [(CKDetailsController *)self conversation];
    unint64_t v20 = [v19 conversationVisualIdentityWithKeys:v17 requestedNumberOfContactsToFetch:v18];

    int64_t v21 = (CNGroupIdentityHeaderViewController *)[objc_alloc(MEMORY[0x1E4F1BBD0]) initWithGroupIdentity:v20 actionsViewConfiguration:v13];
    groupPhotoHeaderViewController = self->_groupPhotoHeaderViewController;
    self->_groupPhotoHeaderViewController = v21;

    if ([(CKDetailsController *)self shouldShowGroupPhotoActionTitle])
    {
      BOOL v23 = CKFrameworkBundle();
      id v24 = [v23 localizedStringForKey:@"GROUP_PHOTO_ACTION_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
      [(CNGroupIdentityHeaderViewController *)self->_groupPhotoHeaderViewController setActionButtonTitle:v24];
    }
    else
    {
      [(CNGroupIdentityHeaderViewController *)self->_groupPhotoHeaderViewController setActionButtonTitle:0];
    }
    int64_t v25 = [(CNGroupIdentityHeaderViewController *)self->_groupPhotoHeaderViewController view];
    [v25 setAutoresizingMask:18];

    [(CNGroupIdentityHeaderViewController *)self->_groupPhotoHeaderViewController setDelegate:self];
    self->_needsContactsReload = 0;
  }
  [(CKDetailsController *)self updateContactsHeaderVerificationState];
  [(CKGroupPhotoCell *)self->_groupPhotoCell frame];
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v34 = [(CNGroupIdentityHeaderViewController *)self->_groupPhotoHeaderViewController view];
  objc_msgSend(v34, "setFrame:", v27, v29, v31, v33);

  id v35 = self->_groupPhotoCell;
  id v36 = [(CNGroupIdentityHeaderViewController *)self->_groupPhotoHeaderViewController view];
  [(CKGroupPhotoCell *)v35 setGroupView:v36];
}

- (id)screenSharingActionView
{
  char v3 = [(CNGroupIdentityHeaderViewController *)self->_groupPhotoHeaderViewController actionsViewConfiguration];
  uint64_t v4 = [v3 supportedActionTypes];

  if (v4 && (uint64_t v5 = [v4 indexOfObject:@"ScreenShareType"], v5 != 0x7FFFFFFFFFFFFFFFLL))
  {
    int v7 = [(CNGroupIdentityHeaderViewController *)self->_groupPhotoHeaderViewController viewForActionAtIndex:v5];
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v6 = v7;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (double)calculateHeightForGroupPhotoHeader
{
  [(CKDetailsController *)self groupPhotoHeaderHeight];
  if (v3 < 0.0)
  {
    uint64_t v4 = [(CKDetailsController *)self tableView];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
    double v9 = *MEMORY[0x1E4F1DB30];
    double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);

    if (v6 != v9 || v8 != v10) {
      goto LABEL_8;
    }
  }
  if ([(CKDetailsController *)self shouldForceGroupPhotoHeaderReload])
  {
LABEL_8:
    [(CKDetailsController *)self _configureGroupPhotoHeader];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v12 = +[CKUIBehavior sharedBehaviors];
      [v12 detailsTableViewInsets];
      double v14 = v13;
      int v15 = +[CKUIBehavior sharedBehaviors];
      [v15 detailsTableViewInsets];
      double v17 = v14 + v16;

      uint64_t v18 = [(CKDetailsController *)self tableView];
      [v18 bounds];
      CGFloat v19 = CGRectGetWidth(v26) - v17;

      -[CNGroupIdentityHeaderViewController sizeForLayoutInContainerSize:](self->_groupPhotoHeaderViewController, "sizeForLayoutInContainerSize:", v19, 1.79769313e308);
      double v21 = v20;
      int64_t v22 = [(CKDetailsController *)self traitCollection];
      [v22 displayScale];
      if (v23 == 0.0)
      {
        if (CKMainScreenScale_once_23 != -1) {
          dispatch_once(&CKMainScreenScale_once_23, &__block_literal_global_1408);
        }
        double v23 = *(double *)&CKMainScreenScale_sMainScreenScale_23;
        if (*(double *)&CKMainScreenScale_sMainScreenScale_23 == 0.0) {
          double v23 = 1.0;
        }
      }
      [(CKDetailsController *)self setGroupPhotoHeaderHeight:ceil(v21 * v23) / v23];
    }
    else
    {
      [(CKDetailsController *)self setGroupPhotoHeaderHeight:300.0];
    }
    [(CKDetailsController *)self setShouldForceGroupPhotoHeaderReload:0];
  }

  [(CKDetailsController *)self groupPhotoHeaderHeight];
  return result;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = 0.0;
  switch([v7 section])
  {
    case 0:
      if ([(CKDetailsController *)self supportsChatNameAndPhotoHeader])
      {
        [(CKDetailsController *)self calculateHeightForGroupPhotoHeader];
        goto LABEL_53;
      }
      goto LABEL_54;
    case 1:
      [(CKDetailsController *)self _heightForExpanseActivityCell];
      goto LABEL_53;
    case 2:
      if (![(CKDetailsController *)self shouldShowSIMTypeSection]) {
        goto LABEL_54;
      }
      -[CKDetailsController switchSubscriptionCellForIndexPathRow:](self, "switchSubscriptionCellForIndexPathRow:", [v7 row]);
      double v10 = (CKDetailsChatOptionsCell *)objc_claimAutoreleasedReturnValue();
      int v11 = [(CKDetailsController *)self switchToLabelForChat];
      if (v11)
      {
        [v6 bounds];
        -[CKDetailsChatOptionsCell sizeThatFits:](v10, "sizeThatFits:", CGRectGetWidth(v44), 3.40282347e38);
        double v8 = v12;
      }

      goto LABEL_46;
    case 3:
      if ([v7 row])
      {
        uint64_t v13 = [v7 row] - 1;
LABEL_15:
        double v16 = [(CKDetailsController *)self locationShareCellForIndexPathRow:v13];
        if (CKIsRunningInMacCatalyst())
        {
LABEL_16:
          [(CKDetailsSharedWithYouCell *)v16 frame];
          double v8 = v17;
        }
        else
        {
LABEL_26:
          [v6 bounds];
          -[CKDetailsSharedWithYouCell sizeThatFits:](v16, "sizeThatFits:", CGRectGetWidth(v45), 3.40282347e38);
          double v8 = v32;
        }
      }
      else
      {
        uint64_t v39 = +[CKUIBehavior sharedBehaviors];
        [v39 detailsViewMapHeight];
        double v8 = v40;

        if ([(CKDetailsController *)self shouldShowLocationStringForOneToOneConversation])
        {
          double v8 = v8 + 44.0;
        }
      }
      goto LABEL_54;
    case 5:
      +[CKDetailsGroupCountCell preferredHeight];
      goto LABEL_53;
    case 6:
      [(CKDetailsController *)self visibleContactsRows];
      [(CKDetailsController *)self shouldAddToVisibleContactRowCountForTUConversation];
      uint64_t v14 = [v7 row];
      BOOL v15 = v14 <= [(CKDetailsController *)self rowForLastContact]
         && [(CKDetailsController *)self countOfContactViewModels] != 0;
      uint64_t v35 = [v7 row];
      id v36 = [(CKDetailsController *)self conversation];
      char v37 = [v36 isBusinessConversation];

      if (v37) {
        goto LABEL_34;
      }
      if (CKIsRunningInMacCatalyst())
      {
        if (![(CKDetailsController *)self hasTUConversation])
        {
          if (!v15) {
            goto LABEL_52;
          }
LABEL_34:
          [(CKDetailsController *)self _heightForContactCellAtIndexPath:v7];
          goto LABEL_53;
        }
        if (!v15) {
          goto LABEL_52;
        }
        int64_t v38 = [(CKDetailsController *)self rowForTUConversationCell];
      }
      else
      {
        if (!v15) {
          goto LABEL_52;
        }
        uint64_t v35 = [v7 row];
        int64_t v38 = [(CKDetailsController *)self rowForShowMoreContactsCell];
      }
      if (v35 > v38) {
        goto LABEL_34;
      }
LABEL_52:
      [(CKDetailsController *)self _heightForAuxContactCellAtIndexPath:v7];
LABEL_53:
      double v8 = v9;
LABEL_54:

      return v8;
    case 7:
      uint64_t v13 = [v7 row];
      goto LABEL_15;
    case 8:
      uint64_t v18 = [CKDetailsSharedWithYouCell alloc];
      double v16 = -[CKDetailsSharedWithYouCell initWithFrame:](v18, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      CGFloat v19 = [(CKDetailsSharedWithYouCell *)v16 textLabel];
      double v20 = CKFrameworkBundle();
      double v21 = v20;
      int64_t v22 = @"MARK_AS_AUTO_DONATING";
      goto LABEL_24;
    case 9:
      double v23 = [CKDetailsChatOptionsCell alloc];
      double v10 = -[CKDetailsChatOptionsCell initWithFrame:](v23, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      unint64_t v24 = [(CKDetailsController *)self _optionRowForIndexPath:v7];
      if (v24 == 2)
      {
        int64_t v25 = [(CKDetailsChatOptionsCell *)v10 textLabel];
        CGRect v26 = CKFrameworkBundle();
        double v27 = v26;
        double v28 = @"SHARE_FOCUS_STATUS";
      }
      else if (v24 == 1)
      {
        int64_t v25 = [(CKDetailsChatOptionsCell *)v10 textLabel];
        CGRect v26 = CKFrameworkBundle();
        double v27 = v26;
        double v28 = @"READ_RECEIPTS";
      }
      else
      {
        if (v24) {
          goto LABEL_45;
        }
        int64_t v25 = [(CKDetailsChatOptionsCell *)v10 textLabel];
        CGRect v26 = CKFrameworkBundle();
        double v27 = v26;
        double v28 = @"DETAILS_VIEW_HIDE_ALERTS_TOGGLE_TITLE";
      }
      unsigned int v41 = [v26 localizedStringForKey:v28 value:&stru_1EDE4CA38 table:@"ChatKit"];
      [v25 setText:v41];

LABEL_45:
      [v6 bounds];
      -[CKDetailsChatOptionsCell sizeThatFits:](v10, "sizeThatFits:", CGRectGetWidth(v46), 3.40282347e38);
      double v8 = v42;
LABEL_46:

      goto LABEL_54;
    case 10:
      double v29 = [CKDetailsLocationShareCell alloc];
      double v16 = -[CKDetailsLocationShareCell initWithFrame:](v29, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      CGFloat v19 = [(CKDetailsSharedWithYouCell *)v16 textLabel];
      double v20 = CKFrameworkBundle();
      double v21 = v20;
      int64_t v22 = @"LEAVE_CONVERSATION";
      goto LABEL_24;
    case 11:
      double v30 = [CKDetailsLocationShareCell alloc];
      double v16 = -[CKDetailsLocationShareCell initWithFrame:](v30, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      CGFloat v19 = [(CKDetailsSharedWithYouCell *)v16 textLabel];
      double v20 = CKFrameworkBundle();
      double v21 = v20;
      int64_t v22 = @"DELETE_AND_BLOCK_THIS_CONVERSATION";
LABEL_24:
      double v31 = [v20 localizedStringForKey:v22 value:&stru_1EDE4CA38 table:@"ChatKit"];
      [v19 setText:v31];

      goto LABEL_26;
    case 12:
      double v16 = [(CKDetailsController *)self searchViewController];
      goto LABEL_26;
    case 13:
      double v33 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v34 = [v33 isKeyTransparencyEnabled];

      if (!v34) {
        goto LABEL_54;
      }
      -[CKDetailsController ktCellForRow:](self, "ktCellForRow:", [v7 row]);
      double v16 = (CKDetailsSharedWithYouCell *)objc_claimAutoreleasedReturnValue();
      if (!CKIsRunningInMacCatalyst()) {
        goto LABEL_26;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_26;
      }
      goto LABEL_16;
    default:
      goto LABEL_54;
  }
}

- (id)labelForChat
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (IMSharedHelperDeviceHasMultipleActiveSubscriptions())
  {
    double v3 = [(CKDetailsController *)self conversation];
    uint64_t v4 = [v3 chat];
    double v5 = [v4 lastAddressedSIMID];

    id v6 = [(CKDetailsController *)self conversation];
    id v7 = [v6 chat];
    double v8 = [v7 lastAddressedHandleID];

    double v9 = [MEMORY[0x1E4F6E668] sharedInstance];
    double v10 = [v9 ctSubscriptionInfo];
    int v11 = objc_msgSend(v10, "__im_subscriptionContextForForSimID:phoneNumber:", v5, v8);

    if (IMOSLoggingEnabled())
    {
      double v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v15 = 138412802;
        double v16 = v11;
        __int16 v17 = 2112;
        uint64_t v18 = v8;
        __int16 v19 = 2112;
        double v20 = v5;
        _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Found current context %@ for phoneNumber %@ simID %@", (uint8_t *)&v15, 0x20u);
      }
    }
    uint64_t v13 = [v11 label];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)switchToLabelForChat
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (IMSharedHelperDeviceHasMultipleActiveSubscriptions())
  {
    double v3 = [(CKDetailsController *)self conversation];
    uint64_t v4 = [v3 chat];
    double v5 = [v4 lastAddressedSIMID];

    id v6 = [(CKDetailsController *)self conversation];
    id v7 = [v6 chat];
    double v8 = [v7 lastAddressedHandleID];

    double v9 = [MEMORY[0x1E4F6E668] sharedInstance];
    double v10 = [v9 ctSubscriptionInfo];
    int v11 = objc_msgSend(v10, "__im_switchSubscriptionContextFromPhoneNumber:simID:", v8, v5);

    if (IMOSLoggingEnabled())
    {
      double v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v15 = 138412802;
        double v16 = v11;
        __int16 v17 = 2112;
        uint64_t v18 = v8;
        __int16 v19 = 2112;
        double v20 = v5;
        _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Found context to switch to %@ for phoneNumber %@ simID %@", (uint8_t *)&v15, 0x20u);
      }
    }
    uint64_t v13 = [v11 label];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (double)_heightForContactCellAtIndexPath:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(CKDetailsController *)self countOfContactViewModels];
  unint64_t v6 = [v4 row];
  if (v6 < v5 || [(CKDetailsController *)self hasTUConversation])
  {
    if ([(CKDetailsController *)self shouldAddToVisibleContactRowCountForTUConversation])
    {
      unint64_t v6 = v5 - 2;
    }
    else
    {
      id v7 = [(CKDetailsController *)self conversation];
      double v8 = [v7 chat];
      [v8 isBusinessChat];
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      double v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        double v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "row"));
        int v11 = [NSNumber numberWithUnsignedInteger:v5];
        double v12 = [MEMORY[0x1E4F29060] callStackSymbols];
        int v22 = 138412802;
        double v23 = v10;
        __int16 v24 = 2112;
        int64_t v25 = v11;
        __int16 v26 = 2112;
        double v27 = v12;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "_heightForContactCellAtIndexPath passed an indexPath with an invalid row index:%@, model count:%@, backtrace:%@", (uint8_t *)&v22, 0x20u);
      }
    }
    if (!v5)
    {
      double v20 = 0.0;
      goto LABEL_13;
    }
    unint64_t v6 = v5 - 1;
  }
  id v13 = objc_alloc(+[CKDetailsContactsTableViewCell cellClass]);
  uint64_t v14 = objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  int v15 = [(CKDetailsController *)self contactsManager];
  double v16 = [v15 contactsViewModels];
  __int16 v17 = [v16 objectAtIndex:v6];

  [v14 configureWithViewModel:v17];
  uint64_t v18 = [(CKDetailsController *)self tableView];
  [v18 bounds];
  objc_msgSend(v14, "sizeThatFits:", CGRectGetWidth(v29), 3.40282347e38);
  double v20 = v19;

LABEL_13:
  return v20;
}

- (double)_heightForAuxContactCellAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 row];
  if (v5 == [(CKDetailsController *)self rowForShowMoreContactsCell])
  {
    [(CKDetailsController *)self showMoreContactCellHeight];
    if (v6 < 0.0)
    {
      id v7 = [CKDetailsGroupHeaderCell alloc];
      double v8 = +[CKDetailsGroupHeaderCell reuseIdentifier];
      double v9 = [(CKDetailsController *)self contactsManager];
      double v10 = [v9 recipientsSortedByIsContact:1 alphabetically:1];
      int v11 = [(CKDetailsGroupHeaderCell *)v7 initWithStyle:0 reuseIdentifier:v8 participants:v10];

      double v12 = [(CKDetailsController *)self tableView];
      [v12 bounds];
      -[CKDetailsGroupHeaderCell sizeThatFits:](v11, "sizeThatFits:", CGRectGetWidth(v36), 3.40282347e38);
      [(CKDetailsController *)self setShowMoreContactCellHeight:v13];
    }
    [(CKDetailsController *)self showMoreContactCellHeight];
LABEL_16:
    double v22 = v14;
    goto LABEL_17;
  }
  uint64_t v15 = [v4 row];
  if (v15 == [(CKDetailsController *)self rowForAddMemberCell])
  {
    [(CKDetailsController *)self addContactCellHeight];
    if (v16 < 0.0)
    {
      id v17 = objc_alloc(+[CKDetailsAddMemberCell cellClass]);
      uint64_t v18 = objc_msgSend(v17, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      double v19 = [(CKDetailsController *)self tableView];
      [v19 bounds];
      objc_msgSend(v18, "sizeThatFits:", CGRectGetWidth(v37), 3.40282347e38);
      [(CKDetailsController *)self setAddContactCellHeight:v20];
    }
    [(CKDetailsController *)self addContactCellHeight];
    goto LABEL_16;
  }
  uint64_t v21 = [v4 row];
  double v22 = 0.0;
  if (v21 == [(CKDetailsController *)self rowForTUConversationCell])
  {
    [(CKDetailsController *)self tuConversationCellHeight];
    if (v23 < 0.0)
    {
      __int16 v24 = [CKDetailsTUConversationCell alloc];
      int64_t v25 = +[CKDetailsTUConversationCell reuseIdentifier];
      __int16 v26 = [(CKDetailsController *)self tuConversation];
      double v27 = [(CKDetailsTUConversationCell *)v24 initWithStyle:0 reuseIdentifier:v25 conversation:v26];

      uint64_t v28 = [(CKDetailsController *)self tableView];
      [v28 bounds];
      -[CKDetailsTUConversationCell sizeThatFits:](v27, "sizeThatFits:", CGRectGetWidth(v38), 3.40282347e38);
      double v30 = v29;

      double v31 = +[CKUIBehavior sharedBehaviors];
      [v31 detailsContactCellMinimumHeight];
      double v33 = v32;

      if (v30 >= v33) {
        double v34 = v30;
      }
      else {
        double v34 = v33;
      }
      [(CKDetailsController *)self setTuConversationCellHeight:v34];
    }
    [(CKDetailsController *)self tuConversationCellHeight];
    goto LABEL_16;
  }
LABEL_17:

  return v22;
}

- (double)_heightForExpanseActivityCell
{
  double v3 = [(CKDetailsController *)self tuConversation];

  if (!v3) {
    return 0.0;
  }
  id v4 = [CKDetailsExpanseActivityCell alloc];
  uint64_t v5 = +[CKDetailsExpanseActivityCell reuseIdentifier];
  double v6 = [(CKDetailsController *)self tuConversation];
  id v7 = [(CKDetailsExpanseActivityCell *)v4 initWithStyle:0 reuseIdentifier:v5 conversation:v6];

  double v8 = (void *)MEMORY[0x1E4F6BCC0];
  double v9 = [(CKDetailsController *)self tuConversation];
  if ([v8 isScreenShareActivityForTUConversation:v9])
  {

LABEL_7:
    id v17 = [(CKDetailsController *)self tableView];
    [v17 bounds];
    -[CKDetailsExpanseActivityCell sizeThatFits:](v7, "sizeThatFits:", CGRectGetWidth(v22), 3.40282347e38);
    double v10 = v18;

    uint64_t v15 = +[CKUIBehavior sharedBehaviors];
    [v15 detailsExpanseScreenShareCellHeight];
    goto LABEL_8;
  }
  int v11 = [(CKDetailsController *)self tuConversation];
  double v12 = +[CKTUConversationViewUtilities activityImageForTUConversation:v11];

  if (!v12) {
    goto LABEL_7;
  }
  double v13 = [(CKDetailsController *)self tableView];
  [v13 bounds];
  -[CKDetailsExpanseActivityCell sizeThatFits:](v7, "sizeThatFits:", CGRectGetWidth(v21), 3.40282347e38);
  double v10 = v14;

  uint64_t v15 = +[CKUIBehavior sharedBehaviors];
  [v15 detailsExpanseCellHeight];
LABEL_8:
  double v19 = v16;

  if (v10 < v19) {
    double v10 = v19;
  }

  return v10;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(CKDetailsController *)self conversationHasLeft])
  {
LABEL_2:
    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = 1;
    switch([v5 section])
    {
      case 2:
        id v7 = CKDetailsSIMCell;
        goto LABEL_22;
      case 3:
        id v7 = CKDetailsMapViewCell;
        goto LABEL_22;
      case 4:
        id v7 = CKDetailsGroupNameCell;
        goto LABEL_22;
      case 6:
        uint64_t v8 = [v5 row];
        if (v8 == [(CKDetailsController *)self rowForAddMemberCell]) {
          goto LABEL_20;
        }
        uint64_t v9 = [v5 row];
        if (v9 == [(CKDetailsController *)self rowForShowMoreContactsCell]) {
          goto LABEL_20;
        }
        uint64_t v10 = [v5 row];
        if (v10 == [(CKDetailsController *)self rowForTUConversationCell]) {
          goto LABEL_2;
        }
        BOOL v6 = CKIsRunningInMacCatalyst() == 0;
        break;
      case 7:
        uint64_t v16 = [v5 row];
        id v17 = [(CKDetailsController *)self conversation];
        int64_t v18 = +[CKDetailsControllerLocationHelper cellTypeForRow:v16 conversation:v17 isFMFEnabled:[(CKDetailsController *)self fmfEnabled] shouldShowFMFView:[(CKDetailsController *)self shouldShowFMFView]];

        BOOL v19 = [(CKDetailsController *)self fmfEnabled];
        BOOL v6 = v18 == 2 || v19;
        break;
      case 8:
        id v7 = CKDetailsSharedWithYouCell;
        goto LABEL_22;
      case 9:
        id v7 = CKDetailsChatOptionsCell;
        goto LABEL_22;
      case 10:
        if (!CKIsRunningUITests()) {
          goto LABEL_25;
        }
        double v20 = [(CKDetailsController *)self conversation];
        CGRect v21 = [v20 chat];
        CGRect v22 = [v21 participants];
        unint64_t v23 = [v22 count];

        if (v23 > 2)
        {
LABEL_20:
          BOOL v6 = 1;
        }
        else
        {
LABEL_25:
          char v24 = [(CKDetailsController *)self canLeaveConversation];
LABEL_23:
          BOOL v6 = v24;
        }
        break;
      case 11:
      case 15:
        break;
      case 12:
        id v7 = CKDetailsSegmentedControlCell;
LABEL_22:
        char v24 = [(__objc2_class *)v7 shouldHighlight];
        goto LABEL_23;
      case 13:
        int v11 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
        int v12 = [v11 isKeyTransparencyEnabled];

        if (!v12) {
          goto LABEL_2;
        }
        double v13 = [(CKDetailsController *)self tableView];
        double v14 = [v13 cellForRowAtIndexPath:v5];

        uint64_t v15 = [(CKDetailsController *)self conversation];
        BOOL v6 = +[CKKTDetailsViewUtilities shouldHighlightCell:v14 forConversation:v15];

        break;
      default:
        goto LABEL_2;
    }
  }

  return v6;
}

- (BOOL)shouldDisplayHeaderForSection:(unint64_t)a3
{
  double v3 = self;
  LOBYTE(self) = 0;
  if ((uint64_t)a3 > 9)
  {
    if (a3 == 13)
    {
      id v4 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v5 = [v4 isKeyTransparencyEnabled];

      if (v5)
      {
        LODWORD(self) = [(CKDetailsController *)v3 shouldShowKTSection];
        if (self) {
          LOBYTE(self) = CKIsRunningInMacCatalyst() == 0;
        }
      }
      else
      {
        LOBYTE(self) = 0;
      }
    }
    else if (a3 == 10)
    {
      LOBYTE(self) = [(CKDetailsController *)v3 shouldShowEnhancedGroupFeatures];
    }
  }
  else if (a3 == 1 || a3 == 3)
  {
    LOBYTE(self) = [(CKDetailsController *)v3 shouldShowExpanseFeatures];
  }
  return (char)self;
}

- (BOOL)shouldDisplayFooterForSection:(unint64_t)a3
{
  BOOL result = 1;
  switch(a3)
  {
    case 0uLL:
      return result;
    case 1uLL:
      BOOL result = [(CKDetailsController *)self shouldShowExpanseFeatures];
      break;
    case 2uLL:
      BOOL result = [(CKDetailsController *)self shouldShowSIMTypeSection];
      break;
    case 6uLL:
      BOOL result = [(CKDetailsController *)self shouldShowBusinessInfoFooter];
      break;
    case 8uLL:
      BOOL result = [(CKDetailsController *)self shouldShowSharedWithYouFeatures];
      break;
    case 0xDuLL:
      int v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v6 = [v5 isKeyTransparencyEnabled];

      if (!v6) {
        goto LABEL_2;
      }
      BOOL result = [(CKDetailsController *)self shouldShowKTSection];
      break;
    default:
LABEL_2:
      BOOL result = 0;
      break;
  }
  return result;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4 != 13) {
    goto LABEL_5;
  }
  int v5 = objc_msgSend(MEMORY[0x1E4F6E778], "sharedFeatureFlags", a3);
  if (![v5 isKeyTransparencyEnabled])
  {
    id v7 = 0;
    goto LABEL_7;
  }
  BOOL v6 = [(CKDetailsController *)self shouldShowKTSection];

  if (!v6)
  {
LABEL_5:
    id v7 = 0;
    goto LABEL_8;
  }
  int v5 = CKFrameworkBundle();
  id v7 = [v5 localizedStringForKey:@"KT_HEADER_TEXT" value:&stru_1EDE4CA38 table:@"ChatKit-Key-Transparency"];
LABEL_7:

LABEL_8:

  return v7;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 13)
  {
    uint64_t v9 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    if ([v9 isKeyTransparencyEnabled])
    {
      BOOL v10 = [(CKDetailsController *)self shouldShowKTSection];

      if (v10)
      {
        double v8 = *MEMORY[0x1E4F43D18];
        goto LABEL_11;
      }
    }
    else
    {
    }
  }
  else if (a4 == 1)
  {
    [(CKDetailsController *)self calculateHeightForExpanseActivityHeader];
    double v8 = v7;
    goto LABEL_11;
  }
  if ([(CKDetailsController *)self shouldDisplayHeaderForSection:a4]) {
    double v8 = 16.0;
  }
  else {
    double v8 = 0.0;
  }
LABEL_11:

  return v8;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v5 = a4;
  id v6 = v5;
  if (v5)
  {
    uint64_t v15 = v5;
    double v7 = [v5 contentView];
    double v8 = +[CKUIBehavior sharedBehaviors];
    uint64_t v9 = [v8 theme];
    BOOL v10 = [v9 detailsHeaderFooterContentViewBackgroundColor];
    [v7 setBackgroundColor:v10];

    int v11 = +[CKUIBehavior sharedBehaviors];
    int v12 = [v11 theme];
    double v13 = [v12 detailsHeaderFooterContentViewBackgroundColor];
    [v15 setBackgroundColor:v13];

    int v14 = CKIsRunningInMacCatalyst();
    id v6 = v15;
    if (v14)
    {
      [v15 setBackgroundView:0];
      id v6 = v15;
    }
  }
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7 = a3;
  id v8 = a4;
  if (CKIsRunningInMacCatalyst()
    && [v8 section] == 6
    && (uint64_t v9 = [v8 row],
        v9 != [(CKDetailsController *)self rowForTUConversationCell]))
  {
    int v12 = [v7 cellForRowAtIndexPath:v8];
    BOOL v10 = [(CKDetailsController *)self _menuConfigForContactsCell:v12];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)_menuConfigForContactsCell:(id)a3
{
  id v4 = a3;
  id v5 = [(CKDetailsController *)self tableView];
  id v6 = [v5 indexPathForCell:v4];

  unint64_t v7 = [(CKDetailsController *)self adjustedViewModelIndexForIndexPath:v6];
  id v8 = [(CKDetailsController *)self contactsManager];
  uint64_t v9 = [v8 contactsViewModels];
  unint64_t v10 = [v9 count];

  if (v10 <= v7)
  {
    id v17 = 0;
  }
  else
  {
    BOOL v11 = [(CKDetailsController *)self _canRemoveRecipientAtIndexPath:v6];
    int v12 = [(CKDetailsController *)self contactsManager];
    double v13 = [v12 contactsViewModels];
    int v14 = [v13 objectAtIndex:v7];
    uint64_t v15 = [v14 entity];

    uint64_t v16 = [(CKDetailsController *)self contactsManager];
    id v17 = [v16 conversationContextMenuConfigForEntity:v15 allowConversationRemoval:v11];
  }

  return v17;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  double v7 = 16.0;
  switch(a4)
  {
    case 0:
      BOOL v8 = ![(CKDetailsController *)self supportsChatNameAndPhotoHeader];
      double v9 = 0.0;
      double v10 = 16.0;
      goto LABEL_22;
    case 2:
      double v7 = 0.0;
      if ([(CKDetailsController *)self shouldShowSIMTypeSection])
      {
        BOOL v11 = [(CKDetailsController *)self switchToLabelForChat];

        if (v11) {
          double v7 = 16.0;
        }
        else {
          double v7 = 0.0;
        }
      }
      break;
    case 3:
      double v7 = 0.0;
      if ([(CKDetailsController *)self shouldShowFMFView]) {
        goto LABEL_8;
      }
      break;
    case 6:
      if ([(CKDetailsController *)self shouldShowBusinessInfoFooter])
      {
        [(CKDetailsController *)self initializeBusinessInfoViewIfNecessary];
        double v13 = [(CKDetailsController *)self tableView];
        [v13 bounds];
        CGFloat v15 = v14;
        CGFloat v17 = v16;
        CGFloat v19 = v18;
        CGFloat v21 = v20;

        CGRect v22 = [(CKDetailsController *)self tableView];
        [v22 _marginWidth];
        double v24 = v23;

        int64_t v25 = [(CKDetailsController *)self businessInfoView];
        v34.origin.CGFloat x = v15;
        v34.origin.CGFloat y = v17;
        v34.size.CGFloat width = v19;
        v34.size.CGFloat height = v21;
        objc_msgSend(v25, "sizeThatFits:", CGRectGetWidth(v34) + v24 * -2.0, 1.79769313e308);
        double v7 = v26;
      }
      else
      {
        double v29 = [(CKDetailsController *)self conversation];
        char v30 = [v29 isGroupConversation];

        if ((v30 & 1) == 0)
        {
          double v31 = [(CKDetailsController *)self conversation];
          int v32 = [v31 isGroupConversation];

          BOOL v8 = v32 == 0;
          double v9 = 0.0;
          double v10 = 28.0;
LABEL_22:
          if (v8) {
            double v7 = v9;
          }
          else {
            double v7 = v10;
          }
        }
      }
      break;
    case 7:
LABEL_8:
      [(CKDetailsController *)self calculateHeightForLocationSharingFooter];
      goto LABEL_16;
    case 8:
      double v7 = 0.0;
      if (![(CKDetailsController *)self shouldShowSharedWithYouFeatures]) {
        break;
      }
      [(CKDetailsController *)self calculateHeightForShareAutomaticallyFooter];
      goto LABEL_16;
    case 10:
    case 11:
      break;
    case 12:
      if (![(CKDetailsController *)self downloadButtonState]) {
        goto LABEL_19;
      }
      BOOL v8 = ![(CKDetailsController *)self isDisplayingPhotos];
      double v9 = 190.0;
      double v10 = 110.0;
      goto LABEL_22;
    case 13:
      double v27 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v28 = [v27 isKeyTransparencyEnabled];

      double v7 = 0.0;
      if (!v28 || ![(CKDetailsController *)self shouldShowKTSection]) {
        break;
      }
      [(CKDetailsController *)self calculateHeightForKTFooter];
LABEL_16:
      double v7 = v12;
      break;
    default:
LABEL_19:
      double v7 = 0.0;
      break;
  }

  return v7;
}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  id v23 = a3;
  id v8 = a4;
  double v9 = v8;
  if (v8)
  {
    id v10 = v8;
    switch(a5)
    {
      case 6:
        uint64_t v11 = [(CKDetailsController *)self businessInfoView];
        break;
      case 7:
        uint64_t v11 = [(CKDetailsController *)self locationSharingTextView];
        break;
      case 8:
        uint64_t v11 = [(CKDetailsController *)self sharedWithYouFooterTextView];
        break;
      case 9:
      case 10:
      case 11:
      case 12:
        goto LABEL_11;
      case 13:
        double v12 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
        int v13 = [v12 isKeyTransparencyEnabled];

        if (!v13) {
          goto LABEL_11;
        }
        uint64_t v11 = [(CKDetailsController *)self ktSecurityFooterTextView];
        break;
      default:
        if (a5 != 1) {
          goto LABEL_11;
        }
        uint64_t v11 = [(CKDetailsController *)self expanseActivityTextView];
        break;
    }
    double v14 = (void *)v11;
    CGFloat v15 = [MEMORY[0x1E4F428B8] clearColor];
    [v14 setBackgroundColor:v15];

LABEL_11:
    double v16 = [v10 contentView];
    CGFloat v17 = +[CKUIBehavior sharedBehaviors];
    double v18 = [v17 theme];
    CGFloat v19 = [v18 detailsHeaderFooterContentViewBackgroundColor];
    [v16 setBackgroundColor:v19];

    double v20 = +[CKUIBehavior sharedBehaviors];
    CGFloat v21 = [v20 theme];
    CGRect v22 = [v21 detailsHeaderFooterContentViewBackgroundColor];
    [v10 setBackgroundColor:v22];
  }
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if (a4 == 1)
  {
    if ([(CKDetailsController *)self shouldDisplayHeaderForSection:1])
    {
      id v6 = [(CKDetailsController *)self expanseActivityHeaderViewForSection:1];
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  double v7 = 0;
  switch(a4)
  {
    case 3:
      if (![(CKDetailsController *)self shouldShowFooterInLocationSection:3]) {
        goto LABEL_15;
      }
      id v8 = self;
      uint64_t v9 = 3;
      goto LABEL_6;
    case 6:
      if (![(CKDetailsController *)self shouldShowBusinessInfoFooter]) {
        goto LABEL_15;
      }
      uint64_t v10 = [(CKDetailsController *)self businessInfoFooterViewForSection:6];
      goto LABEL_14;
    case 7:
      if (![(CKDetailsController *)self shouldShowFooterInLocationSection:7]) {
        goto LABEL_15;
      }
      id v8 = self;
      uint64_t v9 = 7;
LABEL_6:
      uint64_t v10 = [(CKDetailsController *)v8 locationFooterViewForSection:v9];
      goto LABEL_14;
    case 8:
      if (![(CKDetailsController *)self shouldShowSharedWithYouFeatures]) {
        goto LABEL_15;
      }
      uint64_t v10 = [(CKDetailsController *)self sharedWithYouFooterView];
      goto LABEL_14;
    case 12:
      if ([(CKDetailsController *)self shouldShowDownloadMoreCell])
      {
        double v7 = [(CKDetailsController *)self downloadAttachmentsFooterViewForSection:12];
      }
      else
      {
        double v7 = 0;
      }
      [(CKDetailsController *)self setDownloadAttachmentsFooterView:v7];
      [(CKDetailsController *)self _updateDownloadFooterView];
      goto LABEL_20;
    case 13:
      uint64_t v11 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v12 = [v11 isKeyTransparencyEnabled];

      if (v12 && [(CKDetailsController *)self shouldShowKTSection])
      {
        uint64_t v10 = [(CKDetailsController *)self ktSecurityFooterView];
LABEL_14:
        double v7 = (void *)v10;
      }
      else
      {
LABEL_15:
        double v7 = 0;
      }
LABEL_20:

      return v7;
    default:
      goto LABEL_20;
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = a4;
  BOOL v6 = [v5 section] == 6
    && [(CKDetailsController *)self _canRemoveRecipientAtIndexPath:v5];

  return v6;
}

- (double)calculateHeightForLocationSharingFooter
{
  BOOL v3 = [(CKDetailsController *)self shouldShowActiveDeviceSwitchFooter];
  double result = 24.0;
  if (v3)
  {
    [(CKDetailsController *)self initializeLocationSharingTextViewIfNecessary];
    id v5 = [(CKDetailsController *)self tableView];
    [v5 bounds];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;

    double v14 = [(CKDetailsController *)self tableView];
    [v14 _marginWidth];
    double v16 = v15;

    CGFloat v17 = [(CKDetailsController *)self locationSharingTextView];
    v20.origin.CGFloat x = v7;
    v20.origin.CGFloat y = v9;
    v20.size.CGFloat width = v11;
    v20.size.CGFloat height = v13;
    objc_msgSend(v17, "sizeThatFits:", CGRectGetWidth(v20) + v16 * -2.0, 1.79769313e308);
    double v19 = v18;

    return v19 + 32.0;
  }
  return result;
}

- (double)calculateHeightForShareAutomaticallyFooter
{
  BOOL v3 = [(CKDetailsController *)self shouldShowSharedWithYouFeatures];
  double result = 0.0;
  if (v3)
  {
    id v5 = [(CKDetailsController *)self tableView];
    [v5 bounds];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;

    double v14 = [(CKDetailsController *)self tableView];
    [v14 _marginWidth];
    double v16 = v15;

    CGFloat v17 = [(CKDetailsController *)self sharedWithYouFooterTextView];
    v23.origin.CGFloat x = v7;
    v23.origin.CGFloat y = v9;
    v23.size.CGFloat width = v11;
    v23.size.CGFloat height = v13;
    objc_msgSend(v17, "sizeThatFits:", CGRectGetWidth(v23) + v16 * -2.0, 1.79769313e308);
    double v19 = v18;

    +[CKDetailsSharedWithYouHeaderFooterView topPadding];
    double v21 = v19 + v20;
    +[CKDetailsSharedWithYouHeaderFooterView bottomPadding];
    return v21 + v22 + 16.0;
  }
  return result;
}

- (double)calculateHeightForExpanseActivityHeader
{
  double v3 = 0.0;
  if ([(CKDetailsController *)self shouldShowExpanseFeatures])
  {
    id v4 = [(CKDetailsController *)self expanseActivityTextView];
    id v5 = [(CKDetailsController *)self tableView];
    [v5 bounds];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;

    double v14 = [(CKDetailsController *)self tableView];
    [v14 _marginWidth];
    double v16 = v15;

    CGFloat v17 = [(CKDetailsController *)self expanseActivityTextView];
    v23.origin.CGFloat x = v7;
    v23.origin.CGFloat y = v9;
    v23.size.CGFloat width = v11;
    v23.size.CGFloat height = v13;
    objc_msgSend(v17, "sizeThatFits:", CGRectGetWidth(v23) + v16 * -2.0, 1.79769313e308);
    double v19 = v18;

    double v20 = +[CKUIBehavior sharedBehaviors];
    [v20 detailsExpanseActivityDescriptionVerticalPadding];
    double v3 = v19 + 0.0 + v21;
  }
  return v3;
}

- (BOOL)_canRemoveRecipientAtIndexPath:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CKDetailsController *)self rowForShowMoreContactsCell];
  if ([(CKDetailsController *)self shouldShowEnhancedGroupFeatures]
    && [(CKDetailsController *)self _moreThanMinNumberOfParticipantsInGroup]
    && ![(CKDetailsController *)self conversationHasLeft]
    && (uint64_t v6 = [v4 row],
        v6 != [(CKDetailsController *)self rowForTUConversationCell])
    && (v5 == 0x7FFFFFFFFFFFFFFFLL
     || (uint64_t v7 = [v4 row],
         v7 > [(CKDetailsController *)self rowForShowMoreContactsCell])))
  {
    uint64_t v8 = [v4 row];
    BOOL v9 = v8 <= [(CKDetailsController *)self rowForLastContact];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_moreThanMinNumberOfParticipantsInGroup
{
  id v2 = [(CKDetailsController *)self conversation];
  BOOL v3 = (unint64_t)[v2 recipientCount] > 2;

  return v3;
}

- (id)tableView:(id)a3 editActionsForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section] == 6
    && (uint64_t v8 = [v7 row], v8 != -[CKDetailsController rowForAddMemberCell](self, "rowForAddMemberCell")))
  {
    double v10 = (void *)MEMORY[0x1E4F42EC0];
    CGFloat v11 = CKFrameworkBundle();
    double v12 = [v11 localizedStringForKey:@"REMOVE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    double v18 = __62__CKDetailsController_tableView_editActionsForRowAtIndexPath___block_invoke;
    double v19 = &unk_1E56249A0;
    double v20 = self;
    id v21 = v6;
    CGFloat v13 = [v10 rowActionWithStyle:1 title:v12 handler:&v16];

    double v14 = objc_msgSend(MEMORY[0x1E4F428B8], "redColor", v16, v17, v18, v19, v20);
    [v13 setBackgroundColor:v14];

    BOOL v9 = [MEMORY[0x1E4F1C978] arrayWithObject:v13];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

void __62__CKDetailsController_tableView_editActionsForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  uint64_t v6 = [v4 adjustedViewModelIndexForIndexPath:v5];
  id v7 = [*(id *)(a1 + 32) conversation];
  uint64_t v8 = [v7 sortedHandles];
  id v10 = [v8 objectAtIndex:v6];

  BOOL v9 = [*(id *)(a1 + 40) cellForRowAtIndexPath:v5];

  [*(id *)(a1 + 32) _presentRemoveRecipientSheetForHandle:v10 fromView:v9];
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v4 = a4;
  id v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isWaldoEnabled];

  if (v6 && [v4 section] == 3) {
    id v7 = 0;
  }
  else {
    id v7 = v4;
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v32 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 row];
  switch([v6 section])
  {
    case 2:
      if ([(CKDetailsController *)self shouldShowSIMTypeSection])
      {
        uint64_t v8 = [(CKDetailsController *)self tableView];
        [v8 reloadData];
      }
      goto LABEL_21;
    case 3:
      switch(v7)
      {
        case 2:
          goto LABEL_29;
        case 1:
          goto LABEL_32;
        case 0:
          [(CKDetailsController *)self presentFullFMFMapViewController];
          break;
      }
      goto LABEL_21;
    case 6:
      BOOL v9 = [(CKDetailsController *)self tableView];
      id v10 = [v9 cellForRowAtIndexPath:v6];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && !CKIsRunningInMacCatalyst())
      {
        double v22 = [(CKDetailsController *)self conversation];
        int v23 = [v22 isBusinessConversation];

        if (v23)
        {
          [(CKDetailsController *)self _showBrandCard];
        }
        else
        {
          uint64_t v24 = [v6 row];
          BOOL v25 = [(CKDetailsController *)self hasTUConversation];
          uint64_t v26 = -2;
          if (!v25) {
            uint64_t v26 = -1;
          }
          uint64_t v27 = v26 + v24;
          int v28 = [(CKDetailsController *)self contactsManager];
          double v29 = [v28 recipientsSortedByIsContact:1 alphabetically:1];
          char v30 = [v29 objectAtIndex:v27];

          double v31 = [(CKDetailsController *)self view];
          [(CKDetailsController *)self showContactCardForEntity:v30 fromView:v31];
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v32 deselectRowAtIndexPath:v6 animated:1];
          if ([(CKDetailsController *)self isContactsSectionCollapsed]) {
            [(CKDetailsController *)self expandContactsSection];
          }
          else {
            [(CKDetailsController *)self collapseContactsSection];
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [(CKDetailsController *)self presentGroupRecipientSelectionControllerAtIndexPath:v6];
          }
        }
      }
      goto LABEL_20;
    case 7:
      CGFloat v11 = [(CKDetailsController *)self conversation];
      int64_t v12 = +[CKDetailsControllerLocationHelper cellTypeForRow:v7 conversation:v11 isFMFEnabled:[(CKDetailsController *)self fmfEnabled] shouldShowFMFView:[(CKDetailsController *)self shouldShowFMFView]];

      switch(v12)
      {
        case 2:
          [(CKDetailsController *)self stageCurrentLocation];
          break;
        case 1:
LABEL_29:
          [(CKDetailsController *)self shareLocationAction];
          break;
        case 0:
          CGFloat v13 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
          int v14 = [v13 isWaldoEnabled];

          if (v14) {
            [(CKDetailsController *)self stageLocationRequest];
          }
          else {
LABEL_32:
          }
            [(CKDetailsController *)self sendCurrentLocation];
          break;
      }
      goto LABEL_21;
    case 10:
      id v10 = [v32 cellForRowAtIndexPath:v6];
      [(CKDetailsController *)self presentLeaveActionSheetFromView:v10];
      goto LABEL_20;
    case 11:
      id v10 = [v32 cellForRowAtIndexPath:v6];
      [(CKDetailsController *)self presentDeleteAndBlockActionSheetFromView:v10];
      goto LABEL_20;
    case 13:
      double v15 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v16 = [v15 isKeyTransparencyEnabled];

      if (!v16) {
        goto LABEL_21;
      }
      uint64_t v17 = [(CKDetailsController *)self tableView];
      id v10 = [v17 cellForRowAtIndexPath:v6];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(CKDetailsController *)self showKTContactVerificationUI];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(CKDetailsController *)self enableEnhancedProtection];
        }
      }
LABEL_20:

LABEL_21:
      [v32 deselectRowAtIndexPath:v6 animated:1];

      return;
    case 15:
      double v18 = [(CKDetailsController *)self conversation];
      double v19 = [v18 chat];
      double v20 = [v19 participants];
      unint64_t v21 = [v20 count];

      if (v21 >= 2) {
        [(CKDetailsController *)self _presentGroupNameAndPhotoEditor];
      }
      goto LABEL_21;
    default:
      goto LABEL_21;
  }
}

- (void)_showBrandCard
{
  BOOL v3 = [(CKDetailsController *)self conversation];
  id v4 = [v3 businessHandle];
  id v8 = [v4 brand];

  id v5 = v8;
  if (v8)
  {
    id v6 = [MEMORY[0x1E4F6E628] makeBrandPlacecardForIMBrand:v8];
    uint64_t v7 = [(CKDetailsController *)self navigationController];
    [v7 pushViewController:v6 animated:1];

    id v5 = v8;
  }
}

- (void)setupKT
{
  BOOL v3 = [(CKDetailsController *)self conversation];
  id v4 = [v3 chat];
  char v5 = [v4 isBusinessChat];

  if ((v5 & 1) == 0)
  {
    [(CKDetailsController *)self getKTStatus];
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:self selector:sel__handleKeyTransparencyStatusChangedNotification_ name:*MEMORY[0x1E4F6B998] object:0];

    id v8 = [(CKDetailsController *)self conversation];
    uint64_t v7 = [v8 chat];
    [v7 fetchKTStatus];
  }
}

- (void)getKTStatus
{
  BOOL v3 = [(CKDetailsController *)self conversation];
  id v4 = [v3 chat];

  id obj = 0;
  unint64_t v5 = [v4 keyTransparencyStatusForAffectedHandles:&obj];
  objc_storeStrong((id *)&self->_ktHandlesForKtChatStatus, obj);
  int64_t v6 = 0;
  self->_unint64_t ktChatState = v5;
  if (v5 - 1 <= 0xD) {
    int64_t v6 = qword_18F81C5F8[v5 - 1];
  }
  self->_ktEnhancedProtectionStatusCellState = v6;
  if (self->_groupPhotoHeaderViewController) {
    [(CKDetailsController *)self _configureGroupPhotoHeader];
  }
}

- (void)_handleKeyTransparencyStatusChangedNotification:(id)a3
{
  [(CKDetailsController *)self getKTStatus];
  id v4 = [(CKDetailsController *)self tableView];
  [v4 reloadData];
}

- (BOOL)shouldShowKeyTransparency
{
  return self->_ktEnhancedProtectionStatusCellState == 1;
}

- (void)_lastAddressedHandleUpdateNotification:(id)a3
{
  id v3 = [(CKDetailsController *)self tableView];
  [v3 reloadData];
}

- (void)_reloadForReadReceiptVisibilityChangeIfNeeded:(id)a3
{
  int v4 = [(CKDetailsController *)self wasShowingReadReceiptSwitch];
  unint64_t v5 = [(CKDetailsController *)self conversation];
  int64_t v6 = [v5 chat];
  int v7 = [v6 supportsSendingReadReceipts];

  if (v4 != v7)
  {
    id v8 = [(CKDetailsController *)self tableView];
    [v8 reloadData];
  }
}

- (void)_chatAutoDonatingHandleUpdateNotification:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CKDetailsController *)self conversation];
  id v11 = [v5 chat];

  id v6 = [v4 object];

  if (v6 != v11)
  {
    int v7 = [v11 deviceIndependentID];
    id v8 = [v6 deviceIndependentID];
    int v9 = [v7 isEqualToString:v8];

    if (!v9) {
      goto LABEL_5;
    }
    objc_msgSend(v11, "setAutoDonationBehavior:", objc_msgSend(v6, "autoDonationBehavior"));
  }
  id v10 = [(CKDetailsController *)self tableView];
  [v10 reloadData];

LABEL_5:
}

- (void)_handleAddressBookChanged:(id)a3
{
  id v4 = a3;
  id v7 = [(CKDetailsController *)self conversation];
  unint64_t v5 = [(CKDetailsController *)self _groupPhotoHeaderRequiredContactKeys];
  id v6 = objc_msgSend(v7, "conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:", v5, objc_msgSend(MEMORY[0x1E4F1BB38], "maxContactAvatars"));
  [(CNGroupIdentityHeaderViewController *)self->_groupPhotoHeaderViewController groupIdentityDidUpdate:v6];
  [(CKDetailsController *)self _chatAutoDonatingHandleUpdateNotification:v4];
}

- (void)_conversationListFinishedMerging:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(CKDetailsController *)self conversation];
  id v6 = +[CKConversationList sharedConversationList];
  id v7 = [v5 chat];
  id v8 = [v7 guid];
  int v9 = [v6 conversationForExistingChatWithGUID:v8];

  if (v9)
  {
    if (v5 != v9)
    {
      [(CKDetailsController *)self setConversation:v9];
      if (IMOSLoggingEnabled())
      {
        id v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v13 = 138412546;
          int v14 = v9;
          __int16 v15 = 2112;
          int v16 = v5;
          _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Conversation list performed re-merge, updating details view conversation to %@ from %@", (uint8_t *)&v13, 0x16u);
        }
      }
    }
  }
  else if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v13 = 138412290;
        int v14 = v5;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "CKDetailsController attempted to replace conversation after re-merge, but couldn't find a new conversation to replace %@", (uint8_t *)&v13, 0xCu);
      }
    }
    int64_t v12 = [(CKDetailsController *)self detailsControllerDelegate];
    [v12 dismissDetailsNavigationController];
  }
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  -[CKDetailsController setGroupPhotoHeaderHeight:](self, "setGroupPhotoHeaderHeight:", a3, -1.0);

  [(CKDetailsController *)self setSimLabelCellHeight:-1.0];
}

- (void)_handleGroupPhotoChanged:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    unint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      int v23 = self;
      __int16 v24 = 2112;
      id v25 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "IMChatGroupPhotoChangedNotification _handleGroupPhotoChanged called on details controller %@ with notification %@", buf, 0x16u);
    }
  }
  id v6 = [v4 object];
  id v7 = [v6 chatIdentifier];
  id v8 = [(CKDetailsController *)self conversation];
  int v9 = [v8 chat];
  id v10 = [v9 chatIdentifier];
  int v11 = [v7 isEqual:v10];

  if (v11)
  {
    int64_t v12 = [(CKDetailsController *)self conversation];
    int v13 = [v4 userInfo];
    int v14 = [v13 valueForKey:@"sender"];
    __int16 v15 = [(CKDetailsController *)self conversation];
    [v15 updateConversationVisualIdentityGroupPhotoWithSender:v14];

    if (self->_groupPhotoHeaderViewController)
    {
      int v16 = [(CKDetailsController *)self _groupPhotoHeaderRequiredContactKeys];
      uint64_t v17 = objc_msgSend(v12, "conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:", v16, objc_msgSend(MEMORY[0x1E4F1BB38], "maxContactAvatars"));
      [(CNGroupIdentityHeaderViewController *)self->_groupPhotoHeaderViewController groupIdentityDidUpdate:v17];
      if (!self->_groupPhotoCell)
      {
        unint64_t v21 = [CKGroupPhotoCell alloc];
        double v18 = +[CKGroupPhotoCell reuseIdentifier];
        double v19 = [(CKGroupPhotoCell *)v21 initWithStyle:0 reuseIdentifier:v18];
        groupPhotoCell = self->_groupPhotoCell;
        self->_groupPhotoCell = v19;
      }
      self->_needsContactsReload = 1;
    }
  }
}

- (void)_handleGroupDisplayNameChanged:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    unint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412546;
      uint64_t v17 = self;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "IMChatGroupDisplayNameChangedNotification _handleGroupDisplayNameChanged called on details controller %@ with notification %@", (uint8_t *)&v16, 0x16u);
    }
  }
  id v6 = [v4 object];
  id v7 = [(CKDetailsController *)self conversation];
  id v8 = [v7 chat];
  int v9 = [v6 isEqual:v8];

  if (v9)
  {
    id v10 = [v4 userInfo];
    int v11 = [v10 valueForKey:@"sender"];
    int64_t v12 = [(CKDetailsController *)self conversation];
    [v12 updateConversationVisualIdentityDisplayNameWithSender:v11];

    if (self->_groupPhotoHeaderViewController)
    {
      int v13 = [(CKDetailsController *)self _groupPhotoHeaderRequiredContactKeys];
      int v14 = [(CKDetailsController *)self conversation];
      __int16 v15 = objc_msgSend(v14, "conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:", v13, objc_msgSend(MEMORY[0x1E4F1BB38], "maxContactAvatars"));

      [(CNGroupIdentityHeaderViewController *)self->_groupPhotoHeaderViewController groupIdentityDidUpdate:v15];
    }
  }
}

- (void)_chatParticipantsChangedNotification:(id)a3
{
  id v6 = [(CKDetailsController *)self conversation];
  if ([v6 isGroupConversation] && self->_groupPhotoHeaderViewController)
  {
    [v6 setNeedsUpdatedContactOrderForVisualIdentity];
    id v4 = [(CKDetailsController *)self _groupPhotoHeaderRequiredContactKeys];
    unint64_t v5 = objc_msgSend(v6, "conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:", v4, objc_msgSend(MEMORY[0x1E4F1BB38], "maxContactAvatars"));
    [(CNGroupIdentityHeaderViewController *)self->_groupPhotoHeaderViewController groupIdentityDidUpdate:v5];
    self->_needsContactsReload = 1;
    [(CKDetailsController *)self _configureGroupPhotoHeader];
  }
}

- (id)locationFooterViewForSection:(int64_t)a3
{
  id v4 = [(CKDetailsController *)self tableView];
  uint64_t v5 = objc_opt_class();
  id v6 = +[CKDetailsLocationShareHeaderFooterView reuseIdentifier];
  [v4 registerClass:v5 forHeaderFooterViewReuseIdentifier:v6];

  id v7 = +[CKDetailsLocationShareHeaderFooterView reuseIdentifier];
  double v43 = v4;
  double v42 = [v4 dequeueReusableHeaderFooterViewWithIdentifier:v7];

  id v8 = [(CKDetailsController *)self locationSharingTextView];
  int v9 = [MEMORY[0x1E4F6BCB8] sharedInstance];
  id v10 = [v9 activeDevice];

  int v11 = NSString;
  int64_t v12 = CKFrameworkBundle();
  int v13 = [v12 localizedStringForKey:@"LOCATION_CURRENTLY_SHARING_FROM" value:&stru_1EDE4CA38 table:@"ChatKit"];
  int v14 = [v10 deviceName];
  __int16 v15 = objc_msgSend(v11, "stringWithFormat:", v13, v14);

  int v16 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v17 = [v16 userInterfaceLayoutDirection];

  if (v17 == 1) {
    __int16 v18 = @"\u200F";
  }
  else {
    __int16 v18 = @"\u200E";
  }
  id v19 = [(__CFString *)v18 stringByAppendingString:v15];

  uint64_t v20 = CKFrameworkBundle();
  unint64_t v21 = [v20 localizedStringForKey:@"LOCATION_SHARE_FROM_THIS_DEVICE" value:&stru_1EDE4CA38 table:@"ChatKit"];

  unsigned int v41 = v10;
  if ([(CKDetailsController *)self fmfRestricted]
    || CKIsRunningInMacCatalyst()
    || ([v10 isThisDevice] & 1) != 0)
  {
    id v22 = v19;
  }
  else
  {
    id v22 = [NSString stringWithFormat:@"%@ %@", v19, v21];
  }
  int v23 = v22;
  uint64_t v24 = [v22 rangeOfString:v21];
  uint64_t v39 = v25;
  uint64_t v40 = v24;
  uint64_t v26 = [v23 length];
  uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v23];
  uint64_t v28 = *MEMORY[0x1E4FB06F8];
  double v29 = +[CKUIBehavior sharedBehaviors];
  char v30 = [v29 headerFont];
  objc_msgSend(v27, "addAttribute:value:range:", v28, v30, 0, v26);

  uint64_t v31 = *MEMORY[0x1E4FB0700];
  id v32 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  objc_msgSend(v27, "addAttribute:value:range:", v31, v32, 0, v26);

  if (![(CKDetailsController *)self fmfRestricted] && !CKIsRunningInMacCatalyst())
  {
    CGRect v38 = +[CKUIBehavior sharedBehaviors];
    double v33 = [v38 theme];
    CGRect v34 = [v33 appTintColor];
    objc_msgSend(v27, "addAttribute:value:range:", v31, v34, v40, v39);

    uint64_t v35 = *MEMORY[0x1E4FB0720];
    CGRect v36 = [MEMORY[0x1E4F1CB10] URLWithString:&stru_1EDE4CA38];
    objc_msgSend(v27, "addAttribute:value:range:", v35, v36, v40, v39);

    objc_msgSend(v27, "addAttribute:value:range:", *MEMORY[0x1E4FB0808], MEMORY[0x1E4F1CC28], v40, v39);
  }
  [v8 setAttributedText:v27];
  [v8 setDelegate:self];
  [v42 setLocationSharingTextView:v8];

  return v42;
}

- (id)expanseActivityHeaderViewForSection:(int64_t)a3
{
  id v4 = [(CKDetailsController *)self tableView];
  uint64_t v5 = objc_opt_class();
  id v6 = +[CKDetailsExpanseActivityHeaderView reuseIdentifier];
  [v4 registerClass:v5 forHeaderFooterViewReuseIdentifier:v6];

  id v7 = +[CKDetailsExpanseActivityHeaderView reuseIdentifier];
  id v8 = [v4 dequeueReusableHeaderFooterViewWithIdentifier:v7];

  int v9 = [(CKDetailsController *)self expanseActivityTextView];
  [v8 setExpanseActivityTextView:v9];

  return v8;
}

- (id)businessInfoFooterViewForSection:(int64_t)a3
{
  id v4 = [(CKDetailsController *)self tableView];
  uint64_t v5 = objc_opt_class();
  id v6 = +[CKDetailsBusinessInfoHeaderFooterView reuseIdentifier];
  [v4 registerClass:v5 forHeaderFooterViewReuseIdentifier:v6];

  id v7 = +[CKDetailsBusinessInfoHeaderFooterView reuseIdentifier];
  id v8 = [v4 dequeueReusableHeaderFooterViewWithIdentifier:v7];

  int v9 = [(CKDetailsController *)self businessInfoView];
  id v10 = CKFrameworkBundle();
  int v11 = [v10 localizedStringForKey:@"BUSINESS_DESCRIPTION_IN_DETAILS" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v9 setDescriptionText:v11];

  [v8 setBusinessInfoView:v9];

  return v8;
}

- (id)sharedWithYouFooterView
{
  id v3 = [(CKDetailsController *)self tableView];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = +[CKDetailsSharedWithYouHeaderFooterView reuseIdentifier];
  [v3 registerClass:v4 forHeaderFooterViewReuseIdentifier:v5];

  id v6 = +[CKDetailsSharedWithYouHeaderFooterView reuseIdentifier];
  id v7 = [v3 dequeueReusableHeaderFooterViewWithIdentifier:v6];

  id v8 = [(CKDetailsController *)self sharedWithYouFooterTextView];
  [v7 setSharedWithYouTextView:v8];

  return v7;
}

- (id)downloadAttachmentsFooterViewForSection:(int64_t)a3
{
  uint64_t v4 = [(CKDetailsController *)self tableView];
  uint64_t v5 = objc_opt_class();
  id v6 = +[CKDetailsDownloadAttachmentsHeaderFooterView reuseIdentifier];
  [v4 registerClass:v5 forHeaderFooterViewReuseIdentifier:v6];

  id v7 = +[CKDetailsDownloadAttachmentsHeaderFooterView reuseIdentifier];
  id v8 = [v4 dequeueReusableHeaderFooterViewWithIdentifier:v7];

  [v8 setDelegate:self];

  return v8;
}

- (void)_updateDownloadFooterView
{
  id v11 = [(CKDetailsController *)self downloadAttachmentsText];
  id v3 = [(CKDetailsController *)self downloadButtonText];
  uint64_t v4 = [(CKDetailsController *)self downloadAttachmentsFooterView];
  [v4 setTitleText:v11];

  uint64_t v5 = [(CKDetailsController *)self downloadAttachmentsFooterView];
  [v5 setButtonText:v3];

  if ([(CKDetailsController *)self downloadButtonState] == 2)
  {
    id v6 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  }
  else
  {
    id v7 = +[CKUIBehavior sharedBehaviors];
    id v8 = [v7 theme];
    id v6 = [v8 appTintColor];
  }
  int v9 = [(CKDetailsController *)self downloadAttachmentsFooterView];
  [v9 setDownloadButtonTextColor:v6];

  id v10 = [(CKDetailsController *)self downloadAttachmentsFooterView];
  objc_msgSend(v10, "setLogoHidden:", -[CKDetailsController isDisplayingPhotos](self, "isDisplayingPhotos"));
}

- (id)expanseActivityCellForIndexPath:(id)a3
{
  uint64_t v4 = [(CKDetailsController *)self tableView];
  uint64_t v5 = objc_opt_class();
  id v6 = +[CKDetailsExpanseActivityCell reuseIdentifier];
  [v4 registerClass:v5 forCellReuseIdentifier:v6];

  id v7 = [CKDetailsExpanseActivityCell alloc];
  id v8 = +[CKDetailsExpanseActivityCell reuseIdentifier];
  int v9 = [(CKDetailsController *)self tuConversation];
  id v10 = [(CKDetailsExpanseActivityCell *)v7 initWithStyle:0 reuseIdentifier:v8 conversation:v9];

  return v10;
}

- (id)reuseIdentifierForCellInSection:(unint64_t)a3
{
  return &stru_1EDE4CA38;
}

- (id)leaveCellForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKDetailsController *)self tableView];
  [v5 registerClass:objc_opt_class() forCellReuseIdentifier:@"leaveCell_reuseIdentifier"];

  id v6 = [(CKDetailsController *)self tableView];
  id v7 = [v6 dequeueReusableCellWithIdentifier:@"leaveCell_reuseIdentifier" forIndexPath:v4];

  id v8 = [v7 textLabel];
  int v9 = CKFrameworkBundle();
  id v10 = [v9 localizedStringForKey:@"LEAVE_CONVERSATION" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v8 setText:v10];

  id v11 = [MEMORY[0x1E4F428B8] systemRedColor];
  [v8 setTextColor:v11];

  if ([(CKDetailsController *)self conversationHasLeft])
  {
    [v8 setEnabled:0];
  }
  else
  {
    int64_t v12 = [(CKDetailsController *)self conversation];
    objc_msgSend(v8, "setEnabled:", objc_msgSend(v12, "canLeave"));
  }
  [v8 setNumberOfLines:0];
  int v13 = +[CKUIBehavior sharedBehaviors];
  int v14 = [v13 isAccessibilityPreferredContentSizeCategory];

  if (v14)
  {
    LODWORD(v15) = 0.5;
    [v8 _setHyphenationFactor:v15];
  }
  int v16 = [v7 topSeperator];
  [v16 setHidden:1];

  uint64_t v17 = [v7 bottomSeperator];
  [v17 setHidden:1];

  return v7;
}

- (id)deleteAndBlockCellForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKDetailsController *)self tableView];
  [v5 registerClass:objc_opt_class() forCellReuseIdentifier:@"deleteAndBlockCell_reuseIdentifier"];

  id v6 = [(CKDetailsController *)self tableView];
  id v7 = [v6 dequeueReusableCellWithIdentifier:@"deleteAndBlockCell_reuseIdentifier" forIndexPath:v4];

  id v8 = [v7 textLabel];
  int v9 = CKFrameworkBundle();
  id v10 = [v9 localizedStringForKey:@"DELETE_AND_BLOCK_THIS_CONVERSATION" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v8 setText:v10];

  id v11 = [MEMORY[0x1E4F428B8] systemRedColor];
  [v8 setTextColor:v11];

  [v8 setEnabled:1];
  [v8 setNumberOfLines:0];
  int64_t v12 = +[CKUIBehavior sharedBehaviors];
  LODWORD(v10) = [v12 isAccessibilityPreferredContentSizeCategory];

  if (v10)
  {
    LODWORD(v13) = 0.5;
    [v8 _setHyphenationFactor:v13];
  }
  int v14 = [v7 topSeperator];
  [v14 setHidden:1];

  double v15 = [v7 bottomSeperator];
  [v15 setHidden:1];

  return v7;
}

- (id)simTypeCellForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKDetailsController *)self tableView];
  [v5 registerClass:objc_opt_class() forCellReuseIdentifier:@"CKDetailsSIM_reuseIdentifier"];

  id v6 = [(CKDetailsController *)self tableView];
  id v7 = [v6 dequeueReusableCellWithIdentifier:@"CKDetailsSIM_reuseIdentifier" forIndexPath:v4];

  id v8 = [v7 textLabel];
  [v8 setNumberOfLines:0];
  int v9 = +[CKUIBehavior sharedBehaviors];
  int v10 = [v9 isAccessibilityPreferredContentSizeCategory];

  if (v10)
  {
    LODWORD(v11) = 0.5;
    [v8 _setHyphenationFactor:v11];
  }
  int64_t v12 = [v7 bottomSeperator];
  [v12 setHidden:1];

  double v13 = [v7 topSeperator];
  [v13 setHidden:1];

  return v7;
}

- (id)groupPhotoCellForIndexPath:(id)a3
{
  groupPhotoCell = self->_groupPhotoCell;
  if (!groupPhotoCell)
  {
    [(CKDetailsController *)self _configureGroupPhotoHeader];
    [(CKDetailsController *)self addChildViewController:self->_groupPhotoHeaderViewController];
    groupPhotoCell = self->_groupPhotoCell;
  }

  return groupPhotoCell;
}

- (id)groupNameCellForIndexPath:(id)a3
{
  id v4 = [(CKDetailsController *)self groupNameCell];
  if (!v4)
  {
    uint64_t v5 = [(CKDetailsController *)self tableView];
    uint64_t v6 = objc_opt_class();
    id v7 = +[CKDetailsGroupNameCell reuseIdentifier];
    [v5 registerClass:v6 forCellReuseIdentifier:v7];

    id v8 = [CKDetailsGroupNameCell alloc];
    int v9 = -[CKDetailsGroupNameCell initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(CKDetailsController *)self setGroupNameCell:v9];
    int v10 = [(CKDetailsController *)self groupNameView];
    [(CKDetailsGroupNameCell *)v9 setGroupNameView:v10];
  }
  id v11 = [(CKDetailsController *)self groupNameView];
  int64_t v12 = [(CKDetailsController *)self tableView];
  uint64_t v13 = [(CKDetailsController *)self tableView:v12 numberOfRowsInSection:3];

  if (v13 > 0 || CKIsRunningInMacCatalyst())
  {
    int v14 = [(CKDetailsController *)self groupNameCell];
    double v15 = [v14 topSeperator];
    [v15 setHidden:1];
  }
  int v16 = [(CKDetailsController *)self groupNameCell];
  uint64_t v17 = [v16 bottomSeperator];
  [v17 setHidden:1];

  __int16 v18 = [(CKDetailsController *)self groupNameCell];

  return v18;
}

- (CKDetailsAddGroupNameView)groupNameView
{
  groupNameView = self->_groupNameView;
  if (!groupNameView)
  {
    id v4 = [CKDetailsAddGroupNameView alloc];
    uint64_t v5 = -[CKDetailsAddGroupNameView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v6 = self->_groupNameView;
    self->_groupNameView = v5;

    groupNameView = self->_groupNameView;
  }
  id v7 = [(CKDetailsController *)self conversation];
  id v8 = [v7 displayName];
  [(CKDetailsAddGroupNameView *)groupNameView setGroupName:v8];

  [(CKDetailsAddGroupNameView *)self->_groupNameView setEnabled:[(CKDetailsController *)self conversationHasLeft] ^ 1];
  [(CKDetailsAddGroupNameView *)self->_groupNameView setDelegate:self];
  int v9 = self->_groupNameView;

  return v9;
}

- (id)fmfViewControllerCellForIndexPath:(id)a3 shouldShowLocation:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 row])
  {
    id v7 = -[CKDetailsController locationShareCellForIndexPathRow:](self, "locationShareCellForIndexPathRow:", [v6 row] - 1);
    goto LABEL_41;
  }
  id v8 = [(CKDetailsController *)self tableView];
  uint64_t v9 = objc_opt_class();
  int v10 = +[CKDetailsMapViewCell reuseIdentifier];
  [v8 registerClass:v9 forCellReuseIdentifier:v10];

  id v11 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  LODWORD(v9) = [v11 isWaldoEnabled];

  if (v9)
  {
    id v12 = [(CKDetailsController *)self findMyWaldoMapViewController];
    if (!v12)
    {
      uint64_t v65 = 0;
      v66 = &v65;
      uint64_t v67 = 0x2050000000;
      uint64_t v13 = (void *)getFMUILocationDetailViewControllerClass_softClass;
      uint64_t v68 = getFMUILocationDetailViewControllerClass_softClass;
      if (!getFMUILocationDetailViewControllerClass_softClass)
      {
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        v70 = __getFMUILocationDetailViewControllerClass_block_invoke;
        v71 = &unk_1E5620B90;
        v72 = &v65;
        __getFMUILocationDetailViewControllerClass_block_invoke((uint64_t)&buf);
        uint64_t v13 = (void *)v66[3];
      }
      int v14 = v13;
      _Block_object_dispose(&v65, 8);
      double v15 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v65);
      int v16 = [(CKDetailsController *)self conversation];
      uint64_t v17 = [v16 chat];
      __int16 v18 = [v17 participants];
      id v19 = objc_msgSend(v18, "__imArrayByApplyingBlock:", &__block_literal_global_54);
      [v15 addObjectsFromArray:v19];

      id v12 = objc_alloc_init(v14);
      if (!v12) {
        goto LABEL_34;
      }
      if (objc_opt_respondsToSelector()) {
        [v12 setDelegate:self];
      }
      uint64_t v65 = 0;
      v66 = &v65;
      uint64_t v67 = 0x2050000000;
      uint64_t v20 = (void *)getFMUILocationDetailViewControllerViewOptionsClass_softClass;
      uint64_t v68 = getFMUILocationDetailViewControllerViewOptionsClass_softClass;
      if (!getFMUILocationDetailViewControllerViewOptionsClass_softClass)
      {
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        v70 = __getFMUILocationDetailViewControllerViewOptionsClass_block_invoke;
        v71 = &unk_1E5620B90;
        v72 = &v65;
        __getFMUILocationDetailViewControllerViewOptionsClass_block_invoke((uint64_t)&buf);
        uint64_t v20 = (void *)v66[3];
      }
      id v21 = v20;
      _Block_object_dispose(&v65, 8);
      if (v21
        && (objc_opt_respondsToSelector() & 1) != 0
        && ((objc_msgSend(v21, "messagesChatDetails", v65),
             id v22 = objc_claimAutoreleasedReturnValue(),
             (objc_opt_isKindOfClass() & 1) == 0)
          ? (int v23 = 0)
          : (int v23 = v22),
            id v24 = v23,
            v22,
            v24))
      {
        if (objc_opt_respondsToSelector()) {
          [v12 setViewOptions:v24];
        }
      }
      else
      {
        id v22 = 0;
      }
      if (objc_opt_respondsToSelector())
      {
        CGRect v34 = [(CKDetailsController *)self groupPhotoHeaderViewController];
        uint64_t v35 = [v34 displayNameForGroupIdentity];

        CGRect v36 = [(CKDetailsController *)self conversation];
        CGRect v37 = [v36 lastAddressedHandle];
        [v12 startObservingHandles:v15 callerHandle:v37 groupName:v35];
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
LABEL_32:
          -[CKDetailsController setFindMyWaldoMapViewController:](self, "setFindMyWaldoMapViewController:", v12, v65);
          [v12 willMoveToParentViewController:self];
          [(CKDetailsController *)self addChildViewController:v12];
          [v12 didMoveToParentViewController:self];
LABEL_33:

LABEL_34:
          goto LABEL_35;
        }
        uint64_t v35 = [(CKDetailsController *)self conversation];
        CGRect v36 = [v35 lastAddressedHandle];
        [v12 setRemoteParticipantHandles:v15 localParticipantHandle:v36];
      }

      goto LABEL_32;
    }
  }
  else
  {
    id v12 = [(CKDetailsController *)self mapViewController];
    if (!v12)
    {
      uint64_t v25 = (objc_class *)MEMORY[0x192FBA860](@"FMFMapViewController", @"FMFUI");
      uint64_t v26 = [(CKDetailsController *)self conversation];
      uint64_t v27 = [v26 chat];
      uint64_t v28 = [v27 participants];
      double v15 = [(CKDetailsController *)self fmfHandlesFromIMHandles:v28];

      id v12 = (id)[[v25 alloc] initSimpleMapWithDelegate:self handles:v15];
      double v29 = +[CKUIBehavior sharedBehaviors];
      char v30 = [v29 theme];
      uint64_t v31 = [v30 appTintColor];
      [v12 setAnnotationTintColor:v31];

      if (IMOSLoggingEnabled())
      {
        id v32 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = @"NO";
          _os_log_impl(&dword_18EF18000, v32, OS_LOG_TYPE_INFO, "Enable Map Controls? %@", (uint8_t *)&buf, 0xCu);
        }
      }
      double v33 = [v12 view];
      [v33 setUserInteractionEnabled:0];

      id v22 = [v12 mapView];
      [v22 setZoomEnabled:0];
      [v22 setScrollEnabled:0];
      [v22 setPitchEnabled:0];
      [v22 setRotateEnabled:0];
      [(CKDetailsController *)self setMapViewController:v12];
      [v12 willMoveToParentViewController:self];
      [(CKDetailsController *)self addChildViewController:v12];
      [v12 didMoveToParentViewController:self];
      goto LABEL_33;
    }
  }
LABEL_35:
  CGRect v38 = [v12 view];

  uint64_t v39 = [(CKDetailsController *)self mapViewCell];
  BOOL v40 = v39 == 0;

  if (v40)
  {
    unsigned int v41 = [(CKDetailsController *)self tableView];
    double v42 = +[CKDetailsMapViewCell reuseIdentifier];
    double v43 = [v41 dequeueReusableCellWithIdentifier:v42 forIndexPath:v6];
    [(CKDetailsController *)self setMapViewCell:v43];

    if (v4)
    {
      CGRect v44 = [(CKDetailsController *)self mapViewCell];
      [v44 setShouldShowLocationString:1];

      if (!self->_locationStringCell)
      {
        CGRect v45 = [(CKDetailsController *)self conversation];
        CGRect v46 = [v45 recipients];
        v47 = [v46 firstObject];

        v48 = [CKDetailsLocationStringCell alloc];
        double v49 = -[CKDetailsLocationStringCell initWithFrame:](v48, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        locationStringCell = self->_locationStringCell;
        self->_locationStringCell = v49;

        double v51 = self->_locationStringCell;
        double v52 = [(CKDetailsController *)self mapViewCell];
        id v53 = [v52 contentView];
        [v53 layoutMargins];
        [(CKDetailsLocationStringCell *)v51 setLayoutMargins:"setLayoutMargins:"];

        [(CKDetailsController *)self updateLocationForRecipient:v47];
        v54 = [(CKDetailsController *)self mapViewCell];
        [v54 setLocationStringView:self->_locationStringCell];
      }
    }
    CGRect v55 = [(CKDetailsController *)self mapViewCell];
    [v55 setMapView:v38];

    CGRect v56 = [(CKDetailsController *)self mapViewCell];
    CGRect v57 = [v56 contentView];
    CGRect v58 = [(CKDetailsController *)self mapViewCell];
    CGRect v59 = [v58 topSeperator];
    [v57 bringSubviewToFront:v59];

    CGRect v60 = [(CKDetailsController *)self mapViewCell];
    CGRect v61 = [v60 contentView];
    v62 = [(CKDetailsController *)self mapViewCell];
    v63 = [v62 bottomSeperator];
    [v61 bringSubviewToFront:v63];
  }
  id v7 = [(CKDetailsController *)self mapViewCell];

LABEL_41:

  return v7;
}

uint64_t __76__CKDetailsController_fmfViewControllerCellForIndexPath_shouldShowLocation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 ID];
}

- (void)initializeLocationSharingTextViewIfNecessary
{
  id v3 = [(CKDetailsController *)self locationSharingTextView];
  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42F58]);
    id v9 = (id)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v9 setEditable:0];
    uint64_t v5 = [v9 textContainer];
    [v5 setLineFragmentPadding:0.0];

    objc_msgSend(v9, "setTextContainerInset:", *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));
    [v9 setBackgroundColor:0];
    id v6 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    [v9 setTextColor:v6];

    [v9 setScrollEnabled:0];
    id v7 = +[CKUIBehavior sharedBehaviors];
    id v8 = [v7 headerFont];
    [v9 setFont:v8];

    [v9 setDelegate:self];
    [(CKDetailsController *)self setLocationSharingTextView:v9];
    id v3 = v9;
  }
}

- (void)initializeBusinessInfoViewIfNecessary
{
  id v3 = [(CKDetailsController *)self businessInfoView];
  if (!v3)
  {
    id v4 = [[CKBusinessInfoView alloc] initWithLayoutType:1];
    [(CKBusinessInfoView *)v4 setDelegate:self];
    [(CKDetailsController *)self setBusinessInfoView:v4];
    id v3 = v4;
  }
}

- (id)groupCountCellForIndexPath:(id)a3
{
  id v4 = a3;
  if ([(CKDetailsController *)self shouldShowGroupCount])
  {
    uint64_t v5 = [(CKDetailsController *)self tableView];
    uint64_t v6 = objc_opt_class();
    id v7 = +[CKDetailsGroupCountCell reuseIdentifier];
    [v5 registerClass:v6 forCellReuseIdentifier:v7];

    id v8 = [(CKDetailsController *)self tableView];
    id v9 = +[CKDetailsGroupCountCell reuseIdentifier];
    int v10 = [v8 dequeueReusableCellWithIdentifier:v9 forIndexPath:v4];

    id v11 = NSString;
    id v12 = CKFrameworkBundle();
    uint64_t v13 = [v12 localizedStringForKey:@"DETAILS_VIEW_GROUP_COUNT_TEXT" value:&stru_1EDE4CA38 table:@"ChatKit"];
    int v14 = [(CKDetailsController *)self contactsManager];
    double v15 = [v14 contactsViewModels];
    int v16 = objc_msgSend(v11, "localizedStringWithFormat:", v13, objc_msgSend(v15, "count"));

    uint64_t v17 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v18 = [v17 userInterfaceLayoutDirection];

    if (v18 == 1) {
      id v19 = @"\u200F";
    }
    else {
      id v19 = @"\u200E";
    }
    uint64_t v20 = [(__CFString *)v19 stringByAppendingString:v16];

    uint64_t v21 = [v20 length];
    id v22 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v20];
    uint64_t v23 = *MEMORY[0x1E4FB06F8];
    id v24 = +[CKUIBehavior sharedBehaviors];
    uint64_t v25 = [v24 headerFont];
    objc_msgSend(v22, "addAttribute:value:range:", v23, v25, 0, v21);

    uint64_t v26 = *MEMORY[0x1E4FB0700];
    uint64_t v27 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    objc_msgSend(v22, "addAttribute:value:range:", v26, v27, 0, v21);

    uint64_t v28 = [v10 textLabel];
    [v28 setAttributedText:v22];

    double v29 = [v10 topSeperator];
    [v29 setHidden:0];

    char v30 = [v10 bottomSeperator];
    [v30 setHidden:1];
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

- (id)contactsManagerCellForIndexPath:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 row];
  int64_t v6 = [(CKDetailsController *)self visibleContactsRows];
  BOOL v7 = [(CKDetailsController *)self isContactsSectionCollapsible];
  BOOL v8 = [(CKDetailsController *)self shouldAddToVisibleContactRowCountForTUConversation];
  if (v5 == [(CKDetailsController *)self rowForTUConversationCell])
  {
    uint64_t v9 = [(CKDetailsController *)self tuConversationCellForIndexPath:v4];
LABEL_5:
    uint64_t v13 = (void *)v9;
    goto LABEL_6;
  }
  if (v5 == [(CKDetailsController *)self rowForShowMoreContactsCell])
  {
    int v10 = [(CKDetailsController *)self tableView];
    uint64_t v11 = objc_opt_class();
    id v12 = +[CKDetailsGroupHeaderCell reuseIdentifier];
    [v10 registerClass:v11 forCellReuseIdentifier:v12];

    uint64_t v9 = [(CKDetailsController *)self groupHeaderCellForIndexPath:v4];
    goto LABEL_5;
  }
  if (v5 >= v6 + v7 + v8)
  {
    if (v5 == [(CKDetailsController *)self rowForAddMemberCell])
    {
      char v30 = [(CKDetailsController *)self tableView];
      uint64_t v31 = +[CKDetailsAddMemberCell cellClass];
      id v32 = +[CKDetailsAddMemberCell reuseIdentifier];
      [v30 registerClass:v31 forCellReuseIdentifier:v32];

      double v33 = [(CKDetailsController *)self tableView];
      CGRect v34 = +[CKDetailsAddMemberCell reuseIdentifier];
      uint64_t v13 = [v33 dequeueReusableCellWithIdentifier:v34 forIndexPath:v4];

      uint64_t v35 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      LODWORD(v34) = [v35 isCarrierPigeonEnabled];

      if (v34) {
        objc_msgSend(v13, "setEnabled:", -[CKDetailsController shouldEnableAddContactButton](self, "shouldEnableAddContactButton"));
      }
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    double v15 = [(CKDetailsController *)self tableView];
    int v16 = +[CKDetailsContactsTableViewCell cellClass];
    uint64_t v17 = +[CKDetailsContactsTableViewCell reuseIdentifier];
    [v15 registerClass:v16 forCellReuseIdentifier:v17];

    uint64_t v18 = [(CKDetailsController *)self tableView];
    id v19 = +[CKDetailsContactsTableViewCell reuseIdentifier];
    uint64_t v13 = [v18 dequeueReusableCellWithIdentifier:v19 forIndexPath:v4];

    int64_t v20 = [(CKDetailsController *)self adjustedViewModelIndexForIndexPath:v4];
    uint64_t v21 = [(CKDetailsController *)self contactsManager];
    id v22 = [v21 contactsViewModels];
    uint64_t v23 = [v22 objectAtIndex:v20];

    [v13 configureWithViewModel:v23];
    id v24 = [v13 contactAvatarView];
    [v24 setDelegate:self];
    [v24 setShowsContactOnTap:0];
    uint64_t v25 = [MEMORY[0x1E4F42948] currentDevice];
    int v26 = [v25 _supportsForceTouch];

    if (v26)
    {
      [v24 setForcePressView:v13];
      [v24 setUserInteractionEnabled:1];
      [v24 setShowsActionsOnForcePress:1];
    }
    uint64_t v27 = [(CKDetailsController *)self conversation];
    unsigned int v28 = [v27 shouldHaveRoundRectAvatar];

    [v24 setStyle:v28];
    [v13 setDelegate:self];
    if ([v4 row] == 1
      && [(CKDetailsController *)self hasTUConversation]
      && ![(CKDetailsController *)self isContactsSectionCollapsed])
    {
      double v29 = [v13 topSeperator];
      [v29 setHidden:1];
    }
  }
LABEL_6:
  [(CKDetailsController *)self _configureSeparatorForContactCell:v13 indexPath:v4];

  return v13;
}

- (id)tuConversationCellForIndexPath:(id)a3
{
  id v4 = [(CKDetailsController *)self tableView];
  uint64_t v5 = objc_opt_class();
  int64_t v6 = +[CKDetailsTUConversationCell reuseIdentifier];
  [v4 registerClass:v5 forCellReuseIdentifier:v6];

  BOOL v7 = [CKDetailsTUConversationCell alloc];
  BOOL v8 = +[CKDetailsTUConversationCell reuseIdentifier];
  uint64_t v9 = [(CKDetailsController *)self tuConversation];
  int v10 = [(CKDetailsTUConversationCell *)v7 initWithStyle:0 reuseIdentifier:v8 conversation:v9];

  return v10;
}

- (id)groupHeaderCellForIndexPath:(id)a3
{
  id v4 = [CKDetailsGroupHeaderCell alloc];
  uint64_t v5 = +[CKDetailsGroupHeaderCell reuseIdentifier];
  int64_t v6 = [(CKDetailsController *)self contactsManager];
  BOOL v7 = [v6 recipientsSortedByIsContact:1 alphabetically:0];
  BOOL v8 = [(CKDetailsGroupHeaderCell *)v4 initWithStyle:0 reuseIdentifier:v5 participants:v7];

  [(CKDetailsGroupHeaderCell *)v8 configureCellIconForCollapsedState:[(CKDetailsController *)self isContactsSectionCollapsed]];

  return v8;
}

- (id)indexPathForCell:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v19 = self;
  uint64_t v5 = [(CKDetailsController *)self tableView];
  int64_t v6 = [v5 visibleCells];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v13 = [v12 contentView];
        int v14 = [v13 subviews];
        int v15 = [v14 containsObject:v4];

        if (v15)
        {
          int v16 = [(CKDetailsController *)v19 tableView];
          uint64_t v17 = [v16 indexPathForCell:v12];

          uint64_t v9 = (void *)v17;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)contactsCellDidTapPhoneButton:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKDetailsController *)self tableView];
  id v20 = [v5 indexPathForCell:v4];

  int64_t v6 = [(CKDetailsController *)self conversation];
  LODWORD(v5) = [v6 isBusinessConversation];

  if (v5)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F6BBD0]);
    uint64_t v8 = [MEMORY[0x1E4F6BDC0] iMessageService];
    uint64_t v9 = (void *)[v7 initWithService:v8];

    uint64_t v10 = [(CKDetailsController *)self conversation];
    uint64_t v11 = [v10 businessHandle];
    id v12 = [v11 brand];
    uint64_t v13 = [v12 primaryPhoneNumber];

    if ([v13 length])
    {
      int v14 = (void *)[objc_alloc(MEMORY[0x1E4F6BCD8]) initWithAccount:v9 ID:v13 alreadyCanonical:1];
      int v15 = [[CKEntity alloc] initWithIMHandle:v14];
      int v16 = [(CKDetailsController *)self contactsManager];
      [v16 startCommunicationForEntity:v15 action:2 address:0];
    }
  }
  else
  {
    int64_t v17 = [(CKDetailsController *)self adjustedViewModelIndexForIndexPath:v20];
    uint64_t v18 = [(CKDetailsController *)self contactsManager];
    id v19 = [v18 contactsViewModels];
    uint64_t v9 = [v19 objectAtIndex:v17];

    uint64_t v13 = [(CKDetailsController *)self contactsManager];
    [v13 startCommunicationForViewModel:v9 action:2 address:0];
  }
}

- (void)contactsCellDidTapMessagesButton:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKDetailsController *)self tableView];
  id v11 = [v5 indexPathForCell:v4];

  int64_t v6 = [(CKDetailsController *)self adjustedViewModelIndexForIndexPath:v11];
  id v7 = [(CKDetailsController *)self contactsManager];
  uint64_t v8 = [v7 contactsViewModels];
  uint64_t v9 = [v8 objectAtIndex:v6];

  uint64_t v10 = [(CKDetailsController *)self contactsManager];
  [v10 startCommunicationForViewModel:v9 action:4 address:0];
}

- (void)contactsCellDidTapFaceTimeVideoButton:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKDetailsController *)self tableView];
  id v11 = [v5 indexPathForCell:v4];

  int64_t v6 = [(CKDetailsController *)self adjustedViewModelIndexForIndexPath:v11];
  id v7 = [(CKDetailsController *)self contactsManager];
  uint64_t v8 = [v7 contactsViewModels];
  uint64_t v9 = [v8 objectAtIndex:v6];

  uint64_t v10 = [(CKDetailsController *)self contactsManager];
  [v10 startCommunicationForViewModel:v9 action:0 address:0];
}

- (void)contactsCell:(id)a3 didHoverWithState:(int64_t)a4
{
  id v9 = a3;
  int64_t v6 = [(CKDetailsController *)self tableView];
  id v7 = [v6 visibleCells];
  if ([v7 containsObject:v9])
  {
    BOOL v8 = [(CKDetailsController *)self shouldShowGroupCount];

    if (v8)
    {
      if (a4 == 3)
      {
        [v9 _hideAllButtons];
      }
      else if (a4 == 1)
      {
        [v9 _updateVisibleButtons];
      }
    }
  }
  else
  {
  }
}

- (void)groupCellDidTapFaceTimeVideoButton:(id)a3
{
  if (CKIsRunningInMacCatalyst())
  {
    id v4 = [(CKDetailsController *)self contactsManager];
    [v4 beginFacetimeCallWithVideo:1];
  }
}

- (void)groupCellDidTapPhoneButton:(id)a3
{
  if (CKIsRunningInMacCatalyst())
  {
    id v4 = [(CKDetailsController *)self contactsManager];
    [v4 beginFacetimeCallWithVideo:0];
  }
}

- (void)_configureSeparatorForContactCell:(id)a3 indexPath:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 row];
  uint64_t v8 = [v6 section];

  id v9 = [(CKDetailsController *)self tableView];
  int64_t v10 = [(CKDetailsController *)self tableView:v9 numberOfRowsInSection:v8];

  if (v7)
  {
    if (v7 < 1) {
      goto LABEL_9;
    }
    if (v7 == [(CKDetailsController *)self rowForFirstContactCell])
    {
      id v11 = [v23 topSeperator];
      [v11 setHidden:1];
    }
    id v12 = [v23 bottomSeperator];
    [v12 setHidden:1];

    if (!CKIsRunningInMacCatalyst())
    {
      [v23 setIndentTopSeperator:1];
      goto LABEL_9;
    }
  }
  else
  {
    [v23 setIndentBottomSeperator:1];
    uint64_t v13 = [v23 bottomSeperator];
    [v13 setHidden:0];

    if (!CKIsRunningInMacCatalyst()) {
      goto LABEL_9;
    }
  }
  int v14 = [v23 topSeperator];
  [v14 setHidden:1];

LABEL_9:
  if ([(CKDetailsController *)self hasTUConversation])
  {
    if (v7 == [(CKDetailsController *)self rowForFirstContactCell])
    {
      int v15 = [v23 topSeperator];
      [v15 setHidden:1];
    }
    if (v7 == [(CKDetailsController *)self rowForShowMoreContactsCell])
    {
      int v16 = [v23 topSeperator];
      [v16 setHidden:1];

      int64_t v17 = [v23 bottomSeperator];
      [v17 setHidden:0];

      [v23 setIndentBottomSeperator:1];
    }
  }
  int64_t v18 = v10 - 1;
  if (v7 == v10 - 2)
  {
    id v19 = [v23 bottomSeperator];
    [v19 setHidden:0];

    [v23 setIndentBottomSeperator:1];
  }
  id v20 = v23;
  if (v7 == v18)
  {
    long long v21 = [v23 bottomSeperator];
    [v21 setHidden:1];

    if (!v7) {
      [v23 setIndentTopSeperator:0];
    }
    long long v22 = [v23 topSeperator];
    [v22 setHidden:1];

    id v20 = v23;
  }
}

- (void)_configureSeparatorForOptionCell:(id)a3 indexPath:(id)a4
{
  id v5 = a3;
  BOOL v6 = [a4 row] == 0;
  uint64_t v7 = [v5 topSeperator];
  [v7 setHidden:v6];

  id v8 = [v5 bottomSeperator];

  [v8 setHidden:1];
}

- (id)switchSubscriptionCellForIndexPathRow:(int64_t)a3
{
  id v4 = [(CKDetailsController *)self simSwitchCell];
  if (IMSharedHelperDeviceHasMultipleActiveSubscriptions())
  {
    id v5 = [(CKDetailsController *)self simSwitcherMenu];
    [v4 setMenu:v5];

    BOOL v6 = [(CKDetailsController *)self labelForChat];
    if ([v6 length])
    {
      uint64_t v7 = [v4 textLabel];
      id v8 = [(CKDetailsController *)self simCellText:v6];
      [v7 setText:v8];
    }
  }
  id v9 = [v4 bottomSeperator];
  [v9 setHidden:1];

  int64_t v10 = [v4 topSeperator];
  [v10 setHidden:1];

  return v4;
}

- (id)locationShareCellForIndexPathRow:(int64_t)a3
{
  id v5 = [(CKDetailsController *)self conversation];
  int64_t v6 = +[CKDetailsControllerLocationHelper cellTypeForRow:a3 conversation:v5 isFMFEnabled:[(CKDetailsController *)self fmfEnabled] shouldShowFMFView:[(CKDetailsController *)self shouldShowFMFView]];

  if (v6 == 2)
  {
    uint64_t v7 = [(CKDetailsController *)self _tableViewCellForSendCurrentLocation];
  }
  else if (v6 == 1)
  {
    uint64_t v7 = [(CKDetailsController *)self _tableViewCellForSharingLocation:[(CKDetailsController *)self allRecipientsAlreadyFollowingLocation]];
  }
  else if (v6)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [(CKDetailsController *)self _tableViewCellForSendOrRequestLocation];
  }

  return v7;
}

- (id)_tableViewCellForSendOrRequestLocation
{
  id v3 = [(CKDetailsController *)self locationSendOrRequestCell];
  id v4 = [v3 textLabel];
  id v5 = +[CKUIBehavior sharedBehaviors];
  int64_t v6 = [v5 theme];
  uint64_t v7 = [v6 detailsTextColor];
  [v4 setTextColor:v7];

  id v8 = [(CKDetailsController *)self conversation];
  id v9 = [v8 chat];
  uint64_t v10 = [v9 supportsCapabilities:4096];

  id v11 = [v3 textLabel];
  [v11 setEnabled:v10];

  [v3 setUserInteractionEnabled:v10];

  return v3;
}

- (id)_tableViewCellForSendCurrentLocation
{
  id v3 = [(CKDetailsController *)self sendCurrentLocationCell];
  id v4 = [v3 textLabel];
  id v5 = +[CKUIBehavior sharedBehaviors];
  int64_t v6 = [v5 theme];
  uint64_t v7 = [v6 detailsTextColor];
  [v4 setTextColor:v7];

  id v8 = [(CKDetailsController *)self conversation];
  id v9 = [v8 chat];
  uint64_t v10 = [v9 supportsCapabilities:4096];

  id v11 = [v3 textLabel];
  [v11 setEnabled:v10];

  [v3 setUserInteractionEnabled:v10];

  return v3;
}

- (id)_tableViewCellForSharingLocation:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CKDetailsController *)self locationShareCell];
  [v5 setShowOfferTimeRemaining:0];
  BOOL v6 = [(CKDetailsController *)self isGroupChat]
    || [(CKDetailsController *)self shouldShowFMFView];
  uint64_t v7 = [v5 topSeperator];
  [v7 setHidden:v6];

  [v5 setIndentTopSeperator:1];
  if (v3)
  {
    [v5 setMenu:0];
    id v8 = CKFrameworkBundle();
    id v9 = [v8 localizedStringForKey:@"STOP_SHARE_LOCATION" value:&stru_1EDE4CA38 table:@"ChatKit"];
    uint64_t v10 = [v5 textLabel];
    [v10 setText:v9];

    id v11 = [MEMORY[0x1E4F428B8] systemRedColor];
    id v12 = [v5 textLabel];
    [v12 setTextColor:v11];

    uint64_t v13 = [(CKDetailsController *)self _conversationOfferTimeExpiration];
    if (v13)
    {
      int v14 = [MEMORY[0x1E4F1C9C8] date];
      [v13 timeIntervalSinceDate:v14];
      double v16 = v15;

      int64_t v17 = [MEMORY[0x1E4F1C9C8] distantFuture];
      char v18 = [v13 isEqual:v17];

      if ((v18 & 1) == 0 && v16 > 0.0)
      {
        [v5 setShowOfferTimeRemaining:1];
        [v5 setOfferTimeRemaining:v16];
      }
    }
  }
  else
  {
    id v19 = [(CKDetailsController *)self locationShareMenu];
    [v5 setMenu:v19];

    id v20 = CKFrameworkBundle();
    long long v21 = [v20 localizedStringForKey:@"SHARE_LOCATION" value:&stru_1EDE4CA38 table:@"ChatKit"];
    long long v22 = [v5 textLabel];
    [v22 setText:v21];

    uint64_t v13 = +[CKUIBehavior sharedBehaviors];
    id v23 = [v13 theme];
    id v24 = [v23 detailsTextColor];
    uint64_t v25 = [v5 textLabel];
    [v25 setTextColor:v24];
  }
  if (CKIsRunningInMacCatalyst())
  {
    if ([(CKDetailsController *)self allRecipientsAlreadyFollowingLocation])
    {
      int v26 = [v5 bottomSeperator];
      [v26 setHidden:1];
    }
    [v5 setIndentBottomSeperator:1];
  }
  else
  {
    uint64_t v27 = [v5 bottomSeperator];
    [v27 setHidden:1];
  }
  unsigned int v28 = [(CKDetailsController *)self conversation];
  double v29 = [v28 chat];
  int v30 = [v29 supportsCapabilities:4096];

  if (v30) {
    uint64_t v31 = [(CKDetailsController *)self fmfRestricted] ^ 1;
  }
  else {
    uint64_t v31 = 0;
  }
  id v32 = [v5 textLabel];
  [v32 setEnabled:v31];

  [v5 setUserInteractionEnabled:v31];

  return v5;
}

- (id)_conversationOfferTimeExpiration
{
  BOOL v3 = [MEMORY[0x1E4F6BCB8] sharedInstance];
  id v4 = [(CKDetailsController *)self conversation];
  id v5 = [v4 chat];
  BOOL v6 = [v3 timedOfferExpirationForChat:v5];

  return v6;
}

- (CKDetailsSIMCell)simCell
{
  simCell = self->_simCell;
  if (!simCell)
  {
    id v4 = [(CKDetailsController *)self tableView];
    uint64_t v5 = objc_opt_class();
    BOOL v6 = +[CKDetailsSIMCell reuseIdentifier];
    [v4 registerClass:v5 forCellReuseIdentifier:v6];

    uint64_t v7 = [CKDetailsSIMCell alloc];
    id v8 = +[CKDetailsSIMCell reuseIdentifier];
    id v9 = [(CKDetailsSIMCell *)v7 initWithStyle:1 reuseIdentifier:v8];
    uint64_t v10 = self->_simCell;
    self->_simCell = v9;

    [(CKDetailsCell *)self->_simCell setIndentTopSeperator:1];
    simCell = self->_simCell;
  }

  return simCell;
}

- (CKDetailsLocationShareCell)locationShareCell
{
  locationShareCell = self->_locationShareCell;
  if (!locationShareCell)
  {
    id v4 = [(CKDetailsController *)self tableView];
    uint64_t v5 = objc_opt_class();
    BOOL v6 = +[CKDetailsLocationShareCell identifier];
    [v4 registerClass:v5 forCellReuseIdentifier:v6];

    uint64_t v7 = [CKDetailsLocationShareCell alloc];
    id v8 = +[CKDetailsLocationShareCell identifier];
    id v9 = [(CKDetailsLocationShareCell *)v7 initWithStyle:1 reuseIdentifier:v8];
    uint64_t v10 = self->_locationShareCell;
    self->_locationShareCell = v9;

    [(CKDetailsLocationShareCell *)self->_locationShareCell setShowOfferTimeRemaining:0];
    [(CKDetailsCell *)self->_locationShareCell setIndentTopSeperator:1];
    locationShareCell = self->_locationShareCell;
  }

  return locationShareCell;
}

- (CKDetailsSIMCell)simSwitchCell
{
  simSwitchCell = self->_simSwitchCell;
  if (!simSwitchCell)
  {
    id v4 = [(CKDetailsController *)self tableView];
    uint64_t v5 = objc_opt_class();
    BOOL v6 = +[CKDetailsSIMCell reuseIdentifier];
    [v4 registerClass:v5 forCellReuseIdentifier:v6];

    uint64_t v7 = [(CKDetailsController *)self conversation];
    id v8 = [v7 chat];
    id v9 = [v8 lastAddressedSIMID];

    uint64_t v10 = [(CKDetailsController *)self conversation];
    id v11 = [v10 chat];
    id v12 = [v11 lastAddressedHandleID];

    uint64_t v13 = [MEMORY[0x1E4F6E668] sharedInstance];
    int v14 = [v13 ctSubscriptionInfo];
    double v15 = objc_msgSend(v14, "__im_subscriptionContextForForSimID:phoneNumber:", v9, v12);

    if (v15)
    {
      double v16 = [CKDetailsSIMCell alloc];
      int64_t v17 = +[CKDetailsSIMCell reuseIdentifier];
      char v18 = [v15 label];
      id v19 = [(CKDetailsSIMCell *)v16 initWithStyle:0 reuseIdentifier:v17 simLabelText:v18];
      id v20 = self->_simSwitchCell;
      self->_simSwitchCell = v19;
    }
    else
    {
      long long v21 = [MEMORY[0x1E4F6E668] sharedInstance];
      int64_t v17 = [v21 ctSubscriptionInfo];

      long long v22 = [v17 preferredOrDefaultSubscriptionContext];
      char v18 = [v22 label];

      id v23 = [CKDetailsSIMCell alloc];
      id v20 = +[CKDetailsSIMCell reuseIdentifier];
      id v24 = [(CKDetailsSIMCell *)v23 initWithStyle:0 reuseIdentifier:v20 simLabelText:v18];
      uint64_t v25 = self->_simSwitchCell;
      self->_simSwitchCell = v24;
    }
    int v26 = [(CKDetailsSIMCell *)self->_simSwitchCell textLabel];
    uint64_t v27 = CKFrameworkBundle();
    unsigned int v28 = [v27 localizedStringForKey:@"DETAILS_VIEW_SWITCH_SIM_CELL" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v26 setText:v28];

    double v29 = [(CKDetailsCell *)self->_simSwitchCell topSeperator];
    [v29 setHidden:1];

    int v30 = [(CKDetailsCell *)self->_simSwitchCell bottomSeperator];
    [v30 setHidden:1];

    simSwitchCell = self->_simSwitchCell;
  }

  return simSwitchCell;
}

- (CKTranscriptDetailsResizableCell)locationSendOrRequestCell
{
  BOOL v3 = [(CKDetailsController *)self tableView];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = +[CKTranscriptDetailsResizableCell identifier];
  [v3 registerClass:v4 forCellReuseIdentifier:v5];

  BOOL v6 = [CKTranscriptDetailsResizableCell alloc];
  uint64_t v7 = +[CKTranscriptDetailsResizableCell identifier];
  id v8 = [(CKTranscriptDetailsResizableCell *)v6 initWithStyle:0 reuseIdentifier:v7];
  locationSendOrRequestCell = self->_locationSendOrRequestCell;
  self->_locationSendOrRequestCell = v8;

  uint64_t v10 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  LODWORD(v7) = [v10 isWaldoEnabled];

  id v11 = [(CKTranscriptDetailsResizableCell *)self->_locationSendOrRequestCell textLabel];
  id v12 = CKFrameworkBundle();
  uint64_t v13 = v12;
  if (v7) {
    int v14 = @"REQUEST_LOCATION";
  }
  else {
    int v14 = @"SEND_LOCATION";
  }
  double v15 = [v12 localizedStringForKey:v14 value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v11 setText:v15];

  double v16 = [(CKDetailsCell *)self->_locationSendOrRequestCell topSeperator];
  [v16 setHidden:1];

  int64_t v17 = [(CKDetailsCell *)self->_locationSendOrRequestCell bottomSeperator];
  [v17 setHidden:1];

  char v18 = self->_locationSendOrRequestCell;

  return v18;
}

- (CKTranscriptDetailsResizableCell)sendCurrentLocationCell
{
  BOOL v3 = [(CKDetailsController *)self tableView];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = +[CKTranscriptDetailsResizableCell identifier];
  [v3 registerClass:v4 forCellReuseIdentifier:v5];

  BOOL v6 = [CKTranscriptDetailsResizableCell alloc];
  uint64_t v7 = +[CKTranscriptDetailsResizableCell identifier];
  id v8 = [(CKTranscriptDetailsResizableCell *)v6 initWithStyle:0 reuseIdentifier:v7];
  sendCurrentLocationCell = self->_sendCurrentLocationCell;
  self->_sendCurrentLocationCell = v8;

  uint64_t v10 = [(CKTranscriptDetailsResizableCell *)self->_sendCurrentLocationCell textLabel];
  id v11 = CKFrameworkBundle();
  id v12 = [v11 localizedStringForKey:@"SEND_LOCATION" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v10 setText:v12];

  uint64_t v13 = [(CKDetailsCell *)self->_sendCurrentLocationCell topSeperator];
  [v13 setHidden:1];

  int v14 = [(CKDetailsCell *)self->_sendCurrentLocationCell bottomSeperator];
  [v14 setHidden:1];

  double v15 = self->_sendCurrentLocationCell;

  return v15;
}

- (CKTranscriptDetailsResizableCell)locationStartShareCell
{
  if (!self->_locationStartShareCell)
  {
    BOOL v3 = [(CKDetailsController *)self tableView];
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = +[CKTranscriptDetailsResizableCell identifier];
    [v3 registerClass:v4 forCellReuseIdentifier:v5];

    BOOL v6 = [CKTranscriptDetailsResizableCell alloc];
    uint64_t v7 = +[CKTranscriptDetailsResizableCell identifier];
    id v8 = [(CKTranscriptDetailsResizableCell *)v6 initWithStyle:0 reuseIdentifier:v7];
    locationStartShareCell = self->_locationStartShareCell;
    self->_locationStartShareCell = v8;

    uint64_t v10 = [(CKTranscriptDetailsResizableCell *)self->_locationStartShareCell textLabel];
    id v11 = CKFrameworkBundle();
    id v12 = [v11 localizedStringForKey:@"SHARE_LOCATION" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v10 setText:v12];

    [(CKDetailsCell *)self->_locationStartShareCell setIndentTopSeperator:1];
    int v13 = CKIsRunningInMacCatalyst();
    int v14 = self->_locationStartShareCell;
    if (v13)
    {
      [(CKDetailsCell *)v14 setIndentBottomSeperator:1];
    }
    else
    {
      double v15 = [(CKDetailsCell *)v14 bottomSeperator];
      [v15 setHidden:1];
    }
  }
  double v16 = self->_locationStartShareCell;

  return v16;
}

- (CKTranscriptDetailsResizableCell)openInContactsCell
{
  openInContactsCell = self->_openInContactsCell;
  if (!openInContactsCell)
  {
    uint64_t v4 = [(CKDetailsController *)self tableView];
    uint64_t v5 = objc_opt_class();
    BOOL v6 = +[CKTranscriptDetailsResizableCell identifier];
    [v4 registerClass:v5 forCellReuseIdentifier:v6];

    uint64_t v7 = [(CKDetailsCell *)self->_locationStartShareCell bottomSeperator];
    [v7 setHidden:1];

    id v8 = [CKTranscriptDetailsResizableCell alloc];
    id v9 = +[CKTranscriptDetailsResizableCell identifier];
    uint64_t v10 = [(CKTranscriptDetailsResizableCell *)v8 initWithStyle:0 reuseIdentifier:v9];
    id v11 = self->_openInContactsCell;
    self->_openInContactsCell = v10;

    id v12 = [(CKTranscriptDetailsResizableCell *)self->_openInContactsCell textLabel];
    int v13 = CKFrameworkBundle();
    int v14 = [v13 localizedStringForKey:@"OPEN_IN_CONTACTS" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v12 setText:v14];

    double v15 = [(CKTranscriptDetailsResizableCell *)self->_openInContactsCell textLabel];
    double v16 = +[CKUIBehavior sharedBehaviors];
    int64_t v17 = [v16 theme];
    char v18 = [v17 appTintColor];
    [v15 setTextColor:v18];

    id v19 = [(CKTranscriptDetailsResizableCell *)self->_openInContactsCell textLabel];
    [v19 setEnabled:1];

    openInContactsCell = self->_openInContactsCell;
  }

  return openInContactsCell;
}

- (CKDetailsCell)changeGroupNamePhotoCell
{
  if (!self->_changeGroupNamePhotoCell && !CKIsRunningInMacCatalyst())
  {
    BOOL v3 = [(CKDetailsController *)self tableView];
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = +[CKTranscriptDetailsResizableCell identifier];
    [v3 registerClass:v4 forCellReuseIdentifier:v5];

    BOOL v6 = [CKTranscriptDetailsResizableCell alloc];
    uint64_t v7 = +[CKTranscriptDetailsResizableCell identifier];
    id v8 = [(CKTranscriptDetailsResizableCell *)v6 initWithStyle:0 reuseIdentifier:v7];
    changeGroupNamePhotoCell = self->_changeGroupNamePhotoCell;
    self->_changeGroupNamePhotoCell = v8;

    uint64_t v10 = [(CKDetailsCell *)self->_changeGroupNamePhotoCell textLabel];
    id v11 = CKFrameworkBundle();
    id v12 = [v11 localizedStringForKey:@"CHANGE_GROUP_NAME_AND_PHOTO" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v10 setText:v12];

    int v13 = [(CKDetailsCell *)self->_changeGroupNamePhotoCell textLabel];
    int v14 = +[CKUIBehavior sharedBehaviors];
    double v15 = [v14 theme];
    double v16 = [v15 appTintColor];
    [v13 setTextColor:v16];

    int64_t v17 = [(CKDetailsCell *)self->_changeGroupNamePhotoCell textLabel];
    [v17 setEnabled:1];

    char v18 = [(CKDetailsCell *)self->_changeGroupNamePhotoCell bottomSeperator];
    [v18 setHidden:1];

    id v19 = [(CKDetailsCell *)self->_changeGroupNamePhotoCell topSeperator];
    [v19 setHidden:1];
  }
  id v20 = self->_changeGroupNamePhotoCell;

  return v20;
}

- (int64_t)_targetToggleIndexForOptionRow:(unint64_t)a3
{
  if (a3 == 2)
  {
    uint64_t v7 = [(CKDetailsController *)self conversation];
    id v8 = [v7 chat];
    int v9 = [v8 supportsSendingReadReceipts];

    if (v9) {
      return 2;
    }
    else {
      return 1;
    }
  }
  else if (a3 == 1)
  {
    BOOL v3 = [(CKDetailsController *)self conversation];
    uint64_t v4 = [v3 chat];
    unsigned int v5 = [v4 supportsSendingReadReceipts];

    return v5;
  }
  else
  {
    return 0;
  }
}

- (unint64_t)_optionRowForIndexPath:(id)a3
{
  unint64_t result = [a3 row];
  if (result)
  {
    if (result != 2)
    {
      if (result != 1) {
        return -1;
      }
      unsigned int v5 = [(CKDetailsController *)self conversation];
      BOOL v6 = [v5 chat];
      char v7 = [v6 supportsSendingReadReceipts];

      if (v7) {
        return 1;
      }
    }
    id v8 = [(CKDetailsController *)self canShareFocusStatus];
    char v9 = [v8 BOOLValue];

    if (v9) {
      return 2;
    }
    return -1;
  }
  return result;
}

- (id)chatOptionsCellForIndexPath:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CKDetailsController *)self tableView];
  uint64_t v6 = objc_opt_class();
  char v7 = +[CKDetailsChatOptionsCell reuseIdentifier];
  [v5 registerClass:v6 forCellReuseIdentifier:v7];

  unint64_t v8 = [(CKDetailsController *)self _optionRowForIndexPath:v4];
  switch(v8)
  {
    case 2uLL:
      int v13 = [(CKDetailsController *)self canShareFocusStatus];
      int v14 = [v13 BOOLValue];

      if (v14)
      {
        uint64_t v9 = [(CKDetailsController *)self createShareFocusStatusCellAtIndexPath:v4];
        goto LABEL_9;
      }
      goto LABEL_10;
    case 1uLL:
      uint64_t v10 = [(CKDetailsController *)self conversation];
      id v11 = [v10 chat];
      int v12 = [v11 supportsSendingReadReceipts];

      if (v12)
      {
        uint64_t v9 = [(CKDetailsController *)self createReadReceiptsCellAtIndexPath:v4];
        goto LABEL_9;
      }
LABEL_10:
      double v15 = 0;
      goto LABEL_11;
    case 0uLL:
      uint64_t v9 = [(CKDetailsController *)self createDNDCellAtIndexPath:v4];
LABEL_9:
      double v15 = (void *)v9;
LABEL_11:
      [(CKDetailsController *)self _configureSeparatorForOptionCell:v15 indexPath:v4];
      goto LABEL_13;
  }
  double v15 = 0;
LABEL_13:

  return v15;
}

- (id)createDNDCellAtIndexPath:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CKDetailsController *)self tableView];
  uint64_t v6 = +[CKDetailsChatOptionsCell reuseIdentifier];
  char v7 = [v5 dequeueReusableCellWithIdentifier:v6 forIndexPath:v4];

  unint64_t v8 = [v7 controlSwitch];
  uint64_t v9 = [v7 textLabel];
  uint64_t v10 = CKFrameworkBundle();
  id v11 = [v10 localizedStringForKey:@"DETAILS_VIEW_HIDE_ALERTS_TOGGLE_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v9 setText:v11];

  objc_msgSend(v9, "setEnabled:", -[CKDetailsController conversationHasLeft](self, "conversationHasLeft") ^ 1);
  [v8 addTarget:self action:sel_doNotDisturbValueChange_ forControlEvents:4096];
  objc_msgSend(v8, "setEnabled:", -[CKDetailsController conversationHasLeft](self, "conversationHasLeft") ^ 1);
  int v12 = [(CKDetailsController *)self conversation];
  objc_msgSend(v8, "setOn:animated:", objc_msgSend(v12, "isMuted"), 0);

  char v13 = 0;
  if (![(CKDetailsController *)self shouldShowEnhancedGroupFeatures])
  {
    int v14 = [(CKDetailsController *)self conversation];
    double v15 = [v14 chat];
    char v16 = [v15 supportsCapabilities:256];

    char v13 = v16 ^ 1;
  }
  if (CKIsRunningInMacCatalyst() && (v13 & 1) == 0)
  {
    int64_t v17 = [v7 bottomSeperator];
    [v17 setHidden:0];

    [v7 setIndentBottomSeperator:1];
  }

  return v7;
}

- (id)createReadReceiptsCellAtIndexPath:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CKDetailsController *)self tableView];
  uint64_t v6 = +[CKDetailsChatOptionsCell reuseIdentifier];
  char v7 = [v5 dequeueReusableCellWithIdentifier:v6 forIndexPath:v4];

  unint64_t v8 = [v7 controlSwitch];
  uint64_t v9 = [v7 textLabel];
  uint64_t v10 = CKFrameworkBundle();
  id v11 = [v10 localizedStringForKey:@"READ_RECEIPTS" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v9 setText:v11];

  [v8 addTarget:self action:sel_readReceiptsSwitchValueChanged_ forEvents:4096];
  int v12 = [(CKDetailsController *)self conversation];
  objc_msgSend(v8, "setOn:animated:", objc_msgSend(v12, "shouldSendReadReceipts"), 0);

  [v7 setIndentTopSeperator:1];

  return v7;
}

- (id)createShareFocusStatusCellAtIndexPath:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CKDetailsController *)self tableView];
  uint64_t v6 = +[CKDetailsChatOptionsCell reuseIdentifier];
  char v7 = [v5 dequeueReusableCellWithIdentifier:v6 forIndexPath:v4];

  unint64_t v8 = [v7 controlSwitch];
  uint64_t v9 = CKFrameworkBundle();
  uint64_t v10 = [v9 localizedStringForKey:@"SHARE_FOCUS_STATUS" value:&stru_1EDE4CA38 table:@"ChatKit"];

  id v11 = [v7 textLabel];
  [v11 setText:v10];
  [v8 addTarget:self action:sel_shareFocusStatusSwitchValueChanged_ forEvents:4096];
  int v12 = [(CKDetailsController *)self isSharingFocusStatus];
  [v8 setEnabled:v12 != 0];

  char v13 = [(CKDetailsController *)self isSharingFocusStatus];
  objc_msgSend(v8, "setOn:animated:", objc_msgSend(v13, "BOOLValue"), 0);

  [v7 setIndentTopSeperator:1];

  return v7;
}

- (id)sharedWithYouCellForIndexPath:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CKDetailsController *)self tableView];
  uint64_t v6 = objc_opt_class();
  char v7 = +[CKDetailsSharedWithYouCell reuseIdentifier];
  [v5 registerClass:v6 forCellReuseIdentifier:v7];

  unint64_t v8 = [(CKDetailsController *)self tableView];
  uint64_t v9 = +[CKDetailsSharedWithYouCell reuseIdentifier];
  uint64_t v10 = [v8 dequeueReusableCellWithIdentifier:v9 forIndexPath:v4];

  id v11 = [v10 controlSwitch];
  int v12 = [v10 textLabel];
  char v13 = CKFrameworkBundle();
  int v14 = [v13 localizedStringForKey:@"MARK_AS_AUTO_DONATING" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v12 setText:v14];

  double v15 = [v10 topSeperator];
  [v15 setHidden:1];

  char v16 = [v10 bottomSeperator];
  [v16 setHidden:1];

  [v11 addTarget:self action:sel_autoDonationSwitchValueChanged_ forEvents:4096];
  int64_t v17 = [(CKDetailsController *)self conversation];
  char v18 = [v17 chat];
  objc_msgSend(v11, "setOn:animated:", objc_msgSend(v18, "isAutoDonatingMessages"), 0);

  return v10;
}

- (id)editConversationCellForIndexPath:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CKDetailsController *)self tableView];
  uint64_t v6 = +[CKTranscriptDetailsResizableCell identifier];
  char v7 = [v5 dequeueReusableCellWithIdentifier:v6 forIndexPath:v4];

  unint64_t v8 = [v7 textLabel];
  uint64_t v9 = CKFrameworkBundle();
  uint64_t v10 = [v9 localizedStringForKey:@"EDIT_CONVERSATION" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v8 setText:v10];

  id v11 = [v7 textLabel];
  int v12 = +[CKUIBehavior sharedBehaviors];
  char v13 = [v12 theme];
  int v14 = [v13 appTintColor];
  [v11 setTextColor:v14];

  [v7 setIndentTopSeperator:1];

  return v7;
}

- (id)childViewController:(id)a3 cellForIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(CKDetailsController *)self tableView];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = +[CKDetailsChildViewControllerCell reuseIdentifier];
  [v8 registerClass:v9 forCellReuseIdentifier:v10];

  id v11 = [(CKDetailsController *)self tableView];
  int v12 = +[CKDetailsChildViewControllerCell reuseIdentifier];
  char v13 = [v11 dequeueReusableCellWithIdentifier:v12 forIndexPath:v6];

  int v14 = [(CKDetailsController *)self traitCollection];
  if ([v14 horizontalSizeClass] == 1)
  {
    BOOL v15 = 0;
  }
  else
  {
    char v16 = [MEMORY[0x1E4F42948] currentDevice];
    unint64_t v17 = [v16 orientation] - 1;

    if (v17 < 2)
    {
      BOOL v15 = 0;
      goto LABEL_7;
    }
    int v14 = [(CKDetailsController *)self traitCollection];
    BOOL v15 = [v14 verticalSizeClass] != 1;
  }

LABEL_7:
  [v13 setShouldUseLayoutMargins:v15];
  char v18 = [v7 view];

  [v13 setChildViewControllerView:v18];

  return v13;
}

- (void)initializeSearchController
{
  BOOL v3 = [(CKDetailsController *)self searchViewController];

  if (!v3)
  {
    id v4 = [CKDetailsSearchViewController alloc];
    unsigned int v5 = +[CKSpotlightQueryUtilities detailsSearchControllers];
    int v12 = [(CKDetailsSearchViewController *)v4 initWithSearchControllerClasses:v5];

    [(CKSearchViewController *)v12 setMode:3];
    id v6 = [(CKDetailsController *)self conversation];
    [(CKDetailsSearchViewController *)v12 setConversation:v6];

    [(CKDetailsSearchViewController *)v12 setDetailsDelegate:self];
    [(CKDetailsController *)self setSearchViewController:v12];
    id v7 = [(CKDetailsController *)self searchViewController];
    [v7 willMoveToParentViewController:self];

    unint64_t v8 = [(CKDetailsController *)self searchViewController];
    [(CKDetailsController *)self addChildViewController:v8];

    uint64_t v9 = [(CKDetailsController *)self searchViewController];
    [v9 searchWithText:&stru_1EDE4CA38];

    if (CKIsRunningInMacCatalyst())
    {
      uint64_t v10 = [(CKDetailsController *)self searchViewController];
      id v11 = [v10 view];
      [v11 layoutIfNeeded];
    }
  }
}

- (id)searchAttachmentViewControllerCellForIndexPath:(id)a3
{
  id v4 = a3;
  [(CKDetailsController *)self initializeSearchController];
  unsigned int v5 = [(CKDetailsController *)self searchViewController];
  id v6 = [(CKDetailsController *)self childViewController:v5 cellForIndexPath:v4];

  [v6 setShouldUseLayoutMargins:0];
  id v7 = [v6 topSeperator];
  [v7 setHidden:1];

  unint64_t v8 = [v6 bottomSeperator];
  [v8 setHidden:1];

  return v6;
}

- (void)detailsSearchControllerContentDidChange:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    unsigned int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "DISMISSED SIM switch menu", buf, 2u);
    }
  }
  id v6 = [(CKDetailsController *)self simSwitchCell];
  id v7 = [v6 button];
  unint64_t v8 = [v7 contextMenuInteraction];
  [v8 dismissMenu];

  uint64_t v9 = [(CKDetailsController *)self tableView];
  [v9 reloadData];

  dispatch_time_t v10 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__CKDetailsController_detailsSearchControllerContentDidChange___block_invoke;
  block[3] = &unk_1E5620C40;
  void block[4] = self;
  dispatch_after(v10, MEMORY[0x1E4F14428], block);
}

void __63__CKDetailsController_detailsSearchControllerContentDidChange___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableView];
  [v2 reloadData];

  BOOL v3 = [*(id *)(a1 + 32) tableView];
  [v3 setNeedsLayout];

  id v4 = [*(id *)(a1 + 32) tableView];
  [v4 layoutIfNeeded];
}

- (void)detailsSearchController:(id)a3 requestsPushOfSearchController:(id)a4
{
  id v5 = a4;
  id v6 = [(CKDetailsController *)self navigationController];
  [v6 pushViewController:v5 animated:1];
}

- (void)setupContactsManager
{
  BOOL v3 = [CKDetailsContactsManager alloc];
  id v4 = [(CKDetailsController *)self conversation];
  id v5 = [(CKDetailsContactsManager *)v3 initWithConversation:v4 delegate:self];

  [(CKDetailsController *)self setContactsManager:v5];
  [(CKDetailsController *)self setShouldCollapseContactsSection:1];
}

- (void)handleTapOnChromeAvatar:(id)a3
{
  id v4 = [(CKDetailsController *)self conversation];
  id v5 = [v4 recipients];
  id v7 = [v5 firstObject];

  id v6 = [(CKDetailsController *)self view];
  [(CKDetailsController *)self showContactCardForEntity:v7 fromView:v6];
}

- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = [(CKDetailsController *)self tableView];
  unint64_t v8 = [(CKDetailsController *)self tableView:v7 numberOfRowsInSection:3];

  if (v8)
  {
    uint64_t v9 = [(CKDetailsController *)self tableView];
    dispatch_time_t v10 = objc_msgSend(v9, "indexPathForRowAtPoint:", x, y);

    if ([v10 section] == 3
      && (id v11 = (objc_class *)MEMORY[0x192FBA860](@"FMFMapViewController", @"FMF")) != 0)
    {
      id v12 = [v11 alloc];
      char v13 = [(CKDetailsController *)self conversation];
      int v14 = [v13 chat];
      BOOL v15 = [v14 allSiblingFMFHandles];
      char v16 = (void *)[v12 initWithDelegate:self handles:v15];

      unint64_t v17 = +[CKUIBehavior sharedBehaviors];
      char v18 = [v17 theme];
      id v19 = [v18 appTintColor];
      [v16 setAnnotationTintColor:v19];

      unint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v16];
    }
    else
    {
      unint64_t v8 = 0;
    }
  }

  return v8;
}

- (void)previewingContext:(id)a3 commitViewController:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if (MEMORY[0x192FBA860](@"FMFMapViewController", @"FMF"))
    {
      uint64_t v9 = [v8 visibleViewController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v11 = [v8 visibleViewController];
        if (IMOSLoggingEnabled())
        {
          id v12 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            int v14 = 138412290;
            id v15 = v8;
            _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "navController: %@, clearing viewControllers", (uint8_t *)&v14, 0xCu);
          }
        }
        [v8 setViewControllers:MEMORY[0x1E4F1CBF0]];
        char v13 = [(CKDetailsController *)self navigationController];
        [v13 showViewController:v11 sender:0];
      }
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  id v12 = [(CKDetailsController *)self traitCollection];
  int v5 = [v12 hasDifferentColorAppearanceComparedToTraitCollection:v4];

  if (v5)
  {
    id v6 = [(CKDetailsController *)self simSwitchCell];

    if (!v6) {
      return;
    }
    id v7 = [(CKDetailsController *)self simSwitchCell];
    id v8 = [v7 button];
    uint64_t v9 = [v8 contextMenuInteraction];
    [v9 dismissMenu];

    id v12 = [(CKDetailsController *)self simSwitchCell];
    dispatch_time_t v10 = [v12 button];
    id v11 = [(CKDetailsController *)self simSwitcherMenu];
    [v10 setMenu:v11];
  }
}

- (id)simSwitcherMenu
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if ([(CKDetailsController *)self shouldShowSIMTypeSection])
  {
    val = self;
    BOOL v3 = [(CKDetailsController *)self conversation];
    id v4 = [v3 chat];
    uint64_t v31 = [v4 lastAddressedSIMID];

    int v5 = [(CKDetailsController *)val conversation];
    id v6 = [v5 chat];
    int v30 = [v6 lastAddressedHandleID];

    id v7 = [MEMORY[0x1E4F6E668] sharedInstance];
    id v8 = [v7 ctSubscriptionInfo];
    double v33 = objc_msgSend(v8, "__im_subscriptionContextForForSimID:phoneNumber:", v31, v30);

    uint64_t v9 = [MEMORY[0x1E4F6E668] sharedInstance];
    dispatch_time_t v10 = [v9 ctSubscriptionInfo];
    double v29 = [v10 subscriptions];

    id v11 = v29;
    if ([v29 count])
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id obj = v29;
      uint64_t v13 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v41 != v14) {
              objc_enumerationMutation(obj);
            }
            uint64_t v16 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            unint64_t v17 = CKFrameworkBundle();
            char v18 = [v16 label];
            id v19 = [v17 localizedStringForKey:v18 value:&stru_1EDE4CA38 table:@"ChatKit"];

            id location = 0;
            objc_initWeak(&location, val);
            id v20 = (void *)MEMORY[0x1E4F426E8];
            v35[0] = MEMORY[0x1E4F143A8];
            v35[1] = 3221225472;
            v35[2] = __38__CKDetailsController_simSwitcherMenu__block_invoke;
            v35[3] = &unk_1E5621240;
            id v21 = v33;
            id v36 = v21;
            CGRect v37 = v16;
            objc_copyWeak(&v38, &location);
            long long v22 = [v20 actionWithTitle:v19 image:0 identifier:0 handler:v35];
            objc_msgSend(v22, "setState:", objc_msgSend(v21, "isEqual:", v16));
            id v23 = CKLocalizedShortNameForContext(v16);
            id v24 = objc_msgSend(MEMORY[0x1E4F42A80], "__ck_actionImageForSubscriptionShortName:isFilled:", v23, 0);
            [v22 setImage:v24];

            [v12 addObject:v22];
            objc_destroyWeak(&v38);

            objc_destroyWeak(&location);
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
        }
        while (v13);
      }

      uint64_t v25 = (void *)MEMORY[0x1E4F42B80];
      int v26 = (void *)[v12 copy];
      uint64_t v27 = [v25 menuWithChildren:v26];

      id v11 = v29;
    }
    else
    {
      uint64_t v27 = 0;
    }
  }
  else
  {
    uint64_t v27 = 0;
  }

  return v27;
}

void __38__CKDetailsController_simSwitcherMenu__block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) isEqual:*(void *)(a1 + 40)];
  BOOL v3 = [MEMORY[0x1E4F6E890] sharedInstance];
  uint64_t v4 = *MEMORY[0x1E4F6D818];
  id v14 = v3;
  if (v2)
  {
    [v3 trackEvent:v4 withDictionary:&unk_1EDF17AA0];
  }
  else
  {
    [v3 trackEvent:v4 withDictionary:&unk_1EDF17A78];

    int v5 = (id *)(a1 + 48);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained switchSubscriptionToContext:*(void *)(a1 + 40)];

    id v7 = objc_loadWeakRetained((id *)(a1 + 48));
    id v8 = [v7 simSwitchCell];
    id v9 = objc_loadWeakRetained(v5);
    dispatch_time_t v10 = [v9 labelForChat];
    [v8 setSIMLabelText:v10];

    id v14 = objc_loadWeakRetained(v5);
    id v11 = [v14 simSwitchCell];
    id v12 = objc_loadWeakRetained(v5);
    uint64_t v13 = [v12 simSwitcherMenu];
    [v11 setMenu:v13];
  }
}

- (void)handleActiveDeviceChanged:(id)a3
{
  uint64_t v4 = [(CKDetailsController *)self locationSharingTextView];
  [v4 setDelegate:0];

  [(CKDetailsController *)self setLocationSharingTextView:0];
  id v5 = [(CKDetailsController *)self tableView];
  [v5 reloadData];
}

- (void)updateLocationStringCellWithString:(id)a3
{
  locationStringCell = self->_locationStringCell;
  if (locationStringCell) {
    [(CKDetailsLocationStringCell *)locationStringCell setLocationString:a3];
  }
}

- (BOOL)shouldShowExpanseFeatures
{
  char v2 = (void *)MEMORY[0x1E4F6BCC0];
  BOOL v3 = [(CKDetailsController *)self tuConversation];
  LOBYTE(v2) = [v2 activeTUConversationHasActivitySession:v3];

  return (char)v2;
}

- (int64_t)adjustedViewModelIndexForIndexPath:(id)a3
{
  id v4 = a3;
  if (CKIsRunningInMacCatalyst())
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v6 = [(CKDetailsController *)self conversation];
    id v7 = [v6 chat];
    unsigned int v8 = [v7 isBusinessChat];

    uint64_t v5 = v8 - 1;
  }
  uint64_t v9 = v5 - [(CKDetailsController *)self hasTUConversation];
  uint64_t v10 = [v4 row];

  return v9 + v10;
}

- (BOOL)shouldShowBusinessInfoFooter
{
  BOOL v3 = [(CKDetailsController *)self conversation];
  if ([v3 isBusinessConversation])
  {
    id v4 = [(CKDetailsController *)self conversation];
    int v5 = [v4 isMakoConversation] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)shouldShowKTSection
{
  int v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isKeyTransparencyEnabled];

  if (v6)
  {
    id v7 = [(CKDetailsController *)self conversation];
    unsigned int v8 = [v7 sendingService];
    uint64_t v9 = (void *)MEMORY[0x1E4F6E070];
    char v10 = [v8 supportsCapability:*MEMORY[0x1E4F6E070]];
    if ((v10 & 1) != 0
      || ([(CKDetailsController *)self conversation],
          char v2 = objc_claimAutoreleasedReturnValue(),
          [v2 chat],
          BOOL v3 = objc_claimAutoreleasedReturnValue(),
          [v3 hasMessageWithServiceCapability:*v9]))
    {
      id v11 = [(CKDetailsController *)self conversation];
      id v12 = [v11 chat];
      if ([v12 isBusinessChat]) {
        LOBYTE(v13) = 0;
      }
      else {
        BOOL v13 = ![(CKDetailsController *)self conversationHasLeft];
      }

      if (v10) {
        goto LABEL_12;
      }
    }
    else
    {
      LOBYTE(v13) = 0;
    }

LABEL_12:
    return v13;
  }
  LOBYTE(v13) = 0;
  return v13;
}

- (void)expandContactsSection
{
  v21[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CKDetailsController *)self tableView];
  uint64_t v4 = [v3 numberOfRowsInSection:6];

  if (v4
    && [(CKDetailsController *)self isContactsSectionCollapsible]
    && [(CKDetailsController *)self isContactsSectionCollapsed])
  {
    [(CKDetailsController *)self setIsContactsSectionCollapsed:0];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    int v6 = [(CKDetailsController *)self contactsManager];
    id v7 = [v6 contactsViewModels];
    uint64_t v8 = [v7 count];

    uint64_t v9 = v8 + [(CKDetailsController *)self shouldShowAddMemberCell];
    uint64_t v10 = v9 + [(CKDetailsController *)self hasTUConversation];
    BOOL v11 = [(CKDetailsController *)self hasTUConversation];
    if (v10 > v11)
    {
      uint64_t v12 = v11;
      do
      {
        BOOL v13 = [MEMORY[0x1E4F28D58] indexPathForRow:v12 inSection:6];
        [v5 addObject:v13];

        ++v12;
      }
      while (v12 < v10);
    }
    id v14 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:6];
    if ([(CKDetailsController *)self hasTUConversation])
    {
      uint64_t v15 = [MEMORY[0x1E4F28D58] indexPathForRow:1 inSection:6];

      id v14 = (void *)v15;
    }
    uint64_t v16 = [(CKDetailsController *)self tableView];
    [v16 beginUpdates];

    unint64_t v17 = [(CKDetailsController *)self tableView];
    [v17 insertRowsAtIndexPaths:v5 withRowAnimation:0];

    char v18 = [(CKDetailsController *)self tableView];
    v21[0] = v14;
    id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    [v18 reloadRowsAtIndexPaths:v19 withRowAnimation:0];

    id v20 = [(CKDetailsController *)self tableView];
    [v20 endUpdates];
  }
}

- (void)collapseContactsSection
{
  v18[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CKDetailsController *)self shouldShowAddMemberCell];
  [(CKDetailsController *)self setIsContactsSectionCollapsed:1];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = [(CKDetailsController *)self contactsManager];
  int v6 = [v5 contactsViewModels];
  uint64_t v7 = [v6 count];

  uint64_t v8 = v7 + v3 + [(CKDetailsController *)self hasTUConversation];
  BOOL v9 = [(CKDetailsController *)self hasTUConversation];
  if (v8 > v9)
  {
    uint64_t v10 = v9;
    do
    {
      BOOL v11 = [MEMORY[0x1E4F28D58] indexPathForRow:v10 inSection:6];
      [v4 addObject:v11];

      ++v10;
    }
    while (v10 < v8);
  }
  uint64_t v12 = [MEMORY[0x1E4F28D58] indexPathForRow:v8 inSection:6];
  BOOL v13 = [(CKDetailsController *)self tableView];
  [v13 beginUpdates];

  id v14 = [(CKDetailsController *)self tableView];
  [v14 deleteRowsAtIndexPaths:v4 withRowAnimation:0];

  uint64_t v15 = [(CKDetailsController *)self tableView];
  v18[0] = v12;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  [v15 reloadRowsAtIndexPaths:v16 withRowAnimation:0];

  unint64_t v17 = [(CKDetailsController *)self tableView];
  [v17 endUpdates];
}

- (void)presentGroupRecipientSelectionControllerAtIndexPath:(id)a3
{
  id v35 = a3;
  id v4 = [(CKDetailsController *)self conversation];
  id v5 = [[CKGroupRecipientSelectionController alloc] initWithConversation:v4];
  [(CKDetailsController *)self setAddRecipientsController:v5];
  if (CKIsRunningInMacCatalyst())
  {
    int v6 = [(CKDetailsController *)self tableView];
    uint64_t v7 = [v6 cellForRowAtIndexPath:v35];

    uint64_t v8 = +[CKUIBehavior sharedBehaviors];
    -[CKGroupRecipientSelectionController setModalPresentationStyle:](v5, "setModalPresentationStyle:", [v8 groupRecipientSelectionPresentationStyle]);

    BOOL v9 = [(CKGroupRecipientSelectionController *)v5 popoverPresentationController];
    [v9 setSourceView:v7];

    uint64_t v10 = +[CKUIBehavior sharedBehaviors];
    [v10 popOverWidthInDetailsView];
    double v12 = v11;
    BOOL v13 = +[CKUIBehavior sharedBehaviors];
    [v13 popOverMaxHeightInDetailsView];
    -[CKGroupRecipientSelectionController setPreferredContentSize:](v5, "setPreferredContentSize:", v12, v14);

    [(CKDetailsController *)self presentViewController:v5 animated:1 completion:0];
  }
  else
  {
    uint64_t v15 = [[CKNavigationController alloc] initWithRootViewController:v5];
    [(CKDetailsController *)self setGroupNavigationController:v15];

    uint64_t v16 = [(CKDetailsController *)self groupNavigationController];
    unint64_t v17 = [v16 navigationBar];
    char v18 = +[CKUIBehavior sharedBehaviors];
    id v19 = [v18 theme];
    objc_msgSend(v17, "setBarStyle:", objc_msgSend(v19, "navBarStyle"));

    if ([v4 hasDisplayName])
    {
      uint64_t v7 = [v4 displayName];
    }
    else
    {
      id v20 = CKFrameworkBundle();
      uint64_t v7 = [v20 localizedStringForKey:@"MADRID_GROUP" value:&stru_1EDE4CA38 table:@"ChatKit"];
    }
    [(CKGroupRecipientSelectionController *)v5 setTitle:v7];
    id v21 = [(CKDetailsController *)self groupNavigationController];
    long long v22 = +[CKUIBehavior sharedBehaviors];
    objc_msgSend(v21, "setModalPresentationStyle:", objc_msgSend(v22, "groupRecipientSelectionPresentationStyle"));

    id v23 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v24 = [v23 userInterfaceIdiom];

    if ((v24 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      uint64_t v25 = [(CKDetailsController *)self view];
      [v25 frame];
      double v27 = v26;
      unsigned int v28 = [(CKDetailsController *)self view];
      [v28 frame];
      -[CKDetailsController setPreferredContentSize:](self, "setPreferredContentSize:", v27, v29);
    }
    int v30 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:self action:sel_handleCancelAction_];
    uint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:self action:sel_handleDoneAction_];
    id v32 = [(CKGroupRecipientSelectionController *)v5 navigationItem];
    [v32 setLeftBarButtonItem:v30];

    double v33 = [(CKGroupRecipientSelectionController *)v5 navigationItem];
    [v33 setRightBarButtonItem:v31];

    [(CKGroupRecipientSelectionController *)v5 setDoneButton:v31];
    CGRect v34 = [(CKDetailsController *)self groupNavigationController];
    [(CKDetailsController *)self presentViewController:v34 animated:1 completion:0];
  }
}

- (void)handleDoneAction:(id)a3
{
  id v4 = a3;
  id v5 = [(CKDetailsController *)self addRecipientsController];
  int v6 = [v5 toField];
  uint64_t v7 = [v6 recipients];

  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
  id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v10 = [(CKDetailsController *)self conversation];
  double v11 = [v10 recipientStrings];
  double v12 = (void *)[v9 initWithArray:v11];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __40__CKDetailsController_handleDoneAction___block_invoke;
  v15[3] = &unk_1E56249C8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v12;
  id v13 = v12;
  id v14 = v8;
  [v7 enumerateObjectsUsingBlock:v15];
  [(CKDetailsController *)self _handleAddingHandles:v14 allRecipientsAddresses:v13 sender:v4];
}

void __40__CKDetailsController_handleDoneAction___block_invoke(id *a1, void *a2)
{
  id v7 = [a2 rawAddress];
  BOOL v3 = [a1[4] conversation];
  id v4 = [v3 chat];
  id v5 = [v4 account];
  int v6 = [v5 imHandleWithID:v7 alreadyCanonical:0];

  [a1[5] addObject:v6];
  [a1[6] addObject:v7];
}

- (void)handleCancelAction:(id)a3
{
  id v4 = [(CKDetailsController *)self addRecipientsController];
  [v4 stopCheckingRecipientAvailabilityAndRemoveAllTimers];
  [v4 invalidateOutstandingIDStatusRequests];
  [(CKDetailsController *)self dismissViewControllerAnimated:1 completion:0];
  [(CKDetailsController *)self setAddRecipientsController:0];
}

- (void)doNotDisturbValueChange:(id)a3
{
}

- (void)readReceiptsSwitchValueChanged:(id)a3
{
}

- (void)shareFocusStatusSwitchValueChanged:(id)a3
{
}

- (void)autoDonationSwitchValueChanged:(id)a3
{
}

- (void)toggleHideAlertsWithReload:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CKDetailsController *)self conversation];
  uint64_t v6 = [v5 isMuted] ^ 1;

  [(CKDetailsController *)self setHideAlerts:v6 reload:v3];
}

- (void)setHideAlerts:(BOOL)a3 reload:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = @"NO";
      if (v5) {
        uint64_t v8 = @"YES";
      }
      *(_DWORD *)long long buf = 138412290;
      id v17 = v8;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Set hideAlerts to %@", buf, 0xCu);
    }
  }
  id v9 = [(CKDetailsController *)self conversation];
  uint64_t v10 = v9;
  if (v5)
  {
    double v11 = [MEMORY[0x1E4F1C9C8] distantFuture];
    [v10 setMutedUntilDate:v11];
  }
  else
  {
    [v9 unmute];
  }

  if (v4)
  {
    double v12 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:9];
    id v13 = [(CKDetailsController *)self tableView];
    uint64_t v15 = v12;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    [v13 reloadRowsAtIndexPaths:v14 withRowAnimation:0];
  }
}

- (void)toggleSendReadReceiptsWithReload:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CKDetailsController *)self conversation];
  uint64_t v6 = [v5 shouldSendReadReceipts] ^ 1;

  [(CKDetailsController *)self setSendReadReceipts:v6 reload:v3];
}

- (void)setSendReadReceipts:(BOOL)a3 reload:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = [(CKDetailsController *)self conversation];
  uint64_t v8 = [v7 chat];
  char v9 = [v8 isSMS];

  if ((v9 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        double v11 = @"NO";
        if (v5) {
          double v11 = @"YES";
        }
        *(_DWORD *)long long buf = 138412290;
        uint64_t v18 = v11;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Set sendReadReceipts to %@", buf, 0xCu);
      }
    }
    double v12 = [(CKDetailsController *)self conversation];
    [v12 setSendReadReceipts:v5];

    if (v4)
    {
      id v13 = [MEMORY[0x1E4F28D58] indexPathForRow:1 inSection:9];
      id v14 = [(CKDetailsController *)self tableView];
      id v16 = v13;
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
      [v14 reloadRowsAtIndexPaths:v15 withRowAnimation:0];
    }
  }
}

- (void)toggleShareFocusStatusWithReload:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CKDetailsController *)self isSharingFocusStatus];
  uint64_t v6 = [v5 BOOLValue] ^ 1;

  [(CKDetailsController *)self setShareFocusStatus:v6 reload:v3];
}

- (void)setShareFocusStatus:(BOOL)a3 reload:(BOOL)a4
{
  BOOL v5 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = [(CKDetailsController *)self canShareFocusStatus];
  int v8 = [v7 BOOLValue];

  if (v8)
  {
    id location = 0;
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__CKDetailsController_setShareFocusStatus_reload___block_invoke;
    aBlock[3] = &unk_1E56249F0;
    BOOL v31 = a4;
    void aBlock[4] = self;
    objc_copyWeak(&v30, &location);
    char v9 = _Block_copy(aBlock);
    uint64_t v10 = [(CKDetailsController *)self conversation];
    double v11 = [v10 chat];

    double v12 = [v11 recipient];
    id v13 = [v12 normalizedID];

    if (v5)
    {
      id v14 = [v11 lastAddressedHandleID];
      if (IMOSLoggingEnabled())
      {
        uint64_t v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412546;
          CGRect v34 = v13;
          __int16 v35 = 2112;
          id v36 = v14;
          _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "User requested begin sharing focus status with handleID: %@ fromHandleID: %@", buf, 0x16u);
        }
      }
      id v16 = [MEMORY[0x1E4F6E600] sharedInstance];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      void v24[2] = __50__CKDetailsController_setShareFocusStatus_reload___block_invoke_446;
      v24[3] = &unk_1E5624A18;
      id v25 = v13;
      id v17 = v14;
      id v26 = v17;
      objc_copyWeak(&v28, &location);
      id v27 = v9;
      [v16 manuallyShareFocusStatusWithHandleID:v25 fromHandleID:v17 completion:v24];

      objc_destroyWeak(&v28);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          CGRect v34 = v13;
          _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "User requested end sharing focus status with handleID: %@", buf, 0xCu);
        }
      }
      uint64_t v19 = [MEMORY[0x1E4F6E600] sharedInstance];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __50__CKDetailsController_setShareFocusStatus_reload___block_invoke_448;
      v20[3] = &unk_1E5624A40;
      id v21 = v13;
      objc_copyWeak(&v23, &location);
      id v22 = v9;
      [v19 manuallyRemoveSharingOfFocusStatusWithHandleID:v21 completion:v20];

      objc_destroyWeak(&v23);
      id v17 = v21;
    }

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
}

void __50__CKDetailsController_setShareFocusStatus_reload___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    v1[0] = MEMORY[0x1E4F143A8];
    v1[1] = 3221225472;
    v1[2] = __50__CKDetailsController_setShareFocusStatus_reload___block_invoke_2;
    v1[3] = &unk_1E5623328;
    v1[4] = *(void *)(a1 + 32);
    objc_copyWeak(&v2, (id *)(a1 + 40));
    dispatch_async(MEMORY[0x1E4F14428], v1);
    objc_destroyWeak(&v2);
  }
}

void __50__CKDetailsController_setShareFocusStatus_reload___block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(*(id *)(a1 + 32), "_targetToggleIndexForOptionRow:", 2), 9);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v4 = [WeakRetained tableView];
  v6[0] = v2;
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [v4 reloadRowsAtIndexPaths:v5 withRowAnimation:0];
}

void __50__CKDetailsController_setShareFocusStatus_reload___block_invoke_446(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6 || (a3 & 1) == 0)
  {
    id WeakRetained = IMLogHandleForCategory();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
      __50__CKDetailsController_setShareFocusStatus_reload___block_invoke_446_cold_1();
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v9 = *(void *)(a1 + 40);
        int v11 = 138412546;
        uint64_t v12 = v8;
        __int16 v13 = 2112;
        uint64_t v14 = v9;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Successfully shared focus status with handleID: %@ fromHandleID: %@", (uint8_t *)&v11, 0x16u);
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained setIsSharingFocusStatus:MEMORY[0x1E4F1CC38]];
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __50__CKDetailsController_setShareFocusStatus_reload___block_invoke_448(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = IMLogHandleForCategory();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
      __50__CKDetailsController_setShareFocusStatus_reload___block_invoke_448_cold_1();
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        int v7 = 138412290;
        uint64_t v8 = v6;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Successfully manually unshared focus status with handleID: %@", (uint8_t *)&v7, 0xCu);
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained setIsSharingFocusStatus:MEMORY[0x1E4F1CC28]];
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)toggleShowInSharedWithYouWithReload:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CKDetailsController *)self conversation];
  uint64_t v6 = [v5 chat];
  uint64_t v7 = [v6 isAutoDonatingMessages] ^ 1;

  [(CKDetailsController *)self setShowInSharedWithYou:v7 reload:v3];
}

- (void)setShowInSharedWithYou:(BOOL)a3 reload:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v12[1] = *MEMORY[0x1E4F143B8];
  if ([(CKDetailsController *)self shouldShowSharedWithYouFeatures])
  {
    uint64_t v7 = [(CKDetailsController *)self conversation];
    uint64_t v8 = [v7 chat];
    [v8 sendAutoDonationUpdate:v5];

    if (v4)
    {
      uint64_t v9 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:8];
      uint64_t v10 = [(CKDetailsController *)self tableView];
      v12[0] = v9;
      int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
      [v10 reloadRowsAtIndexPaths:v11 withRowAnimation:0];
    }
  }
}

- (void)adjustContentOffsetReloadingSharedAssetsContentViewCell
{
  id v2 = [(CKDetailsController *)self tableView];
  [v2 reloadData];
}

- (void)contactsManagerViewModelsDidChange:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    BOOL v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = NSNumber;
      uint64_t v7 = [v4 contactsViewModels];
      uint64_t v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
      int v14 = 138412290;
      uint64_t v15 = v8;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "contacts view models changed, new model count:%@", (uint8_t *)&v14, 0xCu);
    }
  }
  if ([(CKDetailsController *)self shouldCollapseContactsSection])
  {
    [(CKDetailsController *)self setIsContactsSectionCollapsed:[(CKDetailsController *)self isContactsSectionCollapsible]];
    [(CKDetailsController *)self setShouldCollapseContactsSection:0];
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "DISMISSED SIM switch menu", (uint8_t *)&v14, 2u);
    }
  }
  uint64_t v10 = [(CKDetailsController *)self simSwitchCell];
  int v11 = [v10 button];
  uint64_t v12 = [v11 contextMenuInteraction];
  [v12 dismissMenu];

  __int16 v13 = [(CKDetailsController *)self tableView];
  [v13 reloadData];
}

- (void)_hideAllContactCellButtons
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v3 = [(CKDetailsController *)self tableView];
  id v4 = [v3 visibleCells];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
        uint64_t v10 = [(CKDetailsController *)self tableView];
        int v11 = [v10 indexPathForCell:v9];

        if ([v11 section] == 6)
        {
          if (CKIsRunningInMacCatalyst())
          {
            uint64_t v12 = [(CKDetailsController *)self conversation];
            int v13 = [v12 isGroupConversation];

            if (v13)
            {
              uint64_t v14 = [v11 row];
              if (v14 != [(CKDetailsController *)self rowForShowMoreContactsCell])
              {
                uint64_t v15 = [v11 row];
                if (v15 != [(CKDetailsController *)self rowForAddMemberCell])
                {
                  uint64_t v16 = [v11 row];
                  if (v16 != [(CKDetailsController *)self rowForTUConversationCell]) {
                    [v9 _hideAllButtons];
                  }
                }
              }
            }
          }
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
}

- (void)_presentRemoveRecipientSheetForHandle:(id)a3 fromView:(id)a4
{
  id v6 = a3;
  uint64_t v7 = NSString;
  id v35 = a4;
  uint64_t v8 = CKFrameworkBundle();
  uint64_t v9 = [v8 localizedStringForKey:@"REMOVE_DESCRIPTION" value:&stru_1EDE4CA38 table:@"ChatKit"];
  uint64_t v10 = [v6 fullName];
  int v11 = objc_msgSend(v7, "stringWithFormat:", v9, v10);

  uint64_t v12 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v13 = [v12 userInterfaceLayoutDirection];

  if (v13 == 1) {
    uint64_t v14 = @"\u200F";
  }
  else {
    uint64_t v14 = @"\u200E";
  }
  uint64_t v15 = [(__CFString *)v14 stringByAppendingString:v11];

  uint64_t v16 = +[CKAlertController alertControllerWithTitle:v15 message:0 preferredStyle:0];
  long long v17 = CKFrameworkBundle();
  long long v18 = [v17 localizedStringForKey:@"REMOVE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __70__CKDetailsController__presentRemoveRecipientSheetForHandle_fromView___block_invoke;
  v36[3] = &unk_1E56218C8;
  v36[4] = self;
  id v37 = v6;
  id v19 = v6;
  long long v20 = +[CKAlertAction actionWithTitle:v18 style:2 handler:v36];
  [v16 addAction:v20];

  id v21 = CKFrameworkBundle();
  uint64_t v22 = [v21 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
  id v23 = +[CKAlertAction actionWithTitle:v22 style:1 handler:0];
  [v16 addAction:v23];

  uint64_t v24 = [v16 popoverPresentationController];
  [v35 frame];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;

  objc_msgSend(v24, "setSourceRect:", v26, v28, v30, v32);
  double v33 = [v16 popoverPresentationController];
  CGRect v34 = [(CKDetailsController *)self view];
  [v33 setSourceView:v34];

  [v16 presentFromViewController:self animated:1 completion:0];
}

void __70__CKDetailsController__presentRemoveRecipientSheetForHandle_fromView___block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) conversation];
  v4[0] = *(void *)(a1 + 40);
  BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [v2 removeRecipientHandles:v3];
}

- (void)presentLeaveActionSheetFromView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CKFrameworkBundle();
  id v6 = [v5 localizedStringForKey:@"LEAVE_CONVERSATION" value:&stru_1EDE4CA38 table:@"ChatKit"];

  if (CKIsRunningInMacCatalyst())
  {
    uint64_t v7 = CKFrameworkBundle();
    uint64_t v8 = [v7 localizedStringForKey:@"LEAVE_CONVERSATION_CONFIRMATION" value:&stru_1EDE4CA38 table:@"ChatKit"];

    uint64_t v9 = CKFrameworkBundle();
    uint64_t v10 = [v9 localizedStringForKey:@"LEAVE_CONVERSATION_SHORT" value:&stru_1EDE4CA38 table:@"ChatKit"];

    id v6 = (void *)v10;
  }
  else
  {
    uint64_t v8 = 0;
  }
  int v11 = +[CKAlertController alertControllerWithTitle:0 message:v8 preferredStyle:CKIsRunningInMacCatalyst() != 0];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __55__CKDetailsController_presentLeaveActionSheetFromView___block_invoke;
  v26[3] = &unk_1E5621178;
  v26[4] = self;
  uint64_t v12 = +[CKAlertAction actionWithTitle:v6 style:2 handler:v26];
  [v11 addAction:v12];

  uint64_t v13 = CKFrameworkBundle();
  uint64_t v14 = [(id)v13 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
  uint64_t v15 = +[CKAlertAction actionWithTitle:v14 style:1 handler:0];
  [v11 addAction:v15];

  uint64_t v16 = self;
  long long v17 = [(CKDetailsController *)v16 detailsControllerDelegate];
  LOBYTE(v13) = objc_opt_respondsToSelector();

  if ((v13 & 1) == 0) {
    goto LABEL_9;
  }
  long long v18 = [(CKDetailsController *)v16 detailsControllerDelegate];
  uint64_t v19 = [v18 presentingViewControllerForGroupAlertsFromDetailsController:v16];
  long long v20 = (void *)v19;
  id v21 = v19 ? (CKDetailsController *)v19 : v16;
  uint64_t v22 = v21;

  if (v22 == v16)
  {
LABEL_9:
    id v23 = [v11 popoverPresentationController];
    [v4 frame];
    objc_msgSend(v23, "setSourceRect:");

    uint64_t v24 = [v11 popoverPresentationController];
    double v25 = [(CKDetailsController *)v16 view];
    [v24 setSourceView:v25];

    uint64_t v22 = v16;
  }
  [v11 presentFromViewController:v22 animated:1 completion:0];
}

void __55__CKDetailsController_presentLeaveActionSheetFromView___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) conversation];
  BOOL v3 = [v2 chat];
  [v3 leave];

  id v4 = [*(id *)(a1 + 32) conversation];
  uint64_t v5 = [v4 chat];
  int v6 = [v5 hasRecipientsFollowingLocation];

  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F42728];
    uint64_t v8 = CKFrameworkBundle();
    uint64_t v9 = [v8 localizedStringForKey:@"STOP_SHARING_ON_DELETE_OR_LEAVE_BODY" value:&stru_1EDE4CA38 table:@"ChatKit"];
    uint64_t v10 = [v7 alertControllerWithTitle:0 message:v9 preferredStyle:1];

    int v11 = CKFrameworkBundle();
    uint64_t v12 = [v11 localizedStringForKey:@"YES" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __55__CKDetailsController_presentLeaveActionSheetFromView___block_invoke_2;
    v18[3] = &unk_1E5621178;
    v18[4] = *(void *)(a1 + 32);
    uint64_t v13 = +[CKAlertAction actionWithTitle:v12 style:0 handler:v18];
    [v10 addAction:v13];

    uint64_t v14 = CKFrameworkBundle();
    uint64_t v15 = [v14 localizedStringForKey:@"NO" value:&stru_1EDE4CA38 table:@"ChatKit"];
    uint64_t v16 = +[CKAlertAction actionWithTitle:v15 style:1 handler:0];
    [v10 addAction:v16];

    [*(id *)(a1 + 32) presentViewController:v10 animated:1 completion:0];
  }
  long long v17 = [*(id *)(a1 + 32) tableView];
  [v17 reloadData];
}

void __55__CKDetailsController_presentLeaveActionSheetFromView___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) conversation];
  id v1 = [v2 chat];
  [v1 stopSharingLocation];
}

- (void)presentDeleteAndBlockActionSheetFromView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CKFrameworkBundle();
  int v6 = [v5 localizedStringForKey:@"DELETE_AND_BLOCK_CONVERSATION" value:&stru_1EDE4CA38 table:@"ChatKit"];

  if (CKIsRunningInMacCatalyst())
  {
    uint64_t v7 = CKFrameworkBundle();
    uint64_t v8 = [v7 localizedStringForKey:@"DELETE_AND_BLOCK_CONVERSATION_TITLE_CATALYST" value:&stru_1EDE4CA38 table:@"ChatKit"];

    uint64_t v9 = CKFrameworkBundle();
    uint64_t v10 = [v9 localizedStringForKey:@"DELETE_AND_BLOCK_CONVERSATION_DESCRIPTION_CATALYST" value:&stru_1EDE4CA38 table:@"ChatKit"];

    int v11 = CKFrameworkBundle();
    uint64_t v12 = [v11 localizedStringForKey:@"DELETE_AND_BLOCK_CONVERSATION_SHORT" value:&stru_1EDE4CA38 table:@"ChatKit"];

    int v6 = (void *)v12;
  }
  else
  {
    int v13 = [MEMORY[0x1E4F6EA38] isFilterUnknownSendersEnabled];
    uint64_t v14 = CKFrameworkBundle();
    int v11 = v14;
    if (v13) {
      uint64_t v15 = @"DELETE_AND_BLOCK_CONVERSATION_DESCRIPTION_FILTERS";
    }
    else {
      uint64_t v15 = @"DELETE_AND_BLOCK_CONVERSATION_DESCRIPTION_EDIT";
    }
    uint64_t v10 = [v14 localizedStringForKey:v15 value:&stru_1EDE4CA38 table:@"ChatKit"];
    uint64_t v8 = 0;
  }

  uint64_t v16 = +[CKAlertController alertControllerWithTitle:v8 message:v10 preferredStyle:CKIsRunningInMacCatalyst() != 0];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __64__CKDetailsController_presentDeleteAndBlockActionSheetFromView___block_invoke;
  v31[3] = &unk_1E5621178;
  void v31[4] = self;
  long long v17 = +[CKAlertAction actionWithTitle:v6 style:2 handler:v31];
  [v16 addAction:v17];

  uint64_t v18 = CKFrameworkBundle();
  uint64_t v19 = [(id)v18 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
  long long v20 = +[CKAlertAction actionWithTitle:v19 style:1 handler:0];
  [v16 addAction:v20];

  id v21 = self;
  uint64_t v22 = [(CKDetailsController *)v21 detailsControllerDelegate];
  LOBYTE(v18) = objc_opt_respondsToSelector();

  if ((v18 & 1) == 0) {
    goto LABEL_12;
  }
  id v23 = [(CKDetailsController *)v21 detailsControllerDelegate];
  uint64_t v24 = [v23 presentingViewControllerForGroupAlertsFromDetailsController:v21];
  double v25 = (void *)v24;
  double v26 = v24 ? (CKDetailsController *)v24 : v21;
  double v27 = v26;

  if (v27 == v21)
  {
LABEL_12:
    double v28 = [v16 popoverPresentationController];
    [v4 frame];
    objc_msgSend(v28, "setSourceRect:");

    double v29 = [v16 popoverPresentationController];
    double v30 = [(CKDetailsController *)v21 view];
    [v29 setSourceView:v30];

    double v27 = v21;
  }
  [v16 presentFromViewController:v27 animated:1 completion:0];
}

void __64__CKDetailsController_presentDeleteAndBlockActionSheetFromView___block_invoke(uint64_t a1)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) conversation];
  BOOL v3 = [v2 chat];
  int v4 = [v3 hasRecipientsFollowingLocation];

  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F42728];
    int v6 = CKFrameworkBundle();
    uint64_t v7 = [v6 localizedStringForKey:@"STOP_SHARING_ON_DELETE_OR_LEAVE_BODY" value:&stru_1EDE4CA38 table:@"ChatKit"];
    uint64_t v8 = [v5 alertControllerWithTitle:0 message:v7 preferredStyle:1];

    uint64_t v9 = CKFrameworkBundle();
    uint64_t v10 = [v9 localizedStringForKey:@"YES" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __64__CKDetailsController_presentDeleteAndBlockActionSheetFromView___block_invoke_2;
    v22[3] = &unk_1E5621178;
    v22[4] = *(void *)(a1 + 32);
    int v11 = +[CKAlertAction actionWithTitle:v10 style:0 handler:v22];
    [v8 addAction:v11];

    uint64_t v12 = CKFrameworkBundle();
    int v13 = [v12 localizedStringForKey:@"NO" value:&stru_1EDE4CA38 table:@"ChatKit"];
    uint64_t v14 = +[CKAlertAction actionWithTitle:v13 style:1 handler:0];
    [v8 addAction:v14];

    [*(id *)(a1 + 32) presentViewController:v8 animated:1 completion:0];
  }
  uint64_t v15 = [*(id *)(a1 + 32) conversation];
  uint64_t v16 = [v15 chat];
  [v16 setDeletingIncomingMessages:1];

  long long v17 = +[CKConversationList sharedConversationList];
  uint64_t v18 = [*(id *)(a1 + 32) conversation];
  v23[0] = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  long long v20 = [MEMORY[0x1E4F1C9C8] now];
  [v17 recoverableDeleteForConversations:v19 deleteDate:v20 synchronousQuery:0 completionHandler:0];

  id v21 = [*(id *)(a1 + 32) detailsControllerDelegate];
  [v21 dismissDetailsViewAndShowConversationList];
}

void __64__CKDetailsController_presentDeleteAndBlockActionSheetFromView___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) conversation];
  id v1 = [v2 chat];
  [v1 stopSharingLocation];
}

- (void)detailsAddGroupNameView:(id)a3 didCommitGroupName:(id)a4
{
  id v5 = a4;
  id v6 = [(CKDetailsController *)self conversation];
  [v6 setDisplayName:v5];
}

- (id)avatarView:(id)a3 orderedPropertiesForProperties:(id)a4 category:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v7 = a4;
  if ([a5 isEqualToString:*MEMORY[0x1E4F1BAF8]])
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v26 = v7;
    id obj = v7;
    uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v31;
      uint64_t v12 = *MEMORY[0x1E4F1ADC8];
      uint64_t v27 = *MEMORY[0x1E4F1AEE0];
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          uint64_t v15 = objc_msgSend(v14, "key", v26);
          int v16 = [v15 isEqualToString:v12];

          if (v16)
          {
            long long v17 = [v14 value];
          }
          else
          {
            uint64_t v18 = [v14 key];
            int v19 = [v18 isEqualToString:v27];

            if (v19)
            {
              long long v20 = [v14 value];
              long long v17 = [v20 stringValue];
            }
            else
            {
              long long v17 = 0;
            }
          }
          id v21 = IMStripFormattingFromAddress();

          uint64_t v22 = [v29 preferredHandle];
          id v23 = IMStripFormattingFromAddress();
          int v24 = MEMORY[0x192FBAF60](v21, v23);

          if (v24) {
            [v8 insertObject:v14 atIndex:0];
          }
          else {
            [v8 addObject:v14];
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v10);
    }

    id v7 = v26;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (CNContactStore)suggestionsEnabledContactStore
{
  suggestionsEnabledContactStore = self->_suggestionsEnabledContactStore;
  if (!suggestionsEnabledContactStore)
  {
    int v4 = (void *)MEMORY[0x1E4F1B980];
    if ([MEMORY[0x1E4F1B8F8] suggestionsEnabled]) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = 1;
    }
    id v6 = [v4 storeWithOptions:v5];
    id v7 = self->_suggestionsEnabledContactStore;
    self->_suggestionsEnabledContactStore = v6;

    suggestionsEnabledContactStore = self->_suggestionsEnabledContactStore;
  }

  return suggestionsEnabledContactStore;
}

- (CGSize)screenSize
{
  id v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  double v4 = [(CKDetailsController *)self groupNameCell];
  double v5 = [v4 groupNameView];
  [v5 commitGroupName];

  if (CKIsRunningInMacCatalyst())
  {
    [(CKDetailsController *)self _hideAllContactCellButtons];
  }
}

- (void)presentFullFMFMapViewController
{
  double v3 = (objc_class *)MEMORY[0x192FBA860](@"FMFMapViewController", @"FMF");
  if (v3)
  {
    id v4 = [v3 alloc];
    double v5 = [(CKDetailsController *)self conversation];
    double v6 = [v5 chat];
    double v7 = [v6 allSiblingFMFHandles];
    id v12 = (id)[v4 initWithDelegate:self handles:v7];

    double v8 = +[CKUIBehavior sharedBehaviors];
    uint64_t v9 = [v8 theme];
    uint64_t v10 = [v9 appTintColor];
    [v12 setAnnotationTintColor:v10];

    uint64_t v11 = [(CKDetailsController *)self navigationController];
    [v11 pushViewController:v12 animated:1];
  }
}

- (id)fmfHandlesFromIMHandles:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v35;
    uint64_t v26 = *(void *)v35;
    uint64_t v27 = v4;
    do
    {
      uint64_t v8 = 0;
      uint64_t v28 = v6;
      do
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v34 + 1) + 8 * v8);
        uint64_t v10 = objc_msgSend(MEMORY[0x1E4F6BCB8], "sharedInstance", v26);
        uint64_t v11 = [v10 findMyLocationForHandleOrSibling:v9];
        id v12 = [v11 fmfLocation];

        if (v12)
        {
          int v13 = [v12 location];

          if (v13)
          {
            uint64_t v14 = [v12 handle];
LABEL_10:
            [v4 addObject:v14];
            goto LABEL_22;
          }
        }
        uint64_t v14 = [v9 findMyHandle];
        uint64_t v15 = [MEMORY[0x1E4F6BCB8] sharedInstance];
        int v16 = [v15 findMyHandleIsSharingLocationWithMe:v14];

        if (v16) {
          goto LABEL_10;
        }
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v17 = [v9 findMySiblingHandles];
        uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v31;
          while (2)
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v31 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = *(void *)(*((void *)&v30 + 1) + 8 * i);
              id v23 = [MEMORY[0x1E4F6BCB8] sharedInstance];
              int v24 = [v23 findMyHandleIsSharingLocationWithMe:v22];

              if (v24)
              {
                id v4 = v27;
                [v27 addObject:v22];

                goto LABEL_21;
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
            if (v19) {
              continue;
            }
            break;
          }
        }

        id v4 = v27;
LABEL_21:
        uint64_t v7 = v26;
        uint64_t v6 = v28;
LABEL_22:

        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)annotationImageForHandle:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CKDetailsController *)self conversation];
  uint64_t v6 = [v5 chat];
  uint64_t v7 = [v6 participants];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v8 = v7;
  uint64_t v25 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v25)
  {
    uint64_t v9 = *(void *)v32;
    uint64_t v26 = v8;
    uint64_t v24 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v8);
        }
        uint64_t v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v12 = [v11 siblings];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v28;
          while (2)
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v28 != v15) {
                objc_enumerationMutation(v12);
              }
              long long v17 = *(void **)(*((void *)&v27 + 1) + 8 * j);
              uint64_t v18 = [v17 ID];
              uint64_t v19 = [v4 identifier];
              char v20 = [v18 isEqualToIgnoringCase:v19];

              if (v20)
              {
                uint64_t v22 = [[CKEntity alloc] initWithIMHandle:v17];
                id v21 = [(CKEntity *)v22 locationMapViewContactImage];

                id v8 = v26;
                goto LABEL_19;
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }

        id v8 = v26;
        uint64_t v9 = v24;
      }
      id v21 = 0;
      uint64_t v25 = [v26 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v25);
  }
  else
  {
    id v21 = 0;
  }
LABEL_19:

  return v21;
}

- (id)annotationContactForHandle:(id)a3
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CKDetailsController *)self conversation];
  uint64_t v6 = [v5 chat];
  uint64_t v7 = [v6 participants];

  id v8 = [MEMORY[0x1E4F1BBE8] descriptorForRequiredKeysIncludingImage:1];
  v38[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v10 = v7;
  uint64_t v26 = [v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v26)
  {
    uint64_t v11 = *(void *)v33;
    uint64_t v24 = *(void *)v33;
    uint64_t v25 = v9;
    long long v27 = v10;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v33 != v11) {
          objc_enumerationMutation(v10);
        }
        uint64_t v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        uint64_t v14 = objc_msgSend(v13, "findMySiblingHandles", v24);
        uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v29;
          while (2)
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v29 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = [*(id *)(*((void *)&v28 + 1) + 8 * j) identifier];
              char v20 = [v4 identifier];
              char v21 = [v19 isEqualToIgnoringCase:v20];

              if (v21)
              {
                uint64_t v9 = v25;
                uint64_t v22 = [v13 cnContactWithKeys:v25];

                id v10 = v27;
                goto LABEL_19;
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }

        id v10 = v27;
        uint64_t v11 = v24;
      }
      uint64_t v22 = 0;
      uint64_t v9 = v25;
      uint64_t v26 = [v27 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v26);
  }
  else
  {
    uint64_t v22 = 0;
  }
LABEL_19:

  return v22;
}

- (void)fmfMapViewController:(id)a3 didSelectHandle:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v7;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Map participant selected: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  uint64_t v9 = [(CKDetailsController *)self contactsManager];
  id v10 = [v9 contacts];
  [v10 enumerateObjectsUsingBlock:&__block_literal_global_497_0];
}

- (void)fmfMapViewController:(id)a3 didDeselectHandle:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Map participant de-selected: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (UITextView)locationSharingTextView
{
  locationSharingTextView = self->_locationSharingTextView;
  if (!locationSharingTextView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42F58]);
    id v5 = (UITextView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v6 = self->_locationSharingTextView;
    self->_locationSharingTextView = v5;

    [(UITextView *)self->_locationSharingTextView setEditable:0];
    [(UITextView *)self->_locationSharingTextView _setInteractiveTextSelectionDisabled:1];
    id v7 = [(UITextView *)self->_locationSharingTextView textContainer];
    [v7 setLineFragmentPadding:0.0];

    -[UITextView setTextContainerInset:](self->_locationSharingTextView, "setTextContainerInset:", *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));
    [(UITextView *)self->_locationSharingTextView setBackgroundColor:0];
    int v8 = self->_locationSharingTextView;
    id v9 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    [(UITextView *)v8 setTextColor:v9];

    [(UITextView *)self->_locationSharingTextView setScrollEnabled:0];
    uint64_t v10 = self->_locationSharingTextView;
    int v11 = +[CKUIBehavior sharedBehaviors];
    id v12 = [v11 headerFont];
    [(UITextView *)v10 setFont:v12];

    uint64_t v13 = [MEMORY[0x1E4F6BCB8] sharedInstance];
    uint64_t v14 = [v13 activeDevice];

    uint64_t v15 = NSString;
    uint64_t v16 = CKFrameworkBundle();
    uint64_t v17 = [v16 localizedStringForKey:@"LOCATION_CURRENTLY_SHARING_FROM" value:&stru_1EDE4CA38 table:@"ChatKit"];
    uint64_t v45 = v14;
    uint64_t v18 = [v14 deviceName];
    uint64_t v19 = objc_msgSend(v15, "stringWithFormat:", v17, v18);

    char v20 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v21 = [v20 userInterfaceLayoutDirection];

    if (v21 == 1) {
      uint64_t v22 = @"\u200F";
    }
    else {
      uint64_t v22 = @"\u200E";
    }
    id v23 = [(__CFString *)v22 stringByAppendingString:v19];

    uint64_t v24 = CKFrameworkBundle();
    uint64_t v25 = [v24 localizedStringForKey:@"LOCATION_SHARE_FROM_THIS_DEVICE" value:&stru_1EDE4CA38 table:@"ChatKit"];

    if ([(CKDetailsController *)self fmfRestricted]
      || CKIsRunningInMacCatalyst()
      || ([v45 isThisDevice] & 1) != 0)
    {
      id v26 = v23;
    }
    else
    {
      id v26 = [NSString stringWithFormat:@"%@ %@", v23, v25];
    }
    long long v27 = v26;
    uint64_t v28 = [v26 rangeOfString:v25];
    uint64_t v43 = v29;
    uint64_t v44 = v28;
    uint64_t v30 = [v27 length];
    long long v31 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v27];
    uint64_t v32 = *MEMORY[0x1E4FB06F8];
    long long v33 = +[CKUIBehavior sharedBehaviors];
    long long v34 = [v33 headerFont];
    objc_msgSend(v31, "addAttribute:value:range:", v32, v34, 0, v30);

    uint64_t v35 = *MEMORY[0x1E4FB0700];
    long long v36 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    objc_msgSend(v31, "addAttribute:value:range:", v35, v36, 0, v30);

    if (![(CKDetailsController *)self fmfRestricted] && !CKIsRunningInMacCatalyst())
    {
      uint64_t v37 = +[CKUIBehavior sharedBehaviors];
      id v38 = [v37 theme];
      uint64_t v39 = [v38 appTintColor];
      objc_msgSend(v31, "addAttribute:value:range:", v35, v39, v44, v43);

      uint64_t v40 = *MEMORY[0x1E4FB0720];
      long long v41 = [MEMORY[0x1E4F1CB10] URLWithString:&stru_1EDE4CA38];
      objc_msgSend(v31, "addAttribute:value:range:", v40, v41, v44, v43);

      objc_msgSend(v31, "addAttribute:value:range:", *MEMORY[0x1E4FB0808], MEMORY[0x1E4F1CC28], v44, v43);
    }
    [(UITextView *)self->_locationSharingTextView setAttributedText:v31];
    [(UITextView *)self->_locationSharingTextView setDelegate:self];

    locationSharingTextView = self->_locationSharingTextView;
  }

  return locationSharingTextView;
}

- (UITextView)expanseActivityTextView
{
  expanseActivityTextView = self->_expanseActivityTextView;
  if (!expanseActivityTextView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42F58]);
    id v5 = (UITextView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v6 = self->_expanseActivityTextView;
    self->_expanseActivityTextView = v5;

    [(UITextView *)self->_expanseActivityTextView setEditable:0];
    id v7 = [(UITextView *)self->_expanseActivityTextView textContainer];
    [v7 setLineFragmentPadding:0.0];

    -[UITextView setTextContainerInset:](self->_expanseActivityTextView, "setTextContainerInset:", *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));
    [(UITextView *)self->_expanseActivityTextView setBackgroundColor:0];
    int v8 = self->_expanseActivityTextView;
    id v9 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    [(UITextView *)v8 setTextColor:v9];

    [(UITextView *)self->_expanseActivityTextView setScrollEnabled:0];
    uint64_t v10 = self->_expanseActivityTextView;
    int v11 = +[CKUIBehavior sharedBehaviors];
    id v12 = [v11 headerFont];
    [(UITextView *)v10 setFont:v12];

    uint64_t v13 = self->_expanseActivityTextView;
    uint64_t v14 = [(CKDetailsController *)self tuConversation];
    uint64_t v15 = +[CKTUConversationViewUtilities activityDescriptionStringForTUConversation:v14];
    [(UITextView *)v13 setText:v15];

    expanseActivityTextView = self->_expanseActivityTextView;
  }

  return expanseActivityTextView;
}

- (UITextView)sharedWithYouFooterTextView
{
  sharedWithYouFooterTextView = self->_sharedWithYouFooterTextView;
  if (!sharedWithYouFooterTextView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42F58]);
    id v5 = (UITextView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v6 = self->_sharedWithYouFooterTextView;
    self->_sharedWithYouFooterTextView = v5;

    [(UITextView *)self->_sharedWithYouFooterTextView setEditable:0];
    [(UITextView *)self->_sharedWithYouFooterTextView _setInteractiveTextSelectionDisabled:1];
    id v7 = [(UITextView *)self->_sharedWithYouFooterTextView textContainer];
    [v7 setLineFragmentPadding:0.0];

    -[UITextView setTextContainerInset:](self->_sharedWithYouFooterTextView, "setTextContainerInset:", *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));
    [(UITextView *)self->_sharedWithYouFooterTextView setBackgroundColor:0];
    int v8 = self->_sharedWithYouFooterTextView;
    id v9 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    [(UITextView *)v8 setTextColor:v9];

    [(UITextView *)self->_sharedWithYouFooterTextView setScrollEnabled:0];
    uint64_t v10 = CKFrameworkBundle();
    uint64_t v30 = [v10 localizedStringForKey:@"MARK_AS_AUTO_DONATING_DESCRIPTION" value:&stru_1EDE4CA38 table:@"ChatKit"];

    int v11 = CKFrameworkBundle();
    uint64_t v29 = [v11 localizedStringForKey:@"SHARED_WITH_YOU_LEARN_MORE" value:&stru_1EDE4CA38 table:@"ChatKit"];

    id v12 = [NSString stringWithFormat:@"%@ %@", v30, v29];
    uint64_t v27 = [v12 rangeOfString:v29];
    uint64_t v14 = v13;
    uint64_t v15 = [v12 length];
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v12];
    uint64_t v17 = +[CKUIBehavior sharedBehaviors];
    uint64_t v18 = [v17 headerFont];
    uint64_t v28 = +[CKUIBehavior font:v18 adjustedForMaxSizeCategory:*MEMORY[0x1E4F43768]];

    objc_msgSend(v16, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v28, 0, v15);
    uint64_t v19 = *MEMORY[0x1E4FB0700];
    char v20 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    objc_msgSend(v16, "addAttribute:value:range:", v19, v20, 0, v15);

    uint64_t v21 = +[CKUIBehavior sharedBehaviors];
    uint64_t v22 = [v21 theme];
    id v23 = [v22 linkColor];
    objc_msgSend(v16, "addAttribute:value:range:", v19, v23, v27, v14);

    uint64_t v24 = *MEMORY[0x1E4FB0720];
    uint64_t v25 = [MEMORY[0x1E4F1CB10] URLWithString:&stru_1EDE4CA38];
    objc_msgSend(v16, "addAttribute:value:range:", v24, v25, v27, v14);

    objc_msgSend(v16, "addAttribute:value:range:", *MEMORY[0x1E4FB0808], MEMORY[0x1E4F1CC28], v27, v14);
    [(UITextView *)self->_sharedWithYouFooterTextView setAttributedText:v16];
    [(UITextView *)self->_sharedWithYouFooterTextView setDelegate:self];

    sharedWithYouFooterTextView = self->_sharedWithYouFooterTextView;
  }

  return sharedWithYouFooterTextView;
}

- (id)downloadAttachmentsText
{
  id v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CKDetailsController _purgedAttachmentCount](self, "_purgedAttachmentCount"));
  id v3 = NSString;
  id v4 = CKFrameworkBundle();
  id v5 = [v4 localizedStringForKey:@"THERE_ARE_IMAGE_ATTACHMENTS_IN_ICLOUD" value:&stru_1EDE4CA38 table:@"ChatKit"];
  id v6 = objc_msgSend(v3, "localizedStringWithFormat:", v5, v2);

  id v7 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v8 = [v7 userInterfaceLayoutDirection];

  if (v8 == 1) {
    id v9 = @"\u200F";
  }
  else {
    id v9 = @"\u200E";
  }
  uint64_t v10 = [(__CFString *)v9 stringByAppendingString:v6];

  return v10;
}

- (id)downloadButtonText
{
  unint64_t v2 = [(CKDetailsController *)self downloadButtonState];
  id v3 = @"DOWNLOAD";
  if (v2 == 2) {
    id v3 = @"DOWNLOADING";
  }
  id v4 = v3;
  id v5 = CKFrameworkBundle();
  id v6 = [v5 localizedStringForKey:v4 value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v6;
}

- (CKBusinessInfoView)businessInfoView
{
  businessInfoView = self->_businessInfoView;
  if (!businessInfoView)
  {
    id v4 = [[CKBusinessInfoView alloc] initWithLayoutType:1];
    id v5 = self->_businessInfoView;
    self->_businessInfoView = v4;

    [(CKBusinessInfoView *)self->_businessInfoView setDelegate:self];
    id v6 = CKFrameworkBundle();
    id v7 = [v6 localizedStringForKey:@"BUSINESS_DESCRIPTION_IN_DETAILS" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [(CKBusinessInfoView *)self->_businessInfoView setDescriptionText:v7];

    businessInfoView = self->_businessInfoView;
  }

  return businessInfoView;
}

- (void)businessInfoView:(id)a3 infoButtonTapped:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F83AD8], "presenterForPrivacySplashWithIdentifier:", *MEMORY[0x1E4F83B20], a4);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (CKIsRunningInMacCatalyst()
    && ([(CKDetailsController *)self detailsControllerDelegate],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 detailsControllerBusinessPrivacyInfoPresentingViewController:self],
        id v6 = (CKDetailsController *)objc_claimAutoreleasedReturnValue(),
        v5,
        v6))
  {
    id v7 = self;
    if (v6 != self)
    {
      uint64_t v8 = [(CKDetailsController *)self detailsControllerDelegate];
      [v8 dismissDetailsNavigationController];

      id v7 = v6;
    }
  }
  else
  {
    id v7 = 0;
  }
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = self;
  }
  [v10 setPresentingViewController:v9];
  [v10 present];
}

+ (void)saveGroupPhotoDataAndUpdateParticipants:(id)a3 forConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Saving the group photo and updating the recipients.", v12, 2u);
    }
  }
  if (v6)
  {
    id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v10 = objc_msgSend(v9, "im_randomTemporaryFileURLWithFileName:", *MEMORY[0x1E4F6D450]);
    int v11 = [v10 path];

    [v6 writeToFile:v11 atomically:1];
  }
  else
  {
    int v11 = 0;
  }
  [a1 updateParticipantsWithGroupPhotoAtPath:v11 forConversation:v7];
}

+ (void)updateParticipantsWithGroupPhotoAtPath:(id)a3 forConversation:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      id v16 = v5;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Should update group photo at path: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  if (!v5)
  {
    id v10 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:0];
  id v9 = [MEMORY[0x1E4F6BCC8] sharedInstance];
  id v10 = [v9 createNewOutgoingGroupPhotoTransferWithLocalFileURL:v8];

  int v11 = [MEMORY[0x1E4F6BCC8] sharedInstance];
  id v12 = [v11 transferForGUID:v10];

  if (v12)
  {
    uint64_t v13 = [MEMORY[0x1E4F6BCC8] sharedInstance];
    [v13 registerTransferWithDaemon:v10];

LABEL_13:
    uint64_t v8 = [v6 chat];
    [v8 sendGroupPhotoUpdate:v10];
    goto LABEL_14;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "IMFileTransfer is nil.", (uint8_t *)&v15, 2u);
    }
  }
LABEL_14:
}

- (void)userDidTapDownloadForAttachmentsFooterView:(id)a3
{
  if ([(CKDetailsController *)self downloadButtonState] != 2)
  {
    [(CKDetailsController *)self setDownloadButtonState:2];
    id v5 = [(CKDetailsController *)self conversation];
    id v4 = [v5 chat];
    [v4 downloadPurgedAttachments];
  }
}

- (unint64_t)_purgedAttachmentCount
{
  if (!self->_didPerformPurgedAttachmentsCheck)
  {
    id v3 = [(CKDetailsController *)self conversation];
    id v4 = [v3 chat];
    id v5 = [v4 countOfAttachmentsNotCachedLocally];
    self->_undownloadedPhotoAttachmentCount = [v5 integerValue];

    self->_didPerformPurgedAttachmentsCheck = 1;
  }
  return self->_undownloadedPhotoAttachmentCount;
}

- (void)_resetPurgedAttachmentCount
{
  self->_didPerformPurgedAttachmentsCheck = 0;
  self->_undownloadedPhotoAttachmentCount = 0;
}

- (BOOL)shouldShowDownloadMoreCell
{
  return [(CKDetailsController *)self _purgedAttachmentCount] != 0;
}

- (void)setDownloadButtonState:(unint64_t)a3
{
  self->_downloadButtonState = a3;
  if (a3 - 1 <= 1) {
    [(CKDetailsController *)self _updateDownloadFooterView];
  }
}

- (void)_updateDownloadButtonStateIfNeeded
{
  unint64_t v3 = [(CKDetailsController *)self downloadButtonState];
  id v4 = [(CKDetailsController *)self conversation];
  id v5 = [v4 chat];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __57__CKDetailsController__updateDownloadButtonStateIfNeeded__block_invoke;
  v6[3] = &unk_1E5624A88;
  void v6[4] = self;
  v6[5] = v3;
  [v5 fetchIsCurrentlyDownloadingPurgedAttachments:v6];
}

void __57__CKDetailsController__updateDownloadButtonStateIfNeeded__block_invoke(uint64_t a1, int a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  if (a2)
  {
    uint64_t v4 = 2;
  }
  else
  {
    int v5 = [v3 shouldShowDownloadMoreCell];
    unint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = v5 != 0;
  }
  [v3 setDownloadButtonState:v4];
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6 != [*(id *)(a1 + 32) downloadButtonState])
  {
    id v7 = [*(id *)(a1 + 32) tableView];
    [v7 reloadData];
  }
}

- (void)_batchDownloadNotificationFired:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__CKDetailsController__batchDownloadNotificationFired___block_invoke;
  block[3] = &unk_1E5620C40;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __55__CKDetailsController__batchDownloadNotificationFired___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _resetPurgedAttachmentCount];
  [*(id *)(a1 + 32) _updateDownloadButtonStateIfNeeded];
  [*(id *)(a1 + 32) _updateDownloadFooterView];
  id v2 = [*(id *)(a1 + 32) searchViewController];
  [v2 rekickZKWSearchForAttachmentBatchUpdate];
}

- (void)_presentGroupNameAndPhotoEditor
{
  id v3 = objc_alloc(MEMORY[0x1E4F42BF8]);
  uint64_t v4 = [(CKDetailsController *)self _generateGroupImagePickerViewController];
  id v5 = (id)[v3 initWithRootViewController:v4];

  [(CKDetailsController *)self presentViewController:v5 animated:1 completion:0];
}

- (id)_generateGroupImagePickerViewController
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1BC18] descriptorForRequiredKeys];
  v9[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  id v5 = [(CKDetailsController *)self conversation];
  uint64_t v6 = objc_msgSend(v5, "conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:", v4, objc_msgSend(MEMORY[0x1E4F1BB38], "maxContactAvatars"));

  id v7 = [MEMORY[0x1E4F1BC18] imagePickerForGroupIdentity:v6];
  [v7 setDelegate:self];
  [v7 setPresenterDelegate:self];

  return v7;
}

- (void)groupIdentityHeaderViewController:(id)a3 didDismissSharedProfileBannerWithUpdatedContact:(id)a4 forAction:(unint64_t)a5
{
  -[CKDetailsController setShouldForceGroupPhotoHeaderReload:](self, "setShouldForceGroupPhotoHeaderReload:", 1, a4, a5);
  id v6 = [(CKDetailsController *)self tableView];
  [v6 reloadData];
}

- (void)_dismissIdentityPicker:(id)a3
{
  id v3 = [a3 presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)visualIdentityPicker:(id)a3 didUpdatePhotoForVisualIdentity:(id)a4 withContactImage:(id)a5
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [MEMORY[0x1E4F1BC18] descriptorForRequiredKeys];
  v35[0] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];

  uint64_t v13 = [(CKDetailsController *)self conversation];
  uint64_t v14 = objc_msgSend(v13, "conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:", v12, objc_msgSend(MEMORY[0x1E4F1BB38], "maxContactAvatars"));

  int v15 = [v9 thumbnailImageData];
  id v16 = [v14 groupPhoto];
  char v17 = [v15 isEqualToData:v16];

  if ((v17 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long v34 = 0;
        _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "Updating visual identity.", v34, 2u);
      }
    }
    uint64_t v19 = [(CKDetailsController *)self conversation];
    char v20 = [v19 chat];
    int v21 = [v20 isGroupChat];

    if (v21)
    {
      uint64_t v22 = [v9 thumbnailImageData];
      id v23 = [(CKDetailsController *)self conversation];
      +[CKDetailsController saveGroupPhotoDataAndUpdateParticipants:v22 forConversation:v23];
    }
    uint64_t v24 = [(CKDetailsController *)self conversation];
    [v24 setNeedsUpdatedGroupPhotoForVisualIdentity];
  }
  uint64_t v25 = [v9 name];
  id v26 = [(CKDetailsController *)self conversation];
  uint64_t v27 = [v26 displayName];
  char v28 = [v25 isEqualToString:v27];

  if ((v28 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long v34 = 0;
        _os_log_impl(&dword_18EF18000, v29, OS_LOG_TYPE_INFO, "Updating display name.", v34, 2u);
      }
    }
    uint64_t v30 = [(CKDetailsController *)self conversation];
    long long v31 = [v9 name];
    [v30 setDisplayName:v31];

    uint64_t v32 = [(CKDetailsController *)self conversation];
    [v32 setNeedsUpdatedGroupNameForVisualIdentity];
  }
  long long v33 = [(CKDetailsController *)self conversation];
  [v33 setGroupIdentityUpdateHandleID:0];

  [(CKDetailsController *)self _dismissIdentityPicker:v8];
}

- (void)_handleAddingHandles:(id)a3 allRecipientsAddresses:(id)a4 sender:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(CKDetailsController *)self addRecipientsController];
  id v10 = [(CKDetailsController *)self conversation];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __74__CKDetailsController__handleAddingHandles_allRecipientsAddresses_sender___block_invoke;
  v12[3] = &unk_1E5624AB0;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  [v9 handleAddingHandles:v8 conversation:v10 viewController:self allRecipientAddresses:v11 completion:v12];
}

void __74__CKDetailsController__handleAddingHandles_allRecipientsAddresses_sender___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (!a2) {
    goto LABEL_27;
  }
  id v9 = CKFrameworkBundle();
  id v10 = [v9 localizedStringForKey:@"CREATE_NEW_GROUP_DESC" value:&stru_1EDE4CA38 table:@"ChatKit"];

  id v11 = CKFrameworkBundle();
  uint64_t v12 = [v11 localizedStringForKey:@"CREATE_NEW_GROUP_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

  id v13 = [*(id *)(a1 + 32) conversation];
  uint64_t v14 = [v13 sendingService];
  int v15 = [v14 name];
  int v16 = [v15 isEqualToString:*MEMORY[0x1E4F6E1B0]];

  char v17 = *(void **)(a1 + 32);
  id v74 = v7;
  if (v16)
  {
    char v18 = [v17 _atLeastOneEmailPresentInHandles:v7];
    uint64_t v19 = CKFrameworkBundle();
    char v20 = v19;
    if (v18) {
      int v21 = @"CREATE_NEW_GROUP_IMESSAGE_HAS_EMAILS_DESC";
    }
    else {
      int v21 = @"CREATE_NEW_GROUP_IMESSAGE_DESC";
    }
    uint64_t v50 = [v19 localizedStringForKey:v21 value:&stru_1EDE4CA38 table:@"ChatKit"];
    char v51 = 1;
  }
  else
  {
    uint64_t v22 = [v17 conversation];
    id v23 = [v22 sendingService];
    uint64_t v24 = [v23 name];
    int v25 = [v24 isEqualToString:*MEMORY[0x1E4F6E198]];

    if (!v25)
    {
      char v51 = 1;
      goto LABEL_18;
    }
    id v26 = (void *)v12;
    uint64_t v27 = [MEMORY[0x1E4F6BDC0] smsService];
    char v28 = [*(id *)(a1 + 32) conversation];
    uint64_t v29 = [v28 lastAddressedHandle];
    uint64_t v30 = [*(id *)(a1 + 32) conversation];
    long long v31 = [v30 lastAddressedSIMID];
    unint64_t v32 = objc_msgSend(v27, "__ck_maxRecipientCountForHandle:simID:", v29, v31);

    if ([v8 count] <= v32)
    {
      char v71 = [*(id *)(a1 + 32) _atLeastOneEmailPresentInHandles:v74];
      v72 = CKFrameworkBundle();
      char v20 = v72;
      if (v71) {
        uint64_t v73 = @"CREATE_NEW_GROUP_RCS_HAS_EMAILS_DESC";
      }
      else {
        uint64_t v73 = @"CREATE_NEW_GROUP_RCS_DESC";
      }
      uint64_t v50 = [v72 localizedStringForKey:v73 value:&stru_1EDE4CA38 table:@"ChatKit"];
      char v51 = 1;
      uint64_t v12 = (uint64_t)v26;
    }
    else
    {
      long long v33 = (void *)MEMORY[0x1E4F28EE0];
      long long v34 = [NSNumber numberWithInteger:v32];
      char v20 = [v33 localizedStringFromNumber:v34 numberStyle:1];

      uint64_t v35 = NSString;
      long long v36 = CKFrameworkBundle();
      uint64_t v37 = [v36 localizedStringForKey:@"CANNOT_ADD_RECIPIENT" value:&stru_1EDE4CA38 table:@"ChatKit"];
      id v38 = [v35 stringWithFormat:v37];

      uint64_t v39 = [MEMORY[0x1E4F42738] sharedApplication];
      uint64_t v40 = [v39 userInterfaceLayoutDirection];

      if (v40 == 1) {
        long long v41 = @"\u200F";
      }
      else {
        long long v41 = @"\u200E";
      }
      uint64_t v42 = [(__CFString *)v41 stringByAppendingString:v38];

      uint64_t v43 = NSString;
      uint64_t v44 = CKFrameworkBundle();
      uint64_t v45 = [v44 localizedStringForKey:@"ERR_ALL_RECIPIENTS_NEED_IMESSAGE_OR_RCS" value:&stru_1EDE4CA38 table:@"ChatKit"];
      CGRect v46 = objc_msgSend(v43, "stringWithFormat:", v45, v20);

      v47 = [MEMORY[0x1E4F42738] sharedApplication];
      uint64_t v48 = [v47 userInterfaceLayoutDirection];

      if (v48 == 1) {
        double v49 = @"\u200F";
      }
      else {
        double v49 = @"\u200E";
      }
      uint64_t v50 = [(__CFString *)v49 stringByAppendingString:v46];

      char v51 = 0;
      uint64_t v12 = v42;
    }
  }

  id v10 = (void *)v50;
LABEL_18:
  double v52 = (void *)v12;
  id v53 = +[CKAlertController alertControllerWithTitle:v12 message:v10 preferredStyle:1];
  v54 = CKFrameworkBundle();
  CGRect v55 = [v54 localizedStringForKey:@"CREATE_NEW_GROUP_ACTION_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __74__CKDetailsController__handleAddingHandles_allRecipientsAddresses_sender___block_invoke_2;
  v75[3] = &unk_1E56218C8;
  CGRect v56 = *(void **)(a1 + 40);
  v75[4] = *(void *)(a1 + 32);
  id v76 = v56;
  CGRect v57 = +[CKAlertAction actionWithTitle:v55 style:0 handler:v75];

  CGRect v58 = CKFrameworkBundle();
  CGRect v59 = v58;
  if (v51)
  {
    CGRect v60 = [v58 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
    CGRect v61 = +[CKAlertAction actionWithTitle:v60 style:1 handler:0];

    [v53 addAction:v57];
    [v53 setPreferredAction:v57];
  }
  else
  {
    v62 = [v58 localizedStringForKey:@"OK" value:&stru_1EDE4CA38 table:@"ChatKit"];
    CGRect v61 = +[CKAlertAction actionWithTitle:v62 style:1 handler:0];
  }
  [v53 addAction:v61];
  v63 = [*(id *)(a1 + 32) addRecipientsController];
  v64 = [*(id *)(a1 + 32) detailsControllerDelegate];
  char v65 = objc_opt_respondsToSelector();

  if (v65)
  {
    v66 = [*(id *)(a1 + 32) detailsControllerDelegate];
    uint64_t v67 = [v66 presentingViewControllerForGroupAlertsFromDetailsController:*(void *)(a1 + 32)];
    uint64_t v68 = (void *)v67;
    if (v67) {
      v69 = (void *)v67;
    }
    else {
      v69 = v63;
    }
    id v70 = v69;

    v63 = v70;
  }
  id v7 = v74;
  [v53 presentFromViewController:v63 animated:1 completion:0];

LABEL_27:
}

void __74__CKDetailsController__handleAddingHandles_allRecipientsAddresses_sender___block_invoke_2(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __74__CKDetailsController__handleAddingHandles_allRecipientsAddresses_sender___block_invoke_3;
  v2[3] = &unk_1E5620AF8;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 dismissViewControllerAnimated:0 completion:v2];
}

void __74__CKDetailsController__handleAddingHandles_allRecipientsAddresses_sender___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) detailsControllerDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) detailsControllerDelegate];
    [v4 detailsController:*(void *)(a1 + 32) shouldComposeConversationWithRecipientAddresses:*(void *)(a1 + 40)];
  }
}

- (BOOL)_atLeastOneEmailPresentInHandles:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "ID", (void)v10);
        char IsEmail = IMStringIsEmail();

        if (IsEmail)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)_chatAllowedByScreenTimeChanged:(id)a3
{
  id v5 = [a3 object];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v5 allowedByScreenTime] & 1) == 0)
  {
    if (CKIsRunningInMacCatalyst())
    {
      uint64_t v4 = [(CKDetailsController *)self detailsControllerDelegate];
      [v4 dismissDetailsNavigationController];
    }
    else
    {
      [(CKDetailsController *)self dismissViewControllerAnimated:1 completion:0];
    }
  }
}

- (void)_handleMultiWayStateChange:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  id v13 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6B9B8]];

  id v5 = [MEMORY[0x1E4F6BC40] sharedRegistry];
  id v6 = [v5 existingConversationForTelephonyConversationUUID:v13];

  id v7 = [v6 UUID];
  id v8 = [(CKDetailsController *)self tuConversation];
  id v9 = [v8 UUID];
  int v10 = [v7 isEqual:v9];

  if (v10)
  {
    long long v11 = [(CKDetailsController *)self expanseActivityTextView];
    [v11 removeFromSuperview];

    [(CKDetailsController *)self setExpanseActivityTextView:0];
    long long v12 = [(CKDetailsController *)self tableView];
    [v12 reloadData];
  }
}

- (void)updateContactsHeaderVerificationState
{
  groupPhotoHeaderViewController = self->_groupPhotoHeaderViewController;
  BOOL v3 = [(CKDetailsController *)self shouldShowKeyTransparency];

  [(CNGroupIdentityHeaderViewController *)groupPhotoHeaderViewController setShouldShowStaticKeyBadge:v3];
}

- (id)ktCellForRow:(int64_t)a3
{
  id v5 = [(CKDetailsController *)self conversation];
  id v6 = [v5 chat];
  int v7 = [v6 isGroupChat];

  switch(self->_ktChatState)
  {
    case 0uLL:
      id v8 = [(CKDetailsController *)self ktEnableEnhancedProtectionCell];
      break;
    case 1uLL:
    case 2uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
      goto LABEL_2;
    case 3uLL:
      if (!v7) {
        goto LABEL_4;
      }
      goto LABEL_2;
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
      if (a3)
      {
LABEL_4:
        id v8 = [(CKDetailsController *)self ktVerifyConversationCell];
      }
      else
      {
LABEL_2:
        id v8 = [(CKDetailsController *)self ktEnhancedProtectionStateCell];
      }
      break;
    default:
      id v8 = 0;
      break;
  }

  return v8;
}

- (CKEnableEnhancedProtectionCell)ktEnableEnhancedProtectionCell
{
  ktEnableEnhancedProtectionCell = self->_ktEnableEnhancedProtectionCell;
  if (!ktEnableEnhancedProtectionCell)
  {
    uint64_t v4 = [(CKDetailsController *)self tableView];
    uint64_t v5 = objc_opt_class();
    id v6 = +[CKEnableEnhancedProtectionCell reuseIdentifier];
    [v4 registerClass:v5 forCellReuseIdentifier:v6];

    int v7 = [CKEnableEnhancedProtectionCell alloc];
    id v8 = +[CKEnableEnhancedProtectionCell reuseIdentifier];
    id v9 = [(CKDetailsController *)self tuConversation];
    int v10 = [(CKEnableEnhancedProtectionCell *)v7 initWithStyle:0 reuseIdentifier:v8 conversation:v9 shouldShowMacHeader:1];
    long long v11 = self->_ktEnableEnhancedProtectionCell;
    self->_ktEnableEnhancedProtectionCell = v10;

    ktEnableEnhancedProtectionCell = self->_ktEnableEnhancedProtectionCell;
  }

  return ktEnableEnhancedProtectionCell;
}

- (CKKTEnhancedProtectionStatusCell)ktEnhancedProtectionStateCell
{
  v52[1] = *MEMORY[0x1E4F143B8];
  int64_t ktEnhancedProtectionStatusCellState = self->_ktEnhancedProtectionStatusCellState;
  uint64_t v4 = [(CKDetailsController *)self conversation];
  uint64_t v5 = [v4 chat];

  double v49 = +[CKKTDetailsViewUtilities verifiedHandlesInChat:v5];
  id v6 = [v5 participants];
  unint64_t v7 = [v6 count];

  if (v7 < 2)
  {
    id v13 = [v5 participants];
    uint64_t v14 = [v13 count];

    if (v14 == 1)
    {
      uint64_t v15 = [v5 participants];
      int v16 = [v15 firstObject];
      char v51 = v16;
      char v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
      char v18 = +[CKKTDetailsViewUtilities namesFromHandles:v17 shouldUseShortFormat:0];
      long long v12 = [v18 firstObject];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "CKDetailsController_KT: There are no handles in the chat", buf, 2u);
        }
      }
      long long v12 = &stru_1EDE4CA38;
    }
  }
  else
  {
    id v8 = [(CKDetailsController *)self conversation];
    id v9 = [v8 displayName];
    uint64_t v10 = [v9 length];

    if (v10)
    {
      long long v11 = [(CKDetailsController *)self conversation];
      long long v12 = [v11 displayName];
    }
    else
    {
      char v20 = [v5 participants];
      int v21 = [v20 firstObject];

      v52[0] = v21;
      uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
      id v23 = +[CKKTDetailsViewUtilities namesFromHandles:v22 shouldUseShortFormat:1];
      uint64_t v24 = [v23 firstObject];

      int v25 = NSString;
      id v26 = CKFrameworkBundle();
      uint64_t v27 = [v26 localizedStringForKey:@"X_AND_N_PEOPLE" value:&stru_1EDE4CA38 table:@"ChatKitFormats-Key-Transparency"];
      char v28 = [v5 participants];
      uint64_t v29 = objc_msgSend(v25, "localizedStringWithFormat:", v27, v24, objc_msgSend(v28, "count") - 1);

      uint64_t v30 = [MEMORY[0x1E4F42738] sharedApplication];
      BOOL v31 = [v30 userInterfaceLayoutDirection] == 1;

      if (v31) {
        unint64_t v32 = @"\u200F";
      }
      else {
        unint64_t v32 = @"\u200E";
      }
      long long v12 = [(__CFString *)v32 stringByAppendingString:v29];
    }
  }
  ktEnhancedProtectionStateCell = self->_ktEnhancedProtectionStateCell;
  if (ktEnhancedProtectionStateCell)
  {
    [(CKKTEnhancedProtectionStatusCell *)ktEnhancedProtectionStateCell setEnhancedProtectionStatusCellState:ktEnhancedProtectionStatusCellState];
    long long v34 = self->_ktEnhancedProtectionStateCell;
    uint64_t v35 = [v5 participants];
    -[CKKTEnhancedProtectionStatusCell setHandlesInChatCount:](v34, "setHandlesInChatCount:", [v35 count]);

    -[CKKTEnhancedProtectionStatusCell setVerifiedHandlesCount:](self->_ktEnhancedProtectionStateCell, "setVerifiedHandlesCount:", [v49 count]);
    [(CKKTEnhancedProtectionStatusCell *)self->_ktEnhancedProtectionStateCell setTitleString:v12];
    [(CKKTEnhancedProtectionStatusCell *)self->_ktEnhancedProtectionStateCell updateTitleAndStatusButtonConfiguration];
  }
  else
  {
    long long v36 = [(CKDetailsController *)self tableView];
    uint64_t v37 = objc_opt_class();
    id v38 = +[CKKTEnhancedProtectionStatusCell reuseIdentifier];
    [v36 registerClass:v37 forCellReuseIdentifier:v38];

    uint64_t v39 = [CKKTEnhancedProtectionStatusCell alloc];
    uint64_t v40 = +[CKKTEnhancedProtectionStatusCell reuseIdentifier];
    long long v41 = [(CKDetailsController *)self conversation];
    uint64_t v42 = [v41 chat];
    uint64_t v43 = [v42 participants];
    LOBYTE(v48) = 1;
    uint64_t v44 = [(CKKTEnhancedProtectionStatusCell *)v39 initWithStyle:0 reuseIdentifier:v40 state:ktEnhancedProtectionStatusCellState delegate:self handlesInChat:v43 verifiedHandles:v49 titleString:v12 shouldShowMacHeader:v48];
    uint64_t v45 = self->_ktEnhancedProtectionStateCell;
    self->_ktEnhancedProtectionStateCell = v44;
  }
  CGRect v46 = self->_ktEnhancedProtectionStateCell;

  return v46;
}

- (CKKTVerifyConversationTableViewCell)ktVerifyConversationCell
{
  unint64_t ktChatState = self->_ktChatState;
  uint64_t v4 = [(CKDetailsController *)self conversation];
  uint64_t v5 = [v4 chat];
  int64_t v6 = +[CKKTDetailsViewUtilities numberOfRowsInKTSectionForStatus:isGroupChat:](CKKTDetailsViewUtilities, "numberOfRowsInKTSectionForStatus:isGroupChat:", ktChatState, [v5 isGroupChat]);

  ktVerifyConversationCell = self->_ktVerifyConversationCell;
  if (ktVerifyConversationCell)
  {
    [(CKKTVerifyConversationTableViewCell *)ktVerifyConversationCell setNumberOfRowsInSection:v6];
    [(CKKTVerifyConversationTableViewCell *)self->_ktVerifyConversationCell setShouldShowMacHeader:v6 == 1];
    [(CKKTVerifyConversationTableViewCell *)self->_ktVerifyConversationCell setKtStatus:[(CKDetailsController *)self ktChatState]];
    [(CKKTVerifyConversationTableViewCell *)self->_ktVerifyConversationCell updateForNewKTState];
  }
  else
  {
    id v8 = [(CKDetailsController *)self tableView];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = +[CKKTVerifyConversationTableViewCell reuseIdentifier];
    [v8 registerClass:v9 forCellReuseIdentifier:v10];

    long long v11 = [CKKTVerifyConversationTableViewCell alloc];
    long long v12 = +[CKKTVerifyConversationTableViewCell reuseIdentifier];
    id v13 = [(CKKTVerifyConversationTableViewCell *)v11 initWithStyle:0 reuseIdentifier:v12 numberOfRowsInSection:v6 shouldShowMacHeader:v6 == 1 ktStatus:[(CKDetailsController *)self ktChatState]];
    uint64_t v14 = self->_ktVerifyConversationCell;
    self->_ktVerifyConversationCell = v13;
  }
  uint64_t v15 = self->_ktVerifyConversationCell;
  int v16 = [(CKDetailsController *)self conversation];
  char v17 = [v16 chat];
  -[CKKTVerifyConversationTableViewCell setEnabled:](v15, "setEnabled:", [v17 hasKnownParticipants]);

  char v18 = self->_ktVerifyConversationCell;

  return v18;
}

- (id)ktSecurityFooterView
{
  BOOL v3 = [(CKDetailsController *)self tableView];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = +[CKKTSecurityHeaderFooterView footerReuseIdentifier];
  [v3 registerClass:v4 forHeaderFooterViewReuseIdentifier:v5];

  int64_t v6 = +[CKKTSecurityHeaderFooterView footerReuseIdentifier];
  unint64_t v7 = [v3 dequeueReusableHeaderFooterViewWithIdentifier:v6];

  id v8 = [(CKDetailsController *)self ktSecurityFooterTextView];
  [v7 setKtSecurityTextView:v8];
  [v7 setIsAccessibilityElement:1];
  [v7 setAccessibilityIdentifier:@"KeyTransparencyDetailsFooter"];
  uint64_t v9 = [v8 attributedText];
  uint64_t v10 = [v9 string];
  [v7 setAccessibilityLabel:v10];

  return v7;
}

- (UITextView)ktSecurityFooterTextView
{
  v18[1] = *MEMORY[0x1E4F143B8];
  unint64_t ktChatState = self->_ktChatState;
  ktHandlesForKtChatStatus = self->_ktHandlesForKtChatStatus;
  if (self->_ktSecurityFooterTextView)
  {
    uint64_t v5 = +[CKKTDetailsViewUtilities securityFooterStringForKTChatState:ktChatState handles:ktHandlesForKtChatStatus];
    [(UITextView *)self->_ktSecurityFooterTextView setAttributedText:v5];
  }
  else
  {
    int64_t v6 = +[CKKTDetailsViewUtilities ktSecuritySectionFooterTextViewForKTStatus:ktChatState withHandles:ktHandlesForKtChatStatus];
    ktSecurityFooterTextView = self->_ktSecurityFooterTextView;
    self->_ktSecurityFooterTextView = v6;

    uint64_t v17 = *MEMORY[0x1E4FB0700];
    id v8 = +[CKUIBehavior sharedBehaviors];
    uint64_t v9 = [v8 theme];
    uint64_t v10 = [v9 linkColor];
    v18[0] = v10;
    long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    [(UITextView *)self->_ktSecurityFooterTextView setLinkTextAttributes:v11];

    [(UITextView *)self->_ktSecurityFooterTextView setDelegate:self];
    long long v12 = [(CKDetailsController *)self tableView];
    [v12 _marginWidth];
    double v14 = v13;

    -[UITextView setTextContainerInset:](self->_ktSecurityFooterTextView, "setTextContainerInset:", 0.0, v14, 0.0, v14);
  }
  uint64_t v15 = self->_ktSecurityFooterTextView;

  return v15;
}

- (double)calculateHeightForKTFooter
{
  BOOL v3 = [(CKDetailsController *)self tableView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v23.origin.double x = v5;
  v23.origin.double y = v7;
  v23.size.CGFloat width = v9;
  v23.size.CGFloat height = v11;
  IsEmptdouble y = CGRectIsEmpty(v23);
  double result = 0.0;
  if (!IsEmpty)
  {
    double v14 = [(CKDetailsController *)self tableView];
    [v14 _sectionContentInset];
    double v16 = v15;
    double v18 = v17;

    uint64_t v19 = [(CKDetailsController *)self ktSecurityFooterTextView];
    v24.origin.double x = v5;
    v24.origin.double y = v7;
    v24.size.CGFloat width = v9;
    v24.size.CGFloat height = v11;
    objc_msgSend(v19, "sizeThatFits:", CGRectGetWidth(v24) - (v16 + v18), 1.79769313e308);
    double v21 = v20;

    +[CKKTSecurityHeaderFooterView footerVerticalPadding];
    return v21 + v22 + v22 + 16.0;
  }
  return result;
}

- (void)enableEnhancedProtection
{
}

- (void)keyTransparencyConversationViewControllerDidComplete:(id)a3
{
  double v4 = [(CKDetailsController *)self conversation];
  CGFloat v5 = [v4 chat];
  [v5 fetchKTStatus];

  [(CKDetailsController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)keyTransparencyDetailsStatusCellDidSelectLearnMore:(id)a3
{
}

- (void)showKTContactVerificationUI
{
  id v4 = [(CKDetailsController *)self conversation];
  BOOL v3 = [v4 chat];
  +[CKKeyTransparencyErrorUtilities showKTContactVerificationUIForIMChat:v3 fromViewController:self];
}

- (void)keyTransparencyDetailsStatusCellDidRequestReportToApple:(id)a3
{
}

- (void)keyTransparencyDetailsStatusCellDidSelectIgnoreFailures:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  CGFloat v5 = [(CKDetailsController *)self conversation];
  double v6 = [v5 chat];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  CGFloat v11 = __79__CKDetailsController_keyTransparencyDetailsStatusCellDidSelectIgnoreFailures___block_invoke;
  long long v12 = &unk_1E56215C8;
  objc_copyWeak(&v13, &location);
  CGFloat v7 = +[CKKeyTransparencyErrorUtilities ktClearWarningAlertControllerForChat:v6 confirmationHandler:&v9];

  if (!CKIsRunningInMacCatalyst()
    && +[CKUtilities isIpad])
  {
    double v8 = [v7 popoverPresentationController];
    [v8 setSourceView:v4];
    [v4 bounds];
    objc_msgSend(v8, "setSourceRect:");
  }
  -[CKDetailsController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0, v9, v10, v11, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __79__CKDetailsController_keyTransparencyDetailsStatusCellDidSelectIgnoreFailures___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained detailsControllerDelegate];
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    BOOL v3 = [WeakRetained detailsControllerDelegate];
    [v3 detailsControllerWillDismiss:WeakRetained];
  }
  if (CKIsRunningInMacCatalyst())
  {
    id v4 = [WeakRetained detailsControllerDelegate];
    [v4 dismissDetailsNavigationController];

    CGFloat v5 = [WeakRetained detailsControllerDelegate];
    [v5 detailsControllerDidDismiss:WeakRetained];
  }
  else
  {
    [WeakRetained dismissViewControllerAnimated:1 completion:0];
  }
}

- (CKDetailsControllerDelegate)detailsControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_detailsControllerDelegate);

  return (CKDetailsControllerDelegate *)WeakRetained;
}

- (void)setDetailsControllerDelegate:(id)a3
{
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
}

- (BOOL)isContactsSectionCollapsed
{
  return self->_isContactsSectionCollapsed;
}

- (void)setIsContactsSectionCollapsed:(BOOL)a3
{
  self->_isContactsSectionCollapsed = a3;
}

- (CKDetailsContactsManager)contactsManager
{
  return self->_contactsManager;
}

- (void)setContactsManager:(id)a3
{
}

- (NSTimer)fmfUpdateTimer
{
  return self->_fmfUpdateTimer;
}

- (void)setFmfUpdateTimer:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (void)setSuggestionsEnabledContactStore:(id)a3
{
}

- (CKEntity)presentedEntity
{
  return self->_presentedEntity;
}

- (void)setPresentedEntity:(id)a3
{
}

- (UIViewController)findMyWaldoMapViewController
{
  return self->_findMyWaldoMapViewController;
}

- (void)setFindMyWaldoMapViewController:(id)a3
{
}

- (CKDetailsTableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
}

- (CKDetailsGroupNameCell)groupNameCell
{
  return self->_groupNameCell;
}

- (void)setGroupNameCell:(id)a3
{
}

- (CKGroupPhotoCell)groupPhotoCell
{
  return self->_groupPhotoCell;
}

- (void)setGroupPhotoCell:(id)a3
{
}

- (double)showMoreContactCellHeight
{
  return self->_showMoreContactCellHeight;
}

- (void)setShowMoreContactCellHeight:(double)a3
{
  self->_showMoreContactCellHeight = a3;
}

- (double)addContactCellHeight
{
  return self->_addContactCellHeight;
}

- (void)setAddContactCellHeight:(double)a3
{
  self->_addContactCellHeight = a3;
}

- (double)groupPhotoHeaderHeight
{
  return self->_groupPhotoHeaderHeight;
}

- (void)setGroupPhotoHeaderHeight:(double)a3
{
  self->_groupPhotoHeaderHeight = a3;
}

- (double)simLabelCellHeight
{
  return self->_simLabelCellHeight;
}

- (void)setSimLabelCellHeight:(double)a3
{
  self->_simLabelCellHeight = a3;
}

- (double)tuConversationCellHeight
{
  return self->_tuConversationCellHeight;
}

- (void)setTuConversationCellHeight:(double)a3
{
  self->_tuConversationCellHeight = a3;
}

- (BOOL)shouldForceGroupPhotoHeaderReload
{
  return self->_shouldForceGroupPhotoHeaderReload;
}

- (void)setShouldForceGroupPhotoHeaderReload:(BOOL)a3
{
  self->_shouldForceGroupPhotoHeaderReload = a3;
}

- (NSData)selectedImageData
{
  return self->_selectedImageData;
}

- (void)setSelectedImageData:(id)a3
{
}

- (void)setGroupNameView:(id)a3
{
}

- (CKDetailsMapViewCell)mapViewCell
{
  return self->_mapViewCell;
}

- (void)setMapViewCell:(id)a3
{
}

- (void)setSimCell:(id)a3
{
}

- (void)setLocationShareCell:(id)a3
{
}

- (CKDetailsLocationStringCell)locationStringCell
{
  return self->_locationStringCell;
}

- (void)setLocationStringCell:(id)a3
{
}

- (void)setSimSwitchCell:(id)a3
{
}

- (void)setLocationSendOrRequestCell:(id)a3
{
}

- (void)setLocationStartShareCell:(id)a3
{
}

- (void)setSendCurrentLocationCell:(id)a3
{
}

- (void)setOpenInContactsCell:(id)a3
{
}

- (void)setChangeGroupNamePhotoCell:(id)a3
{
}

- (CKDetailsSearchViewController)searchViewController
{
  return self->_searchViewController;
}

- (void)setSearchViewController:(id)a3
{
}

- (CNGroupIdentityHeaderViewController)groupPhotoHeaderViewController
{
  return self->_groupPhotoHeaderViewController;
}

- (void)setGroupPhotoHeaderViewController:(id)a3
{
}

- (CKNavigationController)groupNavigationController
{
  return self->_groupNavigationController;
}

- (void)setGroupNavigationController:(id)a3
{
}

- (UIButton)screenShareContextButton
{
  return self->_screenShareContextButton;
}

- (void)setScreenShareContextButton:(id)a3
{
}

- (CKGroupRecipientSelectionController)addRecipientsController
{
  return self->_addRecipientsController;
}

- (void)setAddRecipientsController:(id)a3
{
}

- (FMFMapViewController)mapViewController
{
  return self->_mapViewController;
}

- (void)setMapViewController:(id)a3
{
}

- (void)setLocationSharingTextView:(id)a3
{
}

- (CKDetailsDownloadAttachmentsHeaderFooterView)downloadAttachmentsFooterView
{
  return self->_downloadAttachmentsFooterView;
}

- (void)setDownloadAttachmentsFooterView:(id)a3
{
}

- (void)setExpanseActivityTextView:(id)a3
{
}

- (void)setSharedWithYouFooterTextView:(id)a3
{
}

- (void)setBusinessInfoView:(id)a3
{
}

- (BOOL)shouldCollapseContactsSection
{
  return self->_shouldCollapseContactsSection;
}

- (void)setShouldCollapseContactsSection:(BOOL)a3
{
  self->_shouldCollapseContactsSection = a3;
}

- (double)contentOffsetYShiftAfterKeyboardNotification
{
  return self->_contentOffsetYShiftAfterKeyboardNotification;
}

- (void)setContentOffsetYShiftAfterKeyboardNotification:(double)a3
{
  self->_contentOffsetYShiftAfterKeyboardNotification = a3;
}

- selfWeakWrapper
{
  return self->_selfWeakWrapper;
}

- (void)setSelfWeakWrapper:(id)a3
{
}

- (BOOL)didPerformPurgedAttachmentsCheck
{
  return self->_didPerformPurgedAttachmentsCheck;
}

- (void)setDidPerformPurgedAttachmentsCheck:(BOOL)a3
{
  self->_didPerformPurgedAttachmentsCheck = a3;
}

- (unint64_t)undownloadedPhotoAttachmentCount
{
  return self->_undownloadedPhotoAttachmentCount;
}

- (void)setUndownloadedPhotoAttachmentCount:(unint64_t)a3
{
  self->_undownloadedPhotoAttachmentCount = a3;
}

- (unint64_t)downloadButtonState
{
  return self->_downloadButtonState;
}

- (BOOL)isDisplayingPhotos
{
  return self->_isDisplayingPhotos;
}

- (void)setIsDisplayingPhotos:(BOOL)a3
{
  self->_isDisplayingPhotos = a3;
}

- (BOOL)needsContactsReload
{
  return self->_needsContactsReload;
}

- (void)setNeedsContactsReload:(BOOL)a3
{
  self->_needsContactsReload = a3;
}

- (NSNumber)isSharingFocusStatus
{
  return self->_isSharingFocusStatus;
}

- (void)setIsSharingFocusStatus:(id)a3
{
}

- (NSNumber)canShareFocusStatus
{
  return self->_canShareFocusStatus;
}

- (void)setCanShareFocusStatus:(id)a3
{
}

- (BOOL)wasShowingReadReceiptSwitch
{
  return self->_wasShowingReadReceiptSwitch;
}

- (void)setWasShowingReadReceiptSwitch:(BOOL)a3
{
  self->_wasShowingReadReceiptSwitch = a3;
}

- (void)setKtSecurityFooterTextView:(id)a3
{
}

- (void)setKtEnhancedProtectionStateCell:(id)a3
{
}

- (void)setKtEnableEnhancedProtectionCell:(id)a3
{
}

- (void)setKtVerifyConversationCell:(id)a3
{
}

- (int64_t)ktEnhancedProtectionStatusCellState
{
  return self->_ktEnhancedProtectionStatusCellState;
}

- (void)setKtEnhancedProtectionStatusCellState:(int64_t)a3
{
  self->_int64_t ktEnhancedProtectionStatusCellState = a3;
}

- (NSArray)ktHandlesForKtChatStatus
{
  return self->_ktHandlesForKtChatStatus;
}

- (void)setKtHandlesForKtChatStatus:(id)a3
{
}

- (unint64_t)ktChatState
{
  return self->_ktChatState;
}

- (void)setKtChatState:(unint64_t)a3
{
  self->_unint64_t ktChatState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ktHandlesForKtChatStatus, 0);
  objc_storeStrong((id *)&self->_ktVerifyConversationCell, 0);
  objc_storeStrong((id *)&self->_ktEnableEnhancedProtectionCell, 0);
  objc_storeStrong((id *)&self->_ktEnhancedProtectionStateCell, 0);
  objc_storeStrong((id *)&self->_ktSecurityFooterTextView, 0);
  objc_storeStrong((id *)&self->_canShareFocusStatus, 0);
  objc_storeStrong((id *)&self->_isSharingFocusStatus, 0);
  objc_storeStrong(&self->_selfWeakWrapper, 0);
  objc_storeStrong((id *)&self->_businessInfoView, 0);
  objc_storeStrong((id *)&self->_sharedWithYouFooterTextView, 0);
  objc_storeStrong((id *)&self->_expanseActivityTextView, 0);
  objc_storeStrong((id *)&self->_downloadAttachmentsFooterView, 0);
  objc_storeStrong((id *)&self->_locationSharingTextView, 0);
  objc_storeStrong((id *)&self->_mapViewController, 0);
  objc_storeStrong((id *)&self->_addRecipientsController, 0);
  objc_storeStrong((id *)&self->_screenShareContextButton, 0);
  objc_storeStrong((id *)&self->_groupNavigationController, 0);
  objc_storeStrong((id *)&self->_groupPhotoHeaderViewController, 0);
  objc_storeStrong((id *)&self->_searchViewController, 0);
  objc_storeStrong((id *)&self->_changeGroupNamePhotoCell, 0);
  objc_storeStrong((id *)&self->_openInContactsCell, 0);
  objc_storeStrong((id *)&self->_sendCurrentLocationCell, 0);
  objc_storeStrong((id *)&self->_locationStartShareCell, 0);
  objc_storeStrong((id *)&self->_locationSendOrRequestCell, 0);
  objc_storeStrong((id *)&self->_simSwitchCell, 0);
  objc_storeStrong((id *)&self->_locationStringCell, 0);
  objc_storeStrong((id *)&self->_locationShareCell, 0);
  objc_storeStrong((id *)&self->_simCell, 0);
  objc_storeStrong((id *)&self->_mapViewCell, 0);
  objc_storeStrong((id *)&self->_groupNameView, 0);
  objc_storeStrong((id *)&self->_selectedImageData, 0);
  objc_storeStrong((id *)&self->_groupPhotoCell, 0);
  objc_storeStrong((id *)&self->_groupNameCell, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_findMyWaldoMapViewController, 0);
  objc_storeStrong((id *)&self->_presentedEntity, 0);
  objc_storeStrong((id *)&self->_suggestionsEnabledContactStore, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_fmfUpdateTimer, 0);
  objc_storeStrong((id *)&self->_contactsManager, 0);
  objc_storeStrong((id *)&self->_conversation, 0);

  objc_destroyWeak((id *)&self->_detailsControllerDelegate);
}

- (id)simCellText:(id)a3
{
  BOOL v3 = CKFrameworkBundle();
  id v4 = [v3 localizedStringForKey:@"DETAILS_VIEW_SWITCH_SIM_CELL" value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v4;
}

- (void)metricDSDSLineSwitchWithPreviousServiceName:(id)a3 newServiceName:(id)a4 isGroupConversation:(BOOL)a5
{
  BOOL v5 = a5;
  v22[1] = *MEMORY[0x1E4F143B8];
  CGFloat v7 = (void *)MEMORY[0x1E4F6E1A0];
  uint64_t v8 = *MEMORY[0x1E4F6E1A0];
  id v9 = a4;
  int v10 = [a3 isEqualToString:v8];
  int v11 = [v9 isEqualToString:*v7];

  uint64_t v12 = 6;
  if (v5) {
    uint64_t v12 = 10;
  }
  uint64_t v13 = 5;
  if (v5) {
    uint64_t v13 = 9;
  }
  if (v11) {
    uint64_t v12 = v13;
  }
  uint64_t v14 = 4;
  if (v5) {
    uint64_t v14 = 8;
  }
  uint64_t v15 = 3;
  if (v5) {
    uint64_t v15 = 7;
  }
  if (v11) {
    uint64_t v14 = v15;
  }
  if (v10) {
    uint64_t v16 = v14;
  }
  else {
    uint64_t v16 = v12;
  }
  double v17 = [MEMORY[0x1E4F6E890] sharedInstance];
  uint64_t v18 = *MEMORY[0x1E4F6D818];
  double v21 = @"type";
  uint64_t v19 = [NSNumber numberWithUnsignedInteger:v16];
  v22[0] = v19;
  double v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  [v17 trackEvent:v18 withDictionary:v20];
}

- (void)switchSubscriptionToContext:(id)a3
{
  id v48 = a3;
  id v4 = [(CKDetailsController *)self conversation];
  BOOL v5 = [v4 chat];
  double v6 = [v5 lastAddressedSIMID];

  CGFloat v7 = [(CKDetailsController *)self conversation];
  uint64_t v8 = [v7 chat];
  id v9 = [v8 lastAddressedHandleID];

  if ([v9 length] || objc_msgSend(v6, "length"))
  {
    uint64_t v10 = (uint64_t)v9;
  }
  else
  {
    id v38 = [(CKDetailsController *)self conversation];
    uint64_t v39 = [v38 chat];
    uint64_t v40 = [v39 account];
    uint64_t v10 = [v40 strippedLogin];

    if (_IMWillLog())
    {
      uint64_t v41 = v10;
      _IMAlwaysLog();
    }
  }
  int v11 = [(CKDetailsController *)self conversation];
  uint64_t v12 = [v11 chat];
  uint64_t v13 = [v12 account];
  uint64_t v14 = [v13 serviceName];

  if (_IMWillLog())
  {
    uint64_t v44 = v6;
    id v45 = v48;
    uint64_t v42 = v10;
    _IMAlwaysLog();
  }
  uint64_t v15 = objc_msgSend(v48, "labelID", v42, v44, v45);
  CGRect v46 = (void *)v10;
  v47 = v6;
  if ([v15 length] && (objc_msgSend(v15, "isEqualToString:", v6) & 1) == 0)
  {
    id v17 = v15;
    uint64_t v16 = [v48 phoneNumber];
  }
  else
  {
    uint64_t v16 = 0;
    id v17 = 0;
  }
  uint64_t v18 = [MEMORY[0x1E4F6BBD8] sharedInstance];
  uint64_t v19 = [v18 iMessageAccountForLastAddressedHandle:v16 simID:v17];

  if (v19)
  {
    double v20 = [v19 serviceName];
    int v21 = [v20 isEqualToString:*MEMORY[0x1E4F6E1B0]];

    if (v21)
    {
      double v22 = [(CKDetailsController *)self conversation];
      CGRect v23 = [v22 chat];
      [v23 forceCancelTypingIndicator];
    }
  }
  CGRect v24 = [(CKDetailsController *)self conversation];
  int v25 = [v24 chat];
  [v25 setLastAddressedHandleID:v16];

  id v26 = [(CKDetailsController *)self conversation];
  uint64_t v27 = [v26 chat];
  [v27 setLastAddressedSIMID:v17];

  char v28 = [(CKDetailsController *)self conversation];
  uint64_t v29 = [v28 chat];
  uint64_t v30 = [v29 account];
  BOOL v31 = [v30 serviceName];

  unint64_t v32 = [(CKDetailsController *)self conversation];
  -[CKDetailsController metricDSDSLineSwitchWithPreviousServiceName:newServiceName:isGroupConversation:](self, "metricDSDSLineSwitchWithPreviousServiceName:newServiceName:isGroupConversation:", v14, v31, [v32 isGroupConversation]);

  if (_IMWillLog())
  {
    long long v33 = [(CKDetailsController *)self conversation];
    long long v34 = [v33 chat];
    uint64_t v43 = [v34 guid];
    _IMAlwaysLog();
  }
  uint64_t v35 = [(CKDetailsController *)self conversation];
  long long v36 = [v35 chat];
  uint64_t v37 = [v48 label];
  [v36 updateLineSwitchedTo:v37];
}

- (BOOL)shouldShowSIMTypeSection
{
  char v2 = [(CKDetailsController *)self conversation];
  BOOL v3 = [v2 chat];
  char v4 = [v3 supportsCapabilities:0x2000];

  return v4;
}

- (BOOL)isGroupChat
{
  char v2 = [(CKDetailsController *)self conversation];
  BOOL v3 = [v2 chat];
  char v4 = [v3 isGroupChat];

  return v4;
}

- (BOOL)supportsChatNameAndPhotoHeader
{
  return 1;
}

- (BOOL)canLeaveConversation
{
  char v2 = [(CKDetailsController *)self conversation];
  if ([v2 hasLeft]) {
    char v3 = 0;
  }
  else {
    char v3 = [v2 canLeave];
  }

  return v3;
}

- (BOOL)shouldShowGroupCount
{
  int v3 = CKIsRunningInMacCatalyst();
  if (v3)
  {
    char v4 = [(CKDetailsController *)self conversation];
    char v5 = [v4 isGroupConversation];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)shouldShowSharedWithYouFeatures
{
  char v2 = [(CKDetailsController *)self conversation];
  int v3 = [v2 chat];
  char v4 = [v3 shouldShowAutoDonationAction];

  return v4;
}

- (BOOL)shouldShowEnhancedGroupFeatures
{
  char v2 = [(CKDetailsController *)self conversation];
  if ([v2 isGroupConversation]) {
    char v3 = [v2 supportsMutatingGroupMembers];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)conversationHasLeft
{
  char v2 = [(CKDetailsController *)self conversation];
  if ([v2 isGroupConversation] && objc_msgSend(v2, "canLeave")) {
    char v3 = [v2 hasLeft];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)shouldEnableAddContactButton
{
  int v3 = [(CKDetailsController *)self isGroupChat];
  if (v3)
  {
    if ([(CKDetailsController *)self conversationHasLeft]
      || ([(CKDetailsController *)self conversation],
          char v4 = objc_claimAutoreleasedReturnValue(),
          char v5 = [v4 isReadOnlyChat],
          v4,
          (v5 & 1) != 0))
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      double v6 = [MEMORY[0x1E4F6BC48] sharedInstance];
      char v7 = [v6 isSatelliteConnectionActive];

      LOBYTE(v3) = v7 ^ 1;
    }
  }
  return v3;
}

- (id)emailAddressesForChat:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  char v5 = objc_msgSend(v3, "participants", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        int v11 = [v10 ID];
        char IsEmail = IMStringIsEmail();

        if ((IsEmail & 1) == 0)
        {

          uint64_t v15 = &stru_1EDE4CA38;
          goto LABEL_14;
        }
        uint64_t v13 = [v10 ID];
        [v4 addObject:v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  if ([v4 count])
  {
    uint64_t v14 = [v4 componentsJoinedByString:@","];
  }
  else
  {
    uint64_t v14 = &stru_1EDE4CA38;
  }
  uint64_t v15 = v14;
LABEL_14:

  return v15;
}

- (id)screenShareContextMenuForEntity:(id)a3
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [MEMORY[0x1E4F1CA48] array];
  if (v4)
  {
    id location = 0;
    objc_initWeak(&location, self);
    uint64_t v6 = (void *)MEMORY[0x1E4F426E8];
    uint64_t v7 = CKFrameworkBundle();
    uint64_t v8 = [v7 localizedStringForKey:@"INVITE_TO_SHARE_MY_SCREEN" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    void v24[2] = __71__CKDetailsController_ContactActions__screenShareContextMenuForEntity___block_invoke;
    v24[3] = &unk_1E56210D8;
    objc_copyWeak(&v26, &location);
    id v9 = v4;
    id v25 = v9;
    uint64_t v10 = [v6 actionWithTitle:v8 image:0 identifier:0 handler:v24];

    int v11 = (void *)MEMORY[0x1E4F426E8];
    uint64_t v12 = CKFrameworkBundle();
    uint64_t v13 = [v12 localizedStringForKey:@"ASK_TO_SHARE_THEIR_SCREEN" value:&stru_1EDE4CA38 table:@"ChatKit"];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    long long v20 = __71__CKDetailsController_ContactActions__screenShareContextMenuForEntity___block_invoke_2;
    int v21 = &unk_1E56210D8;
    objc_copyWeak(&v23, &location);
    id v22 = v9;
    uint64_t v14 = [v11 actionWithTitle:v13 image:0 identifier:0 handler:&v18];

    v28[0] = v10;
    v28[1] = v14;
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v28, 2, v18, v19, v20, v21);
    [v5 addObjectsFromArray:v15];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  uint64_t v16 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v5];

  return v16;
}

void __71__CKDetailsController_ContactActions__screenShareContextMenuForEntity___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v2 = [WeakRetained contactsManager];
  [v2 startCommunicationForEntity:*(void *)(a1 + 32) action:5 address:0];
}

void __71__CKDetailsController_ContactActions__screenShareContextMenuForEntity___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v2 = [WeakRetained contactsManager];
  [v2 startCommunicationForEntity:*(void *)(a1 + 32) action:6 address:0];
}

- (void)openInContacts
{
  id v3 = [(CKDetailsController *)self conversation];
  id v4 = [v3 recipients];
  id v9 = [v4 firstObject];

  char v5 = [v9 defaultIMHandle];
  uint64_t v6 = [v5 cnContactWithKeys:MEMORY[0x1E4F1CBF0]];

  int v7 = [MEMORY[0x1E4F6E6D8] isCNContactAKnownContact:v6];
  if (!CKIsRunningInMacCatalyst() || v7)
  {
    uint64_t v8 = [(CKDetailsController *)self view];
    [(CKDetailsController *)self showContactCardForEntity:v9 fromView:v8];
  }
}

- (id)setupAlternativeCommunicationActionsForChat:(id)a3
{
  v42[2] = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  id v4 = objc_opt_new();
  if (CKIsRunningInMacCatalyst()
    || ![(CKDetailsController *)self conversationHasLeft])
  {
    long long v34 = [(CKDetailsController *)self createAudioCallActionItemForChat:v36];
    long long v33 = [(CKDetailsController *)self createVideoCallActionItemForChat:v36];
    [v4 addObject:v34];
    [v4 addObject:v33];
    id v35 = objc_alloc_init(MEMORY[0x1E4F1BA28]);
    char v5 = [MEMORY[0x1E4F1BC18] descriptorForRequiredKeys];
    v42[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1BA28] descriptorForRequiredKeys];
    v42[1] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];

    uint64_t v8 = [(CKDetailsController *)self conversation];
    id v9 = [v8 chat];
    uint64_t v10 = [v9 participants];
    uint64_t v11 = [v10 count];

    uint64_t v12 = [(CKDetailsController *)self conversation];
    uint64_t v13 = [v12 conversationVisualIdentityWithKeys:v7 requestedNumberOfContactsToFetch:v11];

    if (objc_opt_respondsToSelector())
    {
      uint64_t v14 = [v13 contacts];
      uint64_t v15 = [v35 mailUrlForContacts:v14 needsEmailAddresses:1];
    }
    else
    {
      uint64_t v15 = 0;
    }
    BOOL v31 = v15 != 0;
    int v30 = [v36 supportsCapabilities:0x4000];
    id v16 = objc_alloc(MEMORY[0x1E4F1BBC8]);
    long long v17 = CKFrameworkBundle();
    uint64_t v18 = [v17 localizedStringForKey:@"MAIL_BUTTON_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    uint64_t v19 = v13;
    long long v20 = (void *)v7;
    int v21 = v4;
    uint64_t v22 = *MEMORY[0x1E4F1AD38];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __83__CKDetailsController_ContactActions__setupAlternativeCommunicationActionsForChat___block_invoke;
    v40[3] = &unk_1E562A528;
    id v32 = v15;
    id v41 = v32;
    uint64_t v23 = v22;
    id v4 = v21;
    CGRect v24 = (void *)[v16 initWithTitle:v18 actionType:v23 actionBlock:v40];

    if (objc_opt_respondsToSelector()) {
      [v24 setShouldOverrideEnabledState:1];
    }
    if (objc_opt_respondsToSelector()) {
      [v24 setOverrideEnabledState:v30 & v31];
    }
    [v21 addObject:v24];
    id location = 0;
    objc_initWeak(&location, self);
    if (v11 == 1)
    {
      id v25 = objc_alloc(MEMORY[0x1E4F1BBC8]);
      id v26 = CKFrameworkBundle();
      uint64_t v27 = [v26 localizedStringForKey:@"INFO_BUTTON_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __83__CKDetailsController_ContactActions__setupAlternativeCommunicationActionsForChat___block_invoke_3;
      v37[3] = &unk_1E562A550;
      objc_copyWeak(&v38, &location);
      char v28 = (void *)[v25 initWithTitle:v27 actionType:@"OpenInContacts" systemImageName:@"person.crop.circle.fill" overrideEnabledState:1 actionBlock:v37];

      [v28 setShouldPresentDisambiguationUI:0];
      [v21 addObject:v28];

      objc_destroyWeak(&v38);
    }
    objc_destroyWeak(&location);
  }

  return v4;
}

void __83__CKDetailsController_ContactActions__setupAlternativeCommunicationActionsForChat___block_invoke(uint64_t a1)
{
  char v2 = [MEMORY[0x1E4F42738] sharedApplication];
  id v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __83__CKDetailsController_ContactActions__setupAlternativeCommunicationActionsForChat___block_invoke_2;
  v4[3] = &unk_1E5620BF0;
  id v5 = v3;
  [v2 openURL:v5 options:MEMORY[0x1E4F1CC08] completionHandler:v4];
}

uint64_t __83__CKDetailsController_ContactActions__setupAlternativeCommunicationActionsForChat___block_invoke_2()
{
  uint64_t result = _IMWillLog();
  if (result) {
    return _IMAlwaysLog();
  }
  return result;
}

void __83__CKDetailsController_ContactActions__setupAlternativeCommunicationActionsForChat___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained openInContacts];
}

- (id)createAudioCallActionItemForChat:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKDetailsController *)self conversation];
  BOOL v6 = +[CKFaceTimeUtilities isFaceTimeVideoAvailable:v5];

  uint64_t v7 = [(CKDetailsController *)self conversation];
  LODWORD(v5) = [v7 isGroupConversation];

  int v8 = v5 ^ 1 | v6;
  if ((v5 & 1) == 0 && !v6) {
    int v8 = +[CKFaceTimeUtilities isTelephonyAvailable];
  }
  uint64_t v9 = [v4 supportsCapabilities:0x4000] & v8;
  id v10 = objc_alloc(MEMORY[0x1E4F1BBC8]);
  uint64_t v11 = +[CKUIBehavior sharedBehaviors];
  uint64_t v12 = objc_msgSend(v11, "__ck_localizedString:", @"CALL_BUTTON_TITLE");
  uint64_t v13 = *MEMORY[0x1E4F1AD20];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __72__CKDetailsController_ContactActions__createAudioCallActionItemForChat___block_invoke;
  long long v20 = &unk_1E562A578;
  char v22 = v9;
  id v14 = v4;
  id v21 = v14;
  uint64_t v15 = (void *)[v10 initWithTitle:v12 actionType:v13 actionBlock:&v17];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v15, "setShouldOverrideEnabledState:", 1, v17, v18, v19, v20);
  }
  if (objc_opt_respondsToSelector()) {
    [v15 setOverrideEnabledState:v9];
  }

  return v15;
}

uint64_t __72__CKDetailsController_ContactActions__createAudioCallActionItemForChat___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) initiateTUConversationWithVideoEnabled:0];
  }
  return result;
}

- (id)createVideoCallActionItemForChat:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKDetailsController *)self conversation];
  BOOL v6 = +[CKFaceTimeUtilities isFaceTimeVideoAvailable:v5];

  uint64_t v7 = [v4 supportsCapabilities:0x4000] & v6;
  id v8 = objc_alloc(MEMORY[0x1E4F1BBC8]);
  uint64_t v9 = +[CKUIBehavior sharedBehaviors];
  id v10 = objc_msgSend(v9, "__ck_localizedString:", @"VIDEO_BUTTON_TITLE");
  uint64_t v11 = *MEMORY[0x1E4F1AD78];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __72__CKDetailsController_ContactActions__createVideoCallActionItemForChat___block_invoke;
  uint64_t v18 = &unk_1E562A578;
  char v20 = v7;
  id v12 = v4;
  id v19 = v12;
  uint64_t v13 = (void *)[v8 initWithTitle:v10 actionType:v11 actionBlock:&v15];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v13, "setShouldOverrideEnabledState:", 1, v15, v16, v17, v18);
  }
  if (objc_opt_respondsToSelector()) {
    [v13 setOverrideEnabledState:v7];
  }

  return v13;
}

uint64_t __72__CKDetailsController_ContactActions__createVideoCallActionItemForChat___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) initiateTUConversationWithVideoEnabled:1];
  }
  return result;
}

- (void)showContactCardForEntity:(id)a3 fromView:(id)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = [(CKDetailsController *)self navigationController];
  uint64_t v7 = [v6 topViewController];

  if (v7 == self)
  {
    id v8 = [MEMORY[0x1E4F1BBA8] descriptorForRequiredKeys];
    v39[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];

    id v10 = (void *)MEMORY[0x1E4F6E6D8];
    uint64_t v11 = [v5 defaultIMHandle];
    id v12 = [v11 cnContactWithKeys:v9];
    int v13 = [v10 isCNContactAKnownContact:v12];

    if (v13)
    {
      id v14 = [(CKDetailsController *)self suggestionsEnabledContactStore];
      uint64_t v15 = [v5 defaultIMHandle];
      uint64_t v16 = [v15 cnContactWithKeys:MEMORY[0x1E4F1CBF0]];
      uint64_t v17 = [v16 identifier];
      uint64_t v18 = [v14 unifiedContactWithIdentifier:v17 keysToFetch:v9 error:0];
    }
    else
    {
      uint64_t v18 = [v5 cnContactWithKeys:v9 shouldFetchSuggestedContact:1];
    }
    id v19 = [v5 defaultIMHandle];
    char v20 = [v19 ID];
    int v21 = [v20 _appearsToBePhoneNumber];
    char v22 = (id *)MEMORY[0x1E4F1AEE0];
    if (!v21) {
      char v22 = (id *)MEMORY[0x1E4F1ADC8];
    }
    id v23 = *v22;

    if (v13) {
      [MEMORY[0x1E4F1BBA8] viewControllerForContact:v18];
    }
    else {
    CGRect v24 = [MEMORY[0x1E4F1BBA8] viewControllerForUnknownContact:v18];
    }
    id v25 = [v5 defaultIMHandle];
    id v26 = [v25 ID];
    uint64_t v27 = [v18 identifierForKey:v23 withDestination:v26];
    [v24 highlightPropertyWithKey:v23 identifier:v27];

    char v28 = [(CKDetailsController *)self suggestionsEnabledContactStore];
    [v24 setContactStore:v28];

    objc_msgSend(v24, "setActions:", objc_msgSend(v24, "actions") | 0x80);
    if (objc_opt_respondsToSelector()) {
      [v24 setShouldUseModernNavigationBarHiding:1];
    }
    if ((CNUIIsMessages() & v13) == 1
      && [(CKDetailsController *)self fmfEnabled]
      && ![(CKDetailsController *)self fmfRestricted])
    {
      uint64_t v29 = [MEMORY[0x1E4F6BCB8] sharedInstance];
      int v30 = [v5 defaultIMHandle];
      uint64_t v31 = [v29 handleIsFollowingMyLocation:v30];

      id v32 = CKFrameworkBundle();
      long long v33 = v32;
      if (v31) {
        long long v34 = @"STOP_SHARE_LOCATION";
      }
      else {
        long long v34 = @"SHARE_LOCATION";
      }
      id v35 = [v32 localizedStringForKey:v34 value:&stru_1EDE4CA38 table:@"ChatKit"];

      [(CKDetailsController *)self setPresentedEntity:v5];
      id v36 = [v24 contentViewController];
      [v36 setShouldShowLinkedContacts:1];
      uint64_t v37 = [v36 cardFooterGroup];
      [v36 addActionWithTitle:v35 target:self selector:sel__toggleSharingStateFromABCard inGroup:v37 destructive:v31];
    }
    id v38 = [(CKDetailsController *)self navigationController];
    [v38 pushViewController:v24 animated:1];
  }
}

- (void)_toggleSharingStateFromABCard
{
  id v3 = [(CKDetailsController *)self presentedEntity];
  id v4 = [v3 defaultIMHandle];

  id v5 = [(CKDetailsController *)self conversation];
  uint64_t v44 = [v5 chat];

  BOOL v6 = [MEMORY[0x1E4F6BCB8] sharedInstance];
  int v7 = [v6 handleIsFollowingMyLocation:v4];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__CKDetailsController_ContactActions___toggleSharingStateFromABCard__block_invoke;
  aBlock[3] = &unk_1E5620BF0;
  void aBlock[4] = self;
  id v45 = _Block_copy(aBlock);
  id v8 = [MEMORY[0x1E4F42728] alertControllerWithTitle:0 message:0 preferredStyle:0];
  uint64_t v9 = (void *)MEMORY[0x1E4F42720];
  id v10 = CKFrameworkBundle();
  uint64_t v11 = v10;
  if (v7)
  {
    id v12 = [v10 localizedStringForKey:@"STOP_SHARE_LOCATION" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __68__CKDetailsController_ContactActions___toggleSharingStateFromABCard__block_invoke_2;
    v58[3] = &unk_1E5623030;
    uint64_t v43 = &v59;
    id v59 = v4;
    uint64_t v42 = &v60;
    int v13 = &v61;
    id v60 = v44;
    CGRect v61 = v45;
    id v14 = v45;
    uint64_t v15 = [v9 actionWithTitle:v12 style:2 handler:v58];
    [v8 addAction:v15];

    uint64_t v16 = (void *)MEMORY[0x1E4F42720];
    uint64_t v17 = CKFrameworkBundle();
    uint64_t v18 = [v17 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
    id v19 = [v16 actionWithTitle:v18 style:1 handler:0];
    [v8 addAction:v19];
  }
  else
  {
    char v20 = [v10 localizedStringForKey:@"SHARE_LOCATION_ONE_HOUR" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __68__CKDetailsController_ContactActions___toggleSharingStateFromABCard__block_invoke_3;
    v54[3] = &unk_1E5623030;
    uint64_t v43 = &v55;
    id v21 = v4;
    id v55 = v21;
    uint64_t v42 = &v56;
    id v22 = v44;
    id v56 = v22;
    id v23 = v45;
    id v57 = v23;
    CGRect v24 = [v9 actionWithTitle:v20 style:0 handler:v54];
    [v8 addAction:v24];

    id v25 = (void *)MEMORY[0x1E4F42720];
    id v26 = CKFrameworkBundle();
    [v26 localizedStringForKey:@"SHARE_LOCATION_EOD" value:&stru_1EDE4CA38 table:@"ChatKit"];
    uint64_t v27 = v41 = v4;
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __68__CKDetailsController_ContactActions___toggleSharingStateFromABCard__block_invoke_4;
    v50[3] = &unk_1E5623030;
    id v28 = v21;
    id v51 = v28;
    id v29 = v22;
    id v52 = v29;
    id v30 = v23;
    id v53 = v30;
    uint64_t v31 = [v25 actionWithTitle:v27 style:0 handler:v50];
    [v8 addAction:v31];

    id v32 = (void *)MEMORY[0x1E4F42720];
    long long v33 = CKFrameworkBundle();
    long long v34 = [v33 localizedStringForKey:@"SHARE_INDEFINITELY" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __68__CKDetailsController_ContactActions___toggleSharingStateFromABCard__block_invoke_5;
    v46[3] = &unk_1E5623030;
    id v47 = v28;
    id v48 = v29;
    id v49 = v30;
    id v35 = v30;
    id v36 = [v32 actionWithTitle:v34 style:0 handler:v46];
    [v8 addAction:v36];

    uint64_t v37 = (void *)MEMORY[0x1E4F42720];
    id v38 = CKFrameworkBundle();
    uint64_t v39 = [v38 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
    uint64_t v40 = [v37 actionWithTitle:v39 style:1 handler:0];
    [v8 addAction:v40];

    int v13 = &v57;
    id v4 = v41;

    uint64_t v17 = v51;
  }

  [(CKDetailsController *)self presentViewController:v8 animated:1 completion:0];
}

void __68__CKDetailsController_ContactActions___toggleSharingStateFromABCard__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) navigationController];
  id v16 = [v4 topViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v16;
    BOOL v6 = CKFrameworkBundle();
    int v7 = v6;
    if (a2) {
      id v8 = @"STOP_SHARE_LOCATION";
    }
    else {
      id v8 = @"SHARE_LOCATION";
    }
    uint64_t v9 = [v6 localizedStringForKey:v8 value:&stru_1EDE4CA38 table:@"ChatKit"];

    id v10 = [v5 contentViewController];
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = [v10 cardFooterGroup];
    [v10 removeActionWithTarget:v11 selector:sel__toggleSharingStateFromABCard inGroup:v12];

    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = [v10 cardFooterGroup];
    [v10 addActionWithTitle:v9 target:v13 selector:sel__toggleSharingStateFromABCard inGroup:v14 destructive:a2];
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) navigationController];
    id v15 = (id)[v5 popToViewController:*(void *)(a1 + 32) animated:1];
  }
}

uint64_t __68__CKDetailsController_ContactActions___toggleSharingStateFromABCard__block_invoke_2(void *a1)
{
  char v2 = [MEMORY[0x1E4F6BCB8] sharedInstance];
  [v2 stopSharingWithHandle:a1[4] inChat:a1[5]];

  id v3 = *(uint64_t (**)(void))(a1[6] + 16);

  return v3();
}

uint64_t __68__CKDetailsController_ContactActions___toggleSharingStateFromABCard__block_invoke_3(void *a1)
{
  char v2 = [MEMORY[0x1E4F6BCB8] sharedInstance];
  [v2 startSharingWithHandle:a1[4] inChat:a1[5] withDuration:0];

  id v3 = *(uint64_t (**)(void))(a1[6] + 16);

  return v3();
}

uint64_t __68__CKDetailsController_ContactActions___toggleSharingStateFromABCard__block_invoke_4(void *a1)
{
  char v2 = [MEMORY[0x1E4F6BCB8] sharedInstance];
  [v2 startSharingWithHandle:a1[4] inChat:a1[5] withDuration:1];

  id v3 = *(uint64_t (**)(void))(a1[6] + 16);

  return v3();
}

uint64_t __68__CKDetailsController_ContactActions___toggleSharingStateFromABCard__block_invoke_5(void *a1)
{
  char v2 = [MEMORY[0x1E4F6BCB8] sharedInstance];
  [v2 startSharingWithHandle:a1[4] inChat:a1[5] withDuration:2];

  id v3 = *(uint64_t (**)(void))(a1[6] + 16);

  return v3();
}

void __56__CKDetailsController__determineFocusStatusSharingState__block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "Error determining if focus status is shared with chat, leaving switch disabled. Error: %@", (uint8_t *)&v3, 0xCu);
}

void __50__CKDetailsController_setShareFocusStatus_reload___block_invoke_446_cold_1()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_3();
  uint64_t v5 = v0;
  __int16 v6 = v1;
  uint64_t v7 = v2;
  _os_log_error_impl(&dword_18EF18000, v3, OS_LOG_TYPE_ERROR, "Error manually sharing focus with handleID: %@ fromHandleID: %@ error: %@", v4, 0x20u);
}

void __50__CKDetailsController_setShareFocusStatus_reload___block_invoke_448_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_3();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_18EF18000, v1, OS_LOG_TYPE_ERROR, "Error manually unsharing focus with handleID: %@ error: %@", v2, 0x16u);
}

@end