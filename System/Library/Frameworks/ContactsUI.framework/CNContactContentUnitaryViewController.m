@interface CNContactContentUnitaryViewController
+ (BOOL)actionModelIncludesTTY:(id)a3;
+ (BOOL)enablesTransportButtons;
+ (BOOL)shouldShowGeminiForResult:(id)a3 contact:(id)a4;
+ (id)BOOLStateRestorationProperties;
+ (id)descriptorForRequiredKeys;
+ (id)descriptorForRequiredKeysForContact:(id)a3;
+ (id)descriptorForRequiredKeysWithDescription:(id)a3;
+ (id)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4;
+ (int64_t)tableViewStyle;
+ (void)_telemetryForContact:(id)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)_hasAtLeastOneVerifiedHandle;
- (BOOL)_indexPathIsActionItem:(id)a3 forTableView:(id)a4;
- (BOOL)_isUnavailableAuthorizationPropertyKey:(id)a3;
- (BOOL)_modelHasChanges;
- (BOOL)_modelIsEmpty;
- (BOOL)allowsActions;
- (BOOL)allowsActionsModel;
- (BOOL)allowsAddToFavorites;
- (BOOL)allowsAddingToAddressBook;
- (BOOL)allowsCardActions;
- (BOOL)allowsConferencing;
- (BOOL)allowsContactBlocking;
- (BOOL)allowsContactBlockingAndReporting;
- (BOOL)allowsDisplayModePickerActions;
- (BOOL)allowsEditInApp;
- (BOOL)allowsEditPhoto;
- (BOOL)allowsEditing;
- (BOOL)allowsNamePicking;
- (BOOL)allowsSendMessage;
- (BOOL)allowsSettingLinkedContactsAsPreferred;
- (BOOL)allowsSharing;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canDisplayDefaultAppGroup;
- (BOOL)contactHasAvailablePropertiesToFavorite:(id)a3 isPhoneAppAvailable:(BOOL)a4 isFaceTimeAppAvailable:(BOOL)a5;
- (BOOL)contactInlineActionsViewController:(id)a3 shouldPerformActionOfType:(id)a4 withContactProperty:(id)a5;
- (BOOL)contactSupportsTTYCalls;
- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContact:(id)a4 propertyKey:(id)a5 propertyIdentifier:(id)a6;
- (BOOL)didEditPronouns;
- (BOOL)didFindStaticIdentity;
- (BOOL)didLookUpStaticIdentity;
- (BOOL)didSetFirstResponder;
- (BOOL)didSetNewContact;
- (BOOL)displayNavigationButtonsShouldUsePlatterStyle;
- (BOOL)editRequiresAuthorization;
- (BOOL)editingChangeRequiresAuthorization;
- (BOOL)forcesTransparentBackground;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)hadAtLeastOneVerifiedHandle;
- (BOOL)hasAvatarConstraints;
- (BOOL)hasEditingConstraints;
- (BOOL)hasExistingGroups;
- (BOOL)hasPendingChanges;
- (BOOL)hasPerformedSharedProfileBannerAnimation;
- (BOOL)hasPersonHeaderSectionForTableView:(id)a3;
- (BOOL)hasSetupViewHierarchy;
- (BOOL)hasSharedProfileBannerSectionForTableView:(id)a3;
- (BOOL)headerViewShouldCacheContactBackgroundColor:(id)a3;
- (BOOL)hideCardActions;
- (BOOL)highlightedPropertyImportant;
- (BOOL)isContactProviderDataSource;
- (BOOL)isHeaderViewContactBlocked:(id)a3;
- (BOOL)isHeaderViewPhotoProhibited;
- (BOOL)isMailVIP;
- (BOOL)isNicknameProhibited;
- (BOOL)isOrientationPhoneLandscape;
- (BOOL)isOutOfProcess;
- (BOOL)isPadCompactHorizontalSize;
- (BOOL)isPadRegularHorizontalSize;
- (BOOL)isPersonHeaderIndexPath:(id)a3 forTableView:(id)a4;
- (BOOL)isPersonHeaderSectionForTableView:(id)a3 section:(int64_t)a4;
- (BOOL)isPresentingFullscreenForOutOfProcess;
- (BOOL)isPresentingModalViewController;
- (BOOL)isScrollViewControllingHeaderResizeAnimation:(id)a3;
- (BOOL)isSharedProfileBannerSectionForTableView:(id)a3 section:(int64_t)a4;
- (BOOL)isSharedProfileBannerSectionIndexPath:(id)a3 forTableView:(id)a4;
- (BOOL)isStandardGroup:(id)a3;
- (BOOL)isSuggestedContact;
- (BOOL)labeledValuesHasNonSuggestion:(id)a3;
- (BOOL)layoutPositionallyAfterNavBar;
- (BOOL)needsReload;
- (BOOL)outOfProcessSetupComplete;
- (BOOL)performSave;
- (BOOL)reloadDataIfNeeded;
- (BOOL)requiresGameCenterRefresh;
- (BOOL)runningPPT;
- (BOOL)saveChanges;
- (BOOL)saveWasAuthorized;
- (BOOL)savingPersonalSharedProfile;
- (BOOL)shouldAddDefaultAppGroup;
- (BOOL)shouldAddFaceTimeGroup;
- (BOOL)shouldAddGameCenterActionGroup;
- (BOOL)shouldAddGameCenterGroup;
- (BOOL)shouldAddShareLocationGroup;
- (BOOL)shouldAllowContainerPicking;
- (BOOL)shouldDisplayAvatarHeaderView;
- (BOOL)shouldDrawNavigationBar;
- (BOOL)shouldIgnoreBlockListChange;
- (BOOL)shouldIgnoreContactStoreDidChangeNotification;
- (BOOL)shouldReallyShowLinkedContactsForEditingState:(BOOL)a3;
- (BOOL)shouldSetBackgroundColorToMatchHeader;
- (BOOL)shouldShowActionsForAvatarView:(id)a3;
- (BOOL)shouldShowGameCenter;
- (BOOL)shouldShowGemini;
- (BOOL)shouldShowSharedProfileBanner;
- (BOOL)shouldShowSharedProfileRow;
- (BOOL)shouldShowVerifiedFooterInSection:(int64_t)a3 inTableView:(id)a4;
- (BOOL)shouldUpdateSharedProfile;
- (BOOL)shouldUseSharedProfile;
- (BOOL)shouldUseStaticHeader;
- (BOOL)showContactBlockingFirst;
- (BOOL)showContactPhotoPosterCell;
- (BOOL)showingMeContact;
- (BOOL)showsGroupMembership;
- (BOOL)showsInlineActions;
- (BOOL)showsSharedProfile;
- (BOOL)supportsDrafts;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6;
- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4;
- (BOOL)usesBrandedCallHeaderFormat;
- (CAGradientLayer)contactViewBackgroundGradientLayer;
- (CGRect)centeredSourceRect:(CGRect)a3 inContactView:(id)a4;
- (CGSize)requiredSizeForVisibleTableView;
- (CGSize)setupTableHeaderView;
- (CNCancelable)faceTimeIDSLookupToken;
- (CNCancelable)iMessageIDSLookupToken;
- (CNCancelable)medicalIDLookupToken;
- (CNCardContactContainerGroup)cardEditingContactContainerGroup;
- (CNCardGameCenterGroup)gameCenterGroup;
- (CNCardGameCenterManager)gameCenterManager;
- (CNCardGroup)cardActionsGroup;
- (CNCardGroup)cardBlockContactGroup;
- (CNCardGroup)cardBottomGroup;
- (CNCardGroup)cardEditingActionsGroup;
- (CNCardGroup)cardEditingDeleteContactGroup;
- (CNCardGroup)cardGameCenterActionGroup;
- (CNCardGroup)cardMedicalIDGroup;
- (CNCardGroup)cardShareLocationGroup;
- (CNCardGroup)cardTopGroup;
- (CNCardGroupMembershipGroup)cardGroupMembershipGroup;
- (CNCardLinkedCardsGroup)cardLinkedCardsGroup;
- (CNCardNamePickingGroup)namePickingGroup;
- (CNCardPropertyGeminiGroup)cardEditingGeminiGroup;
- (CNCardSharedProfileGroup)cardSharedProfileGroup;
- (CNCardStaticIdentityGroup)cardStaticIdentityGroup;
- (CNContactAction)createReminderAction;
- (CNContactAction)deleteContactAction;
- (CNContactAction)gameCenterAddFriendAction;
- (CNContactAction)ignoreContactAction;
- (CNContactAction)shareContactAction;
- (CNContactAction)stopSharingWithFamilyAction;
- (CNContactActionProvider)actionProvider;
- (CNContactActionsContainerView)actionsWrapperView;
- (CNContactActionsContainerView)floatingActionsWrapperView;
- (CNContactAddAddressingGrammarAction)addAddressingGrammarAction;
- (CNContactAddFavoriteAction)addFavoriteAction;
- (CNContactAddLinkedCardAction)addLinkedCardAction;
- (CNContactAddNewFieldAction)addNewFieldAction;
- (CNContactAddToExistingContactAction)addToExistingContactAction;
- (CNContactAddToGroupAction)addToGroupAction;
- (CNContactClearRecentsDataAction)clearRecentsDataAction;
- (CNContactContainerPickerViewController)containerPicker;
- (CNContactContentUnitaryViewController)initWithContact:(id)a3;
- (CNContactContentUnitaryViewController)initWithContact:(id)a3 prohibitedPropertyKeys:(id)a4;
- (CNContactContentUnitaryViewController)initWithEnvironment:(id)a3;
- (CNContactContentUnitaryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CNContactCreateNewContactAction)createNewContactAction;
- (CNContactFormatter)contactFormatter;
- (CNContactHeaderCollapsedView)displayFloatingCollapsedHeaderView;
- (CNContactHeaderDisplayView)displayHeaderView;
- (CNContactHeaderEditView)editingHeaderView;
- (CNContactHeaderStaticDisplayView)staticDisplayHeaderView;
- (CNContactInlineActionsViewController)actionsViewController;
- (CNContactInlineActionsViewController)floatingActionsViewController;
- (CNContactSelectContainersAction)selectContainersAction;
- (CNContactSuggestionAction)suggestedContactAction;
- (CNContactToggleBlockCallerAction)blockAction;
- (CNContactToggleBlockReportCallerAction)blockReportAction;
- (CNContactUpdateExistingContactAction)updateExistingContactAction;
- (CNContactView)displayContactView;
- (CNContactView)editingContactView;
- (CNContactViewCache)contactViewCache;
- (CNContactViewControllerPPTDelegate)pptDelegate;
- (CNContactViewHostProtocol)delegate;
- (CNEmergencyContactAction)emergencyContactAction;
- (CNHealthStoreManagerToken)medicalIDRegistrationToken;
- (CNMeCardSharedProfileGroup)meCardSharedProfileGroup;
- (CNMedicalIDAction)medicalIDAction;
- (CNMutableContact)editingNicknameContact;
- (CNMutableContact)mutableContact;
- (CNMutableContact)mutableContactForHeaderView;
- (CNMutableContact)shadowCopyOfReadonlyContact;
- (CNPropertyAction)sendMessageAction;
- (CNPropertyFaceTimeAction)faceTimeAction;
- (CNPropertyLinkedCardsAction)linkedCardsAction;
- (CNPropertyNoteCell)noteCell;
- (CNScheduler)ktWorkQueue;
- (CNScheduler)mainThreadScheduler;
- (CNShareLocationController)shareLocationController;
- (CNSharedProfileStateOracle)sharedProfileStateOracle;
- (CNSiriContactContextProvider)siriContextProvider;
- (CNTUCallProvider)defaultAppProvider;
- (CNUIContactsEnvironment)environment;
- (CNUIContainerContext)containerContext;
- (CNUIEditAuthorizationController)editAuthorizationController;
- (CNUIGeminiDataSource)geminiDataSource;
- (CNUIGroupEditingContext)groupEditingContext;
- (CNUIGroupsAndContainersSaveManager)groupsAndContainersSaveManager;
- (CNUIStaticIdentity)cachedStaticIdentity;
- (CNUIUserActionListDataSource)actionsDataSource;
- (CNUIUserActivityManager)activityManager;
- (Class)groupClassForProperty:(id)a3;
- (HKHealthStore)healthStore;
- (NSArray)activatedConstraints;
- (NSArray)customActions;
- (NSArray)deletedEditingGroups;
- (NSArray)extraLeftBarButtonItems;
- (NSArray)extraRightBarButtonItems;
- (NSArray)headerViewBackgroundColors;
- (NSArray)highlightedProperties;
- (NSArray)nameEditingGroups;
- (NSArray)pendingLayoutBlocks;
- (NSArray)preEditLeftBarButtonItems;
- (NSDictionary)userActivityUserInfo;
- (NSLayoutConstraint)editingFloatingHeaderHeightConstraint;
- (NSLayoutConstraint)floatingHeaderHeightConstraint;
- (NSLayoutConstraint)headerHeightConstraint;
- (NSMapTable)cachedLabelWidths;
- (NSMutableArray)editingGroups;
- (NSMutableArray)editingLinkedContacts;
- (NSMutableArray)issuedSaveRequestIdentifiers;
- (NSMutableDictionary)groupsAfterGroup;
- (NSMutableSet)cachedVerifiedHandles;
- (NSString)emergencyNumberIdentifier;
- (UIEdgeInsets)headerViewSafeAreaInsets;
- (UIEdgeInsets)insetsForContactTableView:(id)a3;
- (UIEdgeInsets)peripheryInsets;
- (UIEdgeInsets)scrollIndicatorInsetsForContactTableView:(id)a3 withContentInsets:(UIEdgeInsets)a4;
- (UIGestureRecognizerDelegate)previousBackGestureDelegate;
- (UIKeyCommand)cancelCommand;
- (UIKeyCommand)editCommand;
- (UIKeyCommand)saveCommand;
- (UIView)contactViewBackgroundView;
- (UIView)editingFloatingCollapsedHeaderView;
- (UIView)headerDropShadowView;
- (double)actionsBottomMargin;
- (double)actionsTopMargin;
- (double)contentOffsetYForGlobalHeaderHeight:(double)a3 contentInset:(UIEdgeInsets)a4;
- (double)desiredHeightForWidth:(double)a3;
- (double)editingFloatingHeaderHeight;
- (double)globalHeaderHeightForContentOffset:(double)a3 contentInset:(UIEdgeInsets)a4;
- (double)keyboardVerticalOverlap;
- (double)navigationBarHeight;
- (double)staticDisplayHeaderHeight;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (double)updateHeaderConstraintForGlobalHeaderHeight:(double)a3 direction:(int64_t)a4 animated:(BOOL)a5;
- (id)_addAddressingGrammarAction;
- (id)_addCreateNewContactAction;
- (id)_addFavoriteActionWithConferencing:(BOOL)a3 telephony:(BOOL)a4;
- (id)_addGroupsInArray:(id)a3 afterGroup:(id)a4;
- (id)_addLinkedCardAction;
- (id)_addNewFieldAction;
- (id)_addToExistingContactAction;
- (id)_addToGroupAction;
- (id)_allDisplayPropertyItemsFromGroups:(id)a3;
- (id)_cardGroupAtTableViewSectionIndex:(int64_t)a3 forTableView:(id)a4;
- (id)_cellForIndexPath:(id)a3 forTableView:(id)a4;
- (id)_cellIdentifierForTableView:(id)a3 indexPath:(id)a4;
- (id)_clearRecentsDataAction;
- (id)_currentGroupsForTableView:(id)a3;
- (id)_currentTopVisibleGroupInContactView:(id)a3;
- (id)_displayGroupsForKeys:(id)a3;
- (id)_faceTimeAction;
- (id)_itemAtIndexPath:(id)a3 forTableView:(id)a4;
- (id)_labelWidthKeyForGroup:(id)a3;
- (id)_labelWidthKeyForItem:(id)a3;
- (id)_linkedCardsAction;
- (id)_loadDisplayGroups;
- (id)_loadEditingGroupsPreservingChanges:(BOOL)a3;
- (id)_loadNameEditingGroups;
- (id)_loadPropertyGroups;
- (id)_phoneticNameForValue:(id)a3 currentPhoneticName:(id)a4 property:(id)a5;
- (id)_policyForContact:(id)a3 mode:(int64_t)a4;
- (id)_propertyGroupsForKeys:(id)a3;
- (id)_removeUnauthorizedKeysFromContact:(id)a3;
- (id)_selectContainersAction;
- (id)_sendMessageActionAllowingEmailIDs:(BOOL)a3;
- (id)_shareContactAction;
- (id)_sharedProfileSettingsAction;
- (id)_updateContact:(id)a3 withMissingKeysFromRequiredKeys:(id)a4;
- (id)_updateExistingContactAction;
- (id)action:(id)a3 cellForPropertyItem:(id)a4 sender:(id)a5;
- (id)alreadyPickedGroups;
- (id)alternateName;
- (id)applyContactStyle;
- (id)authorizationCheck;
- (id)buttonPlatterImage;
- (id)cardActions;
- (id)cardDefaultAppGroup;
- (id)cardFaceTimeGroup;
- (id)cardFooterGroup;
- (id)cardGroupForProperty:(id)a3;
- (id)contact;
- (id)contactDelegate;
- (id)contactHeaderView;
- (id)contactStore;
- (id)contactView;
- (id)contactViewConfiguration;
- (id)contentScrollViewForEdge:(unint64_t)a3;
- (id)createActionsController;
- (id)currentNavigationController;
- (id)defaulTextColor;
- (id)displayGroups;
- (id)displayedProperties;
- (id)groupContext;
- (id)importantMessage;
- (id)indexPathOfDisplayedPropertyItem:(id)a3;
- (id)indexPathOfEditingPropertyItem:(id)a3;
- (id)indexPathOfPropertyItem:(id)a3 editing:(BOOL)a4;
- (id)initialPrompt;
- (id)linkedPoliciesByContactIdentifier;
- (id)managedConfiguration;
- (id)message;
- (id)missingRequiredKeys;
- (id)navigationItemController;
- (id)originalContacts;
- (id)personHeaderCellForTableView:(id)a3;
- (id)personHeaderView;
- (id)personHeaderViewController;
- (id)personHeaderViewDelegate;
- (id)platterBackBarButtonItem;
- (id)policy;
- (id)presentingDelegate;
- (id)prohibitedPropertyKeys;
- (id)propertyGroups;
- (id)recentsData;
- (id)saveContactExecutor;
- (id)saveDescriptionForCurrentState;
- (id)saveLinkedContactsExecutor;
- (id)setupSharedProfileStateOracle;
- (id)sharedProfileBannerSectionCellForTableView:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)transparentPlatterImage;
- (int64_t)_modalPresentationStyleForViewController:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)additionalTopSectionsCountForTableView:(id)a3;
- (int64_t)editAuthorizationResult;
- (int64_t)mode;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)sectionOfGroup:(id)a3 inTableView:(id)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)bannerActionTypeForEffectiveState;
- (unint64_t)dismissedSharedProfileBannerAction;
- (unint64_t)groupIndexFromTableViewSectionIndex:(unint64_t)a3 forTableView:(id)a4;
- (unint64_t)tableViewSectionIndexFromGroupIndex:(unint64_t)a3 forTableView:(id)a4;
- (unint64_t)tappedSharedProfileBannerAction;
- (void)_addDefaultAppGroupAnimated:(BOOL)a3;
- (void)_addFaceTimeGroupAnimated:(BOOL)a3;
- (void)_addGroup:(id)a3 afterGroup:(id)a4 forTableView:(id)a5 animated:(BOOL)a6;
- (void)_addMedicalIDGroupAnimated:(BOOL)a3 forTableView:(id)a4;
- (void)_addShareLocationGroupAnimated:(BOOL)a3;
- (void)_addedGroupWithName:(id)a3;
- (void)_didCompleteWithContact:(id)a3;
- (void)_handleCoalescedBlockListDidChange;
- (void)_lookupKTHandlesIfNeeded;
- (void)_lookupStaticIdentity;
- (void)_pickName;
- (void)_refetchContact;
- (void)_reloadAlertGroups;
- (void)_reloadContainerContextPreservingChanges:(BOOL)a3;
- (void)_reloadDefaultAppGroup;
- (void)_reloadFaceTimeGroup;
- (void)_reloadGameCenterGroup;
- (void)_reloadGameCenterGroupWithPreflight;
- (void)_reloadGameCenterGroupWithRefresh;
- (void)_reloadGeminiGroupPreservingChanges:(BOOL)a3;
- (void)_reloadGroupEditingContext;
- (void)_reloadGroupMembershipGroup;
- (void)_reloadLinkedCardsGroup;
- (void)_reloadMeCardSharedProfileGroup;
- (void)_reloadMedicalIDGroup;
- (void)_reloadNamePickingGroup;
- (void)_reloadPropertyGroupsPreservingChanges:(BOOL)a3;
- (void)_reloadSharedProfileGroup;
- (void)_reloadStaticIdentityGroup;
- (void)_retrieveActionsModelPreservingChanges:(BOOL)a3;
- (void)_saveChangesForGroups:(id)a3;
- (void)_scrollContactView:(id)a3 toVisibleGroup:(id)a4 animated:(BOOL)a5;
- (void)_setNeedsUpdateCachedLabelWidths;
- (void)_setupAddToAddressBookActions;
- (void)_setupCardActions;
- (void)_setupContactBlockingActionPreservingChanges:(BOOL)a3 withUpdate:(BOOL)a4;
- (void)_setupContactBlockingReportingActionPreservingChanges:(BOOL)a3 withUpdate:(BOOL)a4;
- (void)_setupCustomActions;
- (void)_setupEditingCardActions;
- (void)_setupEditingLinkedContactsForKeys:(id)a3;
- (void)_setupSuggestionActions;
- (void)_updateAvailableTransports;
- (void)_updateAvailableTransportsForItems:(id)a3;
- (void)_updateCachedLabelWidths;
- (void)_updateCachedLabelWidthsForGroup:(id)a3;
- (void)_updateCachedLabelWidthsForItem:(id)a3;
- (void)_updateCachedLabelWidthsIfNeeded;
- (void)_updateEmailTransportButtonsForItems:(id)a3;
- (void)_updateIMessageTransportButtonsForItems:(id)a3;
- (void)_updateLabelWidthForCell:(id)a3;
- (void)_updateLabelWidthForCellsInGroup:(id)a3 forTableView:(id)a4 reset:(BOOL)a5;
- (void)_updateLabelWidthsForAllVisibleCells;
- (void)_updatePhoneTransportButtonsForItems:(id)a3;
- (void)_updateTTYTransportButtonsForItems:(id)a3;
- (void)_updateUserActivity;
- (void)_validateGroup:(id)a3;
- (void)action:(id)a3 dismissViewController:(id)a4 sender:(id)a5;
- (void)action:(id)a3 prepareChildContactViewController:(id)a4 sender:(id)a5;
- (void)action:(id)a3 presentViewController:(id)a4 modalPresentationStyle:(int64_t)a5 sender:(id)a6;
- (void)action:(id)a3 presentViewController:(id)a4 sender:(id)a5;
- (void)action:(id)a3 pushViewController:(id)a4 sender:(id)a5;
- (void)actionDidFinish:(id)a3;
- (void)actionDidFinishFromSecondaryAction:(id)a3;
- (void)actionDidUpdate:(id)a3;
- (void)actionWasCanceled:(id)a3;
- (void)addActionWithTitle:(id)a3 menuProvider:(id)a4 inGroup:(id)a5 destructive:(BOOL)a6;
- (void)addActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5 inGroup:(id)a6;
- (void)addActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5 inGroup:(id)a6 destructive:(BOOL)a7;
- (void)addActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5 menuProvider:(id)a6 inGroup:(id)a7 destructive:(BOOL)a8;
- (void)addCardGroup:(id)a3 afterGroup:(id)a4;
- (void)addContactToGroup:(id)a3;
- (void)addEditingItem:(id)a3 atIndexPath:(id)a4 forTableView:(id)a5 shouldSetFocus:(BOOL)a6;
- (void)addEditingItemAtIndexPath:(id)a3 forTableView:(id)a4;
- (void)addGameCenterActionGroupAnimated:(BOOL)a3;
- (void)addGameCenterGroupAnimated:(BOOL)a3;
- (void)addLinkedContact:(id)a3;
- (void)addStaticIdentity:(id)a3;
- (void)adjustInsetsForKeyboardOverlap:(double)a3;
- (void)adjustPreferredContentSize;
- (void)alertDetailsNotVerified:(id)a3;
- (void)alertStaticIdentitySaveFailed:(id)a3;
- (void)applicationLeftForeground:(id)a3;
- (void)applyNavigationBarTintColorIfNeeded:(id)a3;
- (void)applyPlatterStyleToBarButtonItemsIfNeeded:(id)a3;
- (void)authorizeEditContactWithTargetGroup:(id)a3 completion:(id)a4;
- (void)authorizedAddContactToGroup:(id)a3;
- (void)authorizedRemoveContactFromGroup:(id)a3;
- (void)blockListDidChange:(id)a3;
- (void)cancelAsyncLookups;
- (void)cleanupRecentImageMetadata;
- (void)cleanupRecentMetadata;
- (void)cleanupRecentPosterMetadata;
- (void)clearMapsDataIfEdited;
- (void)completeAddAddressingGrammarAction:(id)a3;
- (void)contactGroupPickerDidCancel:(id)a3;
- (void)contactGroupPickerDidFinish:(id)a3 withGroup:(id)a4;
- (void)contactInlineActionsViewControllerDidDismissDisambiguationUI:(id)a3;
- (void)contactInlineActionsViewControllerWillPresentDisambiguationUI:(id)a3;
- (void)contactStoreDidChangeWithNotification:(id)a3;
- (void)contactViewController:(id)a3 didDeleteContact:(id)a4;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)createCardEditingContactContainerGroupIfNeeded;
- (void)createCardEditingGeminiGroupIfNeeded;
- (void)createdNewContact:(id)a3;
- (void)dealloc;
- (void)didChangeToEditMode:(BOOL)a3;
- (void)didChangeToShowTitle:(BOOL)a3;
- (void)didMoveToParentViewController:(id)a3;
- (void)editAuthorizationController:(id)a3 authorizationDidFinishWithResult:(int64_t)a4;
- (void)editCancel;
- (void)editCancel:(id)a3;
- (void)encodeRestorableStateWithCoder:(id)a3;
- (void)favoritesDidChangeWithNotification:(id)a3;
- (void)finishEditing:(id)a3;
- (void)focusOnFirstEditingItemIfNeeded;
- (void)focusOnLastEditingItemInGroup:(id)a3;
- (void)geminiDataSourceDidUpdate:(id)a3;
- (void)headerPhotoDidUpdate;
- (void)headerView:(id)a3 didAcceptDropOfImageData:(id)a4;
- (void)headerView:(id)a3 didRequestToBlockContact:(BOOL)a4;
- (void)headerView:(id)a3 didSetBackgroundAsGradientColors:(id)a4;
- (void)headerView:(id)a3 didSetBackgroundAsPosterSnapshotImage:(id)a4;
- (void)headerView:(id)a3 didSetNameLabelColor:(id)a4;
- (void)headerView:(id)a3 didUpdateSensitiveContentOverride:(BOOL)a4;
- (void)headerViewDidChangeHeight:(id)a3;
- (void)headerViewDidPickPreferredChannel:(id)a3;
- (void)headerViewDidTapNameLabel:(id)a3;
- (void)initializeTableViewsForHeaderHeight;
- (void)keyboardDidShowNotification:(id)a3;
- (void)keyboardWillHideNotification:(id)a3;
- (void)loadContactViewControllerViews;
- (void)loadView;
- (void)localeDidChange:(id)a3;
- (void)performAuthorizedSetEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)performConfirmedCancel;
- (void)performSaveToSharedProfile;
- (void)performWhenViewIsLaidOut:(id)a3;
- (void)popToPrevious:(id)a3;
- (void)prepareCell:(id)a3;
- (void)prepareContactDidAppearForPPT;
- (void)presentAvatarPosterEditor;
- (void)presentConfirmCancelAlertController;
- (void)presentViewController:(id)a3 sourceView:(id)a4;
- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)propertyCell:(id)a3 didDeleteLabel:(id)a4 forGroup:(id)a5;
- (void)propertyCell:(id)a3 didUpdateItem:(id)a4 withNewLabel:(id)a5;
- (void)propertyCell:(id)a3 didUpdateItem:(id)a4 withNewValue:(id)a5;
- (void)propertyCell:(id)a3 performActionForItem:(id)a4 withTransportType:(int64_t)a5;
- (void)propertyCellDidChangeLayout:(id)a3;
- (void)propertyItem:(id)a3 willChangeValue:(id)a4;
- (void)rebuildActionsViewControllers;
- (void)reloadCardGroup:(id)a3 forTableView:(id)a4;
- (void)reloadCardGroupsForFavoritesUpdateInTableView:(id)a3;
- (void)reloadDataPreservingChanges:(BOOL)a3;
- (void)reloadSections:(id)a3 forTableView:(id)a4;
- (void)reloadUnifiedContact;
- (void)removeActionWithTarget:(id)a3 selector:(SEL)a4 inGroup:(id)a5;
- (void)removeContactFromGroup:(id)a3;
- (void)removeEditingItem:(id)a3 atIndexPath:(id)a4 forTableView:(id)a5;
- (void)removeLinkedContact:(id)a3;
- (void)removePersonHeaderViewControllerFromHierarchy;
- (void)requestFavoritesUpdateWithGemini;
- (void)resetEditAuthorizationState;
- (void)saveModelChangesToContact;
- (void)saveModelChangesToSharedProfileContact;
- (void)saveNewContactDraft;
- (void)scrollScrollViewAllTheWayUp:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)sender:(id)a3 dismissViewController:(id)a4;
- (void)sender:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (void)sender:(id)a3 presentViewController:(id)a4;
- (void)sender:(id)a3 presentViewController:(id)a4 modalPresentationStyle:(int64_t)a5;
- (void)setActionProvider:(id)a3;
- (void)setActionsDataSource:(id)a3;
- (void)setActionsViewController:(id)a3;
- (void)setActionsWrapperView:(id)a3;
- (void)setActivatedConstraints:(id)a3;
- (void)setAddAddressingGrammarAction:(id)a3;
- (void)setAddFavoriteAction:(id)a3;
- (void)setAddLinkedCardAction:(id)a3;
- (void)setAddNewFieldAction:(id)a3;
- (void)setAddToExistingContactAction:(id)a3;
- (void)setAddToGroupAction:(id)a3;
- (void)setAllowsActions:(BOOL)a3;
- (void)setAllowsActionsModel:(BOOL)a3;
- (void)setAllowsAddToFavorites:(BOOL)a3;
- (void)setAllowsAddingToAddressBook:(BOOL)a3;
- (void)setAllowsCardActions:(BOOL)a3;
- (void)setAllowsConferencing:(BOOL)a3;
- (void)setAllowsContactBlocking:(BOOL)a3;
- (void)setAllowsContactBlockingAndReporting:(BOOL)a3;
- (void)setAllowsDisplayModePickerActions:(BOOL)a3;
- (void)setAllowsEditInApp:(BOOL)a3;
- (void)setAllowsEditPhoto:(BOOL)a3;
- (void)setAllowsEditPhoto:(BOOL)a3 preservingChanges:(BOOL)a4;
- (void)setAllowsEditing:(BOOL)a3;
- (void)setAllowsNamePicking:(BOOL)a3;
- (void)setAllowsSendMessage:(BOOL)a3;
- (void)setAllowsSettingLinkedContactsAsPreferred:(BOOL)a3;
- (void)setAllowsSharing:(BOOL)a3;
- (void)setAlternateName:(id)a3;
- (void)setBackgroundColorIfNeededForPresentedViewController:(id)a3;
- (void)setBannerActionTypeForEffectiveState:(unint64_t)a3;
- (void)setBlockAction:(id)a3;
- (void)setBlockReportAction:(id)a3;
- (void)setCachedLabelWidths:(id)a3;
- (void)setCachedStaticIdentity:(id)a3;
- (void)setCachedVerifiedHandles:(id)a3;
- (void)setCancelCommand:(id)a3;
- (void)setCancelKeyboardShortcutEnabled:(BOOL)a3;
- (void)setCardActionsGroup:(id)a3;
- (void)setCardBlockContactGroup:(id)a3;
- (void)setCardBottomGroup:(id)a3;
- (void)setCardDefaultAppGroup:(id)a3;
- (void)setCardEditingActionsGroup:(id)a3;
- (void)setCardEditingContactContainerGroup:(id)a3;
- (void)setCardEditingDeleteContactGroup:(id)a3;
- (void)setCardEditingGeminiGroup:(id)a3;
- (void)setCardFaceTimeGroup:(id)a3;
- (void)setCardGameCenterActionGroup:(id)a3;
- (void)setCardGroupMembershipGroup:(id)a3;
- (void)setCardLinkedCardsGroup:(id)a3;
- (void)setCardMedicalIDGroup:(id)a3;
- (void)setCardShareLocationGroup:(id)a3;
- (void)setCardSharedProfileGroup:(id)a3;
- (void)setCardStaticIdentityGroup:(id)a3;
- (void)setCardTopGroup:(id)a3;
- (void)setClearRecentsDataAction:(id)a3;
- (void)setContact:(id)a3;
- (void)setContact:(id)a3 shouldScrollToTop:(BOOL)a4;
- (void)setContactDelegate:(id)a3;
- (void)setContactFormatter:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setContactSupportsTTYCalls:(BOOL)a3;
- (void)setContactViewBackgroundGradientLayer:(id)a3;
- (void)setContactViewBackgroundToMatchHeader;
- (void)setContactViewBackgroundView:(id)a3;
- (void)setContactViewConfiguration:(id)a3;
- (void)setContainerContext:(id)a3;
- (void)setContainerPicker:(id)a3;
- (void)setCreateNewContactAction:(id)a3;
- (void)setCreateReminderAction:(id)a3;
- (void)setCustomActions:(id)a3;
- (void)setDefaultAppProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeleteContactAction:(id)a3;
- (void)setDeletedEditingGroups:(id)a3;
- (void)setDidEditPronouns:(BOOL)a3;
- (void)setDidFindStaticIdentity:(BOOL)a3;
- (void)setDidLookUpStaticIdentity:(BOOL)a3;
- (void)setDidSetFirstResponder:(BOOL)a3;
- (void)setDidSetNewContact:(BOOL)a3;
- (void)setDismissedSharedProfileBannerAction:(unint64_t)a3;
- (void)setDisplayContactView:(id)a3;
- (void)setDisplayFloatingCollapsedHeaderView:(id)a3;
- (void)setDisplayGroups:(id)a3;
- (void)setDisplayHeaderView:(id)a3;
- (void)setDisplayedProperties:(id)a3;
- (void)setEditAuthorizationController:(id)a3;
- (void)setEditAuthorizationResult:(int64_t)a3;
- (void)setEditCommand:(id)a3;
- (void)setEditKeyboardShortcutEnabled:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setEditingContactView:(id)a3;
- (void)setEditingFloatingCollapsedHeaderView:(id)a3;
- (void)setEditingFloatingHeaderHeightConstraint:(id)a3;
- (void)setEditingGroups:(id)a3;
- (void)setEditingHeaderView:(id)a3;
- (void)setEditingLinkedContacts:(id)a3;
- (void)setEditingNicknameContact:(id)a3;
- (void)setEmergencyContactAction:(id)a3;
- (void)setEmergencyNumberIdentifier:(id)a3;
- (void)setExtraLeftBarButtonItems:(id)a3;
- (void)setExtraRightBarButtonItems:(id)a3;
- (void)setFaceTimeAction:(id)a3;
- (void)setFaceTimeIDSLookupToken:(id)a3;
- (void)setFloatingActionsViewController:(id)a3;
- (void)setFloatingActionsWrapperView:(id)a3;
- (void)setFloatingHeaderHeightConstraint:(id)a3;
- (void)setForcesTransparentBackground:(BOOL)a3;
- (void)setGameCenterAddFriendAction:(id)a3;
- (void)setGameCenterGroup:(id)a3;
- (void)setGameCenterManager:(id)a3;
- (void)setGroupEditingContext:(id)a3;
- (void)setGroupsAfterGroup:(id)a3;
- (void)setGroupsAndContainersSaveManager:(id)a3;
- (void)setHadAtLeastOneVerifiedHandle:(BOOL)a3;
- (void)setHasAvatarConstraints:(BOOL)a3;
- (void)setHasEditingConstraints:(BOOL)a3;
- (void)setHasPerformedSharedProfileBannerAnimation:(BOOL)a3;
- (void)setHasSetupViewHierarchy:(BOOL)a3;
- (void)setHeaderDropShadowView:(id)a3;
- (void)setHeaderHeightConstraint:(id)a3;
- (void)setHeaderViewBackgroundColors:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setHideCardActions:(BOOL)a3;
- (void)setHighlightedProperties:(id)a3;
- (void)setHighlightedPropertyImportant:(BOOL)a3;
- (void)setIMessageIDSLookupToken:(id)a3;
- (void)setIgnoreContactAction:(id)a3;
- (void)setImportantMessage:(id)a3;
- (void)setInitialPrompt:(id)a3;
- (void)setIsMailVIP:(BOOL)a3;
- (void)setIsPresentingFullscreenForOutOfProcess:(BOOL)a3;
- (void)setIssuedSaveRequestIdentifiers:(id)a3;
- (void)setKeyboardVerticalOverlap:(double)a3;
- (void)setLayoutPositionallyAfterNavBar:(BOOL)a3;
- (void)setLinkedCardsAction:(id)a3;
- (void)setLinkedPoliciesByContactIdentifier:(id)a3;
- (void)setMainThreadScheduler:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setMeCardSharedProfileGroup:(id)a3;
- (void)setMedicalIDAction:(id)a3;
- (void)setMedicalIDLookupToken:(id)a3;
- (void)setMedicalIDRegistrationToken:(id)a3;
- (void)setMenuProviderForCell:(id)a3 forActionGroupItem:(id)a4;
- (void)setMessage:(id)a3;
- (void)setMissingRequiredKeys:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setMutableContact:(id)a3;
- (void)setMutableContactForHeaderView:(id)a3;
- (void)setNameEditingGroups:(id)a3;
- (void)setNamePickingGroup:(id)a3;
- (void)setNeedsReload;
- (void)setNeedsReloadLazy;
- (void)setNoteCell:(id)a3;
- (void)setOriginalContacts:(id)a3;
- (void)setOutOfProcessSetupComplete:(BOOL)a3;
- (void)setPendingLayoutBlocks:(id)a3;
- (void)setPersonHeaderView:(id)a3;
- (void)setPersonHeaderViewController:(id)a3;
- (void)setPersonHeaderViewDelegate:(id)a3;
- (void)setPolicy:(id)a3;
- (void)setPptDelegate:(id)a3;
- (void)setPreEditLeftBarButtonItems:(id)a3;
- (void)setPresentingDelegate:(id)a3;
- (void)setPreviousBackGestureDelegate:(id)a3;
- (void)setProhibitedPropertyKeys:(id)a3;
- (void)setRecentsData:(id)a3;
- (void)setRequiresGameCenterRefresh:(BOOL)a3;
- (void)setRunningPPT:(BOOL)a3;
- (void)setSaveCommand:(id)a3;
- (void)setSaveContactExecutor:(id)a3;
- (void)setSaveKeyboardShortcutEnabled:(BOOL)a3;
- (void)setSaveLinkedContactsExecutor:(id)a3;
- (void)setSavingPersonalSharedProfile:(BOOL)a3;
- (void)setSelectContainersAction:(id)a3;
- (void)setSendMessageAction:(id)a3;
- (void)setShadowCopyOfReadonlyContact:(id)a3;
- (void)setShareContactAction:(id)a3;
- (void)setShareLocationController:(id)a3;
- (void)setSharedProfileStateOracle:(id)a3;
- (void)setShouldDrawNavigationBar:(BOOL)a3;
- (void)setShouldIgnoreBlockListChange:(BOOL)a3;
- (void)setShouldIgnoreContactStoreDidChangeNotification:(BOOL)a3;
- (void)setShouldShowSharedProfileBanner:(BOOL)a3;
- (void)setShowContactBlockingFirst:(BOOL)a3;
- (void)setShowContactPhotoPosterCell:(BOOL)a3;
- (void)setShowingMeContact:(BOOL)a3;
- (void)setShowsGroupMembership:(BOOL)a3;
- (void)setShowsInlineActions:(BOOL)a3;
- (void)setShowsSharedProfile:(BOOL)a3;
- (void)setSiriContextProvider:(id)a3;
- (void)setStaticDisplayHeaderView:(id)a3;
- (void)setStopSharingWithFamilyAction:(id)a3;
- (void)setSuggestedContactAction:(id)a3;
- (void)setSupportsDrafts:(BOOL)a3;
- (void)setTappedSharedProfileBannerAction:(unint64_t)a3;
- (void)setTitle:(id)a3;
- (void)setUpBackGestureIfNeeded;
- (void)setUpFloatingActionsViewController;
- (void)setUpdateExistingContactAction:(id)a3;
- (void)setUserActivityUserInfo:(id)a3;
- (void)setUsesBrandedCallHeaderFormat:(BOOL)a3;
- (void)setupActionsPreservingChanges:(BOOL)a3;
- (void)setupConstraints;
- (void)setupConstraintsIfNeeded;
- (void)setupContainerContextIfNeededForContact:(id)a3;
- (void)setupShareLocationActionReload:(BOOL)a3;
- (void)setupTableFooterView;
- (void)setupViewHierarchy;
- (void)setupViewHierarchyAndConstraints;
- (void)setupViewHierarchyIncludingAvatarHeader:(BOOL)a3 editing:(BOOL)a4;
- (void)setupWithOptions:(id)a3 readyBlock:(id)a4;
- (void)sharedProfileBannerView:(id)a3 didDismissWithUpdatedContact:(id)a4 forAction:(unint64_t)a5;
- (void)sharedProfileBannerView:(id)a3 didUpdateContact:(id)a4 forAction:(unint64_t)a5;
- (void)sharingStatusDidChange;
- (void)shouldPresentFullscreen:(BOOL)a3;
- (void)showEditAuthorizationPane:(id)a3 animated:(BOOL)a4;
- (void)showUpdateTermOfAddressAlertIfNeeded;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)tableView:(id)a3 performAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)toggleEditing;
- (void)toggleEditing:(id)a3;
- (void)updateCollapsedHeaderToMatchScrollViewState:(id)a3 scrollDirection:(int64_t)a4 animated:(BOOL)a5;
- (void)updateContact:(id)a3;
- (void)updateContactsViewWithBlock:(id)a3 completion:(id)a4;
- (void)updateDisplayCollapsedHeaderToMatchScrollViewState:(id)a3 scrollDirection:(int64_t)a4 animated:(BOOL)a5;
- (void)updateDoneButton;
- (void)updateEditNavigationItemsAnimated:(BOOL)a3;
- (void)updateEditNavigationItemsAnimated:(BOOL)a3 updateTintColor:(BOOL)a4;
- (void)updateEditPhotoButtonIfNeeded;
- (void)updateGameCenterGroupAndActionsForContact:(id)a3 relationshipResults:(id)a4;
- (void)updateHeaderHeightToMatchScrollViewState:(id)a3 scrollDirection:(int64_t)a4 animated:(BOOL)a5;
- (void)updateInsetsIfNeededForTableView:(id)a3 isEditing:(BOOL)a4;
- (void)updateOutOfProcessFullscreenPresentationIfNeeded;
- (void)updateStaticDisplayHeaderImageVisibility;
- (void)updateTableView:(id)a3 contentInsetsTo:(UIEdgeInsets)a4 withScrollIndicatorInsets:(UIEdgeInsets)a5;
- (void)updateUserActivityState:(id)a3;
- (void)updateViewAnnotationWithContact:(id)a3;
- (void)updateViewConstraints;
- (void)updateWindowTitleForAppearing:(BOOL)a3;
- (void)updatedExistingContact:(id)a3;
- (void)viewController:(id)a3 presentationControllerWillDismiss:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CNContactContentUnitaryViewController

void __82__CNContactContentUnitaryViewController_descriptorForRequiredKeysWithDescription___block_invoke(uint64_t a1)
{
  v39[56] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F1AE08];
  uint64_t v3 = *MEMORY[0x1E4F1AE88];
  uint64_t v4 = *MEMORY[0x1E4F1ADF0];
  v39[2] = *MEMORY[0x1E4F1AEB0];
  v39[3] = v4;
  uint64_t v5 = *MEMORY[0x1E4F1ADE0];
  v39[4] = *MEMORY[0x1E4F1AEA0];
  v39[5] = v5;
  uint64_t v6 = *MEMORY[0x1E4F1AEB8];
  v39[6] = *MEMORY[0x1E4F1AF30];
  v39[7] = v6;
  uint64_t v7 = *MEMORY[0x1E4F1AEF8];
  v39[8] = *MEMORY[0x1E4F1AEC0];
  v39[9] = v7;
  uint64_t v8 = *MEMORY[0x1E4F1AEF0];
  v39[10] = *MEMORY[0x1E4F1AF00];
  v39[11] = v8;
  uint64_t v9 = *MEMORY[0x1E4F1AF08];
  v39[12] = *MEMORY[0x1E4F1AED8];
  v39[13] = v9;
  uint64_t v10 = *MEMORY[0x1E4F1AE78];
  v39[14] = *MEMORY[0x1E4F1ADB8];
  v39[15] = v10;
  uint64_t v11 = *MEMORY[0x1E4F1AD90];
  v39[16] = *MEMORY[0x1E4F1AD88];
  v39[17] = v11;
  uint64_t v12 = *MEMORY[0x1E4F1AED0];
  v39[18] = *MEMORY[0x1E4F1AEC8];
  v39[19] = v12;
  uint64_t v13 = *MEMORY[0x1E4F1AF98];
  v39[20] = *MEMORY[0x1E4F1AE28];
  v39[21] = v13;
  uint64_t v14 = *MEMORY[0x1E4F1AFA8];
  v39[22] = *MEMORY[0x1E4F1AE20];
  v39[23] = v14;
  uint64_t v15 = *MEMORY[0x1E4F1ADC8];
  v39[24] = *MEMORY[0x1E4F1AEE0];
  v39[25] = v15;
  uint64_t v16 = *MEMORY[0x1E4F1ADB0];
  v39[26] = *MEMORY[0x1E4F1AF10];
  v39[27] = v16;
  uint64_t v17 = *MEMORY[0x1E4F1AF50];
  v39[28] = *MEMORY[0x1E4F1AFB0];
  v39[29] = v17;
  uint64_t v18 = *MEMORY[0x1E4F1AE60];
  v39[30] = *MEMORY[0x1E4F1AF78];
  v39[31] = v18;
  v39[0] = v2;
  v39[1] = v3;
  v39[32] = *MEMORY[0x1E4F1AE00];
  v39[33] = v3;
  uint64_t v19 = *MEMORY[0x1E4F1AF90];
  v39[34] = *MEMORY[0x1E4F1ADA0];
  v39[35] = v19;
  uint64_t v20 = *MEMORY[0x1E4F1AE90];
  v39[36] = *MEMORY[0x1E4F1ADA8];
  v39[37] = v20;
  uint64_t v21 = *MEMORY[0x1E4F1AE48];
  v39[38] = *MEMORY[0x1E4F1AD98];
  v39[39] = v21;
  uint64_t v22 = *MEMORY[0x1E4F1AE98];
  v39[40] = *MEMORY[0x1E4F1AE30];
  v39[41] = v22;
  uint64_t v23 = *MEMORY[0x1E4F1AFB8];
  v39[42] = *MEMORY[0x1E4F5A5E8];
  v39[43] = v23;
  uint64_t v24 = *MEMORY[0x1E4F1AFC8];
  v39[44] = *MEMORY[0x1E4F1AFC0];
  v39[45] = v24;
  uint64_t v25 = *MEMORY[0x1E4F1AF68];
  v39[46] = *MEMORY[0x1E4F1AF70];
  v39[47] = v25;
  uint64_t v26 = *MEMORY[0x1E4F1ADE8];
  v39[48] = *MEMORY[0x1E4F1AEE8];
  v39[49] = v26;
  uint64_t v27 = *MEMORY[0x1E4F1AF38];
  v39[50] = *MEMORY[0x1E4F1AF40];
  v39[51] = v27;
  v28 = [MEMORY[0x1E4F1B9F8] descriptorForRequiredKeys];
  uint64_t v29 = *MEMORY[0x1E4F1ADC0];
  v39[52] = v28;
  v39[53] = v29;
  v30 = [MEMORY[0x1E4F1B910] sharedFullNameFormatter];
  v31 = [v30 descriptorForRequiredKeys];
  v39[54] = v31;
  v32 = [MEMORY[0x1E4F1B910] sharedFullNameFormatter];
  v33 = +[CNContactHeaderDisplayView descriptorForRequiredKeysForContactFormatter:v32];
  v39[55] = v33;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:56];

  v35 = +[CNSiriContactContextProvider descriptorForRequiredKeys];
  if (v35)
  {
    uint64_t v36 = [v34 arrayByAddingObject:v35];

    v34 = (void *)v36;
  }
  uint64_t v37 = [MEMORY[0x1E4F1B8F8] descriptorWithKeyDescriptors:v34 description:*(void *)(a1 + 32)];

  v38 = (void *)descriptorForRequiredKeysWithDescription__cn_once_object_10;
  descriptorForRequiredKeysWithDescription__cn_once_object_10 = v37;
}

+ (id)descriptorForRequiredKeys
{
  uint64_t v3 = [NSString stringWithUTF8String:"+[CNContactContentUnitaryViewController descriptorForRequiredKeys]"];
  uint64_t v4 = [a1 descriptorForRequiredKeysWithDescription:v3];

  return v4;
}

+ (id)descriptorForRequiredKeysWithDescription:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__CNContactContentUnitaryViewController_descriptorForRequiredKeysWithDescription___block_invoke;
  block[3] = &unk_1E549B488;
  id v9 = v3;
  uint64_t v4 = descriptorForRequiredKeysWithDescription__cn_once_token_10;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&descriptorForRequiredKeysWithDescription__cn_once_token_10, block);
  }
  id v6 = (id)descriptorForRequiredKeysWithDescription__cn_once_object_10;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultAppProvider, 0);
  objc_storeStrong((id *)&self->_editingNicknameContact, 0);
  objc_storeStrong((id *)&self->_pendingLayoutBlocks, 0);
  objc_storeStrong((id *)&self->_mainThreadScheduler, 0);
  objc_storeStrong((id *)&self->_ktWorkQueue, 0);
  objc_storeStrong((id *)&self->_cachedVerifiedHandles, 0);
  objc_storeStrong((id *)&self->_cachedStaticIdentity, 0);
  objc_storeStrong((id *)&self->_geminiDataSource, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
  objc_storeStrong((id *)&self->_contactViewCache, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_preEditLeftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_cancelCommand, 0);
  objc_storeStrong((id *)&self->_editCommand, 0);
  objc_storeStrong((id *)&self->_saveCommand, 0);
  objc_storeStrong((id *)&self->_actionsDataSource, 0);
  objc_storeStrong((id *)&self->_highlightedProperties, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_userActivityUserInfo, 0);
  objc_storeStrong((id *)&self->_faceTimeIDSLookupToken, 0);
  objc_storeStrong((id *)&self->_iMessageIDSLookupToken, 0);
  objc_storeStrong((id *)&self->_groupEditingContext, 0);
  objc_storeStrong((id *)&self->_editingLinkedContacts, 0);
  objc_storeStrong((id *)&self->_siriContextProvider, 0);
  objc_storeStrong((id *)&self->_ignoreContactAction, 0);
  objc_storeStrong((id *)&self->_deleteContactAction, 0);
  objc_storeStrong((id *)&self->_cardEditingContactContainerGroup, 0);
  objc_storeStrong((id *)&self->_cardEditingGeminiGroup, 0);
  objc_storeStrong((id *)&self->_cardEditingDeleteContactGroup, 0);
  objc_storeStrong((id *)&self->_cardEditingActionsGroup, 0);
  objc_storeStrong((id *)&self->_emergencyNumberIdentifier, 0);
  objc_storeStrong((id *)&self->_medicalIDLookupToken, 0);
  objc_storeStrong((id *)&self->_medicalIDRegistrationToken, 0);
  objc_storeStrong((id *)&self->_emergencyContactAction, 0);
  objc_storeStrong((id *)&self->_medicalIDAction, 0);
  objc_storeStrong((id *)&self->_headerDropShadowView, 0);
  objc_storeStrong((id *)&self->_floatingActionsWrapperView, 0);
  objc_storeStrong((id *)&self->_floatingActionsViewController, 0);
  objc_storeStrong((id *)&self->_actionsWrapperView, 0);
  objc_storeStrong((id *)&self->_actionsViewController, 0);
  objc_storeStrong((id *)&self->_shareLocationController, 0);
  objc_storeStrong((id *)&self->_editingFloatingHeaderHeightConstraint, 0);
  objc_storeStrong((id *)&self->_floatingHeaderHeightConstraint, 0);
  objc_storeStrong((id *)&self->_headerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_activatedConstraints, 0);
  objc_storeStrong((id *)&self->_actionProvider, 0);
  objc_storeStrong((id *)&self->_sharedProfileStateOracle, 0);
  objc_storeStrong((id *)&self->_meCardSharedProfileGroup, 0);
  objc_storeStrong((id *)&self->_cardSharedProfileGroup, 0);
  objc_storeStrong((id *)&self->_namePickingGroup, 0);
  objc_storeStrong((id *)&self->_gameCenterGroup, 0);
  objc_storeStrong((id *)&self->_gameCenterAddFriendAction, 0);
  objc_storeStrong((id *)&self->_cardGameCenterActionGroup, 0);
  objc_storeStrong((id *)&self->_gameCenterManager, 0);
  objc_storeStrong((id *)&self->_addAddressingGrammarAction, 0);
  objc_storeStrong((id *)&self->_selectContainersAction, 0);
  objc_storeStrong((id *)&self->_stopSharingWithFamilyAction, 0);
  objc_storeStrong((id *)&self->_clearRecentsDataAction, 0);
  objc_storeStrong((id *)&self->_suggestedContactAction, 0);
  objc_storeStrong((id *)&self->_updateExistingContactAction, 0);
  objc_storeStrong((id *)&self->_addToExistingContactAction, 0);
  objc_storeStrong((id *)&self->_createNewContactAction, 0);
  objc_storeStrong((id *)&self->_addNewFieldAction, 0);
  objc_storeStrong((id *)&self->_blockReportAction, 0);
  objc_storeStrong((id *)&self->_blockAction, 0);
  objc_storeStrong((id *)&self->_addFavoriteAction, 0);
  objc_storeStrong((id *)&self->_createReminderAction, 0);
  objc_storeStrong((id *)&self->_shareContactAction, 0);
  objc_storeStrong((id *)&self->_addToGroupAction, 0);
  objc_storeStrong((id *)&self->_addLinkedCardAction, 0);
  objc_storeStrong((id *)&self->_linkedCardsAction, 0);
  objc_storeStrong((id *)&self->_faceTimeAction, 0);
  objc_storeStrong((id *)&self->_sendMessageAction, 0);
  objc_storeStrong((id *)&self->_noteCell, 0);
  objc_storeStrong((id *)&self->_customActions, 0);
  objc_storeStrong((id *)&self->_cardGroupMembershipGroup, 0);
  objc_storeStrong((id *)&self->_cardLinkedCardsGroup, 0);
  objc_storeStrong((id *)&self->_cardBlockContactGroup, 0);
  objc_storeStrong((id *)&self->_cardStaticIdentityGroup, 0);
  objc_storeStrong((id *)&self->_cardMedicalIDGroup, 0);
  objc_storeStrong((id *)&self->_cardShareLocationGroup, 0);
  objc_storeStrong((id *)&self->_cardActionsGroup, 0);
  objc_storeStrong((id *)&self->_extraLeftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_extraRightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_cachedLabelWidths, 0);
  objc_storeStrong((id *)&self->_contactViewBackgroundGradientLayer, 0);
  objc_storeStrong((id *)&self->_contactViewBackgroundView, 0);
  objc_storeStrong((id *)&self->_headerViewBackgroundColors, 0);
  objc_storeStrong((id *)&self->_groupsAfterGroup, 0);
  objc_storeStrong((id *)&self->_deletedEditingGroups, 0);
  objc_storeStrong((id *)&self->_nameEditingGroups, 0);
  objc_storeStrong((id *)&self->_editingGroups, 0);
  objc_storeStrong((id *)&self->_groupsAndContainersSaveManager, 0);
  objc_storeStrong((id *)&self->_containerPicker, 0);
  objc_storeStrong((id *)&self->_previousBackGestureDelegate, 0);
  objc_storeStrong((id *)&self->_editAuthorizationController, 0);
  objc_storeStrong((id *)&self->_editingHeaderView, 0);
  objc_storeStrong((id *)&self->_displayHeaderView, 0);
  objc_storeStrong((id *)&self->_editingFloatingCollapsedHeaderView, 0);
  objc_storeStrong((id *)&self->_displayFloatingCollapsedHeaderView, 0);
  objc_storeStrong((id *)&self->_staticDisplayHeaderView, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_editingContactView, 0);
  objc_storeStrong((id *)&self->_displayContactView, 0);
  objc_storeStrong((id *)&self->_containerContext, 0);
  objc_storeStrong((id *)&self->_shadowCopyOfReadonlyContact, 0);
  objc_storeStrong((id *)&self->_issuedSaveRequestIdentifiers, 0);
  objc_storeStrong((id *)&self->_mutableContact, 0);
  objc_storeStrong((id *)&self->_mutableContactForHeaderView, 0);
  objc_destroyWeak((id *)&self->_personHeaderViewDelegate);
  objc_storeStrong((id *)&self->_personHeaderViewController, 0);
  objc_storeStrong((id *)&self->_cardFooterGroup, 0);
  objc_storeStrong((id *)&self->_cardBottomGroup, 0);
  objc_storeStrong((id *)&self->_cardTopGroup, 0);
  objc_storeStrong((id *)&self->_importantMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_alternateName, 0);
  objc_destroyWeak((id *)&self->_presentingDelegate);
  objc_storeStrong((id *)&self->_contactViewConfiguration, 0);
  objc_storeStrong((id *)&self->_displayGroups, 0);
  objc_storeStrong((id *)&self->_cardDefaultAppGroup, 0);
  objc_storeStrong((id *)&self->_cardFaceTimeGroup, 0);
  objc_storeStrong((id *)&self->_propertyGroups, 0);
  objc_storeStrong((id *)&self->_recentsData, 0);
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, 0);
  objc_storeStrong((id *)&self->_saveLinkedContactsExecutor, 0);
  objc_storeStrong((id *)&self->_saveContactExecutor, 0);
  objc_storeStrong((id *)&self->_initialPrompt, 0);
  objc_storeStrong((id *)&self->_originalContacts, 0);
  objc_storeStrong((id *)&self->_missingRequiredKeys, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_linkedPoliciesByContactIdentifier, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_destroyWeak((id *)&self->_contactDelegate);
  objc_destroyWeak((id *)&self->_pptDelegate);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_displayedProperties, 0);
}

- (void)setShowContactPhotoPosterCell:(BOOL)a3
{
  self->_showContactPhotoPosterCell = a3;
}

- (BOOL)showContactPhotoPosterCell
{
  return self->_showContactPhotoPosterCell;
}

- (BOOL)canDisplayDefaultAppGroup
{
  return self->_canDisplayDefaultAppGroup;
}

- (void)setDefaultAppProvider:(id)a3
{
}

- (CNTUCallProvider)defaultAppProvider
{
  return self->_defaultAppProvider;
}

- (void)setEditingNicknameContact:(id)a3
{
}

- (CNMutableContact)editingNicknameContact
{
  return self->_editingNicknameContact;
}

- (void)setSavingPersonalSharedProfile:(BOOL)a3
{
  self->_savingPersonalSharedProfile = a3;
}

- (BOOL)savingPersonalSharedProfile
{
  return self->_savingPersonalSharedProfile;
}

- (void)setPendingLayoutBlocks:(id)a3
{
}

- (NSArray)pendingLayoutBlocks
{
  return self->_pendingLayoutBlocks;
}

- (void)setMainThreadScheduler:(id)a3
{
}

- (CNScheduler)mainThreadScheduler
{
  return self->_mainThreadScheduler;
}

- (CNScheduler)ktWorkQueue
{
  return self->_ktWorkQueue;
}

- (void)setHadAtLeastOneVerifiedHandle:(BOOL)a3
{
  self->_hadAtLeastOneVerifiedHandle = a3;
}

- (BOOL)hadAtLeastOneVerifiedHandle
{
  return self->_hadAtLeastOneVerifiedHandle;
}

- (void)setCachedVerifiedHandles:(id)a3
{
}

- (NSMutableSet)cachedVerifiedHandles
{
  return (NSMutableSet *)objc_getProperty(self, a2, 2488, 1);
}

- (void)setCachedStaticIdentity:(id)a3
{
}

- (CNUIStaticIdentity)cachedStaticIdentity
{
  return (CNUIStaticIdentity *)objc_getProperty(self, a2, 2480, 1);
}

- (void)setDidFindStaticIdentity:(BOOL)a3
{
  self->_didFindStaticIdentity = a3;
}

- (BOOL)didFindStaticIdentity
{
  return self->_didFindStaticIdentity;
}

- (void)setDidLookUpStaticIdentity:(BOOL)a3
{
  self->_didLookUpStaticIdentity = a3;
}

- (BOOL)didLookUpStaticIdentity
{
  return self->_didLookUpStaticIdentity;
}

- (void)setDidEditPronouns:(BOOL)a3
{
  self->_didEditPronouns = a3;
}

- (BOOL)didEditPronouns
{
  return self->_didEditPronouns;
}

- (void)setSupportsDrafts:(BOOL)a3
{
  self->_supportsDrafts = a3;
}

- (BOOL)supportsDrafts
{
  return self->_supportsDrafts;
}

- (BOOL)usesBrandedCallHeaderFormat
{
  return self->_usesBrandedCallHeaderFormat;
}

- (BOOL)forcesTransparentBackground
{
  return self->_forcesTransparentBackground;
}

- (void)setDidSetNewContact:(BOOL)a3
{
  self->_didSetNewContact = a3;
}

- (BOOL)didSetNewContact
{
  return self->_didSetNewContact;
}

- (void)setShouldIgnoreBlockListChange:(BOOL)a3
{
  self->_shouldIgnoreBlockListChange = a3;
}

- (BOOL)shouldIgnoreBlockListChange
{
  return self->_shouldIgnoreBlockListChange;
}

- (UIEdgeInsets)peripheryInsets
{
  double top = self->_peripheryInsets.top;
  double left = self->_peripheryInsets.left;
  double bottom = self->_peripheryInsets.bottom;
  double right = self->_peripheryInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setLayoutPositionallyAfterNavBar:(BOOL)a3
{
  self->_layoutPositionallyAfterNavBar = a3;
}

- (BOOL)layoutPositionallyAfterNavBar
{
  return self->_layoutPositionallyAfterNavBar;
}

- (void)setRunningPPT:(BOOL)a3
{
  self->_runningPPT = a3;
}

- (BOOL)runningPPT
{
  return self->_runningPPT;
}

- (CNUIGeminiDataSource)geminiDataSource
{
  return self->_geminiDataSource;
}

- (CNUIUserActivityManager)activityManager
{
  return self->_activityManager;
}

- (CNContactViewCache)contactViewCache
{
  return self->_contactViewCache;
}

- (CNUIContactsEnvironment)environment
{
  return self->_environment;
}

- (void)setPreEditLeftBarButtonItems:(id)a3
{
}

- (NSArray)preEditLeftBarButtonItems
{
  return self->_preEditLeftBarButtonItems;
}

- (void)setKeyboardVerticalOverlap:(double)a3
{
  self->_keyboardVerticalOverlap = a3;
}

- (double)keyboardVerticalOverlap
{
  return self->_keyboardVerticalOverlap;
}

- (void)setCancelCommand:(id)a3
{
}

- (UIKeyCommand)cancelCommand
{
  return self->_cancelCommand;
}

- (void)setEditCommand:(id)a3
{
}

- (UIKeyCommand)editCommand
{
  return self->_editCommand;
}

- (void)setSaveCommand:(id)a3
{
}

- (UIKeyCommand)saveCommand
{
  return self->_saveCommand;
}

- (void)setContactSupportsTTYCalls:(BOOL)a3
{
  self->_contactSupportsTTYCalls = a3;
}

- (BOOL)contactSupportsTTYCalls
{
  return self->_contactSupportsTTYCalls;
}

- (void)setActionsDataSource:(id)a3
{
}

- (CNUIUserActionListDataSource)actionsDataSource
{
  return self->_actionsDataSource;
}

- (void)setHighlightedProperties:(id)a3
{
}

- (NSArray)highlightedProperties
{
  return self->_highlightedProperties;
}

- (void)setDidSetFirstResponder:(BOOL)a3
{
  self->_didSetFirstResponder = a3;
}

- (BOOL)didSetFirstResponder
{
  return self->_didSetFirstResponder;
}

- (void)setIsPresentingFullscreenForOutOfProcess:(BOOL)a3
{
  self->_isPresentingFullscreenForOutOfProcess = a3;
}

- (BOOL)isPresentingFullscreenForOutOfProcess
{
  return self->_isPresentingFullscreenForOutOfProcess;
}

- (void)setOutOfProcessSetupComplete:(BOOL)a3
{
  self->_outOfProcessSetupComplete = a3;
}

- (BOOL)outOfProcessSetupComplete
{
  return self->_outOfProcessSetupComplete;
}

- (void)setHealthStore:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setUserActivityUserInfo:(id)a3
{
}

- (NSDictionary)userActivityUserInfo
{
  return self->_userActivityUserInfo;
}

- (void)setFaceTimeIDSLookupToken:(id)a3
{
}

- (CNCancelable)faceTimeIDSLookupToken
{
  return self->_faceTimeIDSLookupToken;
}

- (void)setIMessageIDSLookupToken:(id)a3
{
}

- (CNCancelable)iMessageIDSLookupToken
{
  return self->_iMessageIDSLookupToken;
}

- (void)setGroupEditingContext:(id)a3
{
}

- (CNUIGroupEditingContext)groupEditingContext
{
  return self->_groupEditingContext;
}

- (void)setEditingLinkedContacts:(id)a3
{
}

- (NSMutableArray)editingLinkedContacts
{
  return self->_editingLinkedContacts;
}

- (void)setSiriContextProvider:(id)a3
{
}

- (CNSiriContactContextProvider)siriContextProvider
{
  return self->_siriContextProvider;
}

- (void)setIgnoreContactAction:(id)a3
{
}

- (CNContactAction)ignoreContactAction
{
  return self->_ignoreContactAction;
}

- (void)setDeleteContactAction:(id)a3
{
}

- (CNContactAction)deleteContactAction
{
  return self->_deleteContactAction;
}

- (void)setCardEditingContactContainerGroup:(id)a3
{
}

- (CNCardContactContainerGroup)cardEditingContactContainerGroup
{
  return self->_cardEditingContactContainerGroup;
}

- (void)setCardEditingGeminiGroup:(id)a3
{
}

- (CNCardPropertyGeminiGroup)cardEditingGeminiGroup
{
  return self->_cardEditingGeminiGroup;
}

- (void)setCardEditingDeleteContactGroup:(id)a3
{
}

- (CNCardGroup)cardEditingDeleteContactGroup
{
  return self->_cardEditingDeleteContactGroup;
}

- (void)setCardEditingActionsGroup:(id)a3
{
}

- (CNCardGroup)cardEditingActionsGroup
{
  return self->_cardEditingActionsGroup;
}

- (void)setEmergencyNumberIdentifier:(id)a3
{
}

- (NSString)emergencyNumberIdentifier
{
  return self->_emergencyNumberIdentifier;
}

- (void)setMedicalIDLookupToken:(id)a3
{
}

- (CNCancelable)medicalIDLookupToken
{
  return self->_medicalIDLookupToken;
}

- (void)setMedicalIDRegistrationToken:(id)a3
{
}

- (CNHealthStoreManagerToken)medicalIDRegistrationToken
{
  return self->_medicalIDRegistrationToken;
}

- (void)setEmergencyContactAction:(id)a3
{
}

- (CNEmergencyContactAction)emergencyContactAction
{
  return self->_emergencyContactAction;
}

- (void)setMedicalIDAction:(id)a3
{
}

- (CNMedicalIDAction)medicalIDAction
{
  return self->_medicalIDAction;
}

- (void)setHasSetupViewHierarchy:(BOOL)a3
{
  self->_hasSetupViewHierarchy = a3;
}

- (BOOL)hasSetupViewHierarchy
{
  return self->_hasSetupViewHierarchy;
}

- (void)setHasAvatarConstraints:(BOOL)a3
{
  self->_hasAvatarConstraints = a3;
}

- (BOOL)hasAvatarConstraints
{
  return self->_hasAvatarConstraints;
}

- (void)setHasEditingConstraints:(BOOL)a3
{
  self->_hasEditingConstraints = a3;
}

- (BOOL)hasEditingConstraints
{
  return self->_hasEditingConstraints;
}

- (void)setHeaderDropShadowView:(id)a3
{
}

- (UIView)headerDropShadowView
{
  return self->_headerDropShadowView;
}

- (void)setFloatingActionsWrapperView:(id)a3
{
}

- (CNContactActionsContainerView)floatingActionsWrapperView
{
  return self->_floatingActionsWrapperView;
}

- (void)setFloatingActionsViewController:(id)a3
{
}

- (CNContactInlineActionsViewController)floatingActionsViewController
{
  return self->_floatingActionsViewController;
}

- (void)setActionsWrapperView:(id)a3
{
}

- (CNContactActionsContainerView)actionsWrapperView
{
  return self->_actionsWrapperView;
}

- (void)setActionsViewController:(id)a3
{
}

- (CNContactInlineActionsViewController)actionsViewController
{
  return self->_actionsViewController;
}

- (void)setShareLocationController:(id)a3
{
}

- (void)setEditingFloatingHeaderHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)editingFloatingHeaderHeightConstraint
{
  return self->_editingFloatingHeaderHeightConstraint;
}

- (void)setFloatingHeaderHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)floatingHeaderHeightConstraint
{
  return self->_floatingHeaderHeightConstraint;
}

- (void)setHeaderHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)headerHeightConstraint
{
  return self->_headerHeightConstraint;
}

- (void)setActivatedConstraints:(id)a3
{
}

- (NSArray)activatedConstraints
{
  return self->_activatedConstraints;
}

- (void)setActionProvider:(id)a3
{
}

- (CNContactActionProvider)actionProvider
{
  return self->_actionProvider;
}

- (void)setHasPerformedSharedProfileBannerAnimation:(BOOL)a3
{
  self->_hasPerformedSharedProfileBannerAnimation = a3;
}

- (BOOL)hasPerformedSharedProfileBannerAnimation
{
  return self->_hasPerformedSharedProfileBannerAnimation;
}

- (void)setDismissedSharedProfileBannerAction:(unint64_t)a3
{
  self->_dismissedSharedProfileBannerAction = a3;
}

- (unint64_t)dismissedSharedProfileBannerAction
{
  return self->_dismissedSharedProfileBannerAction;
}

- (void)setTappedSharedProfileBannerAction:(unint64_t)a3
{
  self->_tappedSharedProfileBannerAction = a3;
}

- (unint64_t)tappedSharedProfileBannerAction
{
  return self->_tappedSharedProfileBannerAction;
}

- (void)setBannerActionTypeForEffectiveState:(unint64_t)a3
{
  self->_bannerActionTypeForEffectiveState = a3;
}

- (BOOL)shouldShowSharedProfileBanner
{
  return self->_shouldShowSharedProfileBanner;
}

- (void)setSharedProfileStateOracle:(id)a3
{
}

- (void)setMeCardSharedProfileGroup:(id)a3
{
}

- (CNMeCardSharedProfileGroup)meCardSharedProfileGroup
{
  return self->_meCardSharedProfileGroup;
}

- (void)setCardSharedProfileGroup:(id)a3
{
}

- (CNCardSharedProfileGroup)cardSharedProfileGroup
{
  return self->_cardSharedProfileGroup;
}

- (void)setNamePickingGroup:(id)a3
{
}

- (CNCardNamePickingGroup)namePickingGroup
{
  return self->_namePickingGroup;
}

- (void)setRequiresGameCenterRefresh:(BOOL)a3
{
  self->_requiresGameCenterRefresh = a3;
}

- (BOOL)requiresGameCenterRefresh
{
  return self->_requiresGameCenterRefresh;
}

- (void)setGameCenterGroup:(id)a3
{
}

- (CNCardGameCenterGroup)gameCenterGroup
{
  return self->_gameCenterGroup;
}

- (void)setGameCenterAddFriendAction:(id)a3
{
}

- (CNContactAction)gameCenterAddFriendAction
{
  return self->_gameCenterAddFriendAction;
}

- (void)setCardGameCenterActionGroup:(id)a3
{
}

- (CNCardGroup)cardGameCenterActionGroup
{
  return self->_cardGameCenterActionGroup;
}

- (void)setGameCenterManager:(id)a3
{
}

- (CNCardGameCenterManager)gameCenterManager
{
  return self->_gameCenterManager;
}

- (void)setAddAddressingGrammarAction:(id)a3
{
}

- (CNContactAddAddressingGrammarAction)addAddressingGrammarAction
{
  return self->_addAddressingGrammarAction;
}

- (void)setSelectContainersAction:(id)a3
{
}

- (CNContactSelectContainersAction)selectContainersAction
{
  return self->_selectContainersAction;
}

- (void)setStopSharingWithFamilyAction:(id)a3
{
}

- (CNContactAction)stopSharingWithFamilyAction
{
  return self->_stopSharingWithFamilyAction;
}

- (void)setClearRecentsDataAction:(id)a3
{
}

- (CNContactClearRecentsDataAction)clearRecentsDataAction
{
  return self->_clearRecentsDataAction;
}

- (void)setSuggestedContactAction:(id)a3
{
}

- (CNContactSuggestionAction)suggestedContactAction
{
  return self->_suggestedContactAction;
}

- (void)setUpdateExistingContactAction:(id)a3
{
}

- (CNContactUpdateExistingContactAction)updateExistingContactAction
{
  return self->_updateExistingContactAction;
}

- (void)setAddToExistingContactAction:(id)a3
{
}

- (CNContactAddToExistingContactAction)addToExistingContactAction
{
  return self->_addToExistingContactAction;
}

- (void)setCreateNewContactAction:(id)a3
{
}

- (CNContactCreateNewContactAction)createNewContactAction
{
  return self->_createNewContactAction;
}

- (void)setAddNewFieldAction:(id)a3
{
}

- (CNContactAddNewFieldAction)addNewFieldAction
{
  return self->_addNewFieldAction;
}

- (void)setBlockReportAction:(id)a3
{
}

- (CNContactToggleBlockReportCallerAction)blockReportAction
{
  return self->_blockReportAction;
}

- (void)setBlockAction:(id)a3
{
}

- (CNContactToggleBlockCallerAction)blockAction
{
  return self->_blockAction;
}

- (void)setAddFavoriteAction:(id)a3
{
}

- (CNContactAddFavoriteAction)addFavoriteAction
{
  return self->_addFavoriteAction;
}

- (void)setCreateReminderAction:(id)a3
{
}

- (CNContactAction)createReminderAction
{
  return self->_createReminderAction;
}

- (void)setShareContactAction:(id)a3
{
}

- (CNContactAction)shareContactAction
{
  return self->_shareContactAction;
}

- (void)setAddToGroupAction:(id)a3
{
}

- (CNContactAddToGroupAction)addToGroupAction
{
  return self->_addToGroupAction;
}

- (void)setAddLinkedCardAction:(id)a3
{
}

- (CNContactAddLinkedCardAction)addLinkedCardAction
{
  return self->_addLinkedCardAction;
}

- (void)setLinkedCardsAction:(id)a3
{
}

- (CNPropertyLinkedCardsAction)linkedCardsAction
{
  return self->_linkedCardsAction;
}

- (void)setFaceTimeAction:(id)a3
{
}

- (CNPropertyFaceTimeAction)faceTimeAction
{
  return self->_faceTimeAction;
}

- (void)setSendMessageAction:(id)a3
{
}

- (CNPropertyAction)sendMessageAction
{
  return self->_sendMessageAction;
}

- (void)setNoteCell:(id)a3
{
}

- (CNPropertyNoteCell)noteCell
{
  return self->_noteCell;
}

- (void)setCustomActions:(id)a3
{
}

- (NSArray)customActions
{
  return self->_customActions;
}

- (void)setCardGroupMembershipGroup:(id)a3
{
}

- (CNCardGroupMembershipGroup)cardGroupMembershipGroup
{
  return self->_cardGroupMembershipGroup;
}

- (void)setCardLinkedCardsGroup:(id)a3
{
}

- (CNCardLinkedCardsGroup)cardLinkedCardsGroup
{
  return self->_cardLinkedCardsGroup;
}

- (void)setCardBlockContactGroup:(id)a3
{
}

- (CNCardGroup)cardBlockContactGroup
{
  return self->_cardBlockContactGroup;
}

- (void)setCardStaticIdentityGroup:(id)a3
{
}

- (CNCardStaticIdentityGroup)cardStaticIdentityGroup
{
  return self->_cardStaticIdentityGroup;
}

- (void)setCardMedicalIDGroup:(id)a3
{
}

- (CNCardGroup)cardMedicalIDGroup
{
  return self->_cardMedicalIDGroup;
}

- (void)setCardShareLocationGroup:(id)a3
{
}

- (CNCardGroup)cardShareLocationGroup
{
  return self->_cardShareLocationGroup;
}

- (void)setCardActionsGroup:(id)a3
{
}

- (CNCardGroup)cardActionsGroup
{
  return self->_cardActionsGroup;
}

- (void)setExtraLeftBarButtonItems:(id)a3
{
}

- (NSArray)extraLeftBarButtonItems
{
  return self->_extraLeftBarButtonItems;
}

- (void)setExtraRightBarButtonItems:(id)a3
{
}

- (NSArray)extraRightBarButtonItems
{
  return self->_extraRightBarButtonItems;
}

- (void)setCachedLabelWidths:(id)a3
{
}

- (NSMapTable)cachedLabelWidths
{
  return self->_cachedLabelWidths;
}

- (void)setContactViewBackgroundGradientLayer:(id)a3
{
}

- (CAGradientLayer)contactViewBackgroundGradientLayer
{
  return self->_contactViewBackgroundGradientLayer;
}

- (void)setContactViewBackgroundView:(id)a3
{
}

- (UIView)contactViewBackgroundView
{
  return self->_contactViewBackgroundView;
}

- (void)setHeaderViewBackgroundColors:(id)a3
{
}

- (NSArray)headerViewBackgroundColors
{
  return self->_headerViewBackgroundColors;
}

- (void)setGroupsAfterGroup:(id)a3
{
}

- (NSMutableDictionary)groupsAfterGroup
{
  return self->_groupsAfterGroup;
}

- (void)setDeletedEditingGroups:(id)a3
{
}

- (NSArray)deletedEditingGroups
{
  return self->_deletedEditingGroups;
}

- (void)setNameEditingGroups:(id)a3
{
}

- (NSArray)nameEditingGroups
{
  return self->_nameEditingGroups;
}

- (void)setEditingGroups:(id)a3
{
}

- (NSMutableArray)editingGroups
{
  return self->_editingGroups;
}

- (void)setGroupsAndContainersSaveManager:(id)a3
{
}

- (CNUIGroupsAndContainersSaveManager)groupsAndContainersSaveManager
{
  return self->_groupsAndContainersSaveManager;
}

- (void)setContainerPicker:(id)a3
{
}

- (CNContactContainerPickerViewController)containerPicker
{
  return self->_containerPicker;
}

- (void)setPreviousBackGestureDelegate:(id)a3
{
}

- (UIGestureRecognizerDelegate)previousBackGestureDelegate
{
  return self->_previousBackGestureDelegate;
}

- (void)setEditAuthorizationResult:(int64_t)a3
{
  self->_editAuthorizationResult = a3;
}

- (int64_t)editAuthorizationResult
{
  return self->_editAuthorizationResult;
}

- (void)setEditAuthorizationController:(id)a3
{
}

- (CNUIEditAuthorizationController)editAuthorizationController
{
  return self->_editAuthorizationController;
}

- (void)setEditingHeaderView:(id)a3
{
}

- (void)setDisplayHeaderView:(id)a3
{
}

- (void)setEditingFloatingCollapsedHeaderView:(id)a3
{
}

- (void)setDisplayFloatingCollapsedHeaderView:(id)a3
{
}

- (void)setStaticDisplayHeaderView:(id)a3
{
}

- (void)setContactFormatter:(id)a3
{
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)setEditingContactView:(id)a3
{
}

- (void)setDisplayContactView:(id)a3
{
}

- (void)setContainerContext:(id)a3
{
}

- (CNUIContainerContext)containerContext
{
  return self->_containerContext;
}

- (void)setShadowCopyOfReadonlyContact:(id)a3
{
}

- (CNMutableContact)shadowCopyOfReadonlyContact
{
  return self->_shadowCopyOfReadonlyContact;
}

- (void)setIssuedSaveRequestIdentifiers:(id)a3
{
}

- (NSMutableArray)issuedSaveRequestIdentifiers
{
  return self->_issuedSaveRequestIdentifiers;
}

- (void)setMutableContact:(id)a3
{
}

- (CNMutableContact)mutableContact
{
  return self->_mutableContact;
}

- (void)setMutableContactForHeaderView:(id)a3
{
}

- (void)setPersonHeaderViewDelegate:(id)a3
{
}

- (id)personHeaderViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_personHeaderViewDelegate);

  return WeakRetained;
}

- (id)displayedProperties
{
  return self->_displayedProperties;
}

- (id)personHeaderViewController
{
  return self->_personHeaderViewController;
}

- (id)cardFooterGroup
{
  return self->_cardFooterGroup;
}

- (void)setCardBottomGroup:(id)a3
{
}

- (CNCardGroup)cardBottomGroup
{
  return self->_cardBottomGroup;
}

- (void)setCardTopGroup:(id)a3
{
}

- (CNCardGroup)cardTopGroup
{
  return self->_cardTopGroup;
}

- (id)importantMessage
{
  return self->_importantMessage;
}

- (id)message
{
  return self->_message;
}

- (id)contact
{
  return self->_contact;
}

- (id)alternateName
{
  return self->_alternateName;
}

- (void)setHideCardActions:(BOOL)a3
{
  self->_hideCardActions = a3;
}

- (BOOL)hideCardActions
{
  return self->_hideCardActions;
}

- (void)setShowsGroupMembership:(BOOL)a3
{
  self->_showsGroupMembership = a3;
}

- (void)setShowsSharedProfile:(BOOL)a3
{
  self->_showsSharedProfile = a3;
}

- (BOOL)showsSharedProfile
{
  return self->_showsSharedProfile;
}

- (BOOL)showsInlineActions
{
  return self->_showsInlineActions;
}

- (void)setAllowsNamePicking:(BOOL)a3
{
  self->_allowsNamePicking = a3;
}

- (BOOL)allowsNamePicking
{
  return self->_allowsNamePicking;
}

- (BOOL)allowsEditPhoto
{
  return self->_allowsEditPhoto;
}

- (BOOL)allowsDisplayModePickerActions
{
  return self->_allowsDisplayModePickerActions;
}

- (void)setAllowsActionsModel:(BOOL)a3
{
  self->_allowsActionsModel = a3;
}

- (BOOL)allowsActionsModel
{
  return self->_allowsActionsModel;
}

- (void)setAllowsSettingLinkedContactsAsPreferred:(BOOL)a3
{
  self->_allowsSettingLinkedContactsAsPreferred = a3;
}

- (BOOL)allowsSettingLinkedContactsAsPreferred
{
  return self->_allowsSettingLinkedContactsAsPreferred;
}

- (void)setAllowsSendMessage:(BOOL)a3
{
  self->_allowsSendMessage = a3;
}

- (BOOL)allowsSendMessage
{
  return self->_allowsSendMessage;
}

- (void)setAllowsAddingToAddressBook:(BOOL)a3
{
  self->_allowsAddingToAddressBook = a3;
}

- (BOOL)allowsAddingToAddressBook
{
  return self->_allowsAddingToAddressBook;
}

- (void)setAllowsContactBlockingAndReporting:(BOOL)a3
{
  self->_allowsContactBlockingAndReporting = a3;
}

- (BOOL)allowsContactBlockingAndReporting
{
  return self->_allowsContactBlockingAndReporting;
}

- (void)setAllowsContactBlocking:(BOOL)a3
{
  self->_allowsContactBlocking = a3;
}

- (BOOL)allowsContactBlocking
{
  return self->_allowsContactBlocking;
}

- (void)setAllowsAddToFavorites:(BOOL)a3
{
  self->_allowsAddToFavorites = a3;
}

- (BOOL)allowsAddToFavorites
{
  return self->_allowsAddToFavorites;
}

- (void)setAllowsSharing:(BOOL)a3
{
  self->_allowsSharing = a3;
}

- (BOOL)allowsSharing
{
  return self->_allowsSharing;
}

- (void)setAllowsConferencing:(BOOL)a3
{
  self->_allowsConferencing = a3;
}

- (BOOL)allowsConferencing
{
  return self->_allowsConferencing;
}

- (void)setAllowsCardActions:(BOOL)a3
{
  self->_allowsCardActions = a3;
}

- (BOOL)allowsCardActions
{
  return self->_allowsCardActions;
}

- (BOOL)allowsActions
{
  return self->_allowsActions;
}

- (void)setAllowsEditing:(BOOL)a3
{
  self->_allowsEditing = a3;
}

- (void)setPresentingDelegate:(id)a3
{
}

- (id)presentingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingDelegate);

  return WeakRetained;
}

- (void)setContactViewConfiguration:(id)a3
{
}

- (id)contactViewConfiguration
{
  return self->_contactViewConfiguration;
}

- (void)setShowingMeContact:(BOOL)a3
{
  self->_showingMeContact = a3;
}

- (BOOL)showingMeContact
{
  return self->_showingMeContact;
}

- (void)setDisplayGroups:(id)a3
{
}

- (id)displayGroups
{
  return self->_displayGroups;
}

- (void)setCardDefaultAppGroup:(id)a3
{
}

- (id)cardDefaultAppGroup
{
  return self->_cardDefaultAppGroup;
}

- (void)setCardFaceTimeGroup:(id)a3
{
}

- (id)cardFaceTimeGroup
{
  return self->_cardFaceTimeGroup;
}

- (id)propertyGroups
{
  return self->_propertyGroups;
}

- (void)setRecentsData:(id)a3
{
}

- (id)recentsData
{
  return self->_recentsData;
}

- (void)setProhibitedPropertyKeys:(id)a3
{
}

- (id)prohibitedPropertyKeys
{
  return self->_prohibitedPropertyKeys;
}

- (void)setShouldIgnoreContactStoreDidChangeNotification:(BOOL)a3
{
  self->_shouldIgnoreContactStoreDidChangeNotification = a3;
}

- (BOOL)shouldIgnoreContactStoreDidChangeNotification
{
  return self->_shouldIgnoreContactStoreDidChangeNotification;
}

- (void)setSaveLinkedContactsExecutor:(id)a3
{
}

- (id)saveLinkedContactsExecutor
{
  return self->_saveLinkedContactsExecutor;
}

- (void)setSaveContactExecutor:(id)a3
{
}

- (id)saveContactExecutor
{
  return self->_saveContactExecutor;
}

- (void)setInitialPrompt:(id)a3
{
}

- (id)initialPrompt
{
  return self->_initialPrompt;
}

- (void)setShouldDrawNavigationBar:(BOOL)a3
{
  self->_shouldDrawNavigationBar = a3;
}

- (BOOL)shouldDrawNavigationBar
{
  return self->_shouldDrawNavigationBar;
}

- (void)setAllowsEditInApp:(BOOL)a3
{
  self->_allowsEditInApp = a3;
}

- (BOOL)allowsEditInApp
{
  return self->_allowsEditInApp;
}

- (void)setOriginalContacts:(id)a3
{
}

- (void)setMissingRequiredKeys:(id)a3
{
}

- (id)missingRequiredKeys
{
  return self->_missingRequiredKeys;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (id)managedConfiguration
{
  return self->_managedConfiguration;
}

- (id)contactStore
{
  return self->_contactStore;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setLinkedPoliciesByContactIdentifier:(id)a3
{
}

- (id)linkedPoliciesByContactIdentifier
{
  return self->_linkedPoliciesByContactIdentifier;
}

- (void)setPolicy:(id)a3
{
}

- (id)policy
{
  return self->_policy;
}

- (void)setHighlightedPropertyImportant:(BOOL)a3
{
  self->_highlightedPropertyImportant = a3;
}

- (BOOL)highlightedPropertyImportant
{
  return self->_highlightedPropertyImportant;
}

- (void)setContactDelegate:(id)a3
{
}

- (id)contactDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactDelegate);

  return WeakRetained;
}

- (void)setPptDelegate:(id)a3
{
}

- (CNContactViewControllerPPTDelegate)pptDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pptDelegate);

  return (CNContactViewControllerPPTDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CNContactViewHostProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNContactViewHostProtocol *)WeakRetained;
}

- (BOOL)showContactBlockingFirst
{
  return self->_showContactBlockingFirst;
}

- (void)updateViewAnnotationWithContact:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactContentUnitaryViewController *)self view];
  objc_msgSend(v5, "annotateWithContact:isPrimary:isEditing:", v4, 1, -[CNContactContentUnitaryViewController isEditing](self, "isEditing"));
}

- (void)_lookupKTHandlesIfNeeded
{
  uint64_t v2 = self;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v3 = [(CNContactContentUnitaryViewController *)self cachedVerifiedHandles];

  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F1CA80] set];
    [(CNContactContentUnitaryViewController *)v2 setCachedVerifiedHandles:v4];

    if (![(CNContactContentUnitaryViewController *)v2 didFindStaticIdentity]
      || ([(CNContactContentUnitaryViewController *)v2 cachedStaticIdentity],
          id v5 = objc_claimAutoreleasedReturnValue(),
          v5,
          v5))
    {
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      uint64_t v6 = *MEMORY[0x1E4F1ADC8];
      v58[0] = *MEMORY[0x1E4F1AEE0];
      v58[1] = v6;
      obuint64_t j = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:2];
      uint64_t v7 = [obj countByEnumeratingWithState:&v49 objects:v59 count:16];
      if (!v7) {
        goto LABEL_28;
      }
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v50;
      uint64_t v39 = *(void *)v50;
      while (1)
      {
        uint64_t v10 = 0;
        uint64_t v40 = v8;
        do
        {
          if (*(void *)v50 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v49 + 1) + 8 * v10);
          uint64_t v12 = [(CNContactContentUnitaryViewController *)v2 propertyGroups];
          uint64_t v13 = [v12 objectForKeyedSubscript:v11];

          uint64_t v14 = [v13 displayItems];
          uint64_t v15 = [v14 count];

          if (v15)
          {
            long long v47 = 0u;
            long long v48 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            uint64_t v16 = [v13 displayItems];
            uint64_t v17 = [v16 countByEnumeratingWithState:&v45 objects:v57 count:16];
            if (!v17) {
              goto LABEL_25;
            }
            uint64_t v18 = v17;
            v42 = v13;
            uint64_t v43 = v10;
            char v44 = 0;
            uint64_t v19 = *(void *)v46;
            do
            {
              for (uint64_t i = 0; i != v18; ++i)
              {
                if (*(void *)v46 != v19) {
                  objc_enumerationMutation(v16);
                }
                uint64_t v21 = *(void **)(*((void *)&v45 + 1) + 8 * i);
                uint64_t v22 = [v21 labeledValue];
                uint64_t v23 = [v22 value];

                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  [MEMORY[0x1E4F5A630] idsIDForPhoneNumber:v23];
                }
                else {
                uint64_t v24 = [MEMORY[0x1E4F5A630] idsIDForEmail:v23];
                }
                if (v24)
                {
                  [(CNContactContentUnitaryViewController *)v2 cachedStaticIdentity];
                  v26 = uint64_t v25 = v2;
                  int v27 = [v26 isHandleInStore:v24];

                  uint64_t v2 = v25;
                  if (v27)
                  {
                    v28 = [(CNContactContentUnitaryViewController *)v25 cachedVerifiedHandles];
                    uint64_t v29 = [v21 displayValue];
                    [v28 addObject:v29];

                    char v44 = 1;
                  }
                }
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v45 objects:v57 count:16];
            }
            while (v18);

            uint64_t v9 = v39;
            uint64_t v8 = v40;
            uint64_t v13 = v42;
            uint64_t v10 = v43;
            if (v44)
            {
              uint64_t v16 = [(CNContactContentUnitaryViewController *)v2 contactView];
              [(CNContactContentUnitaryViewController *)v2 reloadCardGroup:v42 forTableView:v16];
LABEL_25:
            }
          }

          ++v10;
        }
        while (v10 != v8);
        uint64_t v8 = [obj countByEnumeratingWithState:&v49 objects:v59 count:16];
        if (!v8) {
          goto LABEL_28;
        }
      }
    }
    [(CNContactContentUnitaryViewController *)v2 setDidFindStaticIdentity:0];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    uint64_t v30 = *MEMORY[0x1E4F1ADC8];
    v60[0] = *MEMORY[0x1E4F1AEE0];
    v60[1] = v30;
    obuint64_t j = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2];
    uint64_t v31 = [obj countByEnumeratingWithState:&v53 objects:v61 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v54;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v54 != v33) {
            objc_enumerationMutation(obj);
          }
          uint64_t v35 = *(void *)(*((void *)&v53 + 1) + 8 * j);
          uint64_t v36 = [(CNContactContentUnitaryViewController *)v2 propertyGroups];
          uint64_t v37 = [v36 objectForKeyedSubscript:v35];

          v38 = [(CNContactContentUnitaryViewController *)v2 contactView];
          [(CNContactContentUnitaryViewController *)v2 reloadCardGroup:v37 forTableView:v38];
        }
        uint64_t v32 = [obj countByEnumeratingWithState:&v53 objects:v61 count:16];
      }
      while (v32);
    }
LABEL_28:
  }
}

- (BOOL)_hasAtLeastOneVerifiedHandle
{
  [(CNContactContentUnitaryViewController *)self cachedStaticIdentity];

  id v3 = [(CNContactContentUnitaryViewController *)self cardGroupForProperty:*MEMORY[0x1E4F1ADC8]];
  id v4 = [v3 displayItems];

  if (!v4) {
    goto LABEL_4;
  }
  id v5 = [v3 displayItems];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__CNContactContentUnitaryViewController__hasAtLeastOneVerifiedHandle__block_invoke;
  v13[3] = &unk_1E549BA20;
  v13[4] = self;
  char v6 = objc_msgSend(v5, "_cn_any:", v13);

  if (v6)
  {
    char v7 = 1;
  }
  else
  {
LABEL_4:
    uint64_t v8 = [(CNContactContentUnitaryViewController *)self cardGroupForProperty:*MEMORY[0x1E4F1AEE0]];
    uint64_t v9 = [v8 displayItems];

    if (v9)
    {
      uint64_t v10 = [v8 displayItems];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __69__CNContactContentUnitaryViewController__hasAtLeastOneVerifiedHandle__block_invoke_2;
      v12[3] = &unk_1E549BA20;
      v12[4] = self;
      char v7 = objc_msgSend(v10, "_cn_any:", v12);
    }
    else
    {
      char v7 = 0;
    }
  }
  return v7;
}

uint64_t __69__CNContactContentUnitaryViewController__hasAtLeastOneVerifiedHandle__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F5A630];
  id v4 = [a2 labeledValue];
  id v5 = [v4 value];
  char v6 = [v3 idsIDForEmail:v5];

  char v7 = [*(id *)(a1 + 32) cachedStaticIdentity];
  uint64_t v8 = [v7 isHandleInStore:v6];

  return v8;
}

uint64_t __69__CNContactContentUnitaryViewController__hasAtLeastOneVerifiedHandle__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F5A630];
  id v4 = [a2 labeledValue];
  id v5 = [v4 value];
  char v6 = [v3 idsIDForPhoneNumber:v5];

  char v7 = [*(id *)(a1 + 32) cachedStaticIdentity];
  uint64_t v8 = [v7 isHandleInStore:v6];

  return v8;
}

- (void)alertDetailsNotVerified:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4FB1418];
  char v6 = CNContactsUIBundle();
  char v7 = [v6 localizedStringForKey:@"STATIC_IDENTITY_DETAILS_NOT_VERIFIED_ALERT" value:&stru_1ED8AC728 table:@"Localized-NARWHAL"];
  uint64_t v8 = CNContactsUIBundle();
  uint64_t v9 = [v8 localizedStringForKey:@"STATIC_IDENTITY_DETAILS_NOT_VERIFIED_MESSAGE" value:&stru_1ED8AC728 table:@"Localized-NARWHAL"];
  uint64_t v10 = [v5 alertControllerWithTitle:v7 message:v9 preferredStyle:1];

  uint64_t v11 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v12 = CNContactsUIBundle();
  uint64_t v13 = [v12 localizedStringForKey:@"OK" value:&stru_1ED8AC728 table:@"Localized"];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __65__CNContactContentUnitaryViewController_alertDetailsNotVerified___block_invoke;
  uint64_t v19 = &unk_1E549BC48;
  uint64_t v20 = self;
  id v21 = v4;
  id v14 = v4;
  uint64_t v15 = [v11 actionWithTitle:v13 style:0 handler:&v16];
  objc_msgSend(v10, "addAction:", v15, v16, v17, v18, v19, v20);

  [(CNContactContentUnitaryViewController *)self presentViewController:v10 animated:1 completion:0];
}

uint64_t __65__CNContactContentUnitaryViewController_alertDetailsNotVerified___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishEditing:*(void *)(a1 + 40)];
}

- (void)alertStaticIdentitySaveFailed:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4FB1418];
  char v6 = CNContactsUIBundle();
  char v7 = [v6 localizedStringForKey:@"STATIC_IDENTITY_INVALID_ACCOUNT_KEY_ALERT" value:&stru_1ED8AC728 table:@"Localized-NARWHAL"];
  uint64_t v8 = CNContactsUIBundle();
  uint64_t v9 = [v8 localizedStringForKey:@"STATIC_IDENTITY_INVALID_ACCOUNT_KEY_MESSAGE" value:&stru_1ED8AC728 table:@"Localized-NARWHAL"];
  uint64_t v10 = [v5 alertControllerWithTitle:v7 message:v9 preferredStyle:1];

  objc_initWeak(&location, self);
  uint64_t v11 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v12 = CNContactsUIBundle();
  uint64_t v13 = [v12 localizedStringForKey:@"OK" value:&stru_1ED8AC728 table:@"Localized"];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __71__CNContactContentUnitaryViewController_alertStaticIdentitySaveFailed___block_invoke;
  v16[3] = &unk_1E549BC20;
  objc_copyWeak(&v18, &location);
  id v14 = v4;
  id v17 = v14;
  uint64_t v15 = [v11 actionWithTitle:v13 style:0 handler:v16];
  [v10 addAction:v15];

  [(CNContactContentUnitaryViewController *)self presentViewController:v10 animated:1 completion:0];
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __71__CNContactContentUnitaryViewController_alertStaticIdentitySaveFailed___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setCachedStaticIdentity:0];
  [WeakRetained setCachedVerifiedHandles:0];
  [WeakRetained finishEditing:*(void *)(a1 + 32)];
}

- (id)transparentPlatterImage
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1818], "cnui_imageNamed:", @"transparent-image");
}

- (id)buttonPlatterImage
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1818], "cnui_roundedNavButtonPlatterImage");
}

- (id)defaulTextColor
{
  uint64_t v2 = *MEMORY[0x1E4F5A268];
  id v3 = [(CNContactContentUnitaryViewController *)self contact];
  id v4 = [v3 wallpaper];
  id v5 = [v4 posterArchiveData];
  if ((*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v5)) {
    +[CNUIColorRepository contactCardStaticAvatarHeaderDefaultTextColor];
  }
  else {
  char v6 = +[CNUIColorRepository contactCardStaticHeaderDefaultTintColor];
  }

  return v6;
}

- (void)setContactViewBackgroundToMatchHeader
{
  if ([(CNContactContentUnitaryViewController *)self shouldSetBackgroundColorToMatchHeader])
  {
    id v26 = [(CNContactContentUnitaryViewController *)self headerViewBackgroundColors];
    id v3 = [(CNContactContentUnitaryViewController *)self headerViewBackgroundColors];
    uint64_t v4 = [v3 count];

    if (v4 == 1)
    {
      id v5 = [(CNContactContentUnitaryViewController *)self headerViewBackgroundColors];
      char v6 = [v5 firstObject];
      char v7 = [(CNContactContentUnitaryViewController *)self contactViewBackgroundView];
      [v7 setBackgroundColor:v6];

      uint64_t v8 = [(CNContactContentUnitaryViewController *)self contactViewBackgroundGradientLayer];
      [v8 setColors:0];
    }
    else
    {
      uint64_t v9 = [(CNContactContentUnitaryViewController *)self contactViewBackgroundView];
      [v9 setBackgroundColor:0];

      uint64_t v10 = [(CNContactContentUnitaryViewController *)self contactView];
      [v10 bounds];
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      uint64_t v19 = [(CNContactContentUnitaryViewController *)self contactViewBackgroundGradientLayer];
      objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

      uint64_t v20 = objc_msgSend(v26, "_cn_map:", &__block_literal_global_984);
      id v21 = objc_msgSend(v20, "_cn_reversed");
      uint64_t v22 = [(CNContactContentUnitaryViewController *)self contactViewBackgroundGradientLayer];
      [v22 setColors:v21];

      uint64_t v23 = [(CNContactContentUnitaryViewController *)self contactViewBackgroundGradientLayer];
      objc_msgSend(v23, "setStartPoint:", 0.0, 0.5);

      uint64_t v8 = [(CNContactContentUnitaryViewController *)self contactViewBackgroundGradientLayer];
      objc_msgSend(v8, "setEndPoint:", 1.0, 0.5);
    }

    displayFloatingCollapsedHeaderView = self->_displayFloatingCollapsedHeaderView;
    uint64_t v25 = [(CNContactContentUnitaryViewController *)self headerViewBackgroundColors];
    [(CNContactHeaderCollapsedView *)displayFloatingCollapsedHeaderView updateBackgroundWithGradientColors:v25 horizontal:1];
  }
}

uint64_t __78__CNContactContentUnitaryViewController_setContactViewBackgroundToMatchHeader__block_invoke(int a1, id a2)
{
  id v2 = a2;

  return [v2 CGColor];
}

- (BOOL)shouldSetBackgroundColorToMatchHeader
{
  if ([(CNContactContentUnitaryViewController *)self shouldUseStaticHeader]
    && [(CNContactContentUnitaryViewController *)self isOrientationPhoneLandscape])
  {
    uint64_t v3 = *MEMORY[0x1E4F5A258];
    uint64_t v4 = [(CNContactContentUnitaryViewController *)self headerViewBackgroundColors];
    if ((*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4)) {
      LOBYTE(v5) = 0;
    }
    else {
      int v5 = [(CNContactContentUnitaryViewController *)self isEditing] ^ 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (id)applyContactStyle
{
  v79[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[CNContactStyle currentStyle];
  if ([(CNContactContentUnitaryViewController *)self shouldUseStaticHeader])
  {
    [(CAGradientLayer *)self->_contactViewBackgroundGradientLayer setColors:0];
    [(UIView *)self->_contactViewBackgroundView setBackgroundColor:0];
  }
  if ([(CNContactContentUnitaryViewController *)self shouldSetBackgroundColorToMatchHeader])
  {
    [(CNContactContentUnitaryViewController *)self setContactViewBackgroundToMatchHeader];
    goto LABEL_10;
  }
  if ([(CNContactContentUnitaryViewController *)self forcesTransparentBackground])
  {
    uint64_t v4 = +[CNUIColorRepository transparentBackgroundColor];
  }
  else
  {
    int v5 = [v3 backgroundColor];

    if (!v5) {
      goto LABEL_10;
    }
    uint64_t v4 = [v3 backgroundColor];
  }
  char v6 = (void *)v4;
  char v7 = [(CNContactContentUnitaryViewController *)self contactView];
  [v7 setBackgroundColor:v6];

LABEL_10:
  uint64_t v8 = [v3 sectionBackgroundColor];
  uint64_t v9 = [(CNContactContentUnitaryViewController *)self contactView];
  [v9 setSectionBackgroundColor:v8];

  uint64_t v10 = [v3 separatorColor];
  double v11 = [(CNContactContentUnitaryViewController *)self contactView];
  [v11 setSeparatorColor:v10];

  double v12 = [v3 selectedCellBackgroundColor];
  double v13 = [(CNContactContentUnitaryViewController *)self contactView];
  [v13 setSelectedCellBackgroundColor:v12];

  double v14 = (void *)MEMORY[0x1E4F1CA60];
  double v15 = [(CNContactContentUnitaryViewController *)self contactView];
  double v16 = [v15 valueTextAttributes];
  double v17 = [v14 dictionaryWithDictionary:v16];

  uint64_t v18 = *MEMORY[0x1E4FB0700];
  v78[0] = *MEMORY[0x1E4FB0700];
  uint64_t v19 = [v3 textColor];
  v78[1] = @"ABNotesTextColorAttributeName";
  v79[0] = v19;
  uint64_t v20 = [v3 notesTextColor];
  v79[1] = v20;
  id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:2];
  [v17 addEntriesFromDictionary:v21];

  uint64_t v22 = [(CNContactContentUnitaryViewController *)self contactView];
  [v22 setValueTextAttributes:v17];

  if ([(CNContactContentUnitaryViewController *)self forcesTransparentBackground])
  {
    uint64_t v23 = +[CNUIColorRepository transparentBackgroundColor];
    [(CNContactHeaderDisplayView *)self->_displayHeaderView setBackgroundColor:v23];

    uint64_t v24 = +[CNUIColorRepository transparentBackgroundColor];
    [(CNContactHeaderEditView *)self->_editingHeaderView setBackgroundColor:v24];

    uint64_t v25 = +[CNUIColorRepository transparentBackgroundColor];
    [(UIView *)self->_editingFloatingCollapsedHeaderView setBackgroundColor:v25];

    id v26 = +[CNUIColorRepository transparentBackgroundColor];
  }
  else
  {
    int v27 = [(CNContactContentUnitaryViewController *)self environment];
    int v28 = [v27 runningInContactsAppOniPad];

    if (v28)
    {
      uint64_t v29 = +[CNUIColorRepository contactCardBackgroundiPadOverwriteColor];
      [(CNContactHeaderDisplayView *)self->_displayHeaderView setBackgroundColor:v29];

      uint64_t v30 = +[CNUIColorRepository contactCardBackgroundiPadOverwriteColor];
      [(CNContactHeaderEditView *)self->_editingHeaderView setBackgroundColor:v30];

      uint64_t v31 = +[CNUIColorRepository contactCardBackgroundiPadOverwriteColor];
      [(UIView *)self->_editingFloatingCollapsedHeaderView setBackgroundColor:v31];

      +[CNUIColorRepository contactCardBackgroundiPadOverwriteColor];
    }
    else
    {
      uint64_t v32 = [v3 contactHeaderBackgroundColor];
      [(CNContactHeaderDisplayView *)self->_displayHeaderView setBackgroundColor:v32];

      uint64_t v33 = [v3 contactHeaderBackgroundColor];
      [(CNContactHeaderEditView *)self->_editingHeaderView setBackgroundColor:v33];

      v34 = [v3 contactHeaderBackgroundColor];
      [(UIView *)self->_editingFloatingCollapsedHeaderView setBackgroundColor:v34];

      [v3 contactHeaderBackgroundColor];
    id v26 = };
  }
  [(CNContactActionsContainerView *)self->_actionsWrapperView setBackgroundColor:v26];

  int v35 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
  BOOL v36 = [(CNContactContentUnitaryViewController *)self shouldUseStaticHeader];
  if (!v36 || !v35)
  {
    if (!v36) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if ([(CNContactContentUnitaryViewController *)self isOrientationPhoneLandscape])
  {
LABEL_21:
    uint64_t v37 = +[CNUIColorRepository transparentBackgroundColor];
    [(CNContactActionsContainerView *)self->_actionsWrapperView setBackgroundColor:v37];

    v38 = +[CNUIColorRepository transparentBackgroundColor];
    [(CNContactActionsContainerView *)self->_floatingActionsWrapperView setBackgroundColor:v38];
  }
LABEL_22:
  editingHeaderView = self->_editingHeaderView;
  uint64_t v76 = v18;
  uint64_t v40 = [v3 textColor];
  v77 = v40;
  v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
  [editingHeaderView cn_updateDictionaryForKey:@"nameTextAttributes" withChanges:v41];

  displayHeaderView = self->_displayHeaderView;
  uint64_t v74 = v18;
  uint64_t v43 = [v3 taglineTextColor];
  v75 = v43;
  char v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
  [displayHeaderView cn_updateDictionaryForKey:@"taglineTextAttributes" withChanges:v44];

  if ((![(CNContactContentUnitaryViewController *)self shouldUseStaticHeader] | v35))
  {
    long long v45 = [(CNContactContentUnitaryViewController *)self actionsViewController];
    objc_msgSend(v45, "setViewStyle:", objc_msgSend(v3, "topActionsViewStyle"));
  }
  else
  {
    long long v46 = [(CNContactContentUnitaryViewController *)self floatingActionsViewController];
    [v46 setViewStyle:10];

    long long v47 = [(CNContactContentUnitaryViewController *)self floatingActionsViewController];
    long long v48 = [v47 actionsView];
    [v48 setEnableVisualEffectViewCaptureView:0];

    long long v49 = [(CNContactContentUnitaryViewController *)self actionsViewController];
    [v49 setViewStyle:10];

    long long v45 = +[CNUIColorRepository contactCardStaticHeaderDefaultTintColor];
    [(CNContactInlineActionsViewController *)self->_actionsViewController setPosterTintColor:v45];
    [(CNContactInlineActionsViewController *)self->_floatingActionsViewController setPosterTintColor:v45];
  }

  int v50 = [v3 usesOpaqueBackground];
  long long v51 = [(CNContactContentUnitaryViewController *)self actionsViewController];
  long long v52 = [v51 view];
  long long v53 = [v52 layer];
  long long v54 = v53;
  if (v50)
  {
    [v53 setShadowRadius:8.0];

    long long v55 = [(CNContactContentUnitaryViewController *)self actionsViewController];
    long long v56 = [v55 view];
    v57 = [v56 layer];
    objc_msgSend(v57, "setShadowOffset:", 0.0, 2.0);

    v58 = [(CNContactContentUnitaryViewController *)self actionsViewController];
    v59 = [v58 view];
    v60 = [v59 layer];
    LODWORD(v61) = 1025758986;
    [v60 setShadowOpacity:v61];

    if (![(CNContactContentUnitaryViewController *)self shouldUseStaticHeader]) {
      goto LABEL_31;
    }
    uint64_t v62 = [(CNContactContentUnitaryViewController *)self floatingActionsViewController];
    v63 = [v62 view];
    v64 = [v63 layer];
    [v64 setShadowRadius:8.0];

    v65 = [(CNContactContentUnitaryViewController *)self floatingActionsViewController];
    v66 = [v65 view];
    v67 = [v66 layer];
    objc_msgSend(v67, "setShadowOffset:", 0.0, 2.0);

    v68 = [(CNContactContentUnitaryViewController *)self floatingActionsViewController];
    v69 = [v68 view];
    v70 = [v69 layer];
    v71 = v70;
    LODWORD(v72) = 1025758986;
  }
  else
  {
    [v53 setShadowOpacity:0.0];

    if (![(CNContactContentUnitaryViewController *)self shouldUseStaticHeader]) {
      goto LABEL_31;
    }
    v68 = [(CNContactContentUnitaryViewController *)self floatingActionsViewController];
    v69 = [v68 view];
    v70 = [v69 layer];
    v71 = v70;
    double v72 = 0.0;
  }
  [v70 setShadowOpacity:v72];

LABEL_31:

  return v3;
}

- (void)updateTableView:(id)a3 contentInsetsTo:(UIEdgeInsets)a4 withScrollIndicatorInsets:(UIEdgeInsets)a5
{
  double bottom = a5.bottom;
  double right = a5.right;
  double left = a5.left;
  double top = a5.top;
  double v7 = a4.right;
  double v8 = a4.bottom;
  double v9 = a4.left;
  double v10 = a4.top;
  id v19 = a3;
  [v19 contentInset];
  double v12 = v10 - v11;
  [v19 contentOffset];
  double v14 = v13;
  double v16 = v15 - v12;
  objc_msgSend(v19, "setContentInset:", v10, v9, v8, v7);
  objc_msgSend(v19, "setScrollIndicatorInsets:", top, left, bottom, right);
  objc_msgSend(v19, "setContentOffset:", v14, v16);
}

- (UIEdgeInsets)scrollIndicatorInsetsForContactTableView:(id)a3 withContentInsets:(UIEdgeInsets)a4
{
  CGFloat right = a4.right;
  CGFloat left = a4.left;
  double top = a4.top;
  id v8 = a3;
  [v8 _systemContentInset];
  double v10 = top + v9;
  [(CNContactContentUnitaryViewController *)self keyboardVerticalOverlap];
  double v12 = v11;
  [v8 _systemContentInset];
  double v14 = v13;

  double v15 = fmax(v12 - v14, 0.0);
  double v16 = v10;
  double v17 = left;
  double v18 = right;
  result.CGFloat right = v18;
  result.double bottom = v15;
  result.CGFloat left = v17;
  result.double top = v16;
  return result;
}

- (UIEdgeInsets)insetsForContactTableView:(id)a3
{
  id v4 = a3;
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  if (![(CNContactContentUnitaryViewController *)self shouldUseStaticHeader])
  {
    id v8 = [(CNContactContentUnitaryViewController *)self contactHeaderView];
    [v8 minHeight];
    double v7 = v9;

    double v10 = [(CNContactContentUnitaryViewController *)self contactHeaderView];
    [v10 maxHeight];
    double v6 = v11;

    if (v6 == 0.0)
    {
      double v15 = *MEMORY[0x1E4FB2848];
      double v27 = *(double *)(MEMORY[0x1E4FB2848] + 8);
      double v49 = *(double *)(MEMORY[0x1E4FB2848] + 16);
      double v29 = *(double *)(MEMORY[0x1E4FB2848] + 24);
      goto LABEL_24;
    }
    if ((objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory") & 1) == 0
      && ([(CNContactContentUnitaryViewController *)self isEditing] & 1) == 0)
    {
      double v12 = [(CNContactContentUnitaryViewController *)self actionsWrapperView];
      [v12 frame];
      double v5 = v13;
    }
  }
  [v4 _systemContentInset];
  double v15 = v5 + v6 - v14;
  [v4 bounds];
  double v17 = v6 - v7 + v16;
  [v4 _systemContentInset];
  double v19 = v17 - v18 - v15;
  [v4 _systemContentInset];
  double v21 = v20;
  [(CNContactContentUnitaryViewController *)self keyboardVerticalOverlap];
  if (v21 >= v22) {
    double v22 = v21;
  }
  double v23 = v19 - v22;
  [v4 contentSize];
  if (v23 - v24 >= 0.0) {
    double v25 = v23 - v24;
  }
  else {
    double v25 = 0.0;
  }
  [v4 contentInset];
  double v27 = v26;
  double v29 = v28;
  [(CNContactContentUnitaryViewController *)self keyboardVerticalOverlap];
  if (v30 <= 0.0)
  {
    [v4 _systemContentInset];
    double v48 = -v47;
    goto LABEL_21;
  }
  uint64_t v31 = [(CNContactContentUnitaryViewController *)self view];
  uint64_t v32 = [v31 window];
  if (v32)
  {
    uint64_t v33 = (void *)v32;
    v34 = [(CNContactContentUnitaryViewController *)self view];
    int v35 = [v34 window];
    [v35 bounds];
    double v37 = v36;
    [v4 bounds];
    double v39 = v38;

    double v40 = 0.0;
    if (v37 <= v39) {
      goto LABEL_20;
    }
    v41 = [(CNContactContentUnitaryViewController *)self view];
    v42 = [v41 window];
    [v42 bounds];
    double v44 = v43;
    [v4 bounds];
    double v40 = v44 - v45;

    if ([(CNContactContentUnitaryViewController *)self shouldUseStaticHeader]) {
      goto LABEL_20;
    }
    uint64_t v31 = [(CNContactContentUnitaryViewController *)self contactHeaderView];
    [v31 minTitleOffset];
    double v40 = v40 - v46;
  }
  else
  {
    double v40 = 0.0;
  }

LABEL_20:
  [(CNContactContentUnitaryViewController *)self keyboardVerticalOverlap];
  double v51 = v50;
  [v4 _systemContentInset];
  double v48 = v40 + v51 - v52;
LABEL_21:
  if (v25 >= v48) {
    double v49 = v25;
  }
  else {
    double v49 = v48;
  }
LABEL_24:

  double v53 = v15;
  double v54 = v27;
  double v55 = v49;
  double v56 = v29;
  result.CGFloat right = v56;
  result.double bottom = v55;
  result.CGFloat left = v54;
  result.double top = v53;
  return result;
}

- (void)initializeTableViewsForHeaderHeight
{
  id v39 = [(CNContactContentUnitaryViewController *)self contactView];
  [v39 layoutIfNeeded];
  uint64_t v3 = [(CNContactContentUnitaryViewController *)self actionsWrapperView];
  [v3 setNeedsLayout];

  id v4 = [(CNContactContentUnitaryViewController *)self actionsWrapperView];
  [v4 layoutIfNeeded];

  if ([(CNContactContentUnitaryViewController *)self shouldUseStaticHeader])
  {
    double v5 = [(CNContactContentUnitaryViewController *)self floatingActionsWrapperView];
    [v5 setNeedsLayout];

    double v6 = [(CNContactContentUnitaryViewController *)self floatingActionsWrapperView];
    [v6 layoutIfNeeded];

    double v7 = [(CNContactContentUnitaryViewController *)self displayFloatingCollapsedHeaderView];
    [v7 calculateLabelSizesIfNeeded];
  }
  id v8 = [(CNContactContentUnitaryViewController *)self contactHeaderView];
  [v8 calculateLabelSizesIfNeeded];

  if ([(CNContactContentUnitaryViewController *)self isEditing])
  {
    double v9 = [(CNContactContentUnitaryViewController *)self headerHeightConstraint];
    [v9 constant];
    double v11 = v10;
    double v12 = [(CNContactContentUnitaryViewController *)self contactHeaderView];
    [v12 minHeight];
    if (v11 > v13) {
      double v14 = 0.0;
    }
    else {
      double v14 = 1.0;
    }
    double v15 = [(CNContactContentUnitaryViewController *)self headerDropShadowView];
    [v15 setAlpha:v14];

    if (![(CNContactContentUnitaryViewController *)self shouldUseStaticHeader]) {
      goto LABEL_17;
    }
    [(CNContactContentUnitaryViewController *)self editingFloatingHeaderHeight];
    double v17 = v16;
    double v18 = [(CNContactContentUnitaryViewController *)self editingFloatingHeaderHeightConstraint];
    [v18 constant];
    double v20 = v19;

    if (v20 != v17)
    {
      double v21 = [(CNContactContentUnitaryViewController *)self editingFloatingHeaderHeightConstraint];
      [v21 setConstant:v17];
    }
    double v22 = [(CNContactContentUnitaryViewController *)self contactHeaderView];
    [v22 maxHeight];
    double v24 = v23;
  }
  else
  {
    double v25 = [(CNContactContentUnitaryViewController *)self headerDropShadowView];
    [v25 setAlpha:1.0];

    if (![(CNContactContentUnitaryViewController *)self shouldUseStaticHeader]) {
      goto LABEL_17;
    }
    double v26 = [(CNContactContentUnitaryViewController *)self displayFloatingCollapsedHeaderView];
    [v26 maxHeight];
    double v28 = v27;

    double v29 = [(CNContactContentUnitaryViewController *)self floatingHeaderHeightConstraint];
    [v29 constant];
    double v31 = v30;

    if (v31 != v28)
    {
      uint64_t v32 = [(CNContactContentUnitaryViewController *)self floatingHeaderHeightConstraint];
      [v32 setConstant:v28];
    }
    [(CNContactContentUnitaryViewController *)self staticDisplayHeaderHeight];
    double v24 = v33;
  }
  v34 = [(CNContactContentUnitaryViewController *)self headerHeightConstraint];
  [v34 constant];
  double v36 = v35;

  if (v36 != v24)
  {
    double v37 = [(CNContactContentUnitaryViewController *)self headerHeightConstraint];
    [v37 setConstant:v24];
  }
LABEL_17:
  double v38 = [(CNContactContentUnitaryViewController *)self contactHeaderView];
  [v38 layoutIfNeeded];

  [(CNContactContentUnitaryViewController *)self updateInsetsIfNeededForTableView:v39 isEditing:[(CNContactContentUnitaryViewController *)self isEditing]];
  if ([(CNContactContentUnitaryViewController *)self shouldUseStaticHeader]) {
    [(CNContactContentUnitaryViewController *)self updateCollapsedHeaderToMatchScrollViewState:v39 scrollDirection:2 animated:0];
  }
  else {
    [(CNContactContentUnitaryViewController *)self updateHeaderHeightToMatchScrollViewState:v39 scrollDirection:2 animated:0];
  }
}

- (void)updateInsetsIfNeededForTableView:(id)a3 isEditing:(BOOL)a4
{
  id v44 = a3;
  if (![(CNContactContentUnitaryViewController *)self shouldUseStaticHeader])
  {
    [(CNContactContentUnitaryViewController *)self keyboardVerticalOverlap];
    if (v5 <= 0.0
      || ([(CNContactContentUnitaryViewController *)self view],
          double v6 = objc_claimAutoreleasedReturnValue(),
          [v6 bounds],
          double v8 = v7,
          v6,
          v8 <= 0.0))
    {
      double v15 = [(CNContactContentUnitaryViewController *)self contactHeaderView];
      double v16 = [(CNContactContentUnitaryViewController *)self contactHeaderView];
      [v16 maxHeight];
      double v19 = v15;
      BOOL v18 = 0;
    }
    else
    {
      double v9 = [(CNContactContentUnitaryViewController *)self view];
      [v9 bounds];
      double v11 = v10;
      [(CNContactContentUnitaryViewController *)self keyboardVerticalOverlap];
      double v13 = v11 - v12 + -64.0;

      double v14 = fmax(v13, 0.0);
      double v15 = [(CNContactContentUnitaryViewController *)self contactHeaderView];
      double v16 = [(CNContactContentUnitaryViewController *)self contactHeaderView];
      [v16 maxHeight];
      BOOL v18 = v14 <= v17;
      double v19 = v15;
      double v20 = v14;
    }
    [v19 setConstrainedMaxHeight:v18 enabled:v20];
  }
  [v44 contentInset];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  [(CNContactContentUnitaryViewController *)self insetsForContactTableView:v44];
  if (v30 != v24 || v29 != v22 || v32 != v28 || v31 != v26)
  {
    double v36 = v29;
    double v37 = v30;
    double v38 = v31;
    double v39 = v32;
    -[CNContactContentUnitaryViewController scrollIndicatorInsetsForContactTableView:withContentInsets:](self, "scrollIndicatorInsetsForContactTableView:withContentInsets:", v44);
    -[CNContactContentUnitaryViewController updateTableView:contentInsetsTo:withScrollIndicatorInsets:](self, "updateTableView:contentInsetsTo:withScrollIndicatorInsets:", v44, v36, v37, v38, v39, v40, v41, v42, v43);
  }
}

- (void)scrollScrollViewAllTheWayUp:(id)a3
{
  id v8 = a3;
  [v8 contentOffset];
  double v4 = v3;
  [v8 contentInset];
  double v6 = v5;
  [v8 _systemContentInset];
  objc_msgSend(v8, "setContentOffset:", v4, -(v6 + v7));
}

- (BOOL)shouldUseStaticHeader
{
  id v2 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  double v3 = [v2 featureFlags];
  char v4 = [v3 isFeatureEnabled:16];

  return v4;
}

- (BOOL)isScrollViewControllingHeaderResizeAnimation:(id)a3
{
  id v4 = a3;
  if ([(CNContactContentUnitaryViewController *)self shouldUseStaticHeader])
  {
    BOOL v5 = 0;
  }
  else
  {
    id v6 = [(CNContactContentUnitaryViewController *)self contactView];
    BOOL v5 = v6 == v4;
  }
  return v5;
}

- (double)updateHeaderConstraintForGlobalHeaderHeight:(double)a3 direction:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v8 = [(CNContactContentUnitaryViewController *)self shouldUseStaticHeader];
  double result = 0.0;
  if (!v8)
  {
    double v10 = 0.0;
    if ((objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory", 0.0) & 1) == 0
      && ([(CNContactContentUnitaryViewController *)self isEditing] & 1) == 0)
    {
      double v11 = [(CNContactContentUnitaryViewController *)self actionsWrapperView];
      [v11 frame];
      double v10 = v12;
    }
    double v13 = [(CNContactContentUnitaryViewController *)self headerHeightConstraint];
    [v13 constant];
    double v15 = v14;

    if (a3 - v10 != v15 && (a4 || a3 - v10 > v15))
    {
      double v16 = [(CNContactContentUnitaryViewController *)self headerHeightConstraint];
      [v16 setConstant:a3 - v10];

      return a3;
    }
    else
    {
      return v10 + v15;
    }
  }
  return result;
}

- (void)updateHeaderHeightToMatchScrollViewState:(id)a3 scrollDirection:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v19 = a3;
  if (![(CNContactContentUnitaryViewController *)self shouldUseStaticHeader])
  {
    [v19 contentOffset];
    double v9 = v8;
    [v19 contentInset];
    -[CNContactContentUnitaryViewController globalHeaderHeightForContentOffset:contentInset:](self, "globalHeaderHeightForContentOffset:contentInset:", v9, v10, v11, v12, v13);
    -[CNContactContentUnitaryViewController updateHeaderConstraintForGlobalHeaderHeight:direction:animated:](self, "updateHeaderConstraintForGlobalHeaderHeight:direction:animated:", a4, v5);
    double v15 = v14;
    objc_opt_class();
    id v16 = v19;
    if (objc_opt_isKindOfClass()) {
      double v17 = v16;
    }
    else {
      double v17 = 0;
    }
    id v18 = v17;

    [v18 setMaskingInset:v15];
  }
}

- (double)contentOffsetYForGlobalHeaderHeight:(double)a3 contentInset:(UIEdgeInsets)a4
{
  return -a3;
}

- (double)globalHeaderHeightForContentOffset:(double)a3 contentInset:(UIEdgeInsets)a4
{
  double top = a4.top;
  double v7 = 0.0;
  if ((objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory", a3, a4.top, a4.left, a4.bottom, a4.right) & 1) == 0&& (-[CNContactContentUnitaryViewController isEditing](self, "isEditing") & 1) == 0)
  {
    double v8 = [(CNContactContentUnitaryViewController *)self actionsWrapperView];
    [v8 frame];
    double v7 = v9;
  }
  double v10 = [(CNContactContentUnitaryViewController *)self contactView];
  [v10 _systemContentInset];
  double v12 = top + v11;

  if (-v12 <= a3) {
    double v13 = -a3;
  }
  else {
    double v13 = v12;
  }
  double v14 = [(CNContactContentUnitaryViewController *)self contactHeaderView];
  [v14 minHeight];
  double v16 = v7 + v15;

  if (v13 >= v16) {
    return v13;
  }
  else {
    return v16;
  }
}

- (void)updateDisplayCollapsedHeaderToMatchScrollViewState:(id)a3 scrollDirection:(int64_t)a4 animated:(BOOL)a5
{
  id v24 = a3;
  if ([(CNContactContentUnitaryViewController *)self shouldUseStaticHeader]
    && ([(CNContactContentUnitaryViewController *)self isEditing] & 1) == 0)
  {
    id v6 = [(CNContactContentUnitaryViewController *)self staticDisplayHeaderView];
    [v6 frame];
    double v8 = v7;
    double v9 = [(CNContactContentUnitaryViewController *)self displayFloatingCollapsedHeaderView];
    [v9 frame];
    double v11 = v8 - v10;

    if (objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory"))
    {
      double v12 = [(CNContactContentUnitaryViewController *)self actionsWrapperView];
      [v12 frame];
      double v14 = v13;
    }
    else
    {
      double v12 = [(CNContactContentUnitaryViewController *)self staticDisplayHeaderView];
      [v12 bottomMargin];
      double v14 = v15;
    }

    double v16 = v11 - v14;
    [v24 contentOffset];
    double v18 = v17;
    BOOL v19 = v17 >= v16;
    double v20 = [(CNContactContentUnitaryViewController *)self displayFloatingCollapsedHeaderView];
    int v21 = [v20 isHidden];

    if (((v19 ^ v21) & 1) == 0)
    {
      double v22 = [(CNContactContentUnitaryViewController *)self displayFloatingCollapsedHeaderView];
      [v22 setHidden:v18 < v16];

      double v23 = [(CNContactContentUnitaryViewController *)self displayFloatingCollapsedHeaderView];
      [v23 showLabelAndAvatar:v18 >= v16 animated:1];
    }
  }
}

- (void)updateCollapsedHeaderToMatchScrollViewState:(id)a3 scrollDirection:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if ([(CNContactContentUnitaryViewController *)self shouldUseStaticHeader]
    && ([(CNContactContentUnitaryViewController *)self isEditing] & 1) == 0)
  {
    [(CNContactContentUnitaryViewController *)self updateDisplayCollapsedHeaderToMatchScrollViewState:v8 scrollDirection:a4 animated:v5];
  }
}

- (void)sharingStatusDidChange
{
}

- (void)presentViewController:(id)a3 sourceView:(id)a4
{
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  id v25 = a3;
  if (![(CNContactContentUnitaryViewController *)self shouldUseStaticHeader])
  {
    id v8 = [(CNContactContentUnitaryViewController *)self contactHeaderView];
    [v8 minHeight];
    double v10 = v9;

    double v11 = [(CNContactContentUnitaryViewController *)self contactHeaderView];
    [v11 maxHeight];
    double v13 = v12;

    if ([(CNContactContentUnitaryViewController *)self isScrollViewControllingHeaderResizeAnimation:v25])
    {
      double v14 = v13 - a5->y;
      [v25 contentInset];
      double v16 = v14 - v15;
      [v25 _systemContentInset];
      double v18 = v16 - v17;
      if (y <= 0.0)
      {
        BOOL v19 = v25;
        if (y >= 0.0)
        {
          if (v18 > v10 && v18 < v13)
          {
            if (v18 - v10 >= (v13 - v10) * 0.5) {
              double v18 = v13;
            }
            else {
              double v18 = v10;
            }
          }
        }
        else if (v18 < v13)
        {
          double v18 = v13;
        }
      }
      else
      {
        BOOL v19 = v25;
        if (v18 > v10) {
          double v18 = v10;
        }
      }
      double v21 = v13 - v18;
      [v19 contentInset];
      double v23 = v21 - v22;
      [v25 _systemContentInset];
      a5->double y = v23 - v24;
    }
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v6 = a3;
  if (-[CNContactContentUnitaryViewController isScrollViewControllingHeaderResizeAnimation:](self, "isScrollViewControllingHeaderResizeAnimation:"))
  {
    [v6 _verticalVelocity];
    [(CNContactContentUnitaryViewController *)self updateHeaderHeightToMatchScrollViewState:v6 scrollDirection:v4 >= 0.0 animated:1];
  }
  else if ([(CNContactContentUnitaryViewController *)self shouldUseStaticHeader])
  {
    BOOL v5 = [(CNContactContentUnitaryViewController *)self staticDisplayHeaderView];
    [v6 contentOffset];
    objc_msgSend(v5, "updatePosterImageViewForScrollOffset:");

    [(CNContactContentUnitaryViewController *)self updateCollapsedHeaderToMatchScrollViewState:v6 scrollDirection:2 animated:0];
  }
}

- (void)setEditKeyboardShortcutEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CNContactContentUnitaryViewController *)self editCommand];

  if (v3)
  {
    if (!v5)
    {
      id v6 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"l" modifierFlags:0x100000 action:sel_toggleEditing_];
      [(CNContactContentUnitaryViewController *)self setEditCommand:v6];

      double v7 = CNContactsUIBundle();
      id v8 = [v7 localizedStringForKey:@"EDIT_CONTACT_KEYBOARD_DISCOVERY" value:&stru_1ED8AC728 table:@"Localized"];
      double v9 = [(CNContactContentUnitaryViewController *)self editCommand];
      [v9 setDiscoverabilityTitle:v8];

      id v11 = [(CNContactContentUnitaryViewController *)self editCommand];
      [(CNContactContentUnitaryViewController *)self addKeyCommand:v11];
    }
  }
  else if (v5)
  {
    double v10 = [(CNContactContentUnitaryViewController *)self editCommand];
    [(CNContactContentUnitaryViewController *)self removeKeyCommand:v10];

    [(CNContactContentUnitaryViewController *)self setEditCommand:0];
  }
}

- (void)setCancelKeyboardShortcutEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CNContactContentUnitaryViewController *)self cancelCommand];

  if (v3)
  {
    if (!v5)
    {
      id v6 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B08] modifierFlags:0 action:sel_editCancel_];
      [(CNContactContentUnitaryViewController *)self setCancelCommand:v6];

      id v8 = [(CNContactContentUnitaryViewController *)self cancelCommand];
      [(CNContactContentUnitaryViewController *)self addKeyCommand:v8];
    }
  }
  else if (v5)
  {
    double v7 = [(CNContactContentUnitaryViewController *)self cancelCommand];
    [(CNContactContentUnitaryViewController *)self removeKeyCommand:v7];

    [(CNContactContentUnitaryViewController *)self setCancelCommand:0];
  }
}

- (void)setSaveKeyboardShortcutEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CNContactContentUnitaryViewController *)self saveCommand];

  if (v3)
  {
    if (!v5)
    {
      id v6 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"s" modifierFlags:0x100000 action:sel_toggleEditing_];
      [(CNContactContentUnitaryViewController *)self setSaveCommand:v6];

      double v7 = CNContactsUIBundle();
      id v8 = [v7 localizedStringForKey:@"SAVE_CONTACT_KEYBOARD_DISCOVERY" value:&stru_1ED8AC728 table:@"Localized"];
      double v9 = [(CNContactContentUnitaryViewController *)self saveCommand];
      [v9 setDiscoverabilityTitle:v8];

      id v11 = [(CNContactContentUnitaryViewController *)self saveCommand];
      [(CNContactContentUnitaryViewController *)self addKeyCommand:v11];
    }
  }
  else if (v5)
  {
    double v10 = [(CNContactContentUnitaryViewController *)self saveCommand];
    [(CNContactContentUnitaryViewController *)self removeKeyCommand:v10];

    [(CNContactContentUnitaryViewController *)self setSaveCommand:0];
  }
}

- (void)updateUserActivityState:(id)a3
{
  id v4 = a3;
  id v6 = [(CNContactContentUnitaryViewController *)self activityManager];
  BOOL v5 = [(CNContactContentUnitaryViewController *)self contact];
  [v6 updateUserActivityState:v4 withContentsOfContact:v5];
}

- (void)_updateUserActivity
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((CNUIIsContacts() || CNUIIsMobilePhone())
    && ([(CNContactContentUnitaryViewController *)self isEditing] & 1) == 0)
  {
    BOOL v3 = CNUILogContactCard();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = [MEMORY[0x1E4F28B50] mainBundle];
      BOOL v5 = [v4 bundleIdentifier];
      int v17 = 138412290;
      double v18 = v5;
      _os_log_impl(&dword_18B625000, v3, OS_LOG_TYPE_INFO, "Activity continuity - running in %@", (uint8_t *)&v17, 0xCu);
    }
    id v6 = [(CNContactContentUnitaryViewController *)self activityManager];
    double v7 = [(CNContactContentUnitaryViewController *)self contact];
    id v8 = [v6 makeActivityAdvertisingViewingOfContact:v7];

    double v9 = [(CNContactContentUnitaryViewController *)self userActivity];
    double v10 = v9;
    if (v8)
    {

      if (!v10)
      {
        [(CNContactContentUnitaryViewController *)self setUserActivity:v8];
        id v11 = [(CNContactContentUnitaryViewController *)self userActivity];
        [v11 becomeCurrent];

        double v12 = CNUILogContactCard();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          double v13 = [(CNContactContentUnitaryViewController *)self userActivity];
          int v17 = 138412546;
          double v18 = self;
          __int16 v19 = 2112;
          double v20 = v13;
          _os_log_impl(&dword_18B625000, v12, OS_LOG_TYPE_INFO, "Activity continuity -  %@ created %@", (uint8_t *)&v17, 0x16u);
        }
      }
      double v14 = [(CNContactContentUnitaryViewController *)self userActivity];
      [v14 setNeedsSave:1];
    }
    else
    {
      [v9 resignCurrent];

      double v15 = CNUILogContactCard();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        double v16 = [(CNContactContentUnitaryViewController *)self userActivity];
        int v17 = 138412546;
        double v18 = self;
        __int16 v19 = 2112;
        double v20 = v16;
        _os_log_impl(&dword_18B625000, v15, OS_LOG_TYPE_INFO, "Activity continuity -  %@ removed %@", (uint8_t *)&v17, 0x16u);
      }
      [(CNContactContentUnitaryViewController *)self setUserActivity:0];
    }
  }
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CNContactContentUnitaryViewController;
  [(CNContactContentUnitaryViewController *)&v18 encodeRestorableStateWithCoder:v4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v5 = +[CNContactContentUnitaryViewController BOOLStateRestorationProperties];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [(CNContactContentUnitaryViewController *)self valueForKey:v10];
        if (v11) {
          [v4 encodeObject:v11 forKey:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v7);
  }

  double v12 = [(CNContactContentUnitaryViewController *)self contact];
  double v13 = [v12 identifier];

  if (v13) {
    [v4 encodeObject:v13 forKey:@"Identifier"];
  }
}

- (void)_addedGroupWithName:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = +[CNContactView nameProperties];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    uint64_t v7 = [(CNContactContentUnitaryViewController *)self mutableContact];
    uint64_t v8 = [(CNContactContentUnitaryViewController *)self contactStore];
    double v9 = [(CNContactContentUnitaryViewController *)self policy];
    uint64_t v10 = [(CNContactContentUnitaryViewController *)self linkedPoliciesByContactIdentifier];
    id v11 = +[CNCardPropertyGroup groupForProperty:v4 contact:v7 store:v8 policy:v9 linkedPolicies:v10];

    double v12 = +[CNContactView nameProperties];
    double v42 = v11;
    double v13 = [v11 property];
    unint64_t v14 = [v12 indexOfObject:v13];

    double v43 = self;
    [(CNContactContentUnitaryViewController *)self editingGroups];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v15 countByEnumeratingWithState:&v45 objects:v49 count:16];
    id v44 = v4;
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = 0;
      uint64_t v19 = *(void *)v46;
      while (2)
      {
        uint64_t v20 = 0;
        uint64_t v41 = v18 + v17;
        do
        {
          if (*(void *)v46 != v19) {
            objc_enumerationMutation(v15);
          }
          uint64_t v21 = *(void **)(*((void *)&v45 + 1) + 8 * v20);
          double v22 = +[CNContactView nameProperties];
          double v23 = [v21 property];
          unint64_t v24 = [v22 indexOfObject:v23];

          if (v24 >= v14)
          {
            uint64_t v25 = v18 + v20;
            goto LABEL_15;
          }
          ++v20;
        }
        while (v17 != v20);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v45 objects:v49 count:16];
        uint64_t v25 = v41;
        uint64_t v18 = v41;
        if (v17) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v25 = 0;
    }
LABEL_15:

    double v27 = [(CNContactContentUnitaryViewController *)v43 nameEditingGroups];
    double v28 = (void *)[v27 mutableCopy];

    [v28 insertObject:v42 atIndex:v25];
    double v29 = (void *)[v28 copy];
    [(CNContactContentUnitaryViewController *)v43 setNameEditingGroups:v29];

    double v30 = [(CNContactContentUnitaryViewController *)v43 editingGroups];
    double v31 = (void *)[v30 mutableCopy];

    [v31 insertObject:v42 atIndex:v25];
    double v32 = (void *)[v31 copy];
    [(CNContactContentUnitaryViewController *)v43 setEditingGroups:v32];

    double v33 = [(CNContactContentUnitaryViewController *)v43 contactView];
    [v33 reloadData];

    v34 = [(CNContactContentUnitaryViewController *)v43 contactView];
    uint64_t v35 = [(CNContactContentUnitaryViewController *)v43 sectionOfGroup:v42 inTableView:v34];

    double v36 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:v35];
    double v37 = [(CNContactContentUnitaryViewController *)v43 contactView];
    double v38 = [v37 cellForRowAtIndexPath:v36];

    double v39 = [v38 firstResponderItem];
    [v39 becomeFirstResponder];

    double v40 = [(CNContactContentUnitaryViewController *)v43 contactView];
    [v40 scrollToRowAtIndexPath:v36 atScrollPosition:2 animated:0];

    id v4 = v44;
  }
  else if ([v4 isEqualToString:*MEMORY[0x1E4F1AD88]])
  {
    double v26 = [(CNContactContentUnitaryViewController *)self addAddressingGrammarAction];
    [v26 performActionWithSender:0];
  }
}

- (BOOL)_indexPathIsActionItem:(id)a3 forTableView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = -[CNContactContentUnitaryViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", [v6 section], v7);
  objc_opt_class();
  if (((objc_opt_isKindOfClass() & 1) != 0
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v10 = [(CNContactContentUnitaryViewController *)self _itemAtIndexPath:v6 forTableView:v7];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      char isKindOfClass = 0;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass() ^ 1;
    }
  }

  return isKindOfClass & 1;
}

- (id)_itemAtIndexPath:(id)a3 forTableView:(id)a4
{
  id v6 = a3;
  id v7 = (CNContactView *)a4;
  uint64_t v8 = -[CNContactContentUnitaryViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", [v6 section], v7);
  if ([(CNContactContentUnitaryViewController *)self isStandardGroup:v8])
  {
    editingContactView = self->_editingContactView;

    if (editingContactView == v7) {
      [v8 editingItems];
    }
    else {
    uint64_t v10 = [v8 displayItems];
    }
  }
  else
  {
    BOOL v11 = [(CNContactContentUnitaryViewController *)self _indexPathIsActionItem:v6 forTableView:v7];

    if (!v11)
    {
      double v12 = 0;
      goto LABEL_10;
    }
    uint64_t v10 = [v8 actionItems];
  }
  double v13 = v10;
  double v12 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));

LABEL_10:

  return v12;
}

- (id)_cardGroupAtTableViewSectionIndex:(int64_t)a3 forTableView:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(CNContactContentUnitaryViewController *)self groupIndexFromTableViewSectionIndex:a3 forTableView:v6];
  uint64_t v8 = [(CNContactContentUnitaryViewController *)self _currentGroupsForTableView:v6];

  if ([v8 count] <= v7)
  {
    double v9 = 0;
  }
  else
  {
    double v9 = [v8 objectAtIndexedSubscript:v7];
  }

  return v9;
}

- (id)_currentGroupsForTableView:(id)a3
{
  if (self->_editingContactView == a3) {
    [(CNContactContentUnitaryViewController *)self editingGroups];
  }
  else {
  BOOL v3 = [(CNContactContentUnitaryViewController *)self displayGroups];
  }

  return v3;
}

- (void)_saveChangesForGroups:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
        uint64_t v10 = objc_opt_class();
        if ([v10 isSubclassOfClass:objc_opt_class()])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            -[CNContactContentUnitaryViewController setDidEditPronouns:](self, "setDidEditPronouns:", [v9 modified]);
          }
          [v9 saveChanges];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)_validateGroup:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 propertyItems];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v19 = self;
    char v8 = 0;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v12 = [v11 labeledValue];
        long long v13 = [v12 value];
        char v14 = [v11 isValidValue:v13];

        if ((v14 & 1) == 0)
        {
          id v15 = [v11 labeledValue];
          uint64_t v16 = [v15 value];
          uint64_t v17 = [v11 replacementForInvalidValue:v16];
          [v11 updateLabeledValueWithValue:v17];

          char v8 = 1;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
    if (v8)
    {
      uint64_t v18 = [(CNContactContentUnitaryViewController *)v19 contactView];
      [(CNContactContentUnitaryViewController *)v19 reloadCardGroup:v4 forTableView:v18];
    }
  }
}

- (BOOL)_modelIsEmpty
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(CNContactContentUnitaryViewController *)self editingGroups];
  uint64_t v5 = [v3 arrayWithArray:v4];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v33;
    char v24 = 1;
    uint64_t v25 = *(void *)v33;
    do
    {
      uint64_t v9 = 0;
      uint64_t v26 = v7;
      do
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v32 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          if ([(CNContactContentUnitaryViewController *)self isEditing]) {
            [v11 editingItems];
          }
          else {
          long long v12 = [v11 propertyItems];
          }
          long long v30 = 0u;
          long long v31 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          id v13 = v12;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v29;
            while (2)
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v29 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
                if (objc_opt_respondsToSelector())
                {
                  uint64_t v19 = [v18 normalizedValue];
                  if (v19)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0 || [v19 length])
                    {

                      char v24 = 0;
                      goto LABEL_24;
                    }
                  }
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
              if (v15) {
                continue;
              }
              break;
            }
LABEL_24:
            uint64_t v8 = v25;
            uint64_t v7 = v26;
          }
        }
        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v7);
  }
  else
  {
    char v24 = 1;
  }

  if (self->_editingHeaderView)
  {
    long long v20 = [(CNContactContentUnitaryViewController *)self editingHeaderView];
    char v21 = [v20 hasPhoto];

    char v22 = (v21 ^ 1) & v24;
  }
  else
  {
    char v22 = v24;
  }

  return v22 & 1;
}

- (BOOL)_modelHasChanges
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(CNContactContentUnitaryViewController *)self editingGroups];
  uint64_t v5 = [v3 arrayWithArray:v4];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v42;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v42 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v11, "modified", (void)v41))
        {
          int v12 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  int v12 = 0;
LABEL_12:

  if (self->_editingHeaderView)
  {
    id v13 = [(CNContactContentUnitaryViewController *)self editingHeaderView];
    int v14 = [v13 photoIsModified];

    uint64_t v15 = [(CNContactContentUnitaryViewController *)self editingHeaderView];
    v12 |= v14 | [v15 wallpaperIsModified];
  }
  uint64_t v16 = [(CNContactContentUnitaryViewController *)self editingLinkedContacts];

  uint64_t v17 = [(CNContactContentUnitaryViewController *)self groupEditingContext];
  if (v17)
  {
    uint64_t v18 = [(CNContactContentUnitaryViewController *)self groupEditingContext];
    uint64_t v19 = [v18 addedGroups];
    if ([v19 count])
    {
      BOOL v20 = 1;
    }
    else
    {
      char v21 = [(CNContactContentUnitaryViewController *)self groupEditingContext];
      char v22 = [v21 removedGroups];
      BOOL v20 = [v22 count] != 0;
    }
  }
  else
  {
    BOOL v20 = 0;
  }

  long long v23 = [(CNContactContentUnitaryViewController *)self containerContext];
  char v24 = [v23 addedContainers];
  uint64_t v25 = [v24 count];

  int64_t v26 = [(CNContactContentUnitaryViewController *)self mode];
  BOOL v27 = [(CNContactContentUnitaryViewController *)self mode] == 4
     || [(CNContactContentUnitaryViewController *)self mode] == 5;
  long long v28 = [(CNContactContentUnitaryViewController *)self contact];
  if ([v28 hasNonPersistedData])
  {
    long long v29 = [(CNContactContentUnitaryViewController *)self shadowCopyOfReadonlyContact];
    BOOL v30 = v29 == 0;
  }
  else
  {
    BOOL v30 = 0;
  }
  if (v16) {
    int v31 = 1;
  }
  else {
    int v31 = v12;
  }
  int v32 = v20 | v31;
  if (v25) {
    int v32 = 1;
  }
  if (v26 == 3) {
    int v32 = 1;
  }
  int v33 = v32 | (v27 || v30);

  long long v34 = [(CNContactContentUnitaryViewController *)self cardStaticIdentityGroup];
  char v35 = [v34 didChange];
  if (v33) {
    char v36 = 1;
  }
  else {
    char v36 = v35;
  }

  uint64_t v37 = *MEMORY[0x1E4F5A258];
  uint64_t v38 = [(CNContactContentUnitaryViewController *)self deletedEditingGroups];
  char v39 = (*(uint64_t (**)(uint64_t, void *))(v37 + 16))(v37, v38);

  return v36 | v39 ^ 1;
}

- (id)_loadNameEditingGroups
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v31 = [MEMORY[0x1E4F1CA48] array];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  BOOL v3 = [(CNContactContentUnitaryViewController *)self contact];
  id v4 = +[CNContactView namePropertiesForContact:v3];

  obuint64_t j = v4;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v39;
    uint64_t v30 = *(void *)v39;
    do
    {
      uint64_t v8 = 0;
      uint64_t v32 = v6;
      do
      {
        if (*(void *)v39 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v38 + 1) + 8 * v8);
        uint64_t v10 = [(CNContactContentUnitaryViewController *)self prohibitedPropertyKeys];
        char v11 = [v10 containsObject:v9];

        if ((v11 & 1) == 0)
        {
          int v12 = [(CNContactContentUnitaryViewController *)self contact];
          id v13 = [v12 valueForKey:v9];

          objc_opt_class();
          id v14 = v13;
          if (objc_opt_isKindOfClass()) {
            uint64_t v15 = v14;
          }
          else {
            uint64_t v15 = 0;
          }
          id v16 = v15;

          if (v14 && (!v16 || [v16 length])
            || (+[CNContactView requiredNameProperties],
                uint64_t v17 = objc_claimAutoreleasedReturnValue(),
                int v18 = [v17 containsObject:v9],
                v17,
                v18))
          {
            uint64_t v19 = [(CNContactContentUnitaryViewController *)self mutableContact];
            BOOL v20 = [(CNContactContentUnitaryViewController *)self contactStore];
            char v21 = [(CNContactContentUnitaryViewController *)self policy];
            char v22 = [(CNContactContentUnitaryViewController *)self linkedPoliciesByContactIdentifier];
            long long v23 = +[CNCardPropertyGroup groupForProperty:v9 contact:v19 store:v20 policy:v21 linkedPolicies:v22];

            [v23 setAddSpacerFromPreviousGroup:0];
            long long v36 = 0u;
            long long v37 = 0u;
            long long v34 = 0u;
            long long v35 = 0u;
            char v24 = [v23 propertyItems];
            uint64_t v25 = [v24 countByEnumeratingWithState:&v34 objects:v42 count:16];
            if (v25)
            {
              uint64_t v26 = v25;
              uint64_t v27 = *(void *)v35;
              do
              {
                for (uint64_t i = 0; i != v26; ++i)
                {
                  if (*(void *)v35 != v27) {
                    objc_enumerationMutation(v24);
                  }
                  [*(id *)(*((void *)&v34 + 1) + 8 * i) setDelegate:self];
                }
                uint64_t v26 = [v24 countByEnumeratingWithState:&v34 objects:v42 count:16];
              }
              while (v26);
            }

            [v31 addObject:v23];
            uint64_t v7 = v30;
            uint64_t v6 = v32;
          }
        }
        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v6);
  }

  return v31;
}

- (id)_loadEditingGroupsPreservingChanges:(BOOL)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  if (!a3)
  {
    uint64_t v6 = [(CNContactContentUnitaryViewController *)self _loadNameEditingGroups];
    [(CNContactContentUnitaryViewController *)self setNameEditingGroups:v6];
  }
  uint64_t v7 = [(CNContactContentUnitaryViewController *)self nameEditingGroups];
  [v5 addObjectsFromArray:v7];

  BOOL v8 = [(CNContactContentUnitaryViewController *)self shouldShowGemini];
  [(CNContactContentUnitaryViewController *)self createCardEditingGeminiGroupIfNeeded];
  uint64_t v9 = [(CNContactContentUnitaryViewController *)self cardEditingGeminiGroup];
  [v9 setShouldShowGemini:v8];

  if ([(CNContactContentUnitaryViewController *)self shouldShowGemini])
  {
    uint64_t v10 = [(CNContactContentUnitaryViewController *)self cardEditingGeminiGroup];
    objc_msgSend(v5, "_cn_addNonNilObject:", v10);
  }
  long long v42 = v5;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = +[CNContactView allCardProperties];
  uint64_t v11 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v45;
    uint64_t v14 = *MEMORY[0x1E4F1AF70];
    uint64_t v15 = *MEMORY[0x1E4F5A258];
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v45 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        if (![v17 isEqualToString:v14]
          || ![(CNContactContentUnitaryViewController *)self showingMeContact])
        {
          int v18 = self;
          uint64_t v19 = [(CNContactContentUnitaryViewController *)self propertyGroups];
          BOOL v20 = [v19 objectForKeyedSubscript:v17];

          if (!v20) {
            goto LABEL_19;
          }
          char v21 = [v20 editingItems];
          char v22 = (*(uint64_t (**)(uint64_t, void *))(v15 + 16))(v15, v21);

          if (v22) {
            goto LABEL_19;
          }
          long long v23 = +[CNContactView addFieldCardProperties];
          if ([v23 containsObject:v17])
          {
            uint64_t v24 = [v20 valueEditingItemsCount];

            if (!v24) {
              goto LABEL_19;
            }
          }
          else
          {
          }
          [v42 addObject:v20];
LABEL_19:

          self = v18;
          continue;
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v12);
  }

  uint64_t v25 = [(CNContactContentUnitaryViewController *)self cardStaticIdentityGroup];
  objc_msgSend(v42, "_cn_addNonNilObject:", v25);

  uint64_t v26 = [(CNContactContentUnitaryViewController *)self cardEditingActionsGroup];
  uint64_t v27 = [v26 actions];
  uint64_t v28 = [v27 count];

  if (v28)
  {
    long long v29 = [(CNContactContentUnitaryViewController *)self cardEditingActionsGroup];
    [v42 addObject:v29];
  }
  uint64_t v30 = [(CNContactContentUnitaryViewController *)self cardMedicalIDGroup];
  id v31 = [v30 actionItems];
  uint64_t v32 = [v31 count];

  if (v32)
  {
    int v33 = [(CNContactContentUnitaryViewController *)self cardMedicalIDGroup];
    objc_msgSend(v42, "_cn_addNonNilObject:", v33);
  }
  [(CNContactContentUnitaryViewController *)self createCardEditingContactContainerGroupIfNeeded];
  long long v34 = [(CNContactContentUnitaryViewController *)self cardEditingContactContainerGroup];
  objc_msgSend(v42, "_cn_addNonNilObject:", v34);

  long long v35 = [(CNContactContentUnitaryViewController *)self cardLinkedCardsGroup];
  objc_msgSend(v42, "_cn_addNonNilObject:", v35);

  long long v36 = [(CNContactContentUnitaryViewController *)self cardGroupMembershipGroup];
  objc_msgSend(v42, "_cn_addNonNilObject:", v36);

  long long v37 = [(CNContactContentUnitaryViewController *)self cardEditingDeleteContactGroup];
  long long v38 = [v37 actions];
  uint64_t v39 = [v38 count];

  if (v39)
  {
    long long v40 = [(CNContactContentUnitaryViewController *)self cardEditingDeleteContactGroup];
    [v42 addObject:v40];
  }

  return v42;
}

- (void)createCardEditingContactContainerGroupIfNeeded
{
  BOOL v3 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v4 = [v3 featureFlags];
  int v5 = [v4 isFeatureEnabled:6];

  if (v5)
  {
    if ([(CNContactContentUnitaryViewController *)self shouldAllowContainerPicking]
      && ([(CNContactContentUnitaryViewController *)self isEditing] & 1) != 0)
    {
      uint64_t v6 = [CNCardContactContainerGroup alloc];
      uint64_t v7 = [(CNContactContentUnitaryViewController *)self mutableContact];
      BOOL v8 = [(CNCardGroup *)v6 initWithContact:v7];
      [(CNContactContentUnitaryViewController *)self setCardEditingContactContainerGroup:v8];

      id v11 = [(CNContactContentUnitaryViewController *)self containerContext];
      uint64_t v9 = [v11 selectedContainers];
      uint64_t v10 = [(CNContactContentUnitaryViewController *)self cardEditingContactContainerGroup];
      [v10 setContainers:v9];
    }
    else
    {
      [(CNContactContentUnitaryViewController *)self setCardEditingContactContainerGroup:0];
    }
  }
}

- (void)createCardEditingGeminiGroupIfNeeded
{
  BOOL v3 = [(CNContactContentUnitaryViewController *)self cardEditingGeminiGroup];

  if (!v3)
  {
    id v4 = [(CNContactContentUnitaryViewController *)self propertyGroups];
    int v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F1AF18]];
    [(CNContactContentUnitaryViewController *)self setCardEditingGeminiGroup:v5];

    uint64_t v6 = [(CNContactContentUnitaryViewController *)self cardEditingGeminiGroup];
    uint64_t v7 = [v6 propertyItems];
    id v10 = [v7 objectAtIndexedSubscript:0];

    BOOL v8 = [(CNContactContentUnitaryViewController *)self geminiDataSource];
    uint64_t v9 = [v8 geminiResult];
    [v10 setGeminiResult:v9];

    [v10 setDelegate:self];
  }
}

- (void)_reloadGeminiGroupPreservingChanges:(BOOL)a3
{
  if (!a3)
  {
    [(CNContactContentUnitaryViewController *)self setCardEditingGeminiGroup:0];
    id v6 = [(CNContactContentUnitaryViewController *)self geminiDataSource];
    [v6 resetDataSource];
    int v5 = [(CNContactContentUnitaryViewController *)self contact];
    [v6 setContact:v5];
  }
}

- (id)_loadDisplayGroups
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  int v5 = [(CNContactContentUnitaryViewController *)self cardTopGroup];
  id v6 = [v5 actions];
  uint64_t v7 = [v6 count];

  BOOL v8 = v4;
  if (v7)
  {
    uint64_t v9 = [(CNContactContentUnitaryViewController *)self cardTopGroup];
    [v4 addObject:v9];
  }
  if ([(CNContactContentUnitaryViewController *)self allowsNamePicking])
  {
    id v10 = [(CNContactContentUnitaryViewController *)self namePickingGroup];
    [v4 addObject:v10];
  }
  id v11 = [(CNContactContentUnitaryViewController *)self cardTopGroup];
  id v12 = [(CNContactContentUnitaryViewController *)self _addGroupsInArray:v4 afterGroup:v11];

  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  uint64_t v13 = [(CNContactContentUnitaryViewController *)self displayedProperties];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v85 objects:v90 count:16];
  uint64_t v76 = v4;
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v86;
    uint64_t v80 = *MEMORY[0x1E4F1AD88];
    uint64_t v78 = *(void *)v86;
    uint64_t v79 = *MEMORY[0x1E4F1AF70];
    id v2 = off_1E5495000;
    v77 = v13;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v86 != v16) {
          objc_enumerationMutation(v13);
        }
        int v18 = *(void **)(*((void *)&v85 + 1) + 8 * i);
        if (([v18 isEqualToString:v80] & 1) == 0)
        {
          if (![v18 isEqualToString:v79]) {
            goto LABEL_16;
          }
          uint64_t v19 = [(CNContactContentUnitaryViewController *)self displayContactView];
          BOOL v20 = [(CNContactContentUnitaryViewController *)self hasSharedProfileBannerSectionForTableView:v19];

          if (!v20)
          {
            if ([(CNContactContentUnitaryViewController *)self shouldShowSharedProfileRow])
            {
              if ([(CNContactContentUnitaryViewController *)self showingMeContact])
              {
                char v21 = [(CNContactContentUnitaryViewController *)self meCardSharedProfileGroup];
                objc_msgSend(v8, "_cn_addNonNilObject:", v21);
LABEL_30:

                continue;
              }
LABEL_16:
              char v22 = [(CNContactContentUnitaryViewController *)self propertyGroups];
              char v21 = [v22 objectForKeyedSubscript:v18];

              long long v23 = [v21 displayItems];
              if ([v23 count])
              {
                uint64_t v24 = [(CNContactContentViewController *)self primaryProperty];
                uint64_t v25 = [v21 property];
                char v26 = [v24 isEqualToString:v25];

                uint64_t v13 = v77;
                if ((v26 & 1) == 0)
                {
                  [v8 addObject:v21];
                  long long v83 = 0u;
                  long long v84 = 0u;
                  long long v81 = 0u;
                  long long v82 = 0u;
                  long long v23 = [v21 displayItems];
                  uint64_t v27 = [v23 countByEnumeratingWithState:&v81 objects:v89 count:16];
                  if (v27)
                  {
                    uint64_t v28 = v27;
                    uint64_t v29 = *(void *)v82;
                    do
                    {
                      for (uint64_t j = 0; j != v28; ++j)
                      {
                        if (*(void *)v82 != v29) {
                          objc_enumerationMutation(v23);
                        }
                        id v31 = *(void **)(*((void *)&v81 + 1) + 8 * j);
                        objc_opt_class();
                        if (objc_opt_isKindOfClass()) {
                          [v31 setDelegate:self];
                        }
                      }
                      uint64_t v28 = [v23 countByEnumeratingWithState:&v81 objects:v89 count:16];
                    }
                    while (v28);
                    BOOL v8 = v76;
                    uint64_t v13 = v77;
                  }
                  goto LABEL_28;
                }
              }
              else
              {
LABEL_28:
              }
              id v32 = [(CNContactContentUnitaryViewController *)self _addGroupsInArray:v8 afterGroup:v21];
              uint64_t v16 = v78;
              goto LABEL_30;
            }
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v85 objects:v90 count:16];
    }
    while (v15);
  }

  int v33 = [(CNContactContentUnitaryViewController *)self cardBottomGroup];
  long long v34 = [v33 actions];
  long long v35 = v8;
  uint64_t v36 = [v34 count];

  if (v36)
  {
    long long v37 = [(CNContactContentUnitaryViewController *)self cardBottomGroup];
    [v35 addObject:v37];
  }
  long long v38 = [(CNContactContentUnitaryViewController *)self cardBottomGroup];
  uint64_t v39 = [(CNContactContentUnitaryViewController *)self _addGroupsInArray:v35 afterGroup:v38];

  if (![(CNContactContentUnitaryViewController *)self hideCardActions])
  {
    long long v40 = [(CNContactContentUnitaryViewController *)self cardActionsGroup];
    long long v41 = [v40 actions];
    uint64_t v42 = [v41 count];

    if (v42)
    {
      long long v43 = [(CNContactContentUnitaryViewController *)self cardBottomGroup];
      long long v44 = [v43 actions];
      if (![v44 count])
      {
        if (v39)
        {
          id v2 = [v39 actions];
          if ([v2 count]) {
            goto LABEL_42;
          }
        }
        long long v45 = [(CNContactContentViewController *)self primaryProperty];
        if (!v45)
        {
          uint64_t v74 = [(CNContactContentUnitaryViewController *)self contact];
          char v75 = [v74 isSuggested];

          if (v39) {
          if ((v75 & 1) == 0)
          }
          {
            long long v46 = [(CNContactContentUnitaryViewController *)self cardActionsGroup];
            long long v47 = v46;
            uint64_t v48 = 0;
            goto LABEL_45;
          }
LABEL_44:
          long long v46 = [(CNContactContentUnitaryViewController *)self cardActionsGroup];
          long long v47 = v46;
          uint64_t v48 = 1;
LABEL_45:
          [v46 setAddSpacerFromPreviousGroup:v48];

          uint64_t v49 = [(CNContactContentUnitaryViewController *)self cardActionsGroup];
          [v76 addObject:v49];

          goto LABEL_46;
        }

        if (v39) {
LABEL_42:
        }
      }
      goto LABEL_44;
    }
  }
LABEL_46:
  uint64_t v50 = [(CNContactContentUnitaryViewController *)self cardMedicalIDGroup];
  if (v50)
  {
    double v51 = (void *)v50;
    double v52 = [(CNContactContentUnitaryViewController *)self cardMedicalIDGroup];
    double v53 = [v52 actionItems];
    uint64_t v54 = [v53 count];

    if (v54)
    {
      double v55 = [(CNContactContentUnitaryViewController *)self cardMedicalIDGroup];
      [v76 addObject:v55];
    }
  }
  if (![(CNContactContentUnitaryViewController *)self hideCardActions])
  {
    double v56 = [(CNContactContentUnitaryViewController *)self cardShareLocationGroup];
    v57 = [v56 actionItems];
    uint64_t v58 = [v57 count];

    if (v58)
    {
      v59 = [(CNContactContentUnitaryViewController *)self cardShareLocationGroup];
      [v76 addObject:v59];
    }
  }
  v60 = [(CNContactContentUnitaryViewController *)self cardFooterGroup];
  double v61 = [v60 actions];
  uint64_t v62 = [v61 count];

  if (v62)
  {
    v63 = [(CNContactContentUnitaryViewController *)self cardFooterGroup];
    [v76 addObject:v63];
  }
  if ([(CNContactContentUnitaryViewController *)self isSuggestedContact]
    || [(CNContactContentUnitaryViewController *)self allowsContactBlocking]
    || [(CNContactContentUnitaryViewController *)self allowsContactBlockingAndReporting])
  {
    v64 = [(CNContactContentUnitaryViewController *)self cardBlockContactGroup];
    v65 = [v64 actions];
    uint64_t v66 = [v65 count];

    if (v66)
    {
      BOOL v67 = [(CNContactContentUnitaryViewController *)self showContactBlockingFirst];
      v68 = [(CNContactContentUnitaryViewController *)self cardBlockContactGroup];
      v69 = v68;
      if (v67)
      {
        [v68 setAddSpacerFromPreviousGroup:0];

        v69 = [(CNContactContentUnitaryViewController *)self cardBlockContactGroup];
        [v76 insertObject:v69 atIndex:0];
      }
      else
      {
        [v76 addObject:v68];
      }
    }
  }
  v70 = [(CNContactContentUnitaryViewController *)self cardLinkedCardsGroup];

  if (v70)
  {
    v71 = [(CNContactContentUnitaryViewController *)self cardLinkedCardsGroup];
    [v76 addObject:v71];
  }
  if ([(CNContactContentUnitaryViewController *)self showsGroupMembership])
  {
    double v72 = [(CNContactContentUnitaryViewController *)self cardGroupMembershipGroup];
    objc_msgSend(v76, "_cn_addNonNilObject:", v72);
  }

  return v76;
}

- (id)_addGroupsInArray:(id)a3 afterGroup:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(CNContactContentUnitaryViewController *)self groupsAfterGroup];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];

  if (v9)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(v6, "addObject:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    uint64_t v15 = [v10 lastObject];
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (void)_reloadStaticIdentityGroup
{
  uint64_t v3 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v4 = [v3 featureFlags];
  int v5 = [v4 isFeatureEnabled:11];

  if (v5)
  {
    if ([(CNContactContentUnitaryViewController *)self isEditing])
    {
      id v6 = [(CNContactContentUnitaryViewController *)self cardStaticIdentityGroup];

      if (!v6)
      {
        id v7 = [CNCardStaticIdentityGroup alloc];
        BOOL v8 = [(CNContactContentUnitaryViewController *)self mutableContact];
        uint64_t v9 = [(CNCardStaticIdentityGroup *)v7 initWithContact:v8];
        [(CNContactContentUnitaryViewController *)self setCardStaticIdentityGroup:v9];
      }
      id v10 = [(CNContactContentUnitaryViewController *)self cachedStaticIdentity];

      if (v10)
      {
        id v13 = [(CNContactContentUnitaryViewController *)self cardStaticIdentityGroup];
        uint64_t v11 = [(CNContactContentUnitaryViewController *)self cachedStaticIdentity];
        uint64_t v12 = [v11 verificationCode];
        [v13 addIdentity:v12 isNew:0];
      }
    }
    else
    {
      [(CNContactContentUnitaryViewController *)self setCardStaticIdentityGroup:0];
      if ([(CNContactContentUnitaryViewController *)self didLookUpStaticIdentity])
      {
        [(CNContactContentUnitaryViewController *)self _lookupKTHandlesIfNeeded];
      }
      else
      {
        [(CNContactContentUnitaryViewController *)self _lookupStaticIdentity];
      }
    }
  }
}

- (void)_lookupStaticIdentity
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(CNContactContentUnitaryViewController *)self ktWorkQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__CNContactContentUnitaryViewController__lookupStaticIdentity__block_invoke;
  v4[3] = &unk_1E549B600;
  objc_copyWeak(&v5, &location);
  [v3 performBlock:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __62__CNContactContentUnitaryViewController__lookupStaticIdentity__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_alloc(MEMORY[0x1E4F5A700]);
  uint64_t v3 = [WeakRetained contact];
  id v4 = (void *)[v2 initWithContact:v3];

  [WeakRetained setCachedStaticIdentity:v4];
  [WeakRetained setCachedVerifiedHandles:0];
  [WeakRetained setDidLookUpStaticIdentity:1];
  if (v4) {
    [WeakRetained setDidFindStaticIdentity:1];
  }
  id v5 = [WeakRetained mainThreadScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__CNContactContentUnitaryViewController__lookupStaticIdentity__block_invoke_2;
  v7[3] = &unk_1E549BF80;
  v7[4] = WeakRetained;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

uint64_t __62__CNContactContentUnitaryViewController__lookupStaticIdentity__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHadAtLeastOneVerifiedHandle:", objc_msgSend(*(id *)(a1 + 32), "_hasAtLeastOneVerifiedHandle"));
  if ([*(id *)(a1 + 32) isEditing] && *(void *)(a1 + 40))
  {
    id v2 = [*(id *)(a1 + 32) cardStaticIdentityGroup];
    uint64_t v3 = [*(id *)(a1 + 40) verificationCode];
    [v2 addIdentity:v3 isNew:0];

    id v4 = *(void **)(a1 + 32);
    id v5 = [v4 cardStaticIdentityGroup];
    id v6 = [*(id *)(a1 + 32) contactView];
    [v4 reloadCardGroup:v5 forTableView:v6];
  }
  id v7 = *(void **)(a1 + 32);

  return [v7 _lookupKTHandlesIfNeeded];
}

- (void)_reloadGroupEditingContext
{
  uint64_t v3 = [(CNContactContentUnitaryViewController *)self cardGroupMembershipGroup];

  if (v3)
  {
    id v4 = [(CNContactContentUnitaryViewController *)self cardGroupMembershipGroup];
    id v6 = [v4 parentGroups];

    id v5 = [[CNUIGroupEditingContext alloc] initWithOriginalGroups:v6];
    [(CNContactContentUnitaryViewController *)self setGroupEditingContext:v5];
  }
}

- (BOOL)hasExistingGroups
{
  id v2 = [(CNContactContentUnitaryViewController *)self contactStore];
  char v3 = [v2 hasGroups];

  return v3;
}

- (void)_reloadGroupMembershipGroup
{
  if (![(CNContactContentUnitaryViewController *)self showsGroupMembership]) {
    return;
  }
  char v3 = [(CNContactContentUnitaryViewController *)self contact];
  if ([v3 isSuggested])
  {
  }
  else
  {
    BOOL v4 = [(CNContactContentUnitaryViewController *)self hasExistingGroups];

    if (v4)
    {
      if (!self->_addToGroupAction)
      {
        id v5 = [(CNContactContentUnitaryViewController *)self _addToGroupAction];
        addToGroupAction = self->_addToGroupAction;
        self->_addToGroupAction = v5;
      }
      id v7 = [CNCardGroupMembershipGroup alloc];
      id v8 = [(CNContactContentUnitaryViewController *)self mutableContact];
      uint64_t v9 = [(CNCardGroup *)v7 initWithContact:v8];
      [(CNContactContentUnitaryViewController *)self setCardGroupMembershipGroup:v9];

      id v10 = [(CNContactContentUnitaryViewController *)self groupsAndContainersSaveManager];
      uint64_t v11 = [(CNContactContentUnitaryViewController *)self contact];
      char v26 = [v10 parentGroupsForContact:v11];

      uint64_t v12 = [(CNContactContentUnitaryViewController *)self cardGroupMembershipGroup];
      [v12 setParentGroups:v26];

      id v13 = [(CNContactContentUnitaryViewController *)self addToGroupAction];
      [v13 setContactParentGroups:v26];

      if ([(CNContactContentUnitaryViewController *)self allowsEditing])
      {
        uint64_t v14 = [(CNContactContentUnitaryViewController *)self cardGroupMembershipGroup];
        uint64_t v15 = [(CNContactContentUnitaryViewController *)self addToGroupAction];
        uint64_t v16 = CNContactsUIBundle();
        long long v17 = [v16 localizedStringForKey:@"ADD_TO_LIST_TABLE_CELL_TITLE_DISPLAY_MODE" value:&stru_1ED8AC728 table:@"Localized"];
        [v14 addAction:v15 withTitle:v17];

        long long v18 = [(CNContactContentUnitaryViewController *)self groupEditingContext];
        if (v18)
        {
        }
        else if ([(CNContactContentUnitaryViewController *)self isEditing])
        {
          [(CNContactContentUnitaryViewController *)self _reloadGroupEditingContext];
        }
        char v21 = [(CNContactContentUnitaryViewController *)self groupEditingContext];
        uint64_t v22 = [v21 groupsToDisplayForEditing];
        long long v23 = [(CNContactContentUnitaryViewController *)self cardGroupMembershipGroup];
        [v23 setGroupsToDisplayForEditing:v22];
      }
      if ([(CNContactContentUnitaryViewController *)self isEditing])
      {
        uint64_t v24 = [(CNContactContentUnitaryViewController *)self cardGroupMembershipGroup];
        uint64_t v25 = [v24 groupsToDisplayForEditing];
        [(CNContactAddToGroupAction *)self->_addToGroupAction setContactParentGroups:v25];
      }
      else
      {
        [(CNContactAddToGroupAction *)self->_addToGroupAction setContactParentGroups:v26];
      }
      long long v20 = v26;
      goto LABEL_19;
    }
  }
  cardGroupMembershipGroup = self->_cardGroupMembershipGroup;
  self->_cardGroupMembershipGroup = 0;

  long long v20 = self->_addToGroupAction;
  self->_addToGroupAction = 0;
LABEL_19:
}

- (void)_reloadLinkedCardsGroup
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([(CNContactContentUnitaryViewController *)self shouldReallyShowLinkedContactsForEditingState:[(CNContactContentUnitaryViewController *)self isEditing]])
  {
    if (!self->_linkedCardsAction)
    {
      char v3 = [(CNContactContentUnitaryViewController *)self _linkedCardsAction];
      linkedCardsAction = self->_linkedCardsAction;
      self->_linkedCardsAction = v3;
    }
    addLinkedCardAction = self->_addLinkedCardAction;
    if (!addLinkedCardAction)
    {
      id v6 = [(CNContactContentUnitaryViewController *)self _addLinkedCardAction];
      id v7 = self->_addLinkedCardAction;
      self->_addLinkedCardAction = v6;

      addLinkedCardAction = self->_addLinkedCardAction;
    }
    [(CNContactAddLinkedCardAction *)addLinkedCardAction setEditingLinkedContacts:self->_editingLinkedContacts];
    id v8 = [CNCardLinkedCardsGroup alloc];
    uint64_t v9 = [(CNContactContentUnitaryViewController *)self mutableContact];
    id v10 = [(CNCardGroup *)v8 initWithContact:v9];
    [(CNContactContentUnitaryViewController *)self setCardLinkedCardsGroup:v10];

    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    editingLinkedContacts = self->_editingLinkedContacts;
    if (editingLinkedContacts)
    {
      id v13 = editingLinkedContacts;
    }
    else
    {
      uint64_t v14 = [(CNContactContentUnitaryViewController *)self contact];
      id v13 = [v14 mainStoreLinkedContacts];
    }
    uint64_t v15 = [(CNContactContentUnitaryViewController *)self shadowCopyOfReadonlyContact];

    if (!v15)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      uint64_t v16 = v13;
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v23 != v19) {
              objc_enumerationMutation(v16);
            }
            objc_msgSend(v11, "addObject:", *(void *)(*((void *)&v22 + 1) + 8 * i), (void)v22);
          }
          uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v18);
      }
    }
    if ((unint64_t)objc_msgSend(v11, "count", (void)v22) > 1
      || [(CNContactContentUnitaryViewController *)self isEditing])
    {
      char v21 = [(CNContactContentUnitaryViewController *)self cardLinkedCardsGroup];
      [v21 setLinkedContacts:v11];
    }
    else
    {
      [(CNContactContentUnitaryViewController *)self setCardLinkedCardsGroup:0];
    }
  }
  else
  {
    [(CNContactContentUnitaryViewController *)self setCardLinkedCardsGroup:0];
  }
}

- (BOOL)shouldReallyShowLinkedContactsForEditingState:(BOOL)a3
{
  BOOL v4 = a3;
  if ([(CNContactContentViewController *)self shouldShowLinkedContacts])
  {
    id v6 = [(CNContactContentUnitaryViewController *)self contact];
    id v7 = [v6 mainStoreLinkedContacts];
    unint64_t v8 = [v7 count];
    if (v8 < 2)
    {
      if (!v4)
      {
        LOBYTE(v9) = 0;
        goto LABEL_11;
      }
    }
    else
    {
      char v3 = [(CNContactContentUnitaryViewController *)self shadowCopyOfReadonlyContact];
      if (v3 && !v4)
      {
        LOBYTE(v9) = 0;
        goto LABEL_9;
      }
    }
    id v10 = [(CNContactContentUnitaryViewController *)self contact];
    int v9 = [v10 isSuggestedMe] ^ 1;

    if (v8 < 2)
    {
LABEL_11:

      return v9;
    }
LABEL_9:

    goto LABEL_11;
  }
  LOBYTE(v9) = 0;
  return v9;
}

- (void)_reloadContainerContextPreservingChanges:(BOOL)a3
{
  id v5 = [(CNContactContentUnitaryViewController *)self containerContext];

  if (v5)
  {
    if (!a3)
    {
      id v6 = [(CNContactContentUnitaryViewController *)self containerContext];
      [v6 resetToInitialState];

      id v7 = [(CNContactContentViewController *)self parentContainer];

      if (v7)
      {
        id v9 = [(CNContactContentUnitaryViewController *)self containerContext];
        unint64_t v8 = [(CNContactContentViewController *)self parentContainer];
        [v9 addContainer:v8];
      }
    }
  }
}

- (void)_reloadAlertGroups
{
  char v3 = [(CNContactContentUnitaryViewController *)self propertyGroups];
  BOOL v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1ADA0]];
  objc_msgSend(v4, "setAllowsDisplayModePickerActions:", -[CNContactContentUnitaryViewController allowsDisplayModePickerActions](self, "allowsDisplayModePickerActions"));

  id v6 = [(CNContactContentUnitaryViewController *)self propertyGroups];
  id v5 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F1AF90]];
  objc_msgSend(v5, "setAllowsDisplayModePickerActions:", -[CNContactContentUnitaryViewController allowsDisplayModePickerActions](self, "allowsDisplayModePickerActions"));
}

- (void)_reloadMedicalIDGroup
{
  char v3 = [(CNContactContentUnitaryViewController *)self environment];
  BOOL v4 = [v3 healthStoreManager];

  id v5 = [(CNContactContentUnitaryViewController *)self medicalIDLookupToken];
  [v5 cancel];

  [(CNContactContentUnitaryViewController *)self setMedicalIDLookupToken:0];
  [(CNContactContentUnitaryViewController *)self setMedicalIDRegistrationToken:0];
  [(CNContactContentUnitaryViewController *)self setCardMedicalIDGroup:0];
  if ([(CNContactContentUnitaryViewController *)self shouldUseStaticHeader]) {
    [(CNContactContentUnitaryViewController *)self staticDisplayHeaderView];
  }
  else {
  id v6 = [(CNContactContentUnitaryViewController *)self displayHeaderView];
  }
  [v6 setIsEmergencyContact:0];

  if ([(CNContactContentUnitaryViewController *)self allowsActions]
    && [(CNContactContentUnitaryViewController *)self allowsCardActions])
  {
    objc_initWeak(&location, self);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __62__CNContactContentUnitaryViewController__reloadMedicalIDGroup__block_invoke;
    v19[3] = &unk_1E549BBA8;
    objc_copyWeak(&v21, &location);
    id v7 = v4;
    id v20 = v7;
    unint64_t v8 = [v7 registerMedicalIDDataHandler:v19];
    [(CNContactContentUnitaryViewController *)self setMedicalIDRegistrationToken:v8];
    id v9 = (void *)MEMORY[0x1E4F5A368];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __62__CNContactContentUnitaryViewController__reloadMedicalIDGroup__block_invoke_4;
    uint64_t v15 = &unk_1E549BBD0;
    objc_copyWeak(&v18, &location);
    id v16 = v7;
    id v10 = v8;
    id v17 = v10;
    uint64_t v11 = [v9 tokenWithCancelationBlock:&v12];
    -[CNContactContentUnitaryViewController setMedicalIDLookupToken:](self, "setMedicalIDLookupToken:", v11, v12, v13, v14, v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    [(CNContactContentUnitaryViewController *)self setCardMedicalIDGroup:0];
    [(CNContactContentUnitaryViewController *)self setMedicalIDAction:0];
    [(CNContactContentUnitaryViewController *)self setEmergencyContactAction:0];
    [(CNContactContentUnitaryViewController *)self setEmergencyNumberIdentifier:0];
  }
}

void __62__CNContactContentUnitaryViewController__reloadMedicalIDGroup__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v8 = [WeakRetained environment];
  id v9 = [v8 defaultSchedulerProvider];
  id v10 = [v9 mainThreadScheduler];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__CNContactContentUnitaryViewController__reloadMedicalIDGroup__block_invoke_2;
  v13[3] = &unk_1E549BB80;
  id v14 = v6;
  id v15 = WeakRetained;
  id v16 = *(id *)(a1 + 32);
  id v17 = v5;
  id v11 = v5;
  id v12 = v6;
  [v10 performBlock:v13];
}

void __62__CNContactContentUnitaryViewController__reloadMedicalIDGroup__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setMedicalIDRegistrationToken:0];
  [*(id *)(a1 + 32) unregisterHandlerForToken:*(void *)(a1 + 40)];
}

void __62__CNContactContentUnitaryViewController__reloadMedicalIDGroup__block_invoke_2(uint64_t a1)
{
  v85[1] = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  char v3 = [*(id *)(a1 + 40) medicalIDRegistrationToken];

  if (v2 == v3)
  {
    BOOL v4 = [*(id *)(a1 + 40) contact];
    id v5 = [v4 phoneNumbers];
    uint64_t v6 = [v5 count];

    if (([*(id *)(a1 + 40) showingMeContact] & 1) != 0
      || ([*(id *)(a1 + 40) isEditing] & 1) == 0 && v6)
    {
      id v7 = [*(id *)(a1 + 40) cardMedicalIDGroup];

      if (v7)
      {
        unint64_t v8 = [*(id *)(a1 + 40) cardMedicalIDGroup];
        [v8 removeAllActions];
      }
      else
      {
        id v9 = [CNCardGroup alloc];
        unint64_t v8 = [*(id *)(a1 + 40) mutableContact];
        id v10 = [(CNCardGroup *)v9 initWithContact:v8];
        [*(id *)(a1 + 40) setCardMedicalIDGroup:v10];
      }
      id v11 = [*(id *)(a1 + 40) cardMedicalIDGroup];
      [v11 setAddSpacerFromPreviousGroup:0];

      int v12 = [*(id *)(a1 + 40) showingMeContact];
      uint64_t v13 = *(void **)(a1 + 40);
      if (v12)
      {
        id v14 = [v13 medicalIDAction];

        if (!v14)
        {
          id v15 = [CNMedicalIDAction alloc];
          id v16 = [*(id *)(a1 + 40) contact];
          id v17 = [(CNPropertyAction *)v15 initWithContact:v16];
          [*(id *)(a1 + 40) setMedicalIDAction:v17];

          uint64_t v18 = *(void *)(a1 + 48);
          uint64_t v19 = [*(id *)(a1 + 40) medicalIDAction];
          [v19 setHealthStoreManager:v18];

          id v20 = *(void **)(a1 + 40);
          id v21 = [v20 medicalIDAction];
          [v21 setDelegate:v20];

          long long v22 = [*(id *)(a1 + 40) medicalIDAction];
          [v22 setShowBackgroundPlatter:0];
        }
        long long v23 = [*(id *)(a1 + 40) cardMedicalIDGroup];
        [v23 setAddSpacerFromPreviousGroup:1];

        int v24 = [*(id *)(a1 + 40) shouldUseStaticHeader];
        long long v25 = *(void **)(a1 + 40);
        if (v24) {
          [v25 staticDisplayHeaderView];
        }
        else {
        long long v35 = [v25 displayHeaderView];
        }
        [v35 setIsEmergencyContact:0];

        if (*(void *)(a1 + 56))
        {
          char v36 = [*(id *)(a1 + 40) isEditing];
          long long v37 = CNContactsUIBundle();
          long long v38 = v37;
          if (v36)
          {
            uint64_t v39 = [v37 localizedStringForKey:@"CARD_ACTION_EDIT_MEDICAL_ID" value:&stru_1ED8AC728 table:@"Localized"];
            uint64_t v40 = 3;
          }
          else
          {
            uint64_t v39 = [v37 localizedStringForKey:@"CARD_ACTION_SHOW_MEDICAL_ID" value:&stru_1ED8AC728 table:@"Localized"];
            uint64_t v40 = 2;
          }
        }
        else
        {
          long long v38 = CNContactsUIBundle();
          uint64_t v39 = [v38 localizedStringForKey:@"CARD_ACTION_CREATE_MEDICAL_ID" value:&stru_1ED8AC728 table:@"Localized"];
          uint64_t v40 = 1;
        }

        long long v41 = [*(id *)(a1 + 40) medicalIDAction];
        [v41 setMedicalIDActionType:v40];

        uint64_t v42 = [*(id *)(a1 + 40) cardMedicalIDGroup];
        long long v43 = [*(id *)(a1 + 40) medicalIDAction];
        long long v44 = +[CNUIColorRepository contactListEmergencyContactAddTextColor];
        long long v45 = +[CNUIColorRepository contactListEmergencyContactGlyphColor];
        [v42 addAction:v43 withTitle:v39 color:v44 glyphColor:v45 transportType:6];

        char v26 = 0;
      }
      else
      {
        char v26 = 0;
        if (([v13 isEditing] & 1) == 0 && v6)
        {
          uint64_t v27 = *(void **)(a1 + 40);
          v85[0] = *MEMORY[0x1E4F1AEE0];
          uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:1];
          uint64_t v29 = [v27 _propertyGroupsForKeys:v28];

          uint64_t v30 = [*(id *)(a1 + 40) _allDisplayPropertyItemsFromGroups:v29];
          id v31 = [*(id *)(a1 + 40) emergencyContactAction];

          if (v31)
          {
            id v32 = [*(id *)(a1 + 40) contact];
            int v33 = [*(id *)(a1 + 40) emergencyContactAction];
            [v33 setContact:v32];

            long long v34 = [*(id *)(a1 + 40) emergencyContactAction];
            [v34 setPropertyItems:v30];
          }
          else
          {
            long long v46 = [CNEmergencyContactAction alloc];
            long long v47 = [*(id *)(a1 + 40) contact];
            uint64_t v48 = [(CNEmergencyContactAction *)v46 initWithContact:v47 healthStoreManager:*(void *)(a1 + 48) propertyItems:v30];
            [*(id *)(a1 + 40) setEmergencyContactAction:v48];

            uint64_t v49 = *(void **)(a1 + 40);
            long long v34 = [v49 emergencyContactAction];
            [v34 setDelegate:v49];
          }

          uint64_t v50 = [*(id *)(a1 + 56) emergencyContacts];
          double v51 = [*(id *)(a1 + 40) contact];
          double v52 = +[CNHealthStoreManager emergencyContactMatchingContact:v51];
          double v53 = objc_msgSend(v50, "_cn_firstObjectPassingTest:", v52);

          uint64_t v54 = CNContactsUIBundle();
          double v55 = v54;
          if (v53)
          {
            double v56 = [v54 localizedStringForKey:@"CARD_ACTION_EMERGENCY_REMOVE" value:&stru_1ED8AC728 table:@"Localized"];

            char v26 = [v53 phoneNumberContactIdentifier];
          }
          else
          {
            double v56 = [v54 localizedStringForKey:@"CARD_ACTION_EMERGENCY_ADD" value:&stru_1ED8AC728 table:@"Localized"];

            char v26 = 0;
          }
          v57 = [*(id *)(a1 + 40) emergencyContactAction];
          [v57 setAddingToEmergency:v53 == 0];

          int v58 = [*(id *)(a1 + 40) shouldUseStaticHeader];
          v59 = *(void **)(a1 + 40);
          if (v58) {
            [v59 staticDisplayHeaderView];
          }
          else {
          v60 = [v59 displayHeaderView];
          }
          [v60 setIsEmergencyContact:v53 != 0];

          double v61 = [*(id *)(a1 + 40) contactStore];
          uint64_t v62 = [*(id *)(a1 + 40) emergencyContactAction];
          [v62 setContactStore:v61];

          if (v53) {
            +[CNUIColorRepository contactListEmergencyContactGlyphColor];
          }
          else {
          v63 = +[CNUIColorRepository contactListEmergencyContactAddTextColor];
          }
          v64 = [*(id *)(a1 + 40) cardMedicalIDGroup];
          v65 = [*(id *)(a1 + 40) emergencyContactAction];
          [v64 addAction:v65 withTitle:v56 color:v63 transportType:0];
        }
      }
      uint64_t v66 = [*(id *)(a1 + 40) contactView];
      BOOL v67 = [*(id *)(a1 + 40) editingContactView];
      v68 = *(void **)(a1 + 40);
      if (v66 == v67) {
        [v68 editingGroups];
      }
      else {
      v69 = [v68 displayGroups];
      }

      v70 = (void *)MEMORY[0x1E4FB1EB0];
      v81[0] = MEMORY[0x1E4F143A8];
      v81[1] = 3221225472;
      v81[2] = __62__CNContactContentUnitaryViewController__reloadMedicalIDGroup__block_invoke_3;
      v81[3] = &unk_1E549B800;
      id v71 = v69;
      uint64_t v72 = *(void *)(a1 + 40);
      id v82 = v71;
      uint64_t v83 = v72;
      id v73 = v66;
      id v84 = v73;
      [v70 performWithoutAnimation:v81];
      uint64_t v74 = [*(id *)(a1 + 40) emergencyNumberIdentifier];
      char v75 = v26;
      if (v26 != (void *)v74)
      {
        uint64_t v76 = (void *)v74;
        v77 = [*(id *)(a1 + 40) emergencyNumberIdentifier];
        char v78 = [v26 isEqualToString:v77];

        if (v78)
        {
LABEL_42:

          return;
        }
        [*(id *)(a1 + 40) setEmergencyNumberIdentifier:v26];
        uint64_t v79 = *(void **)(a1 + 40);
        char v75 = [v79 propertyGroups];
        uint64_t v80 = [v75 objectForKeyedSubscript:*MEMORY[0x1E4F1AEE0]];
        [v79 reloadCardGroup:v80 forTableView:v73];
      }
      goto LABEL_42;
    }
  }
}

void __62__CNContactContentUnitaryViewController__reloadMedicalIDGroup__block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  char v3 = [*(id *)(a1 + 40) cardMedicalIDGroup];
  int v4 = [v2 containsObject:v3];

  id v5 = *(void **)(a1 + 40);
  if (v4)
  {
    id v8 = [*(id *)(a1 + 40) cardMedicalIDGroup];
    [v5 reloadCardGroup:v8 forTableView:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = *(void **)(a1 + 40);
    [v7 _addMedicalIDGroupAnimated:0 forTableView:v6];
  }
}

- (void)_addMedicalIDGroupAnimated:(BOOL)a3 forTableView:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = (CNContactView *)a4;
  if (self->_editingContactView == v6)
  {
    id v7 = [(CNContactContentUnitaryViewController *)self editingGroups];
    id v8 = aBlock;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    id v9 = __81__CNContactContentUnitaryViewController__addMedicalIDGroupAnimated_forTableView___block_invoke;
  }
  else
  {
    id v7 = [(CNContactContentUnitaryViewController *)self displayGroups];
    id v8 = &v14;
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v9 = __81__CNContactContentUnitaryViewController__addMedicalIDGroupAnimated_forTableView___block_invoke_2;
  }
  v8[2] = (uint64_t)v9;
  v8[3] = (uint64_t)&unk_1E549BB58;
  v8[4] = (uint64_t)self;
  id v10 = _Block_copy(v8);
  uint64_t v11 = [v7 indexOfObjectPassingTest:v10];
  if (v11)
  {
    if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
      [v7 lastObject];
    }
    else {
    int v12 = [v7 objectAtIndexedSubscript:v11 - 1];
    }
  }
  else
  {
    int v12 = 0;
  }
  uint64_t v13 = [(CNContactContentUnitaryViewController *)self cardMedicalIDGroup];
  [(CNContactContentUnitaryViewController *)self _addGroup:v13 afterGroup:v12 forTableView:v6 animated:v4];
}

BOOL __81__CNContactContentUnitaryViewController__addMedicalIDGroupAnimated_forTableView___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) cardLinkedCardsGroup];
  if (v4 == v3)
  {
    BOOL v7 = 1;
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) cardStaticIdentityGroup];
    if (v5 == v3)
    {
      BOOL v7 = 1;
    }
    else
    {
      id v6 = [*(id *)(a1 + 32) cardEditingDeleteContactGroup];
      BOOL v7 = v6 == v3;
    }
  }

  return v7;
}

BOOL __81__CNContactContentUnitaryViewController__addMedicalIDGroupAnimated_forTableView___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) cardGameCenterActionGroup];
  if (v4 == v3)
  {
    BOOL v9 = 1;
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) cardShareLocationGroup];
    if (v5 == v3)
    {
      BOOL v9 = 1;
    }
    else
    {
      id v6 = [*(id *)(a1 + 32) cardFooterGroup];
      if (v6 == v3)
      {
        BOOL v9 = 1;
      }
      else
      {
        id v7 = [*(id *)(a1 + 32) cardBlockContactGroup];
        if (v7 == v3)
        {
          BOOL v9 = 1;
        }
        else
        {
          id v8 = [*(id *)(a1 + 32) cardLinkedCardsGroup];
          BOOL v9 = v8 == v3;
        }
      }
    }
  }

  return v9;
}

- (void)_addGroup:(id)a3 afterGroup:(id)a4 forTableView:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v11) {
    [(CNContactContentUnitaryViewController *)self addCardGroup:v10 afterGroup:v11];
  }
  if ([(CNContactContentUnitaryViewController *)self isEditing]) {
    [(CNContactContentUnitaryViewController *)self editingGroups];
  }
  else {
  uint64_t v13 = [(CNContactContentUnitaryViewController *)self displayGroups];
  }
  uint64_t v14 = v13;
  if (v11 && (uint64_t v15 = [v13 indexOfObject:v11], v15 != 0x7FFFFFFFFFFFFFFFLL)) {
    uint64_t v16 = v15 + 1;
  }
  else {
    uint64_t v16 = 0;
  }
  uint64_t v17 = [v14 count];
  if (v17 == [v12 numberOfSections])
  {
    [v12 beginUpdates];
    [v14 insertObject:v10 atIndex:v16];
    unint64_t v18 = [(CNContactContentUnitaryViewController *)self tableViewSectionIndexFromGroupIndex:v16 forTableView:v12];
    uint64_t v19 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v18];
    if (v6) {
      uint64_t v20 = 6;
    }
    else {
      uint64_t v20 = 5;
    }
    [v12 insertSections:v19 withRowAnimation:v20];

    [v12 endUpdates];
  }
  else
  {
    id v21 = CNUILogContactCard();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v10;
      _os_log_impl(&dword_18B625000, v21, OS_LOG_TYPE_INFO, "Invalid number of sections detected when adding group %@", (uint8_t *)&v22, 0xCu);
    }

    [v14 insertObject:v10 atIndex:v16];
    [v12 reloadData];
  }
  [(CNContactContentUnitaryViewController *)self adjustPreferredContentSize];
}

- (void)_reloadMeCardSharedProfileGroup
{
  id v3 = [(CNContactContentUnitaryViewController *)self meCardSharedProfileGroup];

  if (!v3)
  {
    id v4 = [CNMeCardSharedProfileGroup alloc];
    id v5 = [(CNContactContentUnitaryViewController *)self contact];
    BOOL v6 = [(CNCardGroup *)v4 initWithContact:v5];
    [(CNContactContentUnitaryViewController *)self setMeCardSharedProfileGroup:v6];

    id v8 = [(CNContactContentUnitaryViewController *)self _sharedProfileSettingsAction];
    id v7 = [(CNContactContentUnitaryViewController *)self meCardSharedProfileGroup];
    [v7 setSharedProfileSettingsAction:v8];
  }
}

- (void)_reloadSharedProfileGroup
{
  id v3 = [(CNContactContentUnitaryViewController *)self cardSharedProfileGroup];

  if (!v3)
  {
    id v4 = [CNCardSharedProfileGroup alloc];
    id v6 = [(CNContactContentUnitaryViewController *)self mutableContact];
    id v5 = [(CNCardGroup *)v4 initWithContact:v6];
    [(CNContactContentUnitaryViewController *)self setCardSharedProfileGroup:v5];
  }
}

- (void)_reloadNamePickingGroup
{
  id v3 = [(CNContactContentUnitaryViewController *)self namePickingGroup];

  if (!v3)
  {
    id v4 = [CNCardNamePickingGroup alloc];
    id v6 = [(CNContactContentUnitaryViewController *)self contact];
    id v5 = [(CNCardGroup *)v4 initWithContact:v6];
    [(CNContactContentUnitaryViewController *)self setNamePickingGroup:v5];
  }
}

- (BOOL)shouldAddGameCenterActionGroup
{
  int v3 = [(CNContactContentUnitaryViewController *)self shouldShowGameCenter];
  if (v3)
  {
    if (([(CNContactContentUnitaryViewController *)self isEditing] & 1) == 0
      && ([(CNContactContentUnitaryViewController *)self displayGroups],
          id v4 = objc_claimAutoreleasedReturnValue(),
          v4,
          v4)
      && ([(CNContactContentUnitaryViewController *)self cardGameCenterActionGroup],
          id v5 = objc_claimAutoreleasedReturnValue(),
          v5,
          v5))
    {
      id v6 = [(CNContactContentUnitaryViewController *)self displayGroups];
      id v7 = [(CNContactContentUnitaryViewController *)self cardGameCenterActionGroup];
      char v8 = objc_msgSend(v6, "_cn_containsObject:", v7);

      LOBYTE(v3) = v8 ^ 1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)shouldAddGameCenterGroup
{
  int v3 = [(CNContactContentUnitaryViewController *)self shouldShowGameCenter];
  if (v3)
  {
    if (([(CNContactContentUnitaryViewController *)self isEditing] & 1) == 0
      && ([(CNContactContentUnitaryViewController *)self displayGroups],
          id v4 = objc_claimAutoreleasedReturnValue(),
          v4,
          v4)
      && ([(CNContactContentUnitaryViewController *)self gameCenterGroup],
          id v5 = objc_claimAutoreleasedReturnValue(),
          v5,
          v5))
    {
      id v6 = [(CNContactContentUnitaryViewController *)self displayGroups];
      id v7 = [(CNContactContentUnitaryViewController *)self gameCenterGroup];
      char v8 = objc_msgSend(v6, "_cn_containsObject:", v7);

      LOBYTE(v3) = v8 ^ 1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)addGameCenterGroupAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CNContactContentUnitaryViewController *)self shouldShowGameCenter]
    && [(CNContactContentUnitaryViewController *)self shouldAddGameCenterGroup])
  {
    id v5 = [(CNContactContentUnitaryViewController *)self displayGroups];
    uint64_t v6 = objc_msgSend(v5, "_cn_indexOfFirstObjectPassingTest:", &__block_literal_global_904);

    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v7 = [(CNContactContentUnitaryViewController *)self displayGroups];
      uint64_t v6 = objc_msgSend(v7, "_cn_indexOfFirstObjectPassingTest:", &__block_literal_global_906);
    }
    id v11 = 0;
    if (v6 && v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      char v8 = [(CNContactContentUnitaryViewController *)self displayGroups];
      id v11 = [v8 objectAtIndexedSubscript:v6 - 1];
    }
    BOOL v9 = [(CNContactContentUnitaryViewController *)self gameCenterGroup];
    id v10 = [(CNContactContentUnitaryViewController *)self displayContactView];
    [(CNContactContentUnitaryViewController *)self _addGroup:v9 afterGroup:v11 forTableView:v10 animated:v3];
  }
}

BOOL __68__CNContactContentUnitaryViewController_addGameCenterGroupAnimated___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 actions];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

uint64_t __68__CNContactContentUnitaryViewController_addGameCenterGroupAnimated___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    uint64_t v6 = [v5 property];
    uint64_t v7 = [v6 isEqualToString:*MEMORY[0x1E4F1AED0]];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)addGameCenterActionGroupAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CNContactContentUnitaryViewController *)self shouldShowGameCenter])
  {
    if (([(CNContactContentUnitaryViewController *)self isEditing] & 1) == 0)
    {
      id v5 = [(CNContactContentUnitaryViewController *)self displayGroups];

      if (v5)
      {
        uint64_t v6 = [(CNContactContentUnitaryViewController *)self displayGroups];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __74__CNContactContentUnitaryViewController_addGameCenterActionGroupAnimated___block_invoke;
        v13[3] = &unk_1E549BAE8;
        void v13[4] = self;
        uint64_t v7 = objc_msgSend(v6, "_cn_indexOfFirstObjectPassingTest:", v13);

        if (v7 && v7 != 0x7FFFFFFFFFFFFFFFLL)
        {
          char v8 = [(CNContactContentUnitaryViewController *)self displayGroups];
          uint64_t v9 = [v8 objectAtIndexedSubscript:v7 - 1];
        }
        else
        {
          char v8 = [(CNContactContentUnitaryViewController *)self displayGroups];
          uint64_t v9 = [v8 lastObject];
        }
        id v10 = (void *)v9;

        id v11 = [(CNContactContentUnitaryViewController *)self cardGameCenterActionGroup];
        id v12 = [(CNContactContentUnitaryViewController *)self displayContactView];
        [(CNContactContentUnitaryViewController *)self _addGroup:v11 afterGroup:v10 forTableView:v12 animated:v3];
      }
    }
  }
}

BOOL __74__CNContactContentUnitaryViewController_addGameCenterActionGroupAnimated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) cardShareLocationGroup];
  if (v4 == v3)
  {
    BOOL v8 = 1;
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) cardFooterGroup];
    if (v5 == v3)
    {
      BOOL v8 = 1;
    }
    else
    {
      id v6 = [*(id *)(a1 + 32) cardBlockContactGroup];
      if (v6 == v3)
      {
        BOOL v8 = 1;
      }
      else
      {
        uint64_t v7 = [*(id *)(a1 + 32) cardLinkedCardsGroup];
        BOOL v8 = v7 != 0;
      }
    }
  }
  return v8;
}

- (void)updateGameCenterGroupAndActionsForContact:(id)a3 relationshipResults:(id)a4
{
  id v36 = a3;
  id v6 = a4;
  if ([(CNContactContentUnitaryViewController *)self shouldShowGameCenter])
  {
    if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0)
    {
      uint64_t v7 = [(CNContactContentUnitaryViewController *)self mutableContact];
      int v8 = [v36 isEqual:v7];

      if (v8)
      {
        if (+[CNCardGameCenterGroup relationshipResultsContainsFriend:v6])
        {
          uint64_t v9 = [(CNContactContentUnitaryViewController *)self gameCenterGroup];

          if (v9)
          {
            id v10 = [(CNContactContentUnitaryViewController *)self gameCenterGroup];
            [v10 setRelationshipResults:v6];
LABEL_14:

            goto LABEL_19;
          }
          int v33 = [CNCardGameCenterGroup alloc];
          long long v34 = [(CNContactContentUnitaryViewController *)self mutableContact];
          long long v35 = [(CNCardGameCenterGroup *)v33 initWithContact:v34 relationshipResults:v6];
          [(CNContactContentUnitaryViewController *)self setGameCenterGroup:v35];

          [(CNContactContentUnitaryViewController *)self addGameCenterGroupAnimated:1];
        }
        else
        {
          if (_os_feature_enabled_impl())
          {
            id v11 = [(CNContactContentUnitaryViewController *)self gameCenterManager];
            int v12 = [v11 hasSentInvite];

            if (v12)
            {
              uint64_t v13 = [(CNContactContentUnitaryViewController *)self cardGameCenterActionGroup];

              if (!v13)
              {
                uint64_t v14 = [CNCardGroup alloc];
                uint64_t v15 = [(CNContactContentUnitaryViewController *)self mutableContact];
                uint64_t v16 = [(CNCardGroup *)v14 initWithContact:v15];
                [(CNContactContentUnitaryViewController *)self setCardGameCenterActionGroup:v16];
              }
              uint64_t v17 = [(CNContactContentUnitaryViewController *)self cardGameCenterActionGroup];
              [v17 removeAllActions];

              unint64_t v18 = [(CNContactContentUnitaryViewController *)self cardGameCenterActionGroup];
              uint64_t v19 = CNContactsUIBundle();
              uint64_t v20 = [v19 localizedStringForKey:@"GAME_CENTER_ACTION_SENT_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
              id v21 = (id)[v18 addActionWithTitle:v20 target:self selector:sel__didTapGameCenterSentActionButton_NoOp];

              int v22 = [(CNContactContentUnitaryViewController *)self cardGameCenterActionGroup];
              [v22 setDisplaysDropdownMenu:0];

              if ([(CNContactContentUnitaryViewController *)self shouldAddGameCenterActionGroup])
              {
                [(CNContactContentUnitaryViewController *)self addGameCenterActionGroupAnimated:1];
              }
              id v23 = [(CNContactContentUnitaryViewController *)self cardGameCenterActionGroup];
              uint64_t v24 = [(CNContactContentUnitaryViewController *)self displayContactView];
              [(CNContactContentUnitaryViewController *)self reloadCardGroup:v23 forTableView:v24];

              id v10 = [(CNContactContentUnitaryViewController *)self displayContactView];
              [v10 reloadData];
              goto LABEL_14;
            }
          }
          if (+[CNCardGameCenterGroup shouldShowAddFriendActionForRelationshipResults:v6])
          {
            long long v25 = [CNCardGroup alloc];
            char v26 = [(CNContactContentUnitaryViewController *)self mutableContact];
            uint64_t v27 = [(CNCardGroup *)v25 initWithContact:v26];
            [(CNContactContentUnitaryViewController *)self setCardGameCenterActionGroup:v27];

            uint64_t v28 = [(CNContactContentUnitaryViewController *)self cardGameCenterActionGroup];
            [v28 setDisplaysDropdownMenu:1];

            uint64_t v29 = [(CNContactContentUnitaryViewController *)self mutableContact];
            uint64_t v30 = +[CNCardGameCenterGroup actionForRelationshipResults:v6 forContact:v29];

            if (v30)
            {
              [v30 setDelegate:self];
              [(CNContactContentUnitaryViewController *)self setGameCenterAddFriendAction:v30];
              id v31 = [(CNContactContentUnitaryViewController *)self cardGameCenterActionGroup];
              id v32 = [v30 title];
              [v31 addAction:v30 withTitle:v32];

              [(CNContactContentUnitaryViewController *)self addGameCenterActionGroupAnimated:0];
            }
          }
        }
      }
    }
  }
LABEL_19:
}

- (void)_reloadGameCenterGroupWithRefresh
{
  if ([(CNContactContentUnitaryViewController *)self shouldShowGameCenter])
  {
    [(CNContactContentUnitaryViewController *)self setRequiresGameCenterRefresh:0];
    id v3 = [(CNContactContentUnitaryViewController *)self gameCenterManager];
    id v4 = [(CNContactContentUnitaryViewController *)self mutableContact];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __74__CNContactContentUnitaryViewController__reloadGameCenterGroupWithRefresh__block_invoke;
    v5[3] = &unk_1E549BB10;
    v5[4] = self;
    [v3 refreshGameCenterRelationshipsForContact:v4 completionHandler:v5];
  }
}

void __74__CNContactContentUnitaryViewController__reloadGameCenterGroupWithRefresh__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) environment];
  int v8 = [v7 defaultSchedulerProvider];
  uint64_t v9 = [v8 mainThreadScheduler];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__CNContactContentUnitaryViewController__reloadGameCenterGroupWithRefresh__block_invoke_2;
  v12[3] = &unk_1E549B800;
  v12[4] = *(void *)(a1 + 32);
  id v13 = v6;
  id v14 = v5;
  id v10 = v5;
  id v11 = v6;
  [v9 performBlock:v12];
}

uint64_t __74__CNContactContentUnitaryViewController__reloadGameCenterGroupWithRefresh__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateGameCenterGroupAndActionsForContact:*(void *)(a1 + 40) relationshipResults:*(void *)(a1 + 48)];
}

- (void)_reloadGameCenterGroupWithPreflight
{
  if ([(CNContactContentUnitaryViewController *)self shouldShowGameCenter])
  {
    id v3 = [(CNContactContentUnitaryViewController *)self gameCenterManager];
    id v4 = [(CNContactContentUnitaryViewController *)self mutableContact];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __76__CNContactContentUnitaryViewController__reloadGameCenterGroupWithPreflight__block_invoke;
    v5[3] = &unk_1E549BB10;
    v5[4] = self;
    [v3 getGameCenterRelationshipsForContact:v4 completionHandler:v5];
  }
}

void __76__CNContactContentUnitaryViewController__reloadGameCenterGroupWithPreflight__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) environment];
  int v8 = [v7 defaultSchedulerProvider];
  uint64_t v9 = [v8 mainThreadScheduler];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__CNContactContentUnitaryViewController__reloadGameCenterGroupWithPreflight__block_invoke_2;
  v12[3] = &unk_1E549B800;
  v12[4] = *(void *)(a1 + 32);
  id v13 = v6;
  id v14 = v5;
  id v10 = v5;
  id v11 = v6;
  [v9 performBlock:v12];
}

uint64_t __76__CNContactContentUnitaryViewController__reloadGameCenterGroupWithPreflight__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateGameCenterGroupAndActionsForContact:*(void *)(a1 + 40) relationshipResults:*(void *)(a1 + 48)];
}

- (void)_reloadGameCenterGroup
{
  if (([(CNContactContentUnitaryViewController *)self isEditing] & 1) == 0
    && [(CNContactContentUnitaryViewController *)self shouldShowGameCenter])
  {
    id v3 = [(CNContactContentUnitaryViewController *)self gameCenterManager];

    if (!v3)
    {
      id v4 = objc_alloc_init(CNCardGameCenterManager);
      [(CNContactContentUnitaryViewController *)self setGameCenterManager:v4];
    }
    id v5 = [(CNContactContentUnitaryViewController *)self gameCenterManager];
    id v16 = [v5 contact];

    if (v16)
    {
      id v6 = [v16 identifier];
      uint64_t v7 = [(CNContactContentUnitaryViewController *)self mutableContact];
      int v8 = [v7 identifier];
      char v9 = [v6 isEqualToString:v8];

      if ((v9 & 1) == 0)
      {
        id v10 = [(CNContactContentUnitaryViewController *)self gameCenterManager];
        [v10 setHasSentInvite:0];
      }
    }
    id v11 = [(CNContactContentUnitaryViewController *)self mutableContact];
    int v12 = [(CNContactContentUnitaryViewController *)self gameCenterManager];
    [v12 setContact:v11];

    id v13 = [(CNContactContentUnitaryViewController *)self environment];
    id v14 = [v13 recentsManager];
    uint64_t v15 = [(CNContactContentUnitaryViewController *)self gameCenterManager];
    [v15 setRecentsManager:v14];

    if ([(CNContactContentUnitaryViewController *)self requiresGameCenterRefresh]) {
      [(CNContactContentUnitaryViewController *)self _reloadGameCenterGroupWithRefresh];
    }
    else {
      [(CNContactContentUnitaryViewController *)self _reloadGameCenterGroupWithPreflight];
    }
  }
}

- (BOOL)shouldShowGameCenter
{
  return 1;
}

- (BOOL)shouldAddShareLocationGroup
{
  if ([(CNContactContentUnitaryViewController *)self isEditing]) {
    return 0;
  }
  id v3 = [(CNContactContentUnitaryViewController *)self displayGroups];

  if (!v3) {
    return 0;
  }
  id v4 = [(CNContactContentUnitaryViewController *)self cardShareLocationGroup];

  if (!v4) {
    return 0;
  }
  id v5 = [(CNContactContentUnitaryViewController *)self displayGroups];
  id v6 = [(CNContactContentUnitaryViewController *)self cardShareLocationGroup];
  char v7 = objc_msgSend(v5, "_cn_containsObject:", v6);

  return v7 ^ 1;
}

- (void)_addShareLocationGroupAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CNContactContentUnitaryViewController *)self shouldAddShareLocationGroup])
  {
    if (([(CNContactContentUnitaryViewController *)self isEditing] & 1) == 0)
    {
      id v5 = [(CNContactContentUnitaryViewController *)self displayGroups];

      if (v5)
      {
        id v6 = [(CNContactContentUnitaryViewController *)self displayGroups];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __72__CNContactContentUnitaryViewController__addShareLocationGroupAnimated___block_invoke;
        v13[3] = &unk_1E549BAE8;
        void v13[4] = self;
        uint64_t v7 = objc_msgSend(v6, "_cn_indexOfFirstObjectPassingTest:", v13);

        if (v7 && v7 != 0x7FFFFFFFFFFFFFFFLL)
        {
          int v8 = [(CNContactContentUnitaryViewController *)self displayGroups];
          uint64_t v9 = [v8 objectAtIndexedSubscript:v7 - 1];
        }
        else
        {
          int v8 = [(CNContactContentUnitaryViewController *)self displayGroups];
          uint64_t v9 = [v8 lastObject];
        }
        id v10 = (void *)v9;

        id v11 = [(CNContactContentUnitaryViewController *)self cardShareLocationGroup];
        int v12 = [(CNContactContentUnitaryViewController *)self displayContactView];
        [(CNContactContentUnitaryViewController *)self _addGroup:v11 afterGroup:v10 forTableView:v12 animated:v3];
      }
    }
  }
}

BOOL __72__CNContactContentUnitaryViewController__addShareLocationGroupAnimated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) cardFooterGroup];
  if (v4 == v3)
  {
    BOOL v7 = 1;
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) cardBlockContactGroup];
    if (v5 == v3)
    {
      BOOL v7 = 1;
    }
    else
    {
      id v6 = [*(id *)(a1 + 32) cardLinkedCardsGroup];
      BOOL v7 = v6 != 0;
    }
  }

  return v7;
}

- (BOOL)shouldAddDefaultAppGroup
{
  if (![(CNContactContentUnitaryViewController *)self canDisplayDefaultAppGroup]) {
    return 0;
  }
  id v3 = [(CNContactContentUnitaryViewController *)self displayGroups];

  if (!v3) {
    return 0;
  }
  id v4 = [(CNContactContentUnitaryViewController *)self cardDefaultAppGroup];

  if (!v4) {
    return 0;
  }
  id v5 = [(CNContactContentUnitaryViewController *)self displayGroups];
  id v6 = [(CNContactContentUnitaryViewController *)self cardDefaultAppGroup];
  char v7 = [v5 containsObject:v6];

  if (v7) {
    return 0;
  }
  id v10 = [(CNContactContentUnitaryViewController *)self cardDefaultAppGroup];
  uint64_t v11 = [v10 contact];

  int v12 = [(CNContactContentUnitaryViewController *)self displayGroups];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__CNContactContentUnitaryViewController_shouldAddDefaultAppGroup__block_invoke;
  v14[3] = &unk_1E549BAC0;
  id v15 = (id)v11;
  id v13 = (id)v11;
  LOBYTE(v11) = objc_msgSend(v12, "_cn_any:", v14);

  char v8 = v11 ^ 1;
  return v8;
}

uint64_t __65__CNContactContentUnitaryViewController_shouldAddDefaultAppGroup__block_invoke(uint64_t a1, void *a2)
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

  if (v6)
  {
    char v7 = *(void **)(a1 + 32);
    char v8 = [v6 contact];
    uint64_t v9 = [v7 isEqualIgnoringIdentifiers:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)_addDefaultAppGroupAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v11[2] = *MEMORY[0x1E4F143B8];
  if (([(CNContactContentUnitaryViewController *)self isEditing] & 1) == 0)
  {
    if ([(CNContactContentUnitaryViewController *)self shouldAddDefaultAppGroup])
    {
      uint64_t v5 = *MEMORY[0x1E4F1ADC8];
      v11[0] = *MEMORY[0x1E4F1AEE0];
      v11[1] = v5;
      id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
      char v7 = [(CNContactContentUnitaryViewController *)self _displayGroupsForKeys:v6];

      char v8 = [v7 firstObject];
      uint64_t v9 = [(CNContactContentUnitaryViewController *)self cardDefaultAppGroup];
      id v10 = [(CNContactContentUnitaryViewController *)self displayContactView];
      [(CNContactContentUnitaryViewController *)self _addGroup:v9 afterGroup:v8 forTableView:v10 animated:v3];
    }
  }
}

- (void)_reloadDefaultAppGroup
{
  if ([(CNContactContentUnitaryViewController *)self shouldAddDefaultAppGroup])
  {
    id v16 = +[CNCapabilitiesManager defaultCapabilitiesManager];
    int v3 = [v16 isDefaultPhoneCallAppThirdParty];
    id v4 = v16;
    if (v3)
    {
      uint64_t v5 = [v16 defaultPhoneCallAppBundleIdentifier];
      id v6 = +[CNUIContactsEnvironment currentEnvironment];
      char v7 = [v6 actionDiscoveringEnvironment];
      char v8 = [v7 callProviderManager];

      uint64_t v9 = [v8 thirdPartyCallProviderWithBundleIdentifier:v5];
      id v10 = [(CNContactContentUnitaryViewController *)self contact];
      int v11 = [v9 doesContactHaveSupportedHandles:v10];

      if (v11)
      {
        [(CNContactContentUnitaryViewController *)self setDefaultAppProvider:v9];
        int v12 = [(CNContactContentUnitaryViewController *)self cardDefaultAppGroup];

        if (!v12)
        {
          id v13 = [CNCardDefaultAppGroup alloc];
          id v14 = [(CNContactContentUnitaryViewController *)self mutableContact];
          id v15 = [(CNCardGroup *)v13 initWithContact:v14];
          [(CNContactContentUnitaryViewController *)self setCardDefaultAppGroup:v15];
        }
      }

      id v4 = v16;
    }
  }
}

- (BOOL)shouldAddFaceTimeGroup
{
  int v3 = [(CNContactContentUnitaryViewController *)self displayGroups];

  if (!v3) {
    return 0;
  }
  id v4 = [(CNContactContentUnitaryViewController *)self cardFaceTimeGroup];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = [(CNContactContentUnitaryViewController *)self displayGroups];
  id v6 = [(CNContactContentUnitaryViewController *)self cardFaceTimeGroup];
  char v7 = [v5 containsObject:v6];

  if (v7) {
    return 0;
  }
  uint64_t v9 = [(CNContactContentUnitaryViewController *)self cardFaceTimeGroup];
  uint64_t v10 = [v9 contact];

  int v11 = [(CNContactContentUnitaryViewController *)self displayGroups];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__CNContactContentUnitaryViewController_shouldAddFaceTimeGroup__block_invoke;
  v14[3] = &unk_1E549BAC0;
  id v15 = (id)v10;
  id v12 = (id)v10;
  LOBYTE(v10) = objc_msgSend(v11, "_cn_any:", v14);

  char v8 = v10 ^ 1;
  return v8;
}

uint64_t __63__CNContactContentUnitaryViewController_shouldAddFaceTimeGroup__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    char v7 = *(void **)(a1 + 32);
    char v8 = [v6 contact];
    uint64_t v9 = [v7 isEqualIgnoringIdentifiers:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)_addFaceTimeGroupAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v11[2] = *MEMORY[0x1E4F143B8];
  if (([(CNContactContentUnitaryViewController *)self isEditing] & 1) == 0)
  {
    if ([(CNContactContentUnitaryViewController *)self shouldAddFaceTimeGroup])
    {
      uint64_t v5 = *MEMORY[0x1E4F1ADC8];
      v11[0] = *MEMORY[0x1E4F1AEE0];
      v11[1] = v5;
      id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
      char v7 = [(CNContactContentUnitaryViewController *)self _displayGroupsForKeys:v6];

      char v8 = [v7 firstObject];
      uint64_t v9 = [(CNContactContentUnitaryViewController *)self cardFaceTimeGroup];
      uint64_t v10 = [(CNContactContentUnitaryViewController *)self displayContactView];
      [(CNContactContentUnitaryViewController *)self _addGroup:v9 afterGroup:v8 forTableView:v10 animated:v3];
    }
  }
}

- (void)_reloadFaceTimeGroup
{
  v26[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[CNCapabilitiesManager defaultCapabilitiesManager];
  int v4 = [v3 isConferencingAvailable];
  int v5 = [v3 isFaceTimeAppAvailable];
  if ([(CNContactContentUnitaryViewController *)self canDisplayDefaultAppGroup]) {
    int v6 = [v3 isDefaultPhoneCallAppThirdParty] ^ 1;
  }
  else {
    int v6 = 1;
  }
  if ((v5 & v4) == 1 && v6 != 0)
  {
    uint64_t v8 = *MEMORY[0x1E4F1ADC8];
    v26[0] = *MEMORY[0x1E4F1AEE0];
    v26[1] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    uint64_t v10 = [(CNContactContentUnitaryViewController *)self _propertyGroupsForKeys:v9];

    int v11 = [(CNContactContentUnitaryViewController *)self _allDisplayPropertyItemsFromGroups:v10];
    if (![(CNContactContentUnitaryViewController *)self allowsActions]
      || ![(CNContactContentUnitaryViewController *)self allowsConferencing])
    {
      goto LABEL_15;
    }
    id v12 = [(CNContactContentUnitaryViewController *)self contact];
    if (([v12 isSuggested] & 1) == 0 && objc_msgSend(v11, "count"))
    {
      id v13 = [(CNContactContentViewController *)self primaryProperty];
      BOOL v14 = v13 == 0;

      if (!v14)
      {
LABEL_15:

        goto LABEL_16;
      }
      id v15 = objc_msgSend(v11, "_cn_filter:", &__block_literal_global_3_57815);
      id v12 = objc_msgSend(v15, "_cn_map:", &__block_literal_global_57810);

      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __61__CNContactContentUnitaryViewController__reloadFaceTimeGroup__block_invoke;
      aBlock[3] = &unk_1E549BA98;
      objc_copyWeak(&v24, &location);
      int v22 = _Block_copy(aBlock);
      id v16 = (void *)MEMORY[0x1E4F5A698];
      uint64_t v17 = [(CNContactContentUnitaryViewController *)self environment];
      unint64_t v18 = [v17 idsAvailabilityProvider];
      uint64_t v19 = [(CNContactContentUnitaryViewController *)self environment];
      uint64_t v20 = [v19 defaultSchedulerProvider];
      id v21 = [v16 validateHandlesForFaceTime:v12 availabilityProvider:v18 schedulerProvider:v20 handler:v22];
      [(CNContactContentUnitaryViewController *)self setFaceTimeIDSLookupToken:v21];

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }

    goto LABEL_15;
  }
LABEL_16:
}

void __61__CNContactContentUnitaryViewController__reloadFaceTimeGroup__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 isAvailable])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    BOOL v3 = [WeakRetained faceTimeIDSLookupToken];
    [v3 cancel];

    [WeakRetained setFaceTimeIDSLookupToken:0];
    if (WeakRetained)
    {
      int v4 = [WeakRetained cardFaceTimeGroup];

      if (!v4)
      {
        int v5 = [CNCardFaceTimeGroup alloc];
        int v6 = [WeakRetained mutableContact];
        char v7 = [(CNCardGroup *)v5 initWithContact:v6];
        [WeakRetained setCardFaceTimeGroup:v7];

        if (([WeakRetained needsReload] & 1) == 0) {
          [WeakRetained _addFaceTimeGroupAnimated:1];
        }
      }
    }
  }
}

- (void)_reloadPropertyGroupsPreservingChanges:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v4 = [(CNContactContentUnitaryViewController *)self propertyGroups];
  int v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) reloadDataPreservingChanges:v3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)_isUnavailableAuthorizationPropertyKey:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(CNContactContentUnitaryViewController *)self contact];
  char v6 = [v5 isKeyAvailable:v4];

  if ((v6 & 1) != 0
    || ([MEMORY[0x1E4F1B8A0] allAuthorizationKeysVector],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 containsKey:v4],
        v7,
        !v8))
  {
    BOOL v10 = 0;
  }
  else
  {
    uint64_t v9 = CNUILogContactCard();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_18B625000, v9, OS_LOG_TYPE_DEFAULT, "Property %@ will not be displayed as it is unavailable and requires authorization", (uint8_t *)&v12, 0xCu);
    }

    BOOL v10 = 1;
  }

  return v10;
}

- (id)_loadPropertyGroups
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA60] dictionary];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__CNContactContentUnitaryViewController__loadPropertyGroups__block_invoke;
  aBlock[3] = &unk_1E549BA70;
  void aBlock[4] = self;
  id v18 = v3;
  id v24 = v18;
  id v4 = (void (**)(void *, void *))_Block_copy(aBlock);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  int v5 = +[CNContactView allCardProperties];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    uint64_t v9 = *MEMORY[0x1E4F1ADC0];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v11, "isEqualToString:", v9, v18))
        {
          int v12 = (void *)MEMORY[0x1E4F1B9C8];
          id v13 = [(CNContactContentUnitaryViewController *)self contact];
          LODWORD(v12) = [v12 isWhitelistedContact:v13];

          if (!v12) {
            continue;
          }
        }
        uint64_t v14 = [(CNContactContentUnitaryViewController *)self prohibitedPropertyKeys];
        char v15 = [v14 containsObject:v11];

        if ((v15 & 1) == 0
          && ![(CNContactContentUnitaryViewController *)self _isUnavailableAuthorizationPropertyKey:v11])
        {
          v4[2](v4, v11);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v7);
  }

  v4[2](v4, (void *)*MEMORY[0x1E4F1AF18]);
  id v16 = v18;

  return v16;
}

void __60__CNContactContentUnitaryViewController__loadPropertyGroups__block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  BOOL v3 = [*(id *)(a1 + 32) policy];
  uint64_t v4 = objc_msgSend(v3, "_cnui_maximumNumberOfValuesForProperty:", v11);

  if (v4)
  {
    int v5 = (void *)[*(id *)(a1 + 32) groupClassForProperty:v11];
    uint64_t v6 = [*(id *)(a1 + 32) mutableContact];
    uint64_t v7 = [*(id *)(a1 + 32) contactStore];
    uint64_t v8 = [*(id *)(a1 + 32) policy];
    uint64_t v9 = [*(id *)(a1 + 32) linkedPoliciesByContactIdentifier];
    BOOL v10 = [v5 groupForProperty:v11 contact:v6 store:v7 policy:v8 linkedPolicies:v9];

    [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v11];
  }
}

- (BOOL)shouldShowGemini
{
  BOOL v3 = [(CNContactContentUnitaryViewController *)self geminiDataSource];
  uint64_t v4 = [v3 geminiResult];

  if (v4 && ![(CNContactContentUnitaryViewController *)self showingMeContact])
  {
    uint64_t v6 = [(CNContactContentUnitaryViewController *)self contact];
    if ([v6 isSuggested])
    {
      BOOL v5 = 0;
    }
    else
    {
      uint64_t v7 = [(CNContactContentUnitaryViewController *)self displayedProperties];
      if ([v7 containsObject:*MEMORY[0x1E4F1AEE0]])
      {
        uint64_t v8 = [(CNContactContentUnitaryViewController *)self contact];
        BOOL v5 = +[CNContactContentUnitaryViewController shouldShowGeminiForResult:v4 contact:v8];
      }
      else
      {
        BOOL v5 = 0;
      }
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (Class)groupClassForProperty:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:*MEMORY[0x1E4F1ADA0]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F1AF90]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F1AF18]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F1ADC0]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F1AD88]] & 1) == 0)
  {
    [v3 isEqualToString:*MEMORY[0x1E4F1AF70]];
  }
  uint64_t v4 = objc_opt_class();

  return (Class)v4;
}

- (void)_updateTTYTransportButtonsForItems:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    uint64_t v8 = *MEMORY[0x1E4F1AEE0];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v11 = [v10 property];
        int v12 = [v11 isEqualToString:v8];

        if (v12) {
          objc_msgSend(v10, "setAllowsTTY:", -[CNContactContentUnitaryViewController contactSupportsTTYCalls](self, "contactSupportsTTYCalls"));
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)_updateEmailTransportButtonsForItems:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    uint64_t v7 = *MEMORY[0x1E4F1ADC8];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        BOOL v10 = [v9 property];
        int v11 = [v10 isEqualToString:v7];

        if (v11) {
          [v9 setAllowsEmail:1];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)_updatePhoneTransportButtonsForItems:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    uint64_t v7 = *MEMORY[0x1E4F1AEE0];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        BOOL v10 = [v9 property];
        int v11 = [v10 isEqualToString:v7];

        if (v11)
        {
          long long v12 = +[CNCapabilitiesManager defaultCapabilitiesManager];
          BOOL v13 = ([v12 hasCellularTelephonyCapability] & 1) != 0 || _CFMZEnabled() != 0;
          [v9 setAllowsPhone:v13];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
}

- (void)_updateIMessageTransportButtonsForItems:(id)a3
{
  uint64_t v26 = self;
  v38[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v27 = [MEMORY[0x1E4F1CA48] arrayWithArray:v3];
  uint64_t v4 = *MEMORY[0x1E4F1B758];
  v38[0] = *MEMORY[0x1E4F1B728];
  v38[1] = v4;
  v38[2] = *MEMORY[0x1E4F1B708];
  uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:3];
  uint64_t v28 = [MEMORY[0x1E4F1CA48] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v34;
    uint64_t v9 = *MEMORY[0x1E4F1AEE0];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(v5);
        }
        int v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        long long v12 = objc_msgSend(v11, "property", v26);
        if ([v12 isEqualToString:v9])
        {
          BOOL v13 = [v11 labeledValue];
          long long v14 = [v13 label];
          int v15 = [v29 containsObject:v14];

          if (v15)
          {
            [v11 setAllowsIMessage:1];
            [v28 addObject:v11];
          }
        }
        else
        {
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v7);
  }

  [v27 removeObjectsInArray:v28];
  if ([v27 count])
  {
    long long v16 = objc_msgSend(v27, "_cn_filter:", &__block_literal_global_3_57815);
    long long v17 = objc_msgSend(v16, "_cn_map:", &__block_literal_global_57810);

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __81__CNContactContentUnitaryViewController__updateIMessageTransportButtonsForItems___block_invoke;
    aBlock[3] = &unk_1E549BA48;
    id v31 = v17;
    id v32 = v27;
    id v18 = v17;
    uint64_t v19 = _Block_copy(aBlock);
    long long v20 = (void *)MEMORY[0x1E4F5A698];
    long long v21 = [(CNContactContentUnitaryViewController *)v26 environment];
    long long v22 = [v21 idsAvailabilityProvider];
    id v23 = [(CNContactContentUnitaryViewController *)v26 environment];
    id v24 = [v23 defaultSchedulerProvider];
    long long v25 = [v20 validateHandlesForIMessage:v18 availabilityProvider:v22 schedulerProvider:v24 handler:v19];
    [(CNContactContentUnitaryViewController *)v26 setIMessageIDSLookupToken:v25];
  }
}

void __81__CNContactContentUnitaryViewController__updateIMessageTransportButtonsForItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  uint64_t v4 = [v3 handle];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __81__CNContactContentUnitaryViewController__updateIMessageTransportButtonsForItems___block_invoke_2;
    v17[3] = &unk_1E549B9F8;
    id v18 = v6;
    uint64_t v8 = objc_msgSend(v7, "_cn_firstObjectPassingTest:", v17);
    uint64_t v9 = *(void **)(a1 + 40);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    long long v14 = __81__CNContactContentUnitaryViewController__updateIMessageTransportButtonsForItems___block_invoke_3;
    int v15 = &unk_1E549BA20;
    id v16 = v8;
    id v10 = v8;
    int v11 = objc_msgSend(v9, "_cn_firstObjectPassingTest:", &v12);
    objc_msgSend(v11, "setAllowsIMessage:", objc_msgSend(v3, "isAvailable", v12, v13, v14, v15));
  }
}

uint64_t __81__CNContactContentUnitaryViewController__updateIMessageTransportButtonsForItems___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isEqual:a2];
}

uint64_t __81__CNContactContentUnitaryViewController__updateIMessageTransportButtonsForItems___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 contactProperty];
  uint64_t v4 = [*(id *)(a1 + 32) contactProperty];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (void)_updateAvailableTransportsForItems:(id)a3
{
  id v5 = a3;
  uint64_t v4 = +[CNCapabilitiesManager defaultCapabilitiesManager];
  if ([v4 isMessagesAppAvailable]) {
    [(CNContactContentUnitaryViewController *)self _updateIMessageTransportButtonsForItems:v5];
  }
  if ([v4 isPhoneAppAvailable]) {
    [(CNContactContentUnitaryViewController *)self _updatePhoneTransportButtonsForItems:v5];
  }
  if ([v4 isMailAppAvailable]) {
    [(CNContactContentUnitaryViewController *)self _updateEmailTransportButtonsForItems:v5];
  }
  [(CNContactContentUnitaryViewController *)self _updateTTYTransportButtonsForItems:v5];
}

- (void)_updateAvailableTransports
{
  v7[2] = *MEMORY[0x1E4F143B8];
  if (([(CNContactContentUnitaryViewController *)self isEditing] & 1) == 0)
  {
    uint64_t v3 = *MEMORY[0x1E4F1ADC8];
    v7[0] = *MEMORY[0x1E4F1AEE0];
    v7[1] = v3;
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
    id v5 = [(CNContactContentUnitaryViewController *)self _propertyGroupsForKeys:v4];

    id v6 = [(CNContactContentUnitaryViewController *)self _allDisplayPropertyItemsFromGroups:v5];
    [(CNContactContentUnitaryViewController *)self _updateAvailableTransportsForItems:v6];
  }
}

- (id)_addAddressingGrammarAction
{
  uint64_t v3 = [CNContactAddAddressingGrammarAction alloc];
  uint64_t v4 = [(CNContactContentUnitaryViewController *)self mutableContact];
  id v5 = [(CNContactAction *)v3 initWithContact:v4];

  [(CNContactAction *)v5 setDelegate:self];

  return v5;
}

- (id)_allDisplayPropertyItemsFromGroups:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v10 = [v9 displayItems];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v19 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                [v4 addObject:v15];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)_clearRecentsDataAction
{
  id v3 = [(CNContactContentUnitaryViewController *)self recentsData];

  if (v3 && ![(CNContactContentUnitaryViewController *)self isSuggestedContact])
  {
    uint64_t v5 = [CNContactClearRecentsDataAction alloc];
    uint64_t v6 = [(CNContactContentUnitaryViewController *)self recentsData];
    uint64_t v7 = [(CNContactContentUnitaryViewController *)self environment];
    uint64_t v8 = [v7 recentsManager];
    uint64_t v4 = [(CNContactClearRecentsDataAction *)v5 initWithRecentsData:v6 coreRecentsManager:v8];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_updateExistingContactAction
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(CNContactContentUnitaryViewController *)self contactFormatter];
  uint64_t v4 = [(CNContactContentUnitaryViewController *)self contact];
  uint64_t v5 = [v3 stringFromContact:v4];

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingName:v5];
    id v7 = objc_alloc(MEMORY[0x1E4F1B908]);
    uint64_t v8 = [(CNContactContentUnitaryViewController *)self contactFormatter];
    uint64_t v9 = [v8 descriptorForRequiredKeys];
    v26[0] = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    uint64_t v11 = (void *)[v7 initWithKeysToFetch:v10];

    [v11 setOnlyMainStore:1];
    [v11 setUnifyResults:1];
    [v11 setPredicate:v6];
    uint64_t v20 = 0;
    long long v21 = &v20;
    uint64_t v22 = 0x3032000000;
    long long v23 = __Block_byref_object_copy__63477;
    long long v24 = __Block_byref_object_dispose__63478;
    id v25 = 0;
    uint64_t v12 = [(CNContactContentUnitaryViewController *)self contactStore];
    v18[4] = &v20;
    id v19 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __69__CNContactContentUnitaryViewController__updateExistingContactAction__block_invoke;
    v18[3] = &unk_1E549B878;
    [v12 enumerateContactsWithFetchRequest:v11 error:&v19 usingBlock:v18];
    id v13 = v19;

    if (v21[5])
    {
      long long v14 = [CNContactUpdateExistingContactAction alloc];
      uint64_t v15 = [(CNContactContentUnitaryViewController *)self contact];
      id v16 = [(CNContactAction *)v14 initWithContact:v15];

      [(CNContactUpdateExistingContactAction *)v16 setExistingContact:v21[5]];
      [(CNContactAction *)v16 setDelegate:self];
    }
    else
    {
      id v16 = 0;
    }
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

void __69__CNContactContentUnitaryViewController__updateExistingContactAction__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v6 + 40);
  id v7 = (id *)(v6 + 40);
  uint64_t v8 = v9;
  if (v9)
  {
    *id v7 = 0;

    *a3 = 1;
  }
  else
  {
    objc_storeStrong(v7, a2);
  }
}

- (CNShareLocationController)shareLocationController
{
  shareLocationController = self->_shareLocationController;
  if (!shareLocationController)
  {
    uint64_t v4 = [CNShareLocationController alloc];
    uint64_t v5 = [(CNContactContentUnitaryViewController *)self environment];
    uint64_t v6 = [v5 idsAvailabilityProvider];
    id v7 = [(CNShareLocationController *)v4 initWithIDSAvailabilityProvider:v6];
    uint64_t v8 = self->_shareLocationController;
    self->_shareLocationController = v7;

    [(CNShareLocationController *)self->_shareLocationController setShareLocationDelegate:self];
    shareLocationController = self->_shareLocationController;
  }

  return shareLocationController;
}

- (id)_sharedProfileSettingsAction
{
  id v3 = [CNContactSharedProfileSettingsAction alloc];
  uint64_t v4 = [(CNContactContentUnitaryViewController *)self contact];
  uint64_t v5 = [(CNContactAction *)v3 initWithContact:v4];

  [(CNContactAction *)v5 setDelegate:self];
  uint64_t v6 = [(CNContactContentUnitaryViewController *)self contactStore];
  [(CNContactSharedProfileSettingsAction *)v5 setContactStore:v6];

  return v5;
}

- (id)_addToExistingContactAction
{
  id v3 = [CNContactAddToExistingContactAction alloc];
  uint64_t v4 = [(CNContactContentUnitaryViewController *)self contact];
  uint64_t v5 = [(CNContactAction *)v3 initWithContact:v4];

  [(CNContactAction *)v5 setDelegate:self];

  return v5;
}

- (id)_addCreateNewContactAction
{
  id v3 = [CNContactCreateNewContactAction alloc];
  uint64_t v4 = [(CNContactContentUnitaryViewController *)self contact];
  uint64_t v5 = [(CNContactAction *)v3 initWithContact:v4];

  [(CNContactAction *)v5 setDelegate:self];
  [(CNContactCreateNewContactAction *)v5 setPresentingViewController:self];

  return v5;
}

- (id)_addNewFieldAction
{
  id v3 = [CNContactAddNewFieldAction alloc];
  uint64_t v4 = [(CNContactContentUnitaryViewController *)self contact];
  uint64_t v5 = [(CNContactAction *)v3 initWithContact:v4];

  uint64_t v6 = [(CNContactContentUnitaryViewController *)self prohibitedPropertyKeys];
  [(CNContactAddNewFieldAction *)v5 setProhibitedPropertyKeys:v6];

  [(CNContactAction *)v5 setDelegate:self];
  [(CNContactAddNewFieldAction *)v5 setGroupPickerDelegate:self];

  return v5;
}

- (id)_addFavoriteActionWithConferencing:(BOOL)a3 telephony:(BOOL)a4
{
  void v16[4] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F1ADC8];
  v16[0] = *MEMORY[0x1E4F1AEE0];
  v16[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F1AE60];
  v16[2] = *MEMORY[0x1E4F1AF78];
  v16[3] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
  uint64_t v8 = [(CNContactContentUnitaryViewController *)self _propertyGroupsForKeys:v7];

  uint64_t v9 = [(CNContactContentUnitaryViewController *)self _allDisplayPropertyItemsFromGroups:v8];
  id v10 = [CNContactAddFavoriteAction alloc];
  uint64_t v11 = [(CNContactContentUnitaryViewController *)self contact];
  uint64_t v12 = [(CNContactContentUnitaryViewController *)self environment];
  id v13 = [v12 inProcessFavorites];
  long long v14 = [(CNContactAddFavoriteAction *)v10 initWithContact:v11 propertyItems:v9 favorites:v13];

  [(CNContactAction *)v14 setDelegate:self];

  return v14;
}

- (id)_shareContactAction
{
  id v3 = [(CNContactContentUnitaryViewController *)self contact];
  uint64_t v4 = [v3 mainStoreLinkedContacts];
  if ([v3 isUnified])
  {
    uint64_t v5 = [v3 linkedContacts];
    char v6 = [v5 isEqual:v4];

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = [MEMORY[0x1E4F1B8F8] unifyContacts:v4];

      id v3 = (void *)v7;
    }
  }
  uint64_t v8 = [(CNContactAction *)[CNContactShareContactAction alloc] initWithContact:v3];
  if ([(CNContactShareContactAction *)v8 canPerformAction])
  {
    [(CNContactAction *)v8 setDelegate:self];
  }
  else
  {

    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_selectContainersAction
{
  id v3 = objc_alloc_init(CNContactSelectContainersAction);
  [(CNContactAction *)v3 setDelegate:self];

  return v3;
}

- (id)_addToGroupAction
{
  id v3 = [CNContactAddToGroupAction alloc];
  uint64_t v4 = [(CNContactContentUnitaryViewController *)self mutableContact];
  uint64_t v5 = [(CNContactAction *)v3 initWithContact:v4];

  char v6 = [(CNContactContentUnitaryViewController *)self contactStore];
  [(CNContactAddToGroupAction *)v5 setContactStore:v6];

  [(CNContactAction *)v5 setDelegate:self];
  uint64_t v7 = [(CNContactContentUnitaryViewController *)self managedConfiguration];
  [(CNContactAddToGroupAction *)v5 setManagedConfiguration:v7];

  return v5;
}

- (id)_addLinkedCardAction
{
  id v3 = [CNContactAddLinkedCardAction alloc];
  uint64_t v4 = [(CNContactContentUnitaryViewController *)self mutableContact];
  uint64_t v5 = [(CNContactAction *)v3 initWithContact:v4];

  [(CNContactAction *)v5 setDelegate:self];

  return v5;
}

- (id)_linkedCardsAction
{
  id v3 = [CNPropertyLinkedCardsAction alloc];
  uint64_t v4 = [(CNContactContentUnitaryViewController *)self mutableContact];
  uint64_t v5 = [(CNPropertyLinkedCardsAction *)v3 initWithContact:v4];

  [(CNContactAction *)v5 setDelegate:self];
  [(CNPropertyLinkedCardsAction *)v5 setContactDelegate:self];

  return v5;
}

- (id)_faceTimeAction
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F1ADC8];
  v11[0] = *MEMORY[0x1E4F1AEE0];
  v11[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  uint64_t v5 = [(CNContactContentUnitaryViewController *)self _propertyGroupsForKeys:v4];

  char v6 = [(CNContactContentUnitaryViewController *)self _allDisplayPropertyItemsFromGroups:v5];
  uint64_t v7 = [CNPropertyFaceTimeAction alloc];
  uint64_t v8 = [(CNContactContentUnitaryViewController *)self contact];
  uint64_t v9 = [(CNPropertyFaceTimeAction *)v7 initWithContact:v8 propertyItems:v6];

  [(CNContactAction *)v9 setDelegate:self];

  return v9;
}

- (id)_sendMessageActionAllowingEmailIDs:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v4 = *MEMORY[0x1E4F1ADC8];
    uint64_t v17 = *MEMORY[0x1E4F1AEE0];
    uint64_t v18 = v4;
    uint64_t v5 = (void *)MEMORY[0x1E4F1C978];
    char v6 = &v17;
    uint64_t v7 = 2;
  }
  else
  {
    uint64_t v16 = *MEMORY[0x1E4F1AEE0];
    uint64_t v5 = (void *)MEMORY[0x1E4F1C978];
    char v6 = &v16;
    uint64_t v7 = 1;
  }
  uint64_t v8 = objc_msgSend(v5, "arrayWithObjects:count:", v6, v7, v16, v17, v18, v19);
  uint64_t v9 = [(CNContactContentUnitaryViewController *)self _propertyGroupsForKeys:v8];

  id v10 = [(CNContactContentUnitaryViewController *)self _allDisplayPropertyItemsFromGroups:v9];
  uint64_t v11 = [CNPropertySendMessageAction alloc];
  uint64_t v12 = [(CNContactContentUnitaryViewController *)self contact];
  id v13 = [(CNContactContentUnitaryViewController *)self actionsDataSource];
  long long v14 = [(CNPropertySendMessageAction *)v11 initWithContact:v12 propertyItems:v10 actionDataSource:v13];

  [(CNContactAction *)v14 setDelegate:self];

  return v14;
}

- (id)_displayGroupsForKeys:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F5A258];
  char v6 = [(CNContactContentUnitaryViewController *)self displayGroups];
  LODWORD(v5) = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  if (v5)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  }
  else
  {
    uint64_t v8 = [(CNContactContentUnitaryViewController *)self _propertyGroupsForKeys:v4];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __63__CNContactContentUnitaryViewController__displayGroupsForKeys___block_invoke;
    v10[3] = &unk_1E549B760;
    v10[4] = self;
    objc_msgSend(v8, "_cn_filter:", v10);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

uint64_t __63__CNContactContentUnitaryViewController__displayGroupsForKeys___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 displayGroups];
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

- (id)_propertyGroupsForKeys:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
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
        uint64_t v12 = [(CNContactContentUnitaryViewController *)self propertyGroups];
        id v13 = [v12 objectForKeyedSubscript:v11];

        if (v13) {
          [v5 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)_setupCustomActions
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ([(CNContactContentUnitaryViewController *)self allowsEditInApp])
  {
    id v3 = [(CNContactContentUnitaryViewController *)self contact];
    char v4 = [v3 isSuggested];

    if ((v4 & 1) == 0)
    {
      uint64_t v5 = [CNEditInAppAction alloc];
      id v6 = [(CNContactContentUnitaryViewController *)self contact];
      uint64_t v7 = [(CNContactContentUnitaryViewController *)self activityManager];
      uint64_t v8 = [(CNEditInAppAction *)v5 initWithContact:v6 activityManager:v7];

      uint64_t v9 = [(CNContactContentUnitaryViewController *)self cardFooterGroup];
      id v10 = [(CNEditInAppAction *)v8 title];
      [v9 addAction:v8 withTitle:v10];
    }
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v11 = [(CNContactContentUnitaryViewController *)self customActions];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v17 = +[CNCustomCardAction groupForActionGivenPlacement:inContactContentViewController:](CNCustomCardAction, "groupForActionGivenPlacement:inContactContentViewController:", [v16 placement], self);
        long long v18 = [v16 menuProvider];

        if (v18)
        {
          [v17 setDisplaysDropdownMenu:1];
          uint64_t v19 = [v16 title];
          uint64_t v20 = [v16 menuProvider];
          id v21 = (id)objc_msgSend(v17, "addActionWithTitle:menuProvider:destructive:", v19, v20, objc_msgSend(v16, "isDestructive"));
        }
        else
        {
          uint64_t v19 = [v16 title];
          uint64_t v20 = [v16 targetActionWrapper];
          id v22 = (id)objc_msgSend(v17, "addActionWithTitle:target:selector:destructive:", v19, v20, sel_performActionWithSender_, objc_msgSend(v16, "isDestructive"));
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }
}

- (void)_setupEditingCardActions
{
  id v3 = [(CNContactContentUnitaryViewController *)self policy];
  char v4 = [v3 isReadonly];

  if (v4) {
    return;
  }
  [(CNContactContentUnitaryViewController *)self _setupSuggestionActions];
  uint64_t v5 = [(CNContactContentUnitaryViewController *)self alreadyPickedGroups];
  id v6 = [(CNContactContentUnitaryViewController *)self policy];
  uint64_t v7 = [(CNContactContentUnitaryViewController *)self prohibitedPropertyKeys];
  uint64_t v8 = [(CNContactContentUnitaryViewController *)self contact];
  BOOL v9 = +[CNContactPropertyGroupPickerViewController propertiesLeftToPickWithPickedGroups:v5 policy:v6 prohibitedPropertyKeys:v7 contact:v8];

  if (v9)
  {
    id v10 = [(CNContactContentUnitaryViewController *)self _addNewFieldAction];
    [(CNContactContentUnitaryViewController *)self setAddNewFieldAction:v10];

    uint64_t v11 = [(CNContactContentUnitaryViewController *)self cardEditingActionsGroup];
    uint64_t v12 = [(CNContactContentUnitaryViewController *)self addNewFieldAction];
    uint64_t v13 = CNContactsUIBundle();
    uint64_t v14 = [v13 localizedStringForKey:@"ADD_MORE_PROPERTIES" value:&stru_1ED8AC728 table:@"Localized"];
    [v11 addAction:v12 withTitle:v14];
  }
  long long v15 = [(CNContactContentUnitaryViewController *)self contact];
  int v16 = [v15 isSuggestedMe];

  if (v16)
  {
    long long v17 = [CNContactIgnoreDonatedInformationAction alloc];
    long long v18 = [(CNContactContentUnitaryViewController *)self mutableContact];
    id v19 = objc_alloc_init(MEMORY[0x1E4F5A190]);
    uint64_t v20 = [(CNContactContentUnitaryViewController *)self environment];
    id v21 = [v20 componentsFactory];
    id v22 = [(CNContactIgnoreDonatedInformationAction *)v17 initWithContact:v18 donationStore:v19 componentsFactory:v21];
    [(CNContactContentUnitaryViewController *)self setIgnoreContactAction:v22];

    long long v23 = [(CNContactContentUnitaryViewController *)self ignoreContactAction];
    [v23 setDelegate:self];

    long long v24 = [(CNContactContentUnitaryViewController *)self ignoreContactAction];
    [v24 setDestructive:1];

    long long v25 = [(CNContactContentUnitaryViewController *)self cardEditingDeleteContactGroup];
    long long v26 = [(CNContactContentUnitaryViewController *)self ignoreContactAction];
    uint64_t v27 = CNContactsUIBundle();
    uint64_t v28 = v27;
    uint64_t v29 = @"CARD_ACTION_IGNORE_CARD";
  }
  else
  {
    long long v25 = [(CNContactContentUnitaryViewController *)self contact];
    if (([v25 isUnknown] & 1) != 0
      || [(CNContactContentViewController *)self editingProposedInformation])
    {
      goto LABEL_9;
    }
    if ([(CNContactContentViewController *)self allowsDeletion])
    {
    }
    else
    {
      BOOL v34 = [(CNContactContentUnitaryViewController *)self saveWasAuthorized];

      if (!v34) {
        goto LABEL_10;
      }
    }
    long long v35 = [CNContactDeleteContactAction alloc];
    long long v36 = [(CNContactContentUnitaryViewController *)self mutableContact];
    long long v37 = [(CNContactContentUnitaryViewController *)self environment];
    long long v38 = [v37 recentsManager];
    uint64_t v39 = [(CNContactContentUnitaryViewController *)self environment];
    uint64_t v40 = [v39 componentsFactory];
    long long v41 = [(CNContactDeleteContactAction *)v35 initWithContact:v36 recentsManager:v38 componentsFactory:v40];
    [(CNContactContentUnitaryViewController *)self setDeleteContactAction:v41];

    uint64_t v42 = [(CNContactContentUnitaryViewController *)self deleteContactAction];
    [v42 setDelegate:self];

    long long v43 = [(CNContactContentUnitaryViewController *)self deleteContactAction];
    [v43 setDestructive:1];

    long long v25 = [(CNContactContentUnitaryViewController *)self cardEditingDeleteContactGroup];
    long long v26 = [(CNContactContentUnitaryViewController *)self deleteContactAction];
    uint64_t v27 = CNContactsUIBundle();
    uint64_t v28 = v27;
    uint64_t v29 = @"CARD_ACTION_DELETE_CARD";
  }
  uint64_t v30 = [v27 localizedStringForKey:v29 value:&stru_1ED8AC728 table:@"Localized"];
  [v25 addAction:v26 withTitle:v30];

LABEL_9:
LABEL_10:
  if ([(CNContactContentUnitaryViewController *)self shouldAllowContainerPicking])
  {
    id v31 = [(CNContactContentUnitaryViewController *)self _selectContainersAction];
    [(CNContactContentUnitaryViewController *)self setSelectContainersAction:v31];

    id v32 = [(CNContactContentUnitaryViewController *)self selectContainersAction];
    [v32 setDelegate:self];
  }
  if (self->_addAddressingGrammarAction)
  {
    id v44 = [(CNContactContentUnitaryViewController *)self mutableContact];
    long long v33 = [(CNContactContentUnitaryViewController *)self addAddressingGrammarAction];
    [v33 setContact:v44];
  }
  else
  {
    id v44 = [(CNContactContentUnitaryViewController *)self _addAddressingGrammarAction];
    -[CNContactContentUnitaryViewController setAddAddressingGrammarAction:](self, "setAddAddressingGrammarAction:");
  }
}

- (void)_setupAddToAddressBookActions
{
  id v28 = [(CNContactContentUnitaryViewController *)self contact];
  if ([v28 isUnknown])
  {
    BOOL v3 = [(CNContactContentUnitaryViewController *)self allowsAddingToAddressBook];

    if (!v3) {
      return;
    }
    char v4 = [(CNContactContentUnitaryViewController *)self _addCreateNewContactAction];
    [(CNContactContentUnitaryViewController *)self setCreateNewContactAction:v4];

    uint64_t v5 = [(CNContactContentUnitaryViewController *)self cardActionsGroup];
    id v6 = [(CNContactContentUnitaryViewController *)self createNewContactAction];
    uint64_t v7 = CNContactsUIBundle();
    uint64_t v8 = [v7 localizedStringForKey:@"UNKNOWN_CARD_CREATE_NEW_CONTACT" value:&stru_1ED8AC728 table:@"Localized"];
    [v5 addAction:v6 withTitle:v8];

    BOOL v9 = [(CNContactContentUnitaryViewController *)self _addToExistingContactAction];
    [(CNContactContentUnitaryViewController *)self setAddToExistingContactAction:v9];

    id v10 = [(CNContactContentUnitaryViewController *)self cardActionsGroup];
    uint64_t v11 = [(CNContactContentUnitaryViewController *)self addToExistingContactAction];
    uint64_t v12 = CNContactsUIBundle();
    uint64_t v13 = [v12 localizedStringForKey:@"UNKNOWN_CARD_ADD_TO_EXISTING_CONTACT" value:&stru_1ED8AC728 table:@"Localized"];
    [v10 addAction:v11 withTitle:v13];

    id v28 = [(CNContactContentUnitaryViewController *)self _updateExistingContactAction];
    if (v28)
    {
      [(CNContactContentUnitaryViewController *)self setUpdateExistingContactAction:v28];
      uint64_t v14 = NSString;
      long long v15 = CNContactsUIBundle();
      int v16 = [v15 localizedStringForKey:@"UNKNOWN_CARD_ADD_UPDATE_CONTACT-%@" value:&stru_1ED8AC728 table:@"Localized"];
      long long v17 = [(CNContactContentUnitaryViewController *)self contactFormatter];
      long long v18 = [v28 existingContact];
      id v19 = [v17 stringFromContact:v18];
      uint64_t v20 = objc_msgSend(v14, "stringWithFormat:", v16, v19);

      id v21 = [(CNContactContentUnitaryViewController *)self cardActionsGroup];
      [v21 addAction:v28 withTitle:v20];
    }
    id v22 = [(CNContactContentUnitaryViewController *)self suggestedContactAction];

    if (v22)
    {
      long long v23 = [(CNContactContentUnitaryViewController *)self cardBlockContactGroup];
      long long v24 = [(CNContactContentUnitaryViewController *)self suggestedContactAction];
      long long v25 = CNContactsUIBundle();
      long long v26 = [v25 localizedStringForKey:@"SUGGESTION_IGNORE_CONTACT" value:&stru_1ED8AC728 table:@"Localized"];
      uint64_t v27 = +[CNUIColorRepository contactCardDestructiveActionTitleTextColor];
      [v23 addAction:v24 withTitle:v26 color:v27 transportType:0];
    }
  }
}

- (void)_setupSuggestionActions
{
  BOOL v3 = [(CNContactContentUnitaryViewController *)self originalContacts];
  objc_msgSend(v3, "_cn_filter:", &__block_literal_global_836);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if ([v8 count] == 1)
  {
    char v4 = [CNContactSuggestionAction alloc];
    uint64_t v5 = [v8 firstObject];
    id v6 = [(CNContactAction *)v4 initWithContact:v5];
    [(CNContactContentUnitaryViewController *)self setSuggestedContactAction:v6];

    uint64_t v7 = [(CNContactContentUnitaryViewController *)self suggestedContactAction];
    [v7 setDelegate:self];
  }
  else
  {
    [(CNContactContentUnitaryViewController *)self setSuggestedContactAction:0];
  }
}

uint64_t __64__CNContactContentUnitaryViewController__setupSuggestionActions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSuggested];
}

- (void)_setupContactBlockingReportingActionPreservingChanges:(BOOL)a3 withUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(CNContactContentUnitaryViewController *)self allowsContactBlockingAndReporting]&& ![(CNContactContentUnitaryViewController *)self showingMeContact])
  {
    uint64_t v7 = [(CNContactContentUnitaryViewController *)self blockReportAction];

    id v8 = [(CNContactContentUnitaryViewController *)self blockReportAction];

    if (!v8)
    {
      BOOL v9 = [CNContactToggleBlockReportCallerAction alloc];
      id v10 = [(CNContactContentUnitaryViewController *)self contact];
      uint64_t v11 = [(CNContactAction *)v9 initWithContact:v10];
      [(CNContactContentUnitaryViewController *)self setBlockReportAction:v11];

      uint64_t v12 = [(CNContactContentUnitaryViewController *)self blockReportAction];
      [v12 setDelegate:self];

      uint64_t v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v13 addObserver:self selector:sel_blockListDidChange_ name:*MEMORY[0x1E4F59E40] object:0];
    }
    uint64_t v14 = [(CNContactContentUnitaryViewController *)self blockReportAction];
    int v15 = [v14 isContactBlockedPreservingChanges:v5];

    if (v7)
    {
      int v16 = CNContactsUIBundle();
      long long v17 = v16;
      if (v15) {
        long long v18 = @"BLOCK_CALLER";
      }
      else {
        long long v18 = @"UNBLOCK_CALLER";
      }
      id v19 = [v16 localizedStringForKey:v18 value:&stru_1ED8AC728 table:@"Localized"];

      uint64_t v20 = [(CNContactContentUnitaryViewController *)self cardBlockContactGroup];
      [v20 removeActionWithTitle:v19];
    }
    id v21 = CNContactsUIBundle();
    id v22 = v21;
    if (v15)
    {
      id v41 = [v21 localizedStringForKey:@"UNBLOCK_CALLER" value:&stru_1ED8AC728 table:@"Localized"];

      long long v23 = [(CNContactContentUnitaryViewController *)self cardBlockContactGroup];
      [v23 removeActionWithTitle:v41];

      +[CNUIColorRepository contactsApplicationTintColor];
    }
    else
    {
      id v41 = [v21 localizedStringForKey:@"BLOCK_CALLER" value:&stru_1ED8AC728 table:@"Localized"];

      long long v24 = [(CNContactContentUnitaryViewController *)self cardBlockContactGroup];
      [v24 removeActionWithTitle:v41];

      +[CNUIColorRepository contactCardDestructiveActionTitleTextColor];
    long long v25 = };
    long long v26 = [(CNContactContentUnitaryViewController *)self cardBlockContactGroup];
    uint64_t v27 = [(CNContactContentUnitaryViewController *)self blockReportAction];
    [v26 addAction:v27 withTitle:v41 color:v25 transportType:0];

    if (v4)
    {
      id v28 = [(CNContactContentUnitaryViewController *)self cardBlockContactGroup];
      uint64_t v29 = [(CNContactContentUnitaryViewController *)self displayContactView];
      int64_t v30 = [(CNContactContentUnitaryViewController *)self sectionOfGroup:v28 inTableView:v29];

      if (v30 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v31 = [(CNContactContentUnitaryViewController *)self displayContactView];
        [v31 contentOffset];
        double v33 = v32;
        double v35 = v34;

        long long v36 = [(CNContactContentUnitaryViewController *)self contactView];
        [v36 beginUpdates];

        long long v37 = [(CNContactContentUnitaryViewController *)self contactView];
        long long v38 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v30];
        [v37 reloadSections:v38 withRowAnimation:0];

        uint64_t v39 = [(CNContactContentUnitaryViewController *)self contactView];
        [v39 endUpdates];

        uint64_t v40 = [(CNContactContentUnitaryViewController *)self contactView];
        objc_msgSend(v40, "setContentOffset:", v33, v35);

        [(CNContactContentUnitaryViewController *)self adjustPreferredContentSize];
      }
    }
  }
}

- (void)_setupContactBlockingActionPreservingChanges:(BOOL)a3 withUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(CNContactContentUnitaryViewController *)self allowsContactBlocking]
    && ![(CNContactContentUnitaryViewController *)self showingMeContact])
  {
    uint64_t v7 = [(CNContactContentUnitaryViewController *)self blockAction];

    id v8 = [(CNContactContentUnitaryViewController *)self blockAction];

    if (!v8)
    {
      BOOL v9 = [CNContactToggleBlockCallerAction alloc];
      id v10 = [(CNContactContentUnitaryViewController *)self contact];
      uint64_t v11 = [(CNContactAction *)v9 initWithContact:v10];
      [(CNContactContentUnitaryViewController *)self setBlockAction:v11];

      uint64_t v12 = [(CNContactContentUnitaryViewController *)self blockAction];
      [v12 setDelegate:self];

      uint64_t v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v13 addObserver:self selector:sel_blockListDidChange_ name:*MEMORY[0x1E4F59E40] object:0];
    }
    uint64_t v14 = [(CNContactContentUnitaryViewController *)self blockAction];
    int v15 = [v14 isContactBlockedPreservingChanges:v5];

    if (v7)
    {
      int v16 = CNContactsUIBundle();
      long long v17 = v16;
      if (v15) {
        long long v18 = @"BLOCK_THIS_CALLER";
      }
      else {
        long long v18 = @"UNBLOCK_THIS_CALLER";
      }
      id v19 = [v16 localizedStringForKey:v18 value:&stru_1ED8AC728 table:@"Localized"];

      uint64_t v20 = [(CNContactContentUnitaryViewController *)self cardBlockContactGroup];
      [v20 removeActionWithTitle:v19];
    }
    id v21 = CNContactsUIBundle();
    id v22 = v21;
    if (v15)
    {
      id v41 = [v21 localizedStringForKey:@"UNBLOCK_THIS_CALLER" value:&stru_1ED8AC728 table:@"Localized"];

      long long v23 = [(CNContactContentUnitaryViewController *)self cardBlockContactGroup];
      [v23 removeActionWithTitle:v41];

      +[CNUIColorRepository contactsApplicationTintColor];
    }
    else
    {
      id v41 = [v21 localizedStringForKey:@"BLOCK_THIS_CALLER" value:&stru_1ED8AC728 table:@"Localized"];

      long long v24 = [(CNContactContentUnitaryViewController *)self cardBlockContactGroup];
      [v24 removeActionWithTitle:v41];

      +[CNUIColorRepository contactCardDestructiveActionTitleTextColor];
    long long v25 = };
    long long v26 = [(CNContactContentUnitaryViewController *)self cardBlockContactGroup];
    uint64_t v27 = [(CNContactContentUnitaryViewController *)self blockAction];
    [v26 addAction:v27 withTitle:v41 color:v25 transportType:0];

    if (v4)
    {
      id v28 = [(CNContactContentUnitaryViewController *)self cardBlockContactGroup];
      uint64_t v29 = [(CNContactContentUnitaryViewController *)self displayContactView];
      int64_t v30 = [(CNContactContentUnitaryViewController *)self sectionOfGroup:v28 inTableView:v29];

      if (v30 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v31 = [(CNContactContentUnitaryViewController *)self displayContactView];
        [v31 contentOffset];
        double v33 = v32;
        double v35 = v34;

        long long v36 = [(CNContactContentUnitaryViewController *)self contactView];
        [v36 beginUpdates];

        long long v37 = [(CNContactContentUnitaryViewController *)self contactView];
        long long v38 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v30];
        [v37 reloadSections:v38 withRowAnimation:0];

        uint64_t v39 = [(CNContactContentUnitaryViewController *)self contactView];
        [v39 endUpdates];

        uint64_t v40 = [(CNContactContentUnitaryViewController *)self contactView];
        objc_msgSend(v40, "setContentOffset:", v33, v35);

        [(CNContactContentUnitaryViewController *)self adjustPreferredContentSize];
      }
    }
  }
}

- (void)setupShareLocationActionReload:(BOOL)a3
{
  if (![(CNContactContentUnitaryViewController *)self showingMeContact] && !CNUIIsMessages())
  {
    BOOL v5 = [(CNContactContentUnitaryViewController *)self cardShareLocationGroup];
    [v5 setDisplaysDropdownMenu:1];

    id v6 = [(CNContactContentUnitaryViewController *)self cardShareLocationGroup];
    uint64_t v7 = [(CNContactContentUnitaryViewController *)self shareLocationController];
    [v6 removeActionWithTarget:v7 selector:sel_perform_];

    objc_initWeak(&location, self);
    id v8 = [(CNContactContentUnitaryViewController *)self shareLocationController];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __72__CNContactContentUnitaryViewController_setupShareLocationActionReload___block_invoke;
    v9[3] = &unk_1E549B9B0;
    objc_copyWeak(&v10, &location);
    BOOL v11 = a3;
    [v8 canShareWithCompletion:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __72__CNContactContentUnitaryViewController_setupShareLocationActionReload___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__63477;
  v15[4] = __Block_byref_object_dispose__63478;
  id v16 = 0;
  if (a2)
  {
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x3032000000;
    v13[3] = __Block_byref_object_copy__63477;
    void v13[4] = __Block_byref_object_dispose__63478;
    BOOL v5 = CNContactsUIBundle();
    id v14 = [v5 localizedStringForKey:@"SHARE_LOCATION_LABEL_TEXT" value:&stru_1ED8AC728 table:@"Localized"];

    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    char v12 = 0;
    objc_initWeak(&location, WeakRetained);
    id v6 = [WeakRetained shareLocationController];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __72__CNContactContentUnitaryViewController_setupShareLocationActionReload___block_invoke_2;
    void v7[3] = &unk_1E549B988;
    objc_copyWeak(&v8, &location);
    v7[4] = v13;
    void v7[5] = v11;
    v7[6] = v15;
    char v9 = *(unsigned char *)(a1 + 40);
    [v6 isSharingWithCompletion:v7];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    _Block_object_dispose(v11, 8);
    _Block_object_dispose(v13, 8);
  }
  _Block_object_dispose(v15, 8);
}

void __72__CNContactContentUnitaryViewController_setupShareLocationActionReload___block_invoke_2(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__CNContactContentUnitaryViewController_setupShareLocationActionReload___block_invoke_3;
  block[3] = &unk_1E549B960;
  char v8 = a2;
  long long v6 = *(_OWORD *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 48);
  void block[4] = WeakRetained;
  char v9 = *(unsigned char *)(a1 + 64);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __72__CNContactContentUnitaryViewController_setupShareLocationActionReload___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    id v2 = CNContactsUIBundle();
    uint64_t v3 = [v2 localizedStringForKey:@"SHARE_LOCATION_STOP_SHARING_LABEL_TEXT" value:&stru_1ED8AC728 table:@"Localized"];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    BOOL v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v7 = [*(id *)(a1 + 32) shareLocationController];
  uint64_t v8 = +[CNContactAction contactActionWithTitle:v6 target:v7 selector:sel_perform_ destructive:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  BOOL v11 = [*(id *)(a1 + 32) cardShareLocationGroup];
  [v11 addAction:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) withTitle:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  if ([*(id *)(a1 + 32) shouldAddShareLocationGroup]) {
    [*(id *)(a1 + 32) _addShareLocationGroupAnimated:1];
  }
  if (*(unsigned char *)(a1 + 65))
  {
    char v12 = *(void **)(a1 + 32);
    id v14 = [v12 cardShareLocationGroup];
    uint64_t v13 = [*(id *)(a1 + 32) contactView];
    [v12 reloadCardGroup:v14 forTableView:v13];
  }
}

- (BOOL)labeledValuesHasNonSuggestion:(id)a3
{
  return objc_msgSend(a3, "_cn_any:", &__block_literal_global_810);
}

uint64_t __71__CNContactContentUnitaryViewController_labeledValuesHasNonSuggestion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSuggested] ^ 1;
}

- (BOOL)contactHasAvailablePropertiesToFavorite:(id)a3 isPhoneAppAvailable:(BOOL)a4 isFaceTimeAppAvailable:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = [v8 phoneNumbers];
  BOOL v10 = [(CNContactContentUnitaryViewController *)self labeledValuesHasNonSuggestion:v9];

  if (v6 && v10) {
    goto LABEL_6;
  }
  BOOL v11 = [v8 emailAddresses];
  BOOL v12 = [(CNContactContentUnitaryViewController *)self labeledValuesHasNonSuggestion:v11];

  if (v5 && (v10 || v12)) {
    goto LABEL_6;
  }
  uint64_t v13 = [v8 socialProfiles];
  BOOL v14 = [(CNContactContentUnitaryViewController *)self labeledValuesHasNonSuggestion:v13];

  if (v14)
  {
LABEL_6:
    BOOL v15 = 1;
  }
  else
  {
    long long v17 = [v8 instantMessageAddresses];
    BOOL v15 = [(CNContactContentUnitaryViewController *)self labeledValuesHasNonSuggestion:v17];
  }
  return v15;
}

- (void)_setupCardActions
{
  if (![(CNContactContentUnitaryViewController *)self allowsActions]) {
    return;
  }
  uint64_t v3 = [(CNContactContentUnitaryViewController *)self actionProvider];
  [v3 buildCommunicationLimitsActions];

  id v84 = +[CNCapabilitiesManager defaultCapabilitiesManager];
  unsigned int v82 = [v84 hasCellularTelephonyCapability];
  int v4 = [v84 areFavoritesAvailable];
  int v5 = [v84 isMMSConfigured];
  int v6 = [v84 isMadridConfigured];
  int v7 = [v84 isConferencingAvailable];
  int v8 = [v84 isMessagesAppAvailable];
  unsigned int v81 = [v84 isPhoneAppAvailable];
  uint64_t v9 = [v84 isFaceTimeAppAvailable];
  int v80 = v5;
  if ([(CNContactContentUnitaryViewController *)self canDisplayDefaultAppGroup]) {
    char v83 = [v84 isDefaultPhoneCallAppThirdParty];
  }
  else {
    char v83 = 0;
  }
  BOOL v10 = [(CNContactContentUnitaryViewController *)self contact];
  BOOL v11 = [v10 phoneNumbers];
  uint64_t v12 = [v11 count];

  uint64_t v13 = [(CNContactContentUnitaryViewController *)self contact];
  BOOL v14 = [v13 emailAddresses];
  uint64_t v15 = [v14 count];

  int v16 = v7;
  if (([MEMORY[0x1E4F1B8F8] quickActionsEnabled] & 1) == 0)
  {
    if (v8 && (v12 ? (char v17 = v82 | v6) : (char v17 = 0), v15 ? (v18 = v80 | v6) : (v18 = 0), (v17 & 1) != 0 || v18))
    {
      id v19 = -[CNContactContentUnitaryViewController _sendMessageActionAllowingEmailIDs:](self, "_sendMessageActionAllowingEmailIDs:");
      [(CNContactContentUnitaryViewController *)self setSendMessageAction:v19];
    }
    else
    {
      [(CNContactContentUnitaryViewController *)self setSendMessageAction:0];
    }
  }
  uint64_t v20 = [(CNContactContentUnitaryViewController *)self faceTimeAction];
  if (v20) {
    int v21 = 0;
  }
  else {
    int v21 = v16;
  }
  if (!(v12 | v15)) {
    int v21 = 0;
  }
  if ((v21 & v9) != 1) {
    goto LABEL_26;
  }
  if ((v83 & 1) == 0)
  {
    uint64_t v20 = [(CNContactContentUnitaryViewController *)self _faceTimeAction];
    [(CNContactContentUnitaryViewController *)self setFaceTimeAction:v20];
LABEL_26:
  }
  [(CNContactContentUnitaryViewController *)self setShareContactAction:0];
  BOOL v22 = [(CNContactContentUnitaryViewController *)self isHeaderViewPhotoProhibited];
  if ([(CNContactContentUnitaryViewController *)self allowsSharing])
  {
    long long v23 = [(CNContactContentUnitaryViewController *)self contact];
    char v24 = [v23 isSuggested] | v22;

    if ((v24 & 1) == 0)
    {
      long long v25 = [(CNContactContentUnitaryViewController *)self _shareContactAction];
      [(CNContactContentUnitaryViewController *)self setShareContactAction:v25];
    }
  }
  if (v4)
  {
    long long v26 = [(CNContactContentUnitaryViewController *)self contact];
    if ([v26 isUnknown])
    {
    }
    else
    {
      uint64_t v27 = [(CNContactContentUnitaryViewController *)self contact];
      BOOL v28 = [(CNContactContentUnitaryViewController *)self contactHasAvailablePropertiesToFavorite:v27 isPhoneAppAvailable:v81 isFaceTimeAppAvailable:v9];

      if (v28)
      {
        uint64_t v29 = [(CNContactContentUnitaryViewController *)self _addFavoriteActionWithConferencing:v9 & v16 telephony:v81 & v82];
        [(CNContactContentUnitaryViewController *)self setAddFavoriteAction:v29];

        goto LABEL_36;
      }
    }
  }
  [(CNContactContentUnitaryViewController *)self setAddFavoriteAction:0];
LABEL_36:
  if ([(CNContactContentUnitaryViewController *)self allowsCardActions])
  {
    int64_t v30 = [(CNContactContentUnitaryViewController *)self contact];
    char v31 = [v30 isSuggested];

    if ((v31 & 1) == 0)
    {
      if ([(CNContactContentUnitaryViewController *)self allowsSendMessage])
      {
        uint64_t v32 = [(CNContactContentUnitaryViewController *)self sendMessageAction];
        if (v32)
        {
          double v33 = (void *)v32;
          double v34 = [(CNContactContentViewController *)self primaryProperty];

          if (!v34)
          {
            double v35 = [(CNContactContentUnitaryViewController *)self cardActionsGroup];
            long long v36 = [(CNContactContentUnitaryViewController *)self sendMessageAction];
            long long v37 = CNContactsUIBundle();
            long long v38 = [v37 localizedStringForKey:@"PHONE_ACTION_TEXT" value:&stru_1ED8AC728 table:@"Localized"];
            [v35 addAction:v36 withTitle:v38];
          }
        }
      }
      uint64_t v39 = [(CNContactContentUnitaryViewController *)self shareContactAction];

      if (v39)
      {
        uint64_t v40 = [(CNContactContentUnitaryViewController *)self cardActionsGroup];
        id v41 = [(CNContactContentUnitaryViewController *)self shareContactAction];
        uint64_t v42 = CNContactsUIBundle();
        long long v43 = [v42 localizedStringForKey:@"SHARE_CONTACT_ACTION_BUTTON_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
        [v40 addAction:v41 withTitle:v43];
      }
      uint64_t v44 = [(CNContactContentUnitaryViewController *)self addFavoriteAction];
      if (v44)
      {
        long long v45 = (void *)v44;
        long long v46 = [(CNContactContentUnitaryViewController *)self addFavoriteAction];
        int v47 = [v46 canPerformAction];

        if (v47)
        {
          uint64_t v48 = [(CNContactContentUnitaryViewController *)self cardActionsGroup];
          uint64_t v49 = [(CNContactContentUnitaryViewController *)self addFavoriteAction];
          uint64_t v50 = CNContactsUIBundle();
          double v51 = [v50 localizedStringForKey:@"PHONE_ACTION_ADD_TO_FAVORITES" value:&stru_1ED8AC728 table:@"Localized"];
          [v48 addAction:v49 withTitle:v51];
        }
      }
      double v52 = [(CNContactContentUnitaryViewController *)self actionProvider];
      double v53 = [v52 shareWithFamilyAction];

      if (v53 && [v53 canPerformAction])
      {
        [v53 setDelegate:self];
        uint64_t v54 = [(CNContactContentUnitaryViewController *)self cardActionsGroup];
        double v55 = [v53 title];
        [v54 addAction:v53 withTitle:v55];
      }
      double v56 = [(CNContactContentUnitaryViewController *)self actionProvider];
      v57 = [v56 stopSharingWithFamilyAction];
      [(CNContactContentUnitaryViewController *)self setStopSharingWithFamilyAction:v57];

      int v58 = [(CNContactContentUnitaryViewController *)self stopSharingWithFamilyAction];
      [v58 setDelegate:self];

      if ([(CNContactContentViewController *)self ignoresParentalRestrictions])
      {
        v59 = [(CNContactContentUnitaryViewController *)self stopSharingWithFamilyAction];
        int v60 = [v59 canPerformAction];

        if (v60)
        {
          double v61 = [(CNContactContentUnitaryViewController *)self cardActionsGroup];
          uint64_t v62 = [(CNContactContentUnitaryViewController *)self stopSharingWithFamilyAction];
          v63 = [(CNContactContentUnitaryViewController *)self stopSharingWithFamilyAction];
          v64 = [v63 title];
          v65 = [(CNContactContentUnitaryViewController *)self stopSharingWithFamilyAction];
          objc_msgSend(v61, "addAction:withTitle:wrapTitle:", v62, v64, objc_msgSend(v65, "wrapTitle"));
        }
      }
      uint64_t v66 = [(CNContactContentUnitaryViewController *)self stopSharingWithFamilyAction];
      int v67 = [v66 canPerformAction];

      if (v67)
      {
        v68 = [(CNContactContentUnitaryViewController *)self cardEditingActionsGroup];
        v69 = [(CNContactContentUnitaryViewController *)self stopSharingWithFamilyAction];
        v70 = [(CNContactContentUnitaryViewController *)self stopSharingWithFamilyAction];
        id v71 = [v70 title];
        uint64_t v72 = [(CNContactContentUnitaryViewController *)self stopSharingWithFamilyAction];
        objc_msgSend(v68, "addAction:withTitle:wrapTitle:", v69, v71, objc_msgSend(v72, "wrapTitle"));
      }
      [(CNContactContentUnitaryViewController *)self setupShareLocationActionReload:0];
    }
  }
  id v73 = [(CNContactContentUnitaryViewController *)self _clearRecentsDataAction];
  [(CNContactContentUnitaryViewController *)self setClearRecentsDataAction:v73];

  uint64_t v74 = [(CNContactContentUnitaryViewController *)self clearRecentsDataAction];

  if (v74)
  {
    char v75 = [(CNContactContentUnitaryViewController *)self clearRecentsDataAction];
    [v75 setDelegate:self];

    uint64_t v76 = [(CNContactContentUnitaryViewController *)self cardActionsGroup];
    v77 = [(CNContactContentUnitaryViewController *)self clearRecentsDataAction];
    char v78 = CNContactsUIBundle();
    uint64_t v79 = [v78 localizedStringForKey:@"CLEAR_RECENTS" value:&stru_1ED8AC728 table:@"Localized"];
    [v76 addAction:v77 withTitle:v79];
  }
}

- (void)_retrieveActionsModelPreservingChanges:(BOOL)a3
{
  int v5 = [(CNContactContentUnitaryViewController *)self contact];

  if (v5)
  {
    if (!a3)
    {
      objc_initWeak(&location, self);
      int v6 = [MEMORY[0x1E4F5A720] allActionTypes];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __80__CNContactContentUnitaryViewController__retrieveActionsModelPreservingChanges___block_invoke;
      void v7[3] = &unk_1E549B918;
      v7[4] = self;
      objc_copyWeak(&v8, &location);
      [v6 enumerateObjectsUsingBlock:v7];

      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

void __80__CNContactContentUnitaryViewController__retrieveActionsModelPreservingChanges___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) actionsDataSource];
  int v5 = [*(id *)(a1 + 32) contact];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__CNContactContentUnitaryViewController__retrieveActionsModelPreservingChanges___block_invoke_2;
  v8[3] = &unk_1E549B8F0;
  id v6 = v3;
  id v9 = v6;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  id v7 = (id)[v4 consumer:0 actionModelsForContact:v5 actionType:v6 handler:v8];

  objc_destroyWeak(&v10);
}

void __80__CNContactContentUnitaryViewController__retrieveActionsModelPreservingChanges___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isEqual:*MEMORY[0x1E4F1AD20]])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __80__CNContactContentUnitaryViewController__retrieveActionsModelPreservingChanges___block_invoke_3;
    v4[3] = &unk_1E549B670;
    objc_copyWeak(&v6, (id *)(a1 + 40));
    id v5 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v4);

    objc_destroyWeak(&v6);
  }
}

void __80__CNContactContentUnitaryViewController__retrieveActionsModelPreservingChanges___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setContactSupportsTTYCalls:", objc_msgSend((id)objc_opt_class(), "actionModelIncludesTTY:", *(void *)(a1 + 32)));
  [WeakRetained _updateAvailableTransports];
}

- (void)setAllowsActions:(BOOL)a3
{
  if (self->_allowsActions != a3)
  {
    self->_allowsActions = a3;
    [(CNContactContentUnitaryViewController *)self setNeedsReload];
  }
}

- (void)setupActionsPreservingChanges:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNContactContentUnitaryViewController *)self actionProvider];
  [v5 buildStaticIdentityActions];

  if (([(CNContactContentUnitaryViewController *)self isEditing] & 1) != 0
    || [(CNContactContentViewController *)self alwaysEditing])
  {
    [(CNContactContentUnitaryViewController *)self _setupEditingCardActions];
  }
  else
  {
    id v6 = [(CNCardGroup *)self->_cardActionsGroup actions];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      id v8 = [CNCardGroup alloc];
      id v9 = [(CNContactContentUnitaryViewController *)self mutableContact];
      id v10 = [(CNCardGroup *)v8 initWithContact:v9];
      cardActionsGroup = self->_cardActionsGroup;
      self->_cardActionsGroup = v10;
    }
    uint64_t v12 = [(CNCardGroup *)self->_cardShareLocationGroup actions];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      BOOL v14 = [CNCardGroup alloc];
      uint64_t v15 = [(CNContactContentUnitaryViewController *)self mutableContact];
      int v16 = [(CNCardGroup *)v14 initWithContact:v15];
      cardShareLocationGroup = self->_cardShareLocationGroup;
      self->_cardShareLocationGroup = v16;
    }
    [(CNContactContentUnitaryViewController *)self _retrieveActionsModelPreservingChanges:v3];
    [(CNContactContentUnitaryViewController *)self _setupCardActions];
    [(CNContactContentUnitaryViewController *)self _setupContactBlockingActionPreservingChanges:v3 withUpdate:v3 ^ 1];
    [(CNContactContentUnitaryViewController *)self _setupContactBlockingReportingActionPreservingChanges:v3 withUpdate:v3 ^ 1];
    [(CNContactContentUnitaryViewController *)self _setupSuggestionActions];
    [(CNContactContentUnitaryViewController *)self _setupAddToAddressBookActions];
    [(CNContactContentUnitaryViewController *)self _setupCustomActions];
  }
}

- (void)_handleCoalescedBlockListDidChange
{
  if ([(CNContactContentUnitaryViewController *)self shouldIgnoreBlockListChange])
  {
    [(CNContactContentUnitaryViewController *)self setShouldIgnoreBlockListChange:0];
  }
  else
  {
    [(CNContactContentUnitaryViewController *)self _setupContactBlockingActionPreservingChanges:0 withUpdate:1];
  }
}

- (void)blockListDidChange:(id)a3
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__handleCoalescedBlockListDidChange object:0];

  [(CNContactContentUnitaryViewController *)self performSelector:sel__handleCoalescedBlockListDidChange withObject:0 afterDelay:0.1];
}

- (void)updateContactsViewWithBlock:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  ++self->_animating;
  id v8 = [(CNContactContentUnitaryViewController *)self contactView];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__CNContactContentUnitaryViewController_updateContactsViewWithBlock_completion___block_invoke;
  v13[3] = &unk_1E549B8A0;
  id v14 = v6;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__CNContactContentUnitaryViewController_updateContactsViewWithBlock_completion___block_invoke_2;
  void v11[3] = &unk_1E549B8C8;
  v11[4] = self;
  id v12 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBatchUpdates:v13 completion:v11];
}

uint64_t __80__CNContactContentUnitaryViewController_updateContactsViewWithBlock_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__CNContactContentUnitaryViewController_updateContactsViewWithBlock_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  --*(_DWORD *)(*(void *)(a1 + 32) + 1324);
  BOOL v3 = *(void **)(a1 + 32);

  return [v3 reloadDataIfNeeded];
}

- (CGSize)requiredSizeForVisibleTableView
{
  BOOL v3 = [(CNContactContentUnitaryViewController *)self displayContactView];
  [v3 contentSize];
  double v5 = v4;
  [v3 contentInset];
  double v7 = v6;
  id v8 = [(CNContactContentUnitaryViewController *)self displayContactView];
  if (![(CNContactContentUnitaryViewController *)self hasPersonHeaderSectionForTableView:v8])
  {

    goto LABEL_5;
  }
  BOOL v9 = [(UIViewController *)self ab_isInPopover];

  if (!v9)
  {
LABEL_5:
    *(double *)&uint64_t v10 = 0.0;
    goto LABEL_6;
  }
  *(double *)&uint64_t v10 = 400.0;
LABEL_6:

  double v11 = *(double *)&v10;
  double v12 = v5 + v7;
  result.height = v12;
  result.width = v11;
  return result;
}

- (double)desiredHeightForWidth:(double)a3
{
  double v4 = [(CNContactContentUnitaryViewController *)self view];
  [v4 frame];
  objc_msgSend(v4, "setFrame:");
  [(CNContactContentUnitaryViewController *)self reloadDataIfNeeded];
  double v5 = [(CNContactContentUnitaryViewController *)self contactView];
  id v6 = (id)[v5 visibleCells];

  double v7 = [(CNContactContentUnitaryViewController *)self view];
  [v7 layoutIfNeeded];

  id v8 = [(CNContactContentUnitaryViewController *)self contactHeaderView];
  [v8 setNeedsLayout];

  if ([(CNContactContentUnitaryViewController *)self shouldUseStaticHeader])
  {
    BOOL v9 = [(CNContactContentUnitaryViewController *)self displayFloatingCollapsedHeaderView];
    [v9 setNeedsLayout];
  }
  [(CNContactContentUnitaryViewController *)self requiredSizeForVisibleTableView];
  double v11 = v10;
  double v12 = [v4 superview];
  [v12 frame];
  objc_msgSend(v4, "setFrame:");

  return v11;
}

- (void)cleanupRecentPosterMetadata
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1B968]);
  double v4 = (void *)MEMORY[0x1E4F1B960];
  double v5 = [(CNContactContentUnitaryViewController *)self contact];
  id v6 = [v5 identifier];
  v16[0] = v6;
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v8 = [v4 saveRequestToDeletePostersForContactIdentifiers:v7];

  id v13 = 0;
  [v3 performSaveRequest:v8 error:&v13];
  id v9 = v13;
  if (v9)
  {
    double v10 = CNUILogContactCard();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      double v11 = [(CNContactContentUnitaryViewController *)self contact];
      double v12 = [v11 identifier];
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v12;
      _os_log_debug_impl(&dword_18B625000, v10, OS_LOG_TYPE_DEBUG, "Failed to delete recent poster metadata for contact: %@", buf, 0xCu);
    }
  }
}

- (void)cleanupRecentImageMetadata
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1B930]);
  double v4 = (void *)MEMORY[0x1E4F1B928];
  double v5 = [(CNContactContentUnitaryViewController *)self contact];
  id v6 = [v5 identifier];
  v16[0] = v6;
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v8 = [v4 saveRequestToDeleteImagesForContactIdentifiers:v7];

  id v13 = 0;
  [v3 performSaveRequest:v8 error:&v13];
  id v9 = v13;
  if (v9)
  {
    double v10 = CNUILogContactCard();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      double v11 = [(CNContactContentUnitaryViewController *)self contact];
      double v12 = [v11 identifier];
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v12;
      _os_log_debug_impl(&dword_18B625000, v10, OS_LOG_TYPE_DEBUG, "Failed to delete recent image metadata for contact: %@", buf, 0xCu);
    }
  }
}

- (void)cleanupRecentMetadata
{
  [(CNContactContentUnitaryViewController *)self cleanupRecentImageMetadata];

  [(CNContactContentUnitaryViewController *)self cleanupRecentPosterMetadata];
}

- (void)reloadUnifiedContact
{
  id v3 = [(CNContactContentUnitaryViewController *)self contact];
  double v4 = objc_opt_class();

  double v5 = [(CNContactContentUnitaryViewController *)self contact];
  id v8 = [v5 linkedContacts];

  id v6 = v8;
  if (v8)
  {
    double v7 = [v4 unifyContacts:v8];
    [(CNContactContentUnitaryViewController *)self setContact:v7];

    id v6 = v8;
  }
}

- (void)addStaticIdentity:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    double v5 = [(CNContactContentUnitaryViewController *)self cardStaticIdentityGroup];
    [v5 addIdentity:v4 isNew:1];

    id v7 = [(CNContactContentUnitaryViewController *)self cardStaticIdentityGroup];
    id v6 = [(CNContactContentUnitaryViewController *)self contactView];
    [(CNContactContentUnitaryViewController *)self reloadCardGroup:v7 forTableView:v6];
  }
}

- (void)removeLinkedContact:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    double v5 = [(CNContactContentUnitaryViewController *)self contact];
    id v6 = [v5 mainStoreLinkedContacts];
    char v7 = [v6 containsObject:v4];

    id v8 = [(CNContactContentUnitaryViewController *)self editingLinkedContacts];
    int v9 = [v8 containsObject:v4];

    if ((v7 & 1) != 0 || v9)
    {
      double v10 = [v4 availableKeyDescriptor];
      v14[0] = v10;
      double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
      [(CNContactContentUnitaryViewController *)self _setupEditingLinkedContactsForKeys:v11];

      double v12 = [(CNContactContentUnitaryViewController *)self editingLinkedContacts];
      [v12 removeObject:v4];

      [(CNContactContentUnitaryViewController *)self reloadDataPreservingChanges:1];
      id v13 = +[CNUIDataCollector sharedCollector];
      [v13 logContactActionType:CNUIContactActionTypeUnlink attributes:0];
    }
  }
}

- (void)addLinkedContact:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(CNContactContentUnitaryViewController *)self contact];
    if ((id)v5 == v4)
    {
    }
    else
    {
      id v6 = (void *)v5;
      char v7 = [(CNContactContentUnitaryViewController *)self contact];
      id v8 = [v7 mainStoreLinkedContacts];
      char v9 = [v8 containsObject:v4];

      if ((v9 & 1) == 0)
      {
        double v10 = [v4 availableKeyDescriptor];
        v14[0] = v10;
        double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
        [(CNContactContentUnitaryViewController *)self _setupEditingLinkedContactsForKeys:v11];

        double v12 = [(CNContactContentUnitaryViewController *)self editingLinkedContacts];
        [v12 addObject:v4];

        [(CNContactContentUnitaryViewController *)self reloadDataPreservingChanges:1];
        id v13 = +[CNUIDataCollector sharedCollector];
        [v13 logContactActionType:CNUIContactActionTypeLink attributes:0];
      }
    }
  }
}

- (void)_setupEditingLinkedContactsForKeys:(id)a3
{
  id v13 = a3;
  id v4 = [(CNContactContentUnitaryViewController *)self editingLinkedContacts];

  uint64_t v5 = v13;
  if (!v4)
  {
    id v6 = [(CNContactContentUnitaryViewController *)self contact];
    int v7 = [v6 isUnified];

    if (v7)
    {
      id v8 = [(CNContactContentUnitaryViewController *)self contact];
      char v9 = [v8 mainStoreLinkedContacts];
      uint64_t v10 = [v9 mutableCopy];
    }
    else
    {
      double v11 = (void *)MEMORY[0x1E4F1CA48];
      id v8 = [(CNContactContentUnitaryViewController *)self contact];
      char v9 = (void *)[v8 copyWithPropertyKeys:v13];
      uint64_t v10 = [v11 arrayWithObject:v9];
    }
    double v12 = (void *)v10;
    [(CNContactContentUnitaryViewController *)self setEditingLinkedContacts:v10];

    uint64_t v5 = v13;
  }
}

- (void)updatedExistingContact:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [(CNContactContentUnitaryViewController *)self contact];
  }
  id v6 = v5;
  [(CNContactContentUnitaryViewController *)self setContact:v5];
  [(CNContactContentUnitaryViewController *)self _didCompleteWithContact:v6];
}

- (void)createdNewContact:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(CNContactContentViewController *)self setPrimaryProperty:0];
    [(CNContactContentUnitaryViewController *)self setContact:v4];
    [(CNContactContentUnitaryViewController *)self setMode:1];
    [(CNContactContentUnitaryViewController *)self setAllowsEditing:1];
    [(CNContactContentUnitaryViewController *)self setAllowsAddingToAddressBook:0];
    [(CNContactContentUnitaryViewController *)self setAllowsAddToFavorites:1];
  }
  [(CNContactContentUnitaryViewController *)self _didCompleteWithContact:v4];
}

- (void)_didCompleteWithContact:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    id v19 = [(CNContactContentUnitaryViewController *)self _removeUnauthorizedKeysFromContact:v4];

    if (self->_contact != &self->_mutableContact->super)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = [v19 copy];

        id v19 = (id)v6;
      }
    }
    id v7 = [(CNContactContentUnitaryViewController *)self suggestedContactAction];
    [v7 confirmSuggestion];
  }
  else
  {
    id v19 = 0;
  }
  if ([(CNContactContentUnitaryViewController *)self mode] == 3)
  {
    id v8 = [(CNContactContentUnitaryViewController *)self originalContacts];
    uint64_t v9 = [v8 count];

    if (v9 == 1)
    {
      if (v19)
      {
        uint64_t v10 = +[CNUIDataCollector sharedCollector];
        double v11 = [(CNContactContentUnitaryViewController *)self originalContacts];
        double v12 = [v11 objectAtIndexedSubscript:0];
        [v10 logContactCreated:v19 originalContact:v12];
      }
    }
  }
  id v13 = [(CNContactContentUnitaryViewController *)self contactDelegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    uint64_t v15 = [(CNContactContentUnitaryViewController *)self contactDelegate];
    [v15 contactViewController:self didCompleteWithContact:v19];
  }
  int v16 = [(CNContactContentUnitaryViewController *)self delegate];
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    int v18 = [(CNContactContentUnitaryViewController *)self delegate];
    [v18 didCompleteWithContact:v19];
  }
}

- (id)_removeUnauthorizedKeysFromContact:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactContentUnitaryViewController *)self missingRequiredKeys];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = (void *)[v4 mutableCopy];
    id v8 = [(CNContactContentUnitaryViewController *)self missingRequiredKeys];
    [v7 removeKeys:v8];

    [v7 setFrozenSelfAsSnapshot];
    id v4 = v7;
  }

  return v4;
}

- (id)_updateContact:(id)a3 withMissingKeysFromRequiredKeys:(id)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 areKeysAvailable:v7 useIgnorableKeys:0 findMissingKeys:1];
  uint64_t v9 = [v8 first];
  int v10 = [v9 BOOLValue];

  if (v10)
  {
    id v11 = v6;
  }
  else
  {
    double v12 = [v8 second];
    [(CNContactContentUnitaryViewController *)self setMissingRequiredKeys:v12];

    uint64_t v24 = 0;
    long long v25 = &v24;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = __Block_byref_object_copy__63477;
    BOOL v28 = __Block_byref_object_dispose__63478;
    id v29 = 0;
    id v13 = objc_alloc(MEMORY[0x1E4F1B908]);
    char v14 = [(CNContactContentUnitaryViewController *)self missingRequiredKeys];
    uint64_t v15 = (void *)[v13 initWithKeysToFetch:v14];

    int v16 = (void *)MEMORY[0x1E4F1B8F8];
    char v17 = [v6 identifier];
    v30[0] = v17;
    int v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    id v19 = [v16 predicateForContactsWithIdentifiers:v18];
    [v15 setPredicate:v19];

    objc_msgSend(v15, "setUnifyResults:", objc_msgSend(v6, "isUnified"));
    uint64_t v20 = [(CNContactContentUnitaryViewController *)self contactStore];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __88__CNContactContentUnitaryViewController__updateContact_withMissingKeysFromRequiredKeys___block_invoke;
    v23[3] = &unk_1E549B878;
    v23[4] = &v24;
    [v20 enumerateContactsWithFetchRequest:v15 error:0 usingBlock:v23];

    int v21 = (void *)[v6 mutableCopy];
    [v21 overwriteStateFromContact:v25[5]];
    id v11 = [v21 freeze];

    _Block_object_dispose(&v24, 8);
  }

  return v11;
}

void __88__CNContactContentUnitaryViewController__updateContact_withMissingKeysFromRequiredKeys___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (void)focusOnLastEditingItemInGroup:(id)a3
{
  id v10 = [a3 lastEditingItem];
  id v4 = [(CNContactContentUnitaryViewController *)self indexPathOfEditingPropertyItem:v10];
  objc_opt_class();
  id v5 = [(CNContactContentUnitaryViewController *)self contactView];
  id v6 = [v5 cellForRowAtIndexPath:v4];
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  uint64_t v9 = [v8 firstResponderItem];

  [v9 becomeFirstResponder];
}

- (void)focusOnFirstEditingItemIfNeeded
{
  if ([(CNContactContentUnitaryViewController *)self isEditing]
    && [(CNContactContentUnitaryViewController *)self mode] == 3
    && ![(CNContactContentUnitaryViewController *)self didSetFirstResponder])
  {
    [(CNContactContentUnitaryViewController *)self setDidSetFirstResponder:1];
    id v3 = [(CNContactContentUnitaryViewController *)self nameEditingGroups];
    id v12 = [v3 firstObject];

    id v4 = [v12 editingItems];
    id v5 = [v4 firstObject];

    id v6 = [(CNContactContentUnitaryViewController *)self indexPathOfEditingPropertyItem:v5];
    objc_opt_class();
    id v7 = [(CNContactContentUnitaryViewController *)self contactView];
    id v8 = [v7 cellForRowAtIndexPath:v6];
    if (objc_opt_isKindOfClass()) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    id v10 = v9;

    id v11 = [v10 firstResponderItem];

    [v11 becomeFirstResponder];
  }
}

- (void)removeEditingItem:(id)a3 atIndexPath:(id)a4 forTableView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = -[CNContactContentUnitaryViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", [v9 section], v10);
  char v12 = [v11 canAddEditingItem];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __84__CNContactContentUnitaryViewController_removeEditingItem_atIndexPath_forTableView___block_invoke;
  v16[3] = &unk_1E549B850;
  void v16[4] = v11;
  id v17 = v8;
  int v18 = self;
  id v19 = v10;
  id v20 = v9;
  char v21 = v12;
  id v13 = v9;
  id v14 = v10;
  id v15 = v8;
  [(CNContactContentUnitaryViewController *)self updateContactsViewWithBlock:v16 completion:0];
}

void __84__CNContactContentUnitaryViewController_removeEditingItem_atIndexPath_forTableView___block_invoke(uint64_t a1)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) removeEditingItem:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) _updateLabelWidthForCellsInGroup:*(void *)(a1 + 32) forTableView:*(void *)(a1 + 56) reset:1];
  int v2 = [*(id *)(a1 + 32) isMultiValue];
  id v3 = *(void **)(a1 + 32);
  if (!v2)
  {
    id v5 = [v3 propertyItems];
    unint64_t v6 = [v5 count];

    id v7 = *(void **)(a1 + 56);
    if (v6 < 2)
    {
      uint64_t v24 = *(void *)(a1 + 64);
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
      [v7 reloadRowsAtIndexPaths:v8 withRowAnimation:100];
    }
    else
    {
      uint64_t v25 = *(void *)(a1 + 64);
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
      [v7 deleteRowsAtIndexPaths:v8 withRowAnimation:2];
    }
    goto LABEL_15;
  }
  id v4 = [v3 editingItems];
  if ([v4 count])
  {
  }
  else
  {
    char v9 = [*(id *)(a1 + 32) canAddEditingItem];

    if ((v9 & 1) == 0)
    {
      int v16 = [*(id *)(a1 + 48) contactView];
      id v17 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(*(id *)(a1 + 64), "section"));
      [v16 deleteSections:v17 withRowAnimation:2];

      int v18 = [*(id *)(a1 + 48) _loadEditingGroupsPreservingChanges:1];
      [*(id *)(a1 + 48) setEditingGroups:v18];

      id v15 = [*(id *)(a1 + 48) deletedEditingGroups];
      id v19 = [v15 arrayByAddingObject:*(void *)(a1 + 32)];
      [*(id *)(a1 + 48) setDeletedEditingGroups:v19];

      goto LABEL_11;
    }
  }
  id v10 = [*(id *)(a1 + 48) contactView];
  v27[0] = *(void *)(a1 + 64);
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  [v10 deleteRowsAtIndexPaths:v11 withRowAnimation:2];

  char v12 = [*(id *)(a1 + 48) contactView];
  id v13 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(*(id *)(a1 + 64), "section"));
  [v12 _reloadSectionHeaderFooters:v13 withRowAnimation:0];

  id v14 = [*(id *)(a1 + 32) property];
  LODWORD(v13) = [v14 isEqualToString:*MEMORY[0x1E4F1AD88]];

  if (v13)
  {
    id v15 = [*(id *)(a1 + 48) contactView];
    [v15 reloadData];
LABEL_11:
  }
  if (!*(unsigned char *)(a1 + 72) && [*(id *)(a1 + 32) canAddEditingItem])
  {
    id v20 = (void *)MEMORY[0x1E4F28D58];
    char v21 = [*(id *)(a1 + 32) editingItems];
    id v8 = objc_msgSend(v20, "indexPathForRow:inSection:", objc_msgSend(v21, "count") - 1, objc_msgSend(*(id *)(a1 + 64), "section"));

    BOOL v22 = *(void **)(a1 + 56);
    uint64_t v26 = v8;
    long long v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    [v22 insertRowsAtIndexPaths:v23 withRowAnimation:100];

LABEL_15:
  }
}

- (void)addEditingItem:(id)a3 atIndexPath:(id)a4 forTableView:(id)a5 shouldSetFocus:(BOOL)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  id v13 = -[CNContactContentUnitaryViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", [v10 section], v11);
  int v14 = [v13 addEditingItem:v12];

  if (v14)
  {
    [(CNContactContentUnitaryViewController *)self _updateLabelWidthForCellsInGroup:v13 forTableView:v11 reset:0];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __96__CNContactContentUnitaryViewController_addEditingItem_atIndexPath_forTableView_shouldSetFocus___block_invoke;
    v17[3] = &unk_1E549B800;
    void v17[4] = v13;
    v17[5] = self;
    id v18 = v10;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __96__CNContactContentUnitaryViewController_addEditingItem_atIndexPath_forTableView_shouldSetFocus___block_invoke_2;
    v15[3] = &unk_1E549B828;
    BOOL v16 = a6;
    v15[4] = self;
    void v15[5] = v13;
    [(CNContactContentUnitaryViewController *)self updateContactsViewWithBlock:v17 completion:v15];
  }
}

void __96__CNContactContentUnitaryViewController_addEditingItem_atIndexPath_forTableView_shouldSetFocus___block_invoke(id *a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (![a1[4] isMultiValue])
  {
    id v3 = [a1[5] contactView];
    id v11 = a1[6];
    id v8 = (void *)MEMORY[0x1E4F1C978];
    char v9 = &v11;
LABEL_7:
    id v10 = objc_msgSend(v8, "arrayWithObjects:count:", v9, 1, v11, v12);
    [v3 reloadRowsAtIndexPaths:v10 withRowAnimation:100];

    goto LABEL_8;
  }
  int v2 = [a1[4] canAddEditingItem];
  id v3 = [a1[5] contactView];
  if (!v2)
  {
    id v12 = a1[6];
    id v8 = (void *)MEMORY[0x1E4F1C978];
    char v9 = &v12;
    goto LABEL_7;
  }
  v13[0] = a1[6];
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [v3 insertRowsAtIndexPaths:v4 withRowAnimation:6];

  id v5 = [a1[5] contactView];
  unint64_t v6 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(a1[6], "section"));
  [v5 _reloadSectionHeaderFooters:v6 withRowAnimation:0];

  id v7 = [a1[4] property];
  LODWORD(v6) = [v7 isEqualToString:*MEMORY[0x1E4F1AD88]];

  if (!v6) {
    return;
  }
  id v3 = [a1[5] contactView];
  [v3 reloadData];
LABEL_8:
}

uint64_t __96__CNContactContentUnitaryViewController_addEditingItem_atIndexPath_forTableView_shouldSetFocus___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    if (*(unsigned char *)(result + 48)) {
      return [*(id *)(result + 32) focusOnLastEditingItemInGroup:*(void *)(result + 40)];
    }
  }
  return result;
}

- (void)addEditingItemAtIndexPath:(id)a3 forTableView:(id)a4
{
}

- (void)_updateLabelWidthsForAllVisibleCells
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(CNContactContentUnitaryViewController *)self contactView];
  [v3 contentOffset];
  double v5 = v4;
  double v7 = v6;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = objc_msgSend(v3, "visibleCells", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [(CNContactContentUnitaryViewController *)self _updateLabelWidthForCell:*(void *)(*((void *)&v13 + 1) + 8 * v12++)];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  objc_msgSend(v3, "setContentOffset:", v5, v7);
  [(CNContactContentUnitaryViewController *)self adjustPreferredContentSize];
}

- (void)_updateLabelWidthForCellsInGroup:(id)a3 forTableView:(id)a4 reset:(BOOL)a5
{
  BOOL v5 = a5;
  id v16 = a3;
  id v8 = a4;
  if (v5)
  {
    uint64_t v9 = [(CNContactContentUnitaryViewController *)self _labelWidthKeyForGroup:v16];
    uint64_t v10 = [(CNContactContentUnitaryViewController *)self cachedLabelWidths];
    [v10 removeObjectForKey:v9];
  }
  [(CNContactContentUnitaryViewController *)self _updateCachedLabelWidthsForGroup:v16];
  int64_t v11 = [(CNContactContentUnitaryViewController *)self sectionOfGroup:v16 inTableView:v8];
  uint64_t v12 = [v16 editingItems];
  if ([v12 count])
  {
    unint64_t v13 = 0;
    do
    {
      long long v14 = [MEMORY[0x1E4F28D58] indexPathForRow:v13 inSection:v11];
      long long v15 = [v8 cellForRowAtIndexPath:v14];
      [(CNContactContentUnitaryViewController *)self _updateLabelWidthForCell:v15];

      ++v13;
    }
    while (v13 < [v12 count]);
  }
}

- (void)_updateLabelWidthForCell:(id)a3
{
  id v15 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  BOOL v5 = v15;
  if (isKindOfClass)
  {
    id v6 = v15;
    char v7 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
    id v8 = [v6 propertyItem];
    uint64_t v9 = v8;
    if (v7)
    {
      uint64_t v10 = [(CNContactContentUnitaryViewController *)self _labelWidthKeyForItem:v8];
    }
    else
    {
      int64_t v11 = [v8 group];
      uint64_t v10 = [(CNContactContentUnitaryViewController *)self _labelWidthKeyForGroup:v11];
    }
    uint64_t v12 = [(CNContactContentUnitaryViewController *)self cachedLabelWidths];
    unint64_t v13 = [v12 objectForKey:v10];
    [v13 floatValue];
    [v6 setLabelWidth:v14];

    BOOL v5 = v15;
  }
}

- (void)_updateCachedLabelWidthsIfNeeded
{
  id v3 = [(CNContactContentUnitaryViewController *)self cachedLabelWidths];

  if (!v3)
  {
    if (self->_editingContactView
      || ([(CNContactContentUnitaryViewController *)self traitCollection],
          double v4 = objc_claimAutoreleasedReturnValue(),
          uint64_t v5 = [v4 userInterfaceIdiom],
          v4,
          v5 == 3))
    {
      [(CNContactContentUnitaryViewController *)self _updateCachedLabelWidths];
    }
  }
}

- (void)_setNeedsUpdateCachedLabelWidths
{
  [(CNContactContentUnitaryViewController *)self setCachedLabelWidths:0];
  if ([(CNContactContentUnitaryViewController *)self isViewLoaded])
  {
    id v3 = [(CNContactContentUnitaryViewController *)self view];
    [v3 setNeedsLayout];
  }
}

- (void)_updateCachedLabelWidths
{
  id v3 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
  [(CNContactContentUnitaryViewController *)self setCachedLabelWidths:v3];

  double v4 = [(CNContactContentUnitaryViewController *)self editingGroups];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = 0;
    do
    {
      char v7 = [(CNContactContentUnitaryViewController *)self editingGroups];
      id v8 = [v7 objectAtIndexedSubscript:v6];

      [(CNContactContentUnitaryViewController *)self _updateCachedLabelWidthsForGroup:v8];
      ++v6;
      uint64_t v9 = [(CNContactContentUnitaryViewController *)self editingGroups];
      unint64_t v10 = [v9 count];
    }
    while (v6 < v10);
  }

  [(CNContactContentUnitaryViewController *)self _updateLabelWidthsForAllVisibleCells];
}

- (void)_updateCachedLabelWidthsForGroup:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v4 = objc_msgSend(a3, "editingItems", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(CNContactContentUnitaryViewController *)self _updateCachedLabelWidthsForItem:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_updateCachedLabelWidthsForItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v37 = v4;
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v37;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  if (v6 && [v6 supportsLabel])
  {
    int v7 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
    uint64_t v8 = [(CNContactContentUnitaryViewController *)self contactView];
    long long v9 = [v8 labelTextAttributes];
    long long v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4FB06F8]];

    if (v10)
    {
      [v10 _scaledValueForValue:44.0];
      double v12 = v11;
    }
    else
    {
      double v12 = 44.0;
    }
    unint64_t v13 = [(CNContactContentUnitaryViewController *)self contactView];
    [v13 frame];
    double Width = CGRectGetWidth(v39);
    if (v7)
    {
      id v15 = [(CNContactContentUnitaryViewController *)self contactView];
      [v15 _marginWidth];
      double v17 = Width - v16;
    }
    else
    {
      double v17 = Width / 3.0;
    }

    if (v7) {
      double v17 = v17 + -53.0;
    }
    id v18 = objc_alloc(MEMORY[0x1E4F28B18]);
    id v19 = [v6 displayLabel];
    id v20 = [(CNContactContentUnitaryViewController *)self contactView];
    char v21 = [v20 labelTextAttributes];
    BOOL v22 = (void *)[v18 initWithString:v19 attributes:v21];

    objc_msgSend(v22, "boundingRectWithSize:options:context:", 3, 0, v17, 10000.0);
    double v23 = CGRectGetWidth(v40);
    if (v12 < v23) {
      int v24 = 1;
    }
    else {
      int v24 = v7;
    }
    if (!v24) {
      double v23 = v12;
    }
    if (v23 >= v17) {
      double v23 = v17;
    }
    double v25 = ceil(v23);
    uint64_t v26 = [v6 group];
    uint64_t v27 = [(CNContactContentUnitaryViewController *)self _labelWidthKeyForGroup:v26];
    BOOL v28 = [(CNContactContentUnitaryViewController *)self _labelWidthKeyForItem:v6];
    id v29 = [(CNContactContentUnitaryViewController *)self cachedLabelWidths];
    int64_t v30 = [v29 objectForKey:v27];
    [v30 floatValue];
    float v32 = v31;

    if (v25 > 0.0)
    {
      double v33 = [(CNContactContentUnitaryViewController *)self cachedLabelWidths];
      double v34 = [NSNumber numberWithDouble:v25];
      [v33 setObject:v34 forKey:v28];

      if (v25 > v32)
      {
        double v35 = [(CNContactContentUnitaryViewController *)self cachedLabelWidths];
        long long v36 = [NSNumber numberWithDouble:v25];
        [v35 setObject:v36 forKey:v27];
      }
    }
  }
}

- (id)_labelWidthKeyForItem:(id)a3
{
  id v3 = a3;

  return v3;
}

- (id)_labelWidthKeyForGroup:(id)a3
{
  id v3 = (__CFString *)a3;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(__CFString *)v3 property];
    if ([v5 isEqualToString:*MEMORY[0x1E4F1AF90]])
    {
    }
    else
    {
      id v6 = [(__CFString *)v3 property];
      int v7 = [v6 isEqualToString:*MEMORY[0x1E4F1ADA0]];

      id v4 = v3;
      if (!v7) {
        goto LABEL_6;
      }
    }

    id v4 = @"alerts";
  }
LABEL_6:

  return v4;
}

- (void)removePersonHeaderViewControllerFromHierarchy
{
  id v3 = [(CNContactContentUnitaryViewController *)self personHeaderViewController];
  id v4 = [v3 parentViewController];

  if (v4)
  {
    uint64_t v5 = [(CNContactContentUnitaryViewController *)self personHeaderViewController];
    [v5 willMoveToParentViewController:0];

    id v6 = [(CNContactContentUnitaryViewController *)self personHeaderViewController];
    int v7 = [v6 isViewLoaded];

    if (v7)
    {
      uint64_t v8 = [(CNContactContentUnitaryViewController *)self personHeaderViewController];
      long long v9 = [v8 view];
      [v9 removeFromSuperview];
    }
    id v10 = [(CNContactContentUnitaryViewController *)self personHeaderViewController];
    [v10 removeFromParentViewController];
  }
}

- (unint64_t)tableViewSectionIndexFromGroupIndex:(unint64_t)a3 forTableView:(id)a4
{
  return [(CNContactContentUnitaryViewController *)self additionalTopSectionsCountForTableView:a4]+ a3;
}

- (unint64_t)groupIndexFromTableViewSectionIndex:(unint64_t)a3 forTableView:(id)a4
{
  return a3
       - [(CNContactContentUnitaryViewController *)self additionalTopSectionsCountForTableView:a4];
}

- (BOOL)isPersonHeaderIndexPath:(id)a3 forTableView:(id)a4
{
  id v6 = a4;
  LOBYTE(a3) = -[CNContactContentUnitaryViewController isPersonHeaderSectionForTableView:section:](self, "isPersonHeaderSectionForTableView:section:", v6, [a3 section]);

  return (char)a3;
}

- (id)personHeaderCellForTableView:(id)a3
{
  v64[4] = *MEMORY[0x1E4F143B8];
  id v4 = [a3 dequeueReusableCellWithIdentifier:@"PersonHeaderCellIdentifier"];
  if (!v4)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"PersonHeaderCellIdentifier"];
    [v4 setSelectionStyle:0];
    [v4 setSeparatorStyle:0];
    objc_msgSend(v4, "_cnui_applyContactStyle");
  }
  uint64_t v5 = self;
  id v6 = [(CNContactContentUnitaryViewController *)v5 personHeaderViewController];
  int v7 = [v6 parentViewController];

  if (v7 != v5)
  {
    [(CNContactContentUnitaryViewController *)v5 removePersonHeaderViewControllerFromHierarchy];
    uint64_t v8 = [(CNContactContentUnitaryViewController *)v5 personHeaderViewController];
    [(CNContactContentUnitaryViewController *)v5 addChildViewController:v8];

    long long v9 = [(CNContactContentUnitaryViewController *)v5 personHeaderViewController];
    id v10 = [v9 view];

    double v11 = [v4 contentView];
    [v11 addSubview:v10];

    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v12 = [v4 contentView];
    unint64_t v13 = [v12 layoutMarginsGuide];

    uint64_t v14 = [(CNContactContentUnitaryViewController *)v5 personHeaderViewDelegate];
    double v61 = v13;
    uint64_t v62 = v10;
    if (v14
      && (id v15 = (void *)v14,
          [(CNContactContentUnitaryViewController *)v5 personHeaderViewDelegate],
          double v16 = objc_claimAutoreleasedReturnValue(),
          char v17 = objc_opt_respondsToSelector(),
          v16,
          v15,
          (v17 & 1) != 0))
    {
      id v18 = [(CNContactContentUnitaryViewController *)v5 personHeaderViewDelegate];
      id v19 = [(CNContactContentUnitaryViewController *)v5 personHeaderViewController];
      [v18 contentInsetsForCustomHeaderViewController:v19];
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;

      double v51 = (void *)MEMORY[0x1E4F28DC8];
      uint64_t v50 = [v10 topAnchor];
      int v60 = [v4 contentView];
      v59 = [v60 topAnchor];
      int v58 = objc_msgSend(v50, "constraintEqualToAnchor:constant:", v21);
      v64[0] = v58;
      BOOL v28 = [v10 bottomAnchor];
      double v56 = [v4 contentView];
      [v56 bottomAnchor];
      double v55 = v57 = v28;
      uint64_t v54 = objc_msgSend(v28, "constraintEqualToAnchor:constant:", -v25);
      v64[1] = v54;
      id v29 = [v10 leadingAnchor];
      int64_t v30 = [v4 contentView];
      float v31 = [v30 leadingAnchor];
      double v53 = v29;
      float v32 = [v29 constraintEqualToAnchor:v31 constant:v23];
      v64[2] = v32;
      double v33 = [v10 trailingAnchor];
      double v34 = [v4 contentView];
      double v35 = [v34 trailingAnchor];
      long long v36 = [v33 constraintEqualToAnchor:v35 constant:-v27];
      v64[3] = v36;
      id v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:4];
      [v51 activateConstraints:v37];

      long long v38 = v50;
    }
    else
    {
      double v52 = (void *)MEMORY[0x1E4F28DC8];
      long long v38 = [v10 topAnchor];
      int v60 = [v4 contentView];
      v59 = [v60 topAnchor];
      int v58 = objc_msgSend(v38, "constraintEqualToAnchor:");
      v63[0] = v58;
      CGRect v39 = [v10 bottomAnchor];
      double v56 = [v4 contentView];
      [v56 bottomAnchor];
      double v55 = v57 = v39;
      uint64_t v54 = objc_msgSend(v39, "constraintEqualToAnchor:");
      v63[1] = v54;
      CGRect v40 = [v10 leadingAnchor];
      int64_t v30 = [v13 leadingAnchor];
      double v53 = v40;
      float v31 = [v40 constraintEqualToAnchor:v30];
      v63[2] = v31;
      float v32 = [v10 trailingAnchor];
      double v33 = [v13 trailingAnchor];
      double v34 = [v32 constraintEqualToAnchor:v33];
      v63[3] = v34;
      double v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:4];
      [v52 activateConstraints:v35];
    }

    uint64_t v41 = [(CNContactContentUnitaryViewController *)v5 personHeaderViewDelegate];
    if (v41)
    {
      uint64_t v42 = (void *)v41;
      long long v43 = [(CNContactContentUnitaryViewController *)v5 personHeaderViewDelegate];
      char v44 = objc_opt_respondsToSelector();

      if (v44)
      {
        long long v45 = [(CNContactContentUnitaryViewController *)v5 personHeaderViewDelegate];
        long long v46 = [(CNContactContentUnitaryViewController *)v5 personHeaderViewController];
        int v47 = [v45 backgroundColorForCustomHeaderViewController:v46];

        if (v47)
        {
          uint64_t v48 = [v4 contentView];
          [v48 setBackgroundColor:v47];

          [v4 setBackgroundColor:v47];
        }
      }
    }
  }

  return v4;
}

- (BOOL)isPersonHeaderSectionForTableView:(id)a3 section:(int64_t)a4
{
  id v6 = a3;
  if ([(CNContactContentUnitaryViewController *)self hasPersonHeaderSectionForTableView:v6])
  {
    if ([(CNContactContentUnitaryViewController *)self hasSharedProfileBannerSectionForTableView:v6])
    {
      BOOL v7 = a4 == 1;
    }
    else
    {
      BOOL v7 = a4 == 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)hasPersonHeaderSectionForTableView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNContactContentUnitaryViewController *)self personHeaderViewController];
  if (v5)
  {
    id v6 = [(CNContactContentUnitaryViewController *)self displayContactView];
    BOOL v7 = v6 == v4;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)presentAvatarPosterEditor
{
  id v3 = [(CNContactContentUnitaryViewController *)self editingHeaderView];
  objc_msgSend(v3, "editButtonTappedWhileEditing:", -[CNContactContentUnitaryViewController isEditing](self, "isEditing"));

  dispatch_time_t v4 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__CNContactContentUnitaryViewController_presentAvatarPosterEditor__block_invoke;
  block[3] = &unk_1E549B488;
  void block[4] = self;
  dispatch_after(v4, MEMORY[0x1E4F14428], block);
}

uint64_t __66__CNContactContentUnitaryViewController_presentAvatarPosterEditor__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setEditing:1 animated:0];
}

- (void)sharedProfileBannerView:(id)a3 didDismissWithUpdatedContact:(id)a4 forAction:(unint64_t)a5
{
  id v7 = a4;
  uint64_t v8 = [(CNContactContentUnitaryViewController *)self displayContactView];
  BOOL v9 = [(CNContactContentUnitaryViewController *)self hasSharedProfileBannerSectionForTableView:v8];

  [(CNContactContentUnitaryViewController *)self setTappedSharedProfileBannerAction:0];
  [(CNContactContentUnitaryViewController *)self setDismissedSharedProfileBannerAction:a5];
  id v10 = [(CNContactContentUnitaryViewController *)self displayContactView];
  BOOL v11 = [(CNContactContentUnitaryViewController *)self hasSharedProfileBannerSectionForTableView:v10];

  if (v9 && !v11)
  {
    double v12 = [(CNContactContentUnitaryViewController *)self contactView];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __104__CNContactContentUnitaryViewController_sharedProfileBannerView_didDismissWithUpdatedContact_forAction___block_invoke;
    v15[3] = &unk_1E549B488;
    v15[4] = self;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __104__CNContactContentUnitaryViewController_sharedProfileBannerView_didDismissWithUpdatedContact_forAction___block_invoke_2;
    v13[3] = &unk_1E549B7D8;
    void v13[4] = self;
    id v14 = v7;
    [v12 performBatchUpdates:v15 completion:v13];
  }
}

void __104__CNContactContentUnitaryViewController_sharedProfileBannerView_didDismissWithUpdatedContact_forAction___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contactView];
  v1 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
  [v2 deleteSections:v1 withRowAnimation:2];
}

uint64_t __104__CNContactContentUnitaryViewController_sharedProfileBannerView_didDismissWithUpdatedContact_forAction___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setContact:*(void *)(a1 + 40) shouldScrollToTop:0];
}

- (void)sharedProfileBannerView:(id)a3 didUpdateContact:(id)a4 forAction:(unint64_t)a5
{
  id v7 = a4;
  [(CNContactContentUnitaryViewController *)self setTappedSharedProfileBannerAction:a5];
  [(CNContactContentUnitaryViewController *)self setDismissedSharedProfileBannerAction:0];
  [(CNContactContentUnitaryViewController *)self setContact:v7];
}

- (unint64_t)bannerActionTypeForEffectiveState
{
  return self->_bannerActionTypeForEffectiveState;
}

void *__74__CNContactContentUnitaryViewController_bannerActionTypeForEffectiveState__block_invoke(uint64_t a1)
{
  CGSize result = *(void **)(a1 + 32);
  if (!result[266]) {
    return (id)[result setupSharedProfileStateOracle];
  }
  return result;
}

- (id)setupSharedProfileStateOracle
{
  id v3 = objc_alloc(MEMORY[0x1E4F1BAB8]);
  dispatch_time_t v4 = [(CNContactContentUnitaryViewController *)self contact];
  uint64_t v5 = [(CNContactContentUnitaryViewController *)self contactStore];
  id v6 = (CNSharedProfileStateOracle *)[v3 initWithContact:v4 contactStore:v5];
  sharedProfileStateOracle = self->_sharedProfileStateOracle;
  self->_sharedProfileStateOracle = v6;

  if ([(CNContactContentUnitaryViewController *)self shouldShowSharedProfileBanner]) {
    self->_bannerActionTypeForEffectiveState = [(CNSharedProfileStateOracle *)self->_sharedProfileStateOracle bannerActionTypeForEffectiveState];
  }
  uint64_t v8 = self->_sharedProfileStateOracle;

  return v8;
}

- (CNSharedProfileStateOracle)sharedProfileStateOracle
{
  id v2 = cn_objectResultWithObjectLock();

  return (CNSharedProfileStateOracle *)v2;
}

uint64_t __65__CNContactContentUnitaryViewController_sharedProfileStateOracle__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setupSharedProfileStateOracle];
}

- (id)sharedProfileBannerSectionCellForTableView:(id)a3
{
  dispatch_time_t v4 = [(CNContactContentUnitaryViewController *)self contactView];
  uint64_t v5 = +[CNContactView cellIdentifierForSharedProfileBanner];
  id v6 = [v4 dequeueReusableCellWithIdentifier:v5];

  [v6 setSelectionStyle:0];
  [v6 setSeparatorStyle:0];
  objc_msgSend(v6, "_cnui_applyContactStyle");
  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  [v9 setDelegate:self];
  [(CNContactContentUnitaryViewController *)self prepareCell:v9];
  id v10 = [(CNContactContentUnitaryViewController *)self sharedProfileStateOracle];
  objc_msgSend(v9, "setUpWithSharedProfileStateOracle:tappedAction:hasPerformedAnimation:", v10, -[CNContactContentUnitaryViewController tappedSharedProfileBannerAction](self, "tappedSharedProfileBannerAction"), -[CNContactContentUnitaryViewController hasPerformedSharedProfileBannerAnimation](self, "hasPerformedSharedProfileBannerAnimation"));

  [(CNContactContentUnitaryViewController *)self setHasPerformedSharedProfileBannerAnimation:1];

  return v7;
}

- (BOOL)isSharedProfileBannerSectionIndexPath:(id)a3 forTableView:(id)a4
{
  id v6 = a4;
  LOBYTE(a3) = -[CNContactContentUnitaryViewController isSharedProfileBannerSectionForTableView:section:](self, "isSharedProfileBannerSectionForTableView:section:", v6, [a3 section]);

  return (char)a3;
}

- (BOOL)isSharedProfileBannerSectionForTableView:(id)a3 section:(int64_t)a4
{
  BOOL result = [(CNContactContentUnitaryViewController *)self hasSharedProfileBannerSectionForTableView:a3];
  if (a4) {
    return 0;
  }
  return result;
}

- (BOOL)hasSharedProfileBannerSectionForTableView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v6 = [v5 featureFlags];
  int v7 = [v6 isFeatureEnabled:15];

  if (v7
    && [(CNContactContentUnitaryViewController *)self shouldShowSharedProfileBanner]
    && ([(CNContactContentUnitaryViewController *)self displayContactView],
        id v8 = (id)objc_claimAutoreleasedReturnValue(),
        v8,
        v8 == v4)
    && ![(CNContactContentUnitaryViewController *)self dismissedSharedProfileBannerAction])
  {
    unint64_t v11 = [(CNContactContentUnitaryViewController *)self bannerActionTypeForEffectiveState];
    BOOL v9 = (v11 | [(CNContactContentUnitaryViewController *)self tappedSharedProfileBannerAction]) != 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)setShouldShowSharedProfileBanner:(BOOL)a3
{
  if (self->_shouldShowSharedProfileBanner != a3)
  {
    self->_shouldShowSharedProfileBanner = a3;
    id v3 = [(CNContactContentUnitaryViewController *)self contactView];
    [v3 reloadData];
  }
}

- (BOOL)shouldShowSharedProfileRow
{
  if (![(CNContactContentUnitaryViewController *)self showsSharedProfile]) {
    return 0;
  }
  id v3 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v4 = [v3 featureFlags];
  int v5 = [v4 isFeatureEnabled:15];

  if (!v5 || [(CNContactContentUnitaryViewController *)self mode] == 2) {
    return 0;
  }

  return [(CNContactContentUnitaryViewController *)self showContactPhotoPosterCell];
}

- (int64_t)additionalTopSectionsCountForTableView:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CNContactContentUnitaryViewController *)self hasSharedProfileBannerSectionForTableView:v4];
  LODWORD(self) = [(CNContactContentUnitaryViewController *)self hasPersonHeaderSectionForTableView:v4];

  return self + (unint64_t)v5;
}

- (void)geminiDataSourceDidUpdate:(id)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 geminiResult];
  id v6 = [(CNContactContentUnitaryViewController *)self cardEditingGeminiGroup];
  int v7 = [v6 editingItems];
  id v8 = [v7 firstObject];

  [v8 geminiDataSourceDidUpdate:v4];
  BOOL v9 = [(CNContactContentUnitaryViewController *)self indexPathOfEditingPropertyItem:v8];
  BOOL v10 = [(CNContactContentUnitaryViewController *)self shouldShowGemini];
  if ([(CNContactContentUnitaryViewController *)self shouldUseStaticHeader])
  {
    unint64_t v11 = [(CNContactContentUnitaryViewController *)self staticDisplayHeaderView];
    [v11 updateGeminiResult:v5];

    [(CNContactContentUnitaryViewController *)self staticDisplayHeaderView];
  }
  else
  {
    double v12 = [(CNContactContentUnitaryViewController *)self displayHeaderView];
    [v12 updateGeminiResult:v5];

    [(CNContactContentUnitaryViewController *)self displayHeaderView];
  unint64_t v13 = };
  [v13 setShouldShowGemini:v10];

  id v14 = [(CNContactContentUnitaryViewController *)self cardEditingGeminiGroup];
  [v14 setGeminiResult:v5];

  id v15 = [(CNContactContentUnitaryViewController *)self cardEditingGeminiGroup];
  [v15 setShouldShowGemini:v10];

  double v16 = [(CNContactContentUnitaryViewController *)self editingContactView];
  uint64_t v17 = [(CNContactContentUnitaryViewController *)self cardEditingGeminiGroup];
  if (v17)
  {
    id v18 = (void *)v17;
    int v19 = [(CNContactContentUnitaryViewController *)self isEditing];

    if (v19)
    {
      if (v9)
      {
        if (v10)
        {
          v28[0] = v9;
          double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
          [v16 reloadRowsAtIndexPaths:v20 withRowAnimation:100];
        }
        else
        {
          double v25 = [(CNContactContentUnitaryViewController *)self cardEditingGeminiGroup];
          int64_t v26 = [(CNContactContentUnitaryViewController *)self sectionOfGroup:v25 inTableView:v16];

          double v27 = [(CNContactContentUnitaryViewController *)self editingGroups];
          [v27 removeObjectAtIndex:v26];

          double v20 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(v9, "indexAtPosition:", 0));
          [v16 deleteSections:v20 withRowAnimation:3];
        }
        goto LABEL_13;
      }
      if (v10)
      {
        double v21 = [(CNContactContentUnitaryViewController *)self editingGroups];
        double v22 = [(CNContactContentUnitaryViewController *)self cardEditingGeminiGroup];
        [v21 insertObject:v22 atIndex:0];

        double v23 = [(CNContactContentUnitaryViewController *)self cardEditingGeminiGroup];
        int64_t v24 = [(CNContactContentUnitaryViewController *)self sectionOfGroup:v23 inTableView:v16];

        if (v24 != 0x7FFFFFFFFFFFFFFFLL)
        {
          double v20 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v24];
          [v16 insertSections:v20 withRowAnimation:3];
LABEL_13:
        }
      }
    }
  }
}

- (void)setMenuProviderForCell:(id)a3 forActionGroupItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    goto LABEL_4;
  }
  id v8 = [(CNContactContentUnitaryViewController *)self cardShareLocationGroup];
  BOOL v9 = [v8 actions];
  BOOL v10 = [v7 actions];
  int v11 = [v9 isEqualToArray:v10];

  if (!v11)
  {
LABEL_4:
    unint64_t v13 = [(CNContactContentUnitaryViewController *)self cardGameCenterActionGroup];
    id v14 = [v13 actions];
    id v15 = [v7 actions];
    if ([v14 isEqualToArray:v15])
    {
      double v16 = [(CNContactContentUnitaryViewController *)self gameCenterManager];
      int v17 = [v16 shouldActionDisplayDropdownMenu];

      if (v17)
      {
        id v18 = [v7 actions];
        id v19 = [v18 firstObject];

        double v20 = [v19 target];

        if (!v20)
        {
LABEL_22:

          goto LABEL_23;
        }
        double v21 = [v19 target];
        id v22 = [v21 addFriendsMenuProvider];

        if (v22) {
          [v6 setMenuProvider:v22];
        }
LABEL_21:

        goto LABEL_22;
      }
    }
    else
    {
    }
    double v23 = [v7 actions];
    int64_t v24 = [v23 firstObject];

    objc_opt_class();
    id v19 = v24;
    if (objc_opt_isKindOfClass()) {
      double v25 = v19;
    }
    else {
      double v25 = 0;
    }
    id v22 = v25;

    if (v22)
    {
      id v26 = [v22 menuProvider];
      [v6 setMenuProvider:v26];
    }
    else
    {
      double v27 = [v19 target];
      if ([v27 conformsToProtocol:&unk_1ED94A278]) {
        BOOL v28 = v27;
      }
      else {
        BOOL v28 = 0;
      }
      id v26 = v28;

      if (v26)
      {
        id v29 = [v6 contextMenuInteraction];
        int64_t v30 = [v26 menuProviderForContextMenuInteraction:v29];
        [v6 setMenuProvider:v30];
      }
    }

    goto LABEL_21;
  }
  double v12 = [(CNContactContentUnitaryViewController *)self shareLocationController];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __83__CNContactContentUnitaryViewController_setMenuProviderForCell_forActionGroupItem___block_invoke;
  v31[3] = &unk_1E549B788;
  id v32 = v6;
  [v12 actionsMenuProviderWithCompletion:v31];

LABEL_23:
}

void __83__CNContactContentUnitaryViewController_setMenuProviderForCell_forActionGroupItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __83__CNContactContentUnitaryViewController_setMenuProviderForCell_forActionGroupItem___block_invoke_2;
  v5[3] = &unk_1E549B710;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __83__CNContactContentUnitaryViewController_setMenuProviderForCell_forActionGroupItem___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMenuProvider:*(void *)(a1 + 40)];
}

- (id)_cellForIndexPath:(id)a3 forTableView:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = [(CNContactContentUnitaryViewController *)self _itemAtIndexPath:v7 forTableView:v8];
  BOOL v10 = [(CNContactContentUnitaryViewController *)self _cellIdentifierForTableView:v8 indexPath:v7];
  uint64_t v11 = [(CNContactContentUnitaryViewController *)self noteCell];
  if (!v11) {
    goto LABEL_4;
  }
  double v12 = (void *)v11;
  unint64_t v13 = [(CNContactContentUnitaryViewController *)self contactView];
  id v14 = objc_opt_class();
  id v15 = [v14 cellIdentifierForClass:objc_opt_class()];
  int v16 = [v10 isEqualToString:v15];

  if (v16)
  {
    int v17 = [(CNContactContentUnitaryViewController *)self noteCell];
    [(CNContactContentUnitaryViewController *)self setNoteCell:0];
  }
  else
  {
LABEL_4:
    id v18 = [(CNContactContentUnitaryViewController *)self contactView];
    int v17 = [v18 dequeueReusableCellWithIdentifier:v10];
  }
  if (!v17)
  {
    id v71 = [MEMORY[0x1E4F28B00] currentHandler];
    [v71 handleFailureInMethod:a2, self, @"CNContactContentUnitaryViewController.m", 6027, @"We couldn’t create a cell with identifier: %@ indexPath: %@", v10, v7 object file lineNumber description];
  }
  uint64_t v72 = v10;
  if ([(CNContactContentUnitaryViewController *)self mode] == 5)
  {
    objc_opt_class();
    id v19 = v9;
    if (objc_opt_isKindOfClass()) {
      double v20 = v19;
    }
    else {
      double v20 = 0;
    }
    id v21 = v20;

    if (v21)
    {
      id v22 = [(CNContactContentUnitaryViewController *)self highlightedProperties];
      if ([v22 count])
      {
        double v23 = [(CNContactContentUnitaryViewController *)self highlightedProperties];
        int64_t v24 = [v21 contactProperty];
        int v25 = [v23 containsObject:v24];

        if (v25 && (objc_opt_respondsToSelector() & 1) != 0) {
          [v17 setForceSuggested:1];
        }
      }
      else
      {
      }
    }
  }
  if (objc_opt_respondsToSelector()) {
    [v17 setDelegate:self];
  }
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v17, "setShouldShowTransportButtons:", objc_msgSend((id)objc_opt_class(), "enablesTransportButtons"));
  }
  [v17 setCardGroupItem:v9];
  if (objc_opt_respondsToSelector())
  {
    id v26 = [(CNContactContentUnitaryViewController *)self presentingDelegate];
    [v17 setPresentingDelegate:v26];
  }
  if (objc_opt_respondsToSelector())
  {
    id v27 = [(CNContactContentUnitaryViewController *)self displayContactView];
    if (v27 == v8)
    {
      BOOL v28 = [(CNContactContentUnitaryViewController *)self contactView];
      id v29 = objc_opt_class();
      int64_t v30 = [v29 cellIdentifierForClass:objc_opt_class()];
      int v31 = [v72 isEqualToString:v30];

      if (v31)
      {
        if ([(CNContactContentUnitaryViewController *)self allowsEditing]) {
          BOOL v32 = [(CNContactContentUnitaryViewController *)self editRequiresAuthorization] ^ 1;
        }
        else {
          BOOL v32 = 0;
        }
        goto LABEL_31;
      }
    }
    else
    {
    }
    BOOL v32 = [(CNContactContentUnitaryViewController *)self allowsEditing];
LABEL_31:
    [v17 setAllowsEditing:v32];
  }
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v17, "setAllowsActions:", -[CNContactContentUnitaryViewController allowsActions](self, "allowsActions"));
  }
  if (objc_opt_respondsToSelector())
  {
    id v33 = v17;
    objc_msgSend(v33, "setVIP:", -[CNContactContentUnitaryViewController isMailVIP](self, "isMailVIP"));
  }
  double v34 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  double v35 = [v34 featureFlags];
  int v36 = [v35 isFeatureEnabled:11];

  if (v36 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v37 = v17;
    objc_opt_class();
    id v38 = v9;
    if (objc_opt_isKindOfClass()) {
      CGRect v39 = v38;
    }
    else {
      CGRect v39 = 0;
    }
    id v40 = v39;

    uint64_t v41 = [(CNContactContentUnitaryViewController *)self cachedVerifiedHandles];
    if (v41)
    {
      uint64_t v42 = [(CNContactContentUnitaryViewController *)self cachedVerifiedHandles];
      long long v43 = [v40 displayValue];
      objc_msgSend(v37, "setStaticIdentityVerified:", objc_msgSend(v42, "containsObject:", v43));
    }
    else
    {
      [v37 setStaticIdentityVerified:0];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    id v44 = v17;
    long long v45 = [(CNContactContentUnitaryViewController *)self emergencyNumberIdentifier];
    long long v46 = [v44 propertyItem];
    int v47 = [v46 contactProperty];
    uint64_t v48 = [v47 identifier];
    objc_msgSend(v44, "setEmergencyPhoneNumber:", objc_msgSend(v45, "isEqualToString:", v48));
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v49 = v9;
    if (objc_opt_isKindOfClass()) {
      uint64_t v50 = v49;
    }
    else {
      uint64_t v50 = 0;
    }
    id v51 = v50;

    objc_opt_class();
    id v52 = v17;
    if (objc_opt_isKindOfClass()) {
      double v53 = v52;
    }
    else {
      double v53 = 0;
    }
    id v54 = v53;

    [(CNContactContentUnitaryViewController *)self setMenuProviderForCell:v54 forActionGroupItem:v51];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v55 = v17;
    if (objc_opt_isKindOfClass()) {
      double v56 = v55;
    }
    else {
      double v56 = 0;
    }
    id v57 = v56;

    objc_msgSend(v57, "setShowsGameCenterLabel:", objc_msgSend(v7, "row") == 0);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v58 = v9;
    if (objc_opt_isKindOfClass()) {
      v59 = v58;
    }
    else {
      v59 = 0;
    }
    id v60 = v59;

    double v61 = [(CNContactContentUnitaryViewController *)self sharedProfileStateOracle];
    [v60 setSharedProfileStateOracle:v61];

    objc_opt_class();
    id v62 = v17;
    if (objc_opt_isKindOfClass()) {
      v63 = v62;
    }
    else {
      v63 = 0;
    }
    id v64 = v63;

    v65 = [(CNContactContentUnitaryViewController *)self sharedProfileStateOracle];
    [v64 setSharedProfileStateOracle:v65];

    [v64 setActionDelegate:self];
    objc_msgSend(v64, "setAllowsEditing:", -[CNContactContentUnitaryViewController allowsEditing](self, "allowsEditing"));
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v66 = v17;
    if (objc_opt_isKindOfClass()) {
      int v67 = v66;
    }
    else {
      int v67 = 0;
    }
    id v68 = v67;

    v69 = [(CNContactContentUnitaryViewController *)self mutableContactForHeaderView];
    [v68 setMeContact:v69];
  }

  return v17;
}

- (id)_cellIdentifierForTableView:(id)a3 indexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = [(CNContactContentUnitaryViewController *)self _itemAtIndexPath:v8 forTableView:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    if (![(CNContactContentUnitaryViewController *)self isEditing])
    {
      unint64_t v13 = [v10 property];
      id v14 = +[CNContactView cellIdentifierForProperty:v13];

      goto LABEL_19;
    }
    uint64_t v11 = +[CNContactView cellIdentifierForEditingPropertyItem:v10];
LABEL_18:
    id v14 = (void *)v11;
LABEL_19:

    if (v14) {
      goto LABEL_48;
    }
    goto LABEL_51;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = +[CNContactView cellIdentifierForPropertyPlaceholder];
    goto LABEL_47;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    -[CNContactContentUnitaryViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", [v8 section], v7);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if ([v10 useSplitActions])
    {
      uint64_t v11 = +[CNContactView cellIdentifierForSplitActions];
    }
    else
    {
      if ([v10 displaysDropdownMenu]) {
        +[CNContactView cellIdentifierForDropdownMenuActions];
      }
      else {
      uint64_t v11 = +[CNContactView cellIdentifierForActions];
      }
    }
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = +[CNContactView cellIdentifierForFaceTimeGroup];
    goto LABEL_47;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = +[CNContactView cellIdentifierForDefaultAppGroup];
    goto LABEL_47;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([(CNContactContentUnitaryViewController *)self isEditing]) {
      +[CNContactView cellIdentifierForLinkedCardsEditingGroup];
    }
    else {
      +[CNContactView cellIdentifierForLinkedCardsGroup];
    }
    uint64_t v12 = LABEL_24:;
    goto LABEL_47;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = +[CNContactView cellIdentifierForLinkedCardsPlaceholderGroup];
    goto LABEL_47;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([(CNContactContentUnitaryViewController *)self isEditing]) {
      +[CNContactView cellIdentifierForGroupMembershipEditingGroup];
    }
    else {
      +[CNContactView cellIdentifierForGroupMembershipGroup];
    }
    goto LABEL_24;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = +[CNContactView cellIdentifierForGroupMembershipPlaceholderGroup];
    goto LABEL_47;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = +[CNContactView cellIdentifierForStaticIdentityPlaceholderGroup];
    goto LABEL_47;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = +[CNContactView cellIdentifierForStaticIdentityEditingGroup];
    goto LABEL_47;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = +[CNContactView cellIdentifierForGameCenterGroup];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v12 = +[CNContactView cellIdentifierForMeCardSharedProfileGroup];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_51;
        }
        uint64_t v12 = +[CNContactView cellIdentifierForCardNamePickingGroup];
      }
    }
LABEL_47:
    id v14 = (void *)v12;
    if (v12) {
      goto LABEL_48;
    }
    goto LABEL_51;
  }
  if ([(CNContactContentUnitaryViewController *)self isEditing])
  {
    uint64_t v12 = +[CNContactView cellIdentifierForContactContainerEditingGroup];
    goto LABEL_47;
  }
LABEL_51:
  int v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"CNContactContentUnitaryViewController.m", 6004, @"Unknown group item: %@", v9 object file lineNumber description];

  id v14 = 0;
LABEL_48:

  return v14;
}

- (void)_scrollContactView:(id)a3 toVisibleGroup:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v18 = a3;
  id v8 = a4;
  [v18 _effectiveContentInset];
  objc_msgSend(v18, "setContentOffset:", 0.0, -v9);
  if (v8)
  {
    int64_t v10 = [(CNContactContentUnitaryViewController *)self sectionOfGroup:v8 inTableView:v18];
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v11 = v10;
      uint64_t v12 = [v8 displayItems];
      uint64_t v13 = (uint64_t)(double)((unint64_t)[v12 count] >> 1);

      id v14 = [MEMORY[0x1E4F28D58] indexPathForRow:v13 inSection:v11];
      uint64_t v15 = [v18 numberOfSections];
      if (v15 > [v14 section])
      {
        uint64_t v16 = objc_msgSend(v18, "numberOfRowsInSection:", objc_msgSend(v14, "section"));
        if (v16 > [v14 row])
        {
LABEL_7:
          if (!v14) {
            goto LABEL_10;
          }
          [v18 scrollToRowAtIndexPath:v14 atScrollPosition:2 animated:v5];
          goto LABEL_9;
        }
        if (objc_msgSend(v18, "numberOfRowsInSection:", objc_msgSend(v14, "section")) >= 1)
        {
          uint64_t v17 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:v11];

          id v14 = (void *)v17;
          goto LABEL_7;
        }
      }
LABEL_9:
    }
  }
LABEL_10:
}

- (id)_currentTopVisibleGroupInContactView:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 contentOffset];
  double v6 = v5;
  id v7 = [v4 tableHeaderView];
  [v7 bounds];
  double v9 = v8;
  [v4 estimatedRowHeight];
  double v11 = v9 - v10;

  if (v6 <= v11)
  {
LABEL_14:
    id v18 = 0;
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v12 = objc_msgSend(v4, "visibleCells", 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
LABEL_4:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v23 + 1) + 8 * v16);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        if (v14 == ++v16)
        {
          uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v14) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v19 = v17;

      if (!v19) {
        goto LABEL_14;
      }
      double v20 = [v19 propertyItem];
      id v21 = [v20 property];
      id v18 = [(CNContactContentUnitaryViewController *)self cardGroupForProperty:v21];

      uint64_t v12 = v19;
    }
    else
    {
LABEL_10:
      id v18 = 0;
    }
  }

  return v18;
}

- (BOOL)needsReload
{
  return self->_needsReload;
}

- (BOOL)reloadDataIfNeeded
{
  if (!self->_needsReload || self->_animating) {
    return 0;
  }
  [(CNContactContentUnitaryViewController *)self reloadDataPreservingChanges:0];
  return 1;
}

- (void)setNeedsReloadLazy
{
  self->_needsReload = 1;
}

- (void)setNeedsReload
{
  self->_needsReload = 1;
  [(CNContactContentUnitaryViewController *)self performSelector:sel_reloadDataIfNeeded withObject:0 afterDelay:0.0];
}

- (BOOL)isSuggestedContact
{
  id v2 = [(CNContactContentUnitaryViewController *)self contact];
  char v3 = [v2 isSuggested];

  return v3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return ![(CNContactContentUnitaryViewController *)self hasPendingChanges];
}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContact:(id)a4 propertyKey:(id)a5 propertyIdentifier:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [(CNContactContentUnitaryViewController *)self contactDelegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    uint64_t v14 = [(CNContactContentUnitaryViewController *)self contactDelegate];
    char v15 = [v14 contactViewController:self shouldPerformDefaultActionForContact:v9 propertyKey:v10 propertyIdentifier:v11];
  }
  else
  {
    char v15 = 1;
  }
  uint64_t v16 = [(CNContactContentUnitaryViewController *)self delegate];
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    uint64_t v18 = [(CNContactContentUnitaryViewController *)self _removeUnauthorizedKeysFromContact:v9];

    id v19 = [(CNContactContentUnitaryViewController *)self delegate];
    char v15 = [v19 shouldPerformDefaultActionForContact:v18 propertyKey:v10 propertyIdentifier:v11];

    id v9 = (id)v18;
  }

  return v15;
}

- (void)contactViewController:(id)a3 didDeleteContact:(id)a4
{
  id v15 = a4;
  double v5 = [(CNContactContentUnitaryViewController *)self contact];
  double v6 = [v5 mainStoreLinkedContacts];
  int v7 = [v6 containsObject:v15];

  if (v7)
  {
    [(CNContactContentUnitaryViewController *)self removeLinkedContact:v15];
    double v8 = [(CNContactContentUnitaryViewController *)self saveLinkedContactsExecutor];
    id v9 = [(CNContactContentUnitaryViewController *)self saveDescriptionForCurrentState];
    id v10 = [v8 executeSaveWithConfiguration:v9 saveDelegate:self];

    [(CNContactContentUnitaryViewController *)self setEditingLinkedContacts:0];
    id v11 = [(CNContactContentUnitaryViewController *)self issuedSaveRequestIdentifiers];
    uint64_t v12 = [v10 identifiersOfIssuedSaveRequests];
    [v11 addObjectsFromArray:v12];

    char v13 = [v10 contact];

    if (v13)
    {
      uint64_t v14 = [v10 contact];
      [(CNContactContentUnitaryViewController *)self setContact:v14];
    }
  }

  MEMORY[0x1F4181820]();
}

- (BOOL)shouldShowActionsForAvatarView:(id)a3
{
  return [(CNContactContentUnitaryViewController *)self isEditing] ^ 1;
}

- (void)_pickName
{
}

- (void)headerViewDidTapNameLabel:(id)a3
{
  if (([(CNContactContentUnitaryViewController *)self isEditing] & 1) == 0
    && [(CNContactContentUnitaryViewController *)self allowsNamePicking])
  {
    [(CNContactContentUnitaryViewController *)self _pickName];
  }
}

- (void)headerView:(id)a3 didSetNameLabelColor:(id)a4
{
  double v8 = (CNContactHeaderCollapsedView *)a3;
  id v6 = a4;
  if ((CNContactHeaderCollapsedView *)self->_staticDisplayHeaderView == v8)
  {
    int v7 = &OBJC_IVAR___CNContactContentUnitaryViewController__actionsViewController;
  }
  else
  {
    if (self->_displayFloatingCollapsedHeaderView != v8) {
      goto LABEL_6;
    }
    int v7 = &OBJC_IVAR___CNContactContentUnitaryViewController__floatingActionsViewController;
  }
  [*(id *)((char *)&self->super.super.super.super.isa + *v7) setPosterTintColor:v6];
LABEL_6:
}

- (void)headerView:(id)a3 didSetBackgroundAsGradientColors:(id)a4
{
  id v6 = a4;
  if (self->_staticDisplayHeaderView == a3)
  {
    id v7 = v6;
    [(CNContactContentUnitaryViewController *)self setHeaderViewBackgroundColors:v6];
    if ([(CNContactContentUnitaryViewController *)self shouldSetBackgroundColorToMatchHeader])
    {
      [(CNContactContentUnitaryViewController *)self setContactViewBackgroundToMatchHeader];
    }
    else
    {
      [(CNContactHeaderCollapsedView *)self->_displayFloatingCollapsedHeaderView updateBackgroundWithGradientColors:v7 horizontal:0];
    }
    id v6 = v7;
  }
}

- (void)headerView:(id)a3 didSetBackgroundAsPosterSnapshotImage:(id)a4
{
  if (self->_staticDisplayHeaderView == a3) {
    [(CNContactHeaderCollapsedView *)self->_displayFloatingCollapsedHeaderView updateBackgroundWithPosterSnapshotImage:a4];
  }
}

- (BOOL)isPadCompactHorizontalSize
{
  id v2 = [(CNContactContentUnitaryViewController *)self traitCollection];
  uint64_t v3 = [v2 horizontalSizeClass];

  id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  return v5 == 1 && v3 == 1;
}

- (BOOL)isPadRegularHorizontalSize
{
  id v2 = [(CNContactContentUnitaryViewController *)self traitCollection];
  uint64_t v3 = [v2 horizontalSizeClass];

  id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  return v5 == 1 && v3 != 1;
}

- (BOOL)isOrientationPhoneLandscape
{
  uint64_t v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  unint64_t v5 = [(CNContactContentUnitaryViewController *)self interfaceOrientation] - 3;
  if (v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5 >= 2;
  }
  return !v6;
}

- (BOOL)isHeaderViewContactBlocked:(id)a3
{
  uint64_t v4 = [(CNContactContentUnitaryViewController *)self blockAction];

  if (!v4)
  {
    unint64_t v5 = [CNContactToggleBlockCallerAction alloc];
    BOOL v6 = [(CNContactContentUnitaryViewController *)self contact];
    id v7 = [(CNContactAction *)v5 initWithContact:v6];
    [(CNContactContentUnitaryViewController *)self setBlockAction:v7];

    double v8 = [(CNContactContentUnitaryViewController *)self blockAction];
    [v8 setDelegate:self];
  }
  id v9 = [(CNContactContentUnitaryViewController *)self blockAction];
  char v10 = [v9 isContactBlockedPreservingChanges:1];

  return v10 ^ 1;
}

- (void)headerView:(id)a3 didRequestToBlockContact:(BOOL)a4
{
  unint64_t v5 = [(CNContactContentUnitaryViewController *)self blockAction];

  if (!v5)
  {
    BOOL v6 = [CNContactToggleBlockCallerAction alloc];
    id v7 = [(CNContactContentUnitaryViewController *)self contact];
    double v8 = [(CNContactAction *)v6 initWithContact:v7];
    [(CNContactContentUnitaryViewController *)self setBlockAction:v8];

    id v9 = [(CNContactContentUnitaryViewController *)self blockAction];
    [v9 setDelegate:self];
  }
  id v10 = [(CNContactContentUnitaryViewController *)self blockAction];
  [v10 performActionWithSender:self];
}

- (void)headerView:(id)a3 didUpdateSensitiveContentOverride:(BOOL)a4
{
  if (a4) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2;
  }
  BOOL v6 = [(CNContactContentUnitaryViewController *)self contact];
  id v7 = [v6 sensitiveContentConfiguration];
  uint64_t v8 = [v7 override];

  if (v8 != v5)
  {
    id v9 = [(CNContactContentUnitaryViewController *)self contact];
    id v17 = (id)[v9 mutableCopy];

    id v10 = [v17 sensitiveContentConfiguration];

    if (v10)
    {
      id v11 = [v17 sensitiveContentConfiguration];
      uint64_t v12 = [v11 updatedWithOverride:v5];
      [v17 setSensitiveContentConfiguration:v12];
    }
    else
    {
      id v11 = [MEMORY[0x1E4F1BAB0] configurationWithOverride:v5];
      [v17 setSensitiveContentConfiguration:v11];
    }

    id v13 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
    objc_msgSend(v13, "setIgnoresGuardianRestrictions:", -[CNContactContentUnitaryViewController saveWasAuthorized](self, "saveWasAuthorized"));
    uint64_t v14 = [(CNContactContentUnitaryViewController *)self issuedSaveRequestIdentifiers];
    id v15 = [v13 saveRequestIdentifier];
    [v14 addObject:v15];

    [v13 updateContact:v17];
    uint64_t v16 = [(CNContactContentUnitaryViewController *)self contactStore];
    [v16 executeSaveRequest:v13 error:0];

    [(CNContactContentUnitaryViewController *)self setContact:v17];
  }
}

- (BOOL)headerViewShouldCacheContactBackgroundColor:(id)a3
{
  return [(CNContactContentUnitaryViewController *)self mode] == 1;
}

- (double)navigationBarHeight
{
  id v2 = [(CNContactContentUnitaryViewController *)self currentNavigationController];
  uint64_t v3 = [v2 navigationBar];
  [v3 frame];
  double v5 = v4;

  return v5;
}

- (UIEdgeInsets)headerViewSafeAreaInsets
{
  uint64_t v3 = [(CNContactContentUnitaryViewController *)self view];
  [v3 safeAreaInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  [(CNContactContentUnitaryViewController *)self navigationBarHeight];
  double v11 = v5 - v10;
  double v12 = 0.0;
  double v13 = v7;
  double v14 = v9;
  result.CGFloat right = v14;
  result.double bottom = v12;
  result.CGFloat left = v13;
  result.double top = v11;
  return result;
}

- (void)headerViewDidChangeHeight:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactContentUnitaryViewController *)self contactHeaderView];

  if (v5 == v4)
  {
    [(CNContactContentUnitaryViewController *)self setupViewHierarchyAndConstraints];
  }
}

- (BOOL)isNicknameProhibited
{
  id v2 = [(CNContactContentUnitaryViewController *)self prohibitedPropertyKeys];
  char v3 = [v2 containsObject:*MEMORY[0x1E4F1AEC0]];

  return v3;
}

- (void)requestFavoritesUpdateWithGemini
{
  char v3 = [(CNContactContentUnitaryViewController *)self environment];
  id v4 = [v3 inProcessFavorites];
  id v5 = [(CNContactContentUnitaryViewController *)self contact];
  double v6 = [v4 entriesForContact:v5];

  if (v6)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.contacts.clientDidDisplayFavorites", 0, 0, 0);
  }
}

- (void)headerViewDidPickPreferredChannel:(id)a3
{
  id v14 = a3;
  id v4 = [(CNContactContentUnitaryViewController *)self contact];
  id v5 = [v4 preferredChannel];
  char v6 = [v5 isEqualToString:v14];

  if ((v6 & 1) == 0)
  {
    double v7 = [(CNContactContentUnitaryViewController *)self contact];
    double v8 = (void *)[v7 mutableCopy];

    [v8 setPreferredChannel:v14];
    id v9 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
    objc_msgSend(v9, "setIgnoresGuardianRestrictions:", -[CNContactContentUnitaryViewController saveWasAuthorized](self, "saveWasAuthorized"));
    double v10 = [(CNContactContentUnitaryViewController *)self issuedSaveRequestIdentifiers];
    double v11 = [v9 saveRequestIdentifier];
    [v10 addObject:v11];

    [v9 updateContact:v8];
    double v12 = [(CNContactContentUnitaryViewController *)self contactStore];
    [v12 executeSaveRequest:v9 error:0];

    [(CNContactContentUnitaryViewController *)self setContact:v8];
    [(CNContactContentUnitaryViewController *)self requestFavoritesUpdateWithGemini];
    double v13 = [(CNContactContentUnitaryViewController *)self displayContactView];
    [(CNContactContentUnitaryViewController *)self updateInsetsIfNeededForTableView:v13 isEditing:0];
  }
}

- (void)headerView:(id)a3 didAcceptDropOfImageData:(id)a4
{
  id v5 = a4;
  if (([(CNContactContentUnitaryViewController *)self isEditing] & 1) == 0) {
    [(CNContactContentUnitaryViewController *)self toggleEditing];
  }
  [(CNContactHeaderEditView *)self->_editingHeaderView presentAvatarPickerWithImageData:v5];
}

- (void)headerPhotoDidUpdate
{
  [(CNContactContentUnitaryViewController *)self updateDoneButton];
  [(CNContactHeaderEditView *)self->_editingHeaderView updateEditButtonTitle];
  if ([(CNContactContentUnitaryViewController *)self isEditing])
  {
    id v3 = [(CNContactContentUnitaryViewController *)self editingContactView];
    [(CNContactContentUnitaryViewController *)self scrollScrollViewAllTheWayUp:v3];
  }
}

- (void)contactGroupPickerDidFinish:(id)a3 withGroup:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  double v7 = [(CNContactContentUnitaryViewController *)self presentingDelegate];
  [v7 sender:self dismissViewController:v6];

  [(CNContactContentUnitaryViewController *)self _addedGroupWithName:v8];
}

- (void)contactGroupPickerDidCancel:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactContentUnitaryViewController *)self presentingDelegate];
  [v5 sender:self dismissViewController:v4];
}

- (id)alreadyPickedGroups
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(CNContactContentUnitaryViewController *)self editingGroups];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
        }
        double v10 = [v9 property];
        [v3 addObject:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_phoneticNameForValue:(id)a3 currentPhoneticName:(id)a4 property:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_msgSend(v8, "cnui_stringByTransliteratingToPhoneticCharactersForProperty:", a5);
  double v10 = objc_msgSend(v9, "_cn_trimmedString");
  double v11 = objc_msgSend(v8, "_cn_trimmedString");

  int v12 = [v10 isEqualToString:v11];
  uint64_t v13 = [v7 length];

  if (v13)
  {
    if ((v12 & 1) == 0) {
      goto LABEL_10;
    }
    long long v14 = &stru_1ED8AC728;
  }
  else
  {
    if ([v9 length]) {
      int v15 = v12;
    }
    else {
      int v15 = 1;
    }
    if (v15 != 1) {
      goto LABEL_10;
    }
    long long v14 = 0;
  }

  id v9 = v14;
LABEL_10:

  return v9;
}

- (void)propertyItem:(id)a3 willChangeValue:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 contactProperty];
  id v9 = [v8 phoneticProperty];

  if (v9)
  {
    double v10 = [(CNContactContentUnitaryViewController *)self nameEditingGroups];
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __70__CNContactContentUnitaryViewController_propertyItem_willChangeValue___block_invoke;
    v54[3] = &unk_1E549B760;
    id v11 = v9;
    id v55 = v11;
    int v12 = objc_msgSend(v10, "_cn_firstObjectPassingTest:", v54);

    uint64_t v13 = [v12 editingItems];
    long long v14 = [v13 firstObject];
    int v15 = [v14 labeledValue];
    uint64_t v16 = [v15 value];

    uint64_t v17 = [(CNContactContentUnitaryViewController *)self _phoneticNameForValue:v7 currentPhoneticName:v16 property:v11];
    id v44 = v16;
    if (![v7 length])
    {
      uint64_t v18 = [v6 labeledValue];
      uint64_t v19 = [v18 value];
      id v20 = v11;
      id v21 = (void *)v19;
      id v22 = v16;
      long long v23 = v20;
      long long v24 = -[CNContactContentUnitaryViewController _phoneticNameForValue:currentPhoneticName:property:](self, "_phoneticNameForValue:currentPhoneticName:property:", v19, v22);

      if (v24)
      {

        uint64_t v17 = &stru_1ED8AC728;
      }

      id v11 = v23;
      uint64_t v16 = v44;
    }
    if (v17)
    {
      id v42 = v7;
      id v43 = v6;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v25 = [v12 editingItems];
      uint64_t v26 = [v25 countByEnumeratingWithState:&v50 objects:v57 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v51 != v28) {
              objc_enumerationMutation(v25);
            }
            [*(id *)(*((void *)&v50 + 1) + 8 * i) updateLabeledValueWithValue:v17];
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v50 objects:v57 count:16];
        }
        while (v27);
      }
      id v45 = v11;
      uint64_t v41 = v12;

      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      int64_t v30 = [(CNContactContentUnitaryViewController *)self contactView];
      int v31 = [v30 visibleCells];

      uint64_t v32 = [v31 countByEnumeratingWithState:&v46 objects:v56 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v47;
        do
        {
          for (uint64_t j = 0; j != v33; ++j)
          {
            if (*(void *)v47 != v34) {
              objc_enumerationMutation(v31);
            }
            int v36 = *(void **)(*((void *)&v46 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v37 = [v36 propertyItem];
              id v38 = [v37 property];
              int v39 = [v38 isEqualToString:v45];

              if (v39)
              {
                id v40 = [v36 textField];
                [v40 setText:v17];
              }
            }
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v46 objects:v56 count:16];
        }
        while (v33);
      }

      id v7 = v42;
      id v6 = v43;
      int v12 = v41;
      uint64_t v16 = v44;
    }
  }
}

uint64_t __70__CNContactContentUnitaryViewController_propertyItem_willChangeValue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 property];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)propertyCellDidChangeLayout:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(CNContactContentUnitaryViewController *)self contactView];
  uint64_t v5 = [v4 indexPathForCell:v6];
  if (v5)
  {
    [v6 setValue:MEMORY[0x1E4F1CC38] forKey:@"needsHeightCalculation"];
    [v4 _heightForRowAtIndexPath:v5];
    objc_msgSend(v4, "_setHeight:forRowAtIndexPath:", v5);
  }
}

- (void)propertyCell:(id)a3 didDeleteLabel:(id)a4 forGroup:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v21 = a5;
  [v21 itemsUsingLabel:a4];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v22)
  {
    uint64_t v19 = *(void *)v28;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v27 + 1) + 8 * v6);
        id v8 = [v21 nextAvailableLabel];
        [v7 updateLabeledValueWithLabel:v8];
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v9 = [(CNContactContentUnitaryViewController *)self contactView];
        double v10 = [v9 visibleCells];

        uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v24;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v24 != v13) {
                objc_enumerationMutation(v10);
              }
              int v15 = *(void **)(*((void *)&v23 + 1) + 8 * v14);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v16 = [v15 propertyItem];

                if (v16 == v7) {
                  [v15 updateWithPropertyItem:v7];
                }
              }
              ++v14;
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v12);
        }

        ++v6;
      }
      while (v6 != v22);
      uint64_t v22 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v22);
  }
  uint64_t v17 = [(CNContactContentUnitaryViewController *)self contactView];
  [(CNContactContentUnitaryViewController *)self _updateLabelWidthForCellsInGroup:v21 forTableView:v17 reset:1];

  [(CNContactContentUnitaryViewController *)self updateDoneButton];
}

- (void)propertyCell:(id)a3 performActionForItem:(id)a4 withTransportType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  switch(a5)
  {
    case 1:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
LABEL_6:
      uint64_t v11 = [(CNContactContentUnitaryViewController *)self faceTimeAction];
      [v11 setType:a5];

      double v10 = [(CNContactContentUnitaryViewController *)self faceTimeAction];
      goto LABEL_9;
    case 3:
      goto LABEL_6;
    case 2:
      double v10 = [(CNContactContentUnitaryViewController *)self sendMessageAction];
LABEL_9:
      uint64_t v12 = v10;
      [v10 performActionForItem:v9 sender:v8];
LABEL_10:

      goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v10 = [(CNContactContentUnitaryViewController *)self linkedCardsAction];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [(CNContactContentUnitaryViewController *)self addLinkedCardAction];
LABEL_16:
    uint64_t v12 = v13;
    [v13 performActionWithSender:v8];
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [(CNContactContentUnitaryViewController *)self addToGroupAction];
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = [(CNContactContentUnitaryViewController *)self actionProvider];
    uint64_t v14 = [v12 staticIdentityAction];
    [v14 performActionForItem:v9 sender:v8];
LABEL_21:

    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = [(CNContactContentUnitaryViewController *)self actionProvider];
    uint64_t v14 = [v12 addStaticIdentityAction];
    [v14 performActionWithSender:v8];
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v15 = [(CNContactContentUnitaryViewController *)self selectContainersAction];
    uint64_t v16 = [(CNContactContentUnitaryViewController *)self containerContext];
    [(CNPropertySuggestionAction *)v15 performActionWithContainerContext:v16];
  }
  else if ([v8 isSuggested])
  {
    uint64_t v17 = [CNPropertySuggestionAction alloc];
    uint64_t v18 = [(CNContactContentUnitaryViewController *)self contact];
    int v15 = [(CNPropertyAction *)v17 initWithContact:v18 propertyItem:v9];

    [(CNContactAction *)v15 setDelegate:self];
    [(CNPropertySuggestionAction *)v15 performActionForItem:v9 sender:v8];
  }
  else
  {
    if (a5 != 7)
    {
      +[CNPropertyAction performDefaultActionForItem:v9 sender:v8];
      goto LABEL_11;
    }
    int v15 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
    uint64_t v19 = (void *)MEMORY[0x1E4FB1410];
    id v20 = CNContactsUIBundle();
    id v21 = [v20 localizedStringForKey:@"PHONE_ACTION_TTY_CALL" value:&stru_1ED8AC728 table:@"Localized"];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __93__CNContactContentUnitaryViewController_propertyCell_performActionForItem_withTransportType___block_invoke;
    v41[3] = &unk_1E549B738;
    v41[4] = self;
    id v22 = v9;
    id v42 = v22;
    id v23 = v8;
    id v43 = v23;
    long long v24 = [v19 actionWithTitle:v21 style:0 handler:v41];
    [(CNPropertySuggestionAction *)v15 addAction:v24];

    long long v25 = (void *)MEMORY[0x1E4FB1410];
    long long v26 = CNContactsUIBundle();
    long long v27 = [v26 localizedStringForKey:@"PHONE_ACTION_TTY_RELAY_CALL" value:&stru_1ED8AC728 table:@"Localized"];
    uint64_t v34 = MEMORY[0x1E4F143A8];
    uint64_t v35 = 3221225472;
    int v36 = __93__CNContactContentUnitaryViewController_propertyCell_performActionForItem_withTransportType___block_invoke_2;
    id v37 = &unk_1E549B738;
    id v38 = self;
    id v39 = v22;
    id v28 = v23;
    id v40 = v28;
    long long v29 = [v25 actionWithTitle:v27 style:0 handler:&v34];
    -[CNPropertySuggestionAction addAction:](v15, "addAction:", v29, v34, v35, v36, v37, v38);

    long long v30 = (void *)MEMORY[0x1E4FB1410];
    int v31 = CNContactsUIBundle();
    uint64_t v32 = [v31 localizedStringForKey:@"CANCEL" value:&stru_1ED8AC728 table:@"Localized"];
    uint64_t v33 = [v30 actionWithTitle:v32 style:1 handler:0];
    [(CNPropertySuggestionAction *)v15 addAction:v33];

    [(CNContactContentUnitaryViewController *)self sender:v28 presentViewController:v15];
  }

LABEL_11:
}

void __93__CNContactContentUnitaryViewController_propertyCell_performActionForItem_withTransportType___block_invoke(uint64_t a1)
{
  id v2 = [CNPropertyTTYAction alloc];
  id v3 = [*(id *)(a1 + 32) contact];
  uint64_t v4 = [(CNPropertyAction *)v2 initWithContact:v3 propertyItem:*(void *)(a1 + 40)];

  [(CNContactAction *)v4 setDelegate:*(void *)(a1 + 32)];
  [(CNPropertyTTYAction *)v4 performActionForItem:*(void *)(a1 + 40) sender:*(void *)(a1 + 48)];
}

void __93__CNContactContentUnitaryViewController_propertyCell_performActionForItem_withTransportType___block_invoke_2(uint64_t a1)
{
  id v2 = [CNPropertyTTYRelayAction alloc];
  id v3 = [*(id *)(a1 + 32) contact];
  uint64_t v4 = [(CNPropertyAction *)v2 initWithContact:v3 propertyItem:*(void *)(a1 + 40)];

  [(CNContactAction *)v4 setDelegate:*(void *)(a1 + 32)];
  [(CNPropertyTTYRelayAction *)v4 performActionForItem:*(void *)(a1 + 40) sender:*(void *)(a1 + 48)];
}

- (void)propertyCell:(id)a3 didUpdateItem:(id)a4 withNewValue:(id)a5
{
  id v21 = a3;
  id v8 = a4;
  [v8 updateLabeledValueWithValue:a5];
  if (objc_opt_respondsToSelector()) {
    [v21 updateWithPropertyItem:v8];
  }
  id v9 = [v8 group];
  double v10 = [(CNContactContentUnitaryViewController *)self contactView];
  [(CNContactContentUnitaryViewController *)self _updateLabelWidthForCellsInGroup:v9 forTableView:v10 reset:1];

  uint64_t v11 = [v8 property];
  uint64_t v12 = *MEMORY[0x1E4F1ADA0];
  if ([v11 isEqualToString:*MEMORY[0x1E4F1ADA0]])
  {

    uint64_t v13 = *MEMORY[0x1E4F1AF90];
  }
  else
  {
    uint64_t v14 = [v8 property];
    uint64_t v13 = *MEMORY[0x1E4F1AF90];
    int v15 = [v14 isEqualToString:*MEMORY[0x1E4F1AF90]];

    if (!v15) {
      goto LABEL_7;
    }
  }
  uint64_t v16 = [(CNContactContentUnitaryViewController *)self propertyGroups];
  uint64_t v17 = [v16 objectForKeyedSubscript:v12];
  [(CNContactContentUnitaryViewController *)self _validateGroup:v17];

  uint64_t v18 = [(CNContactContentUnitaryViewController *)self propertyGroups];
  uint64_t v19 = [v18 objectForKeyedSubscript:v13];
  [(CNContactContentUnitaryViewController *)self _validateGroup:v19];

LABEL_7:
  if ([(CNContactContentUnitaryViewController *)self isEditing])
  {
    id v20 = [(CNContactContentUnitaryViewController *)self editingHeaderView];
    [v20 updateContactWithEditedPropertyItem:v8];
  }
  [(CNContactContentUnitaryViewController *)self updateDoneButton];
}

- (void)propertyCell:(id)a3 didUpdateItem:(id)a4 withNewLabel:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  [v8 updateLabeledValueWithLabel:a5];
  [v9 updateWithPropertyItem:v8];

  double v10 = [v8 group];

  uint64_t v11 = [(CNContactContentUnitaryViewController *)self contactView];
  [(CNContactContentUnitaryViewController *)self _updateLabelWidthForCellsInGroup:v10 forTableView:v11 reset:1];

  [(CNContactContentUnitaryViewController *)self updateDoneButton];
}

- (void)actionWasCanceled:(id)a3
{
  id v6 = [(CNContactContentUnitaryViewController *)self contactView];
  uint64_t v4 = [(CNContactContentUnitaryViewController *)self contactView];
  uint64_t v5 = [v4 indexPathForSelectedRow];
  [v6 deselectRowAtIndexPath:v5 animated:1];
}

- (void)completeAddAddressingGrammarAction:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 selectedAddressingGrammar];
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A250] + 16))() & 1) == 0)
  {
    objc_opt_class();
    uint64_t v6 = *MEMORY[0x1E4F1AD88];
    id v7 = [(CNContactContentUnitaryViewController *)self cardGroupForProperty:*MEMORY[0x1E4F1AD88]];
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;

    if (v9)
    {
      double v10 = [v4 indexPath];
      uint64_t v11 = [(CNContactContentUnitaryViewController *)self editingGroups];
      char v12 = [v11 containsObject:v9];

      if ((v12 & 1) == 0)
      {
        char v40 = v12;
        uint64_t v41 = v10;
        id v43 = v5;
        uint64_t v13 = +[CNContactView allCardProperties];
        unint64_t v14 = [v13 indexOfObject:v6];

        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v42 = self;
        int v15 = [(CNContactContentUnitaryViewController *)self editingGroups];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v44 objects:v48 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v45;
          uint64_t v19 = 0;
          while (2)
          {
            uint64_t v20 = 0;
            uint64_t v39 = v19;
            uint64_t v38 = v19 + v17;
            do
            {
              if (*(void *)v45 != v18) {
                objc_enumerationMutation(v15);
              }
              id v21 = *(void **)(*((void *)&v44 + 1) + 8 * v20);
              id v22 = +[CNContactView allCardProperties];
              id v23 = [v21 property];
              unint64_t v24 = [v22 indexOfObject:v23];

              if (v24 != 0x7FFFFFFFFFFFFFFFLL && v24 >= v14)
              {
                uint64_t v26 = v39 + v20;
                goto LABEL_21;
              }
              ++v20;
            }
            while (v17 != v20);
            uint64_t v17 = [v15 countByEnumeratingWithState:&v44 objects:v48 count:16];
            uint64_t v26 = v38;
            uint64_t v19 = v38;
            if (v17) {
              continue;
            }
            break;
          }
        }
        else
        {
          uint64_t v26 = 0;
        }
LABEL_21:

        self = v42;
        long long v27 = [(CNContactContentUnitaryViewController *)v42 editingGroups];
        id v28 = (void *)[v27 mutableCopy];

        [v28 insertObject:v9 atIndex:v26];
        long long v29 = (void *)[v28 copy];
        [(CNContactContentUnitaryViewController *)v42 setEditingGroups:v29];

        long long v30 = [(CNContactContentUnitaryViewController *)v42 contactView];
        [v30 reloadData];

        int v31 = [(CNContactContentUnitaryViewController *)v42 contactView];
        uint64_t v32 = [(CNContactContentUnitaryViewController *)v42 sectionOfGroup:v9 inTableView:v31];

        double v10 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:v32];

        uint64_t v5 = v43;
        char v12 = v40;
      }
      if (v10)
      {
        uint64_t v33 = [(CNContactContentUnitaryViewController *)self addAddressingGrammarAction];
        uint64_t v34 = [v33 selectedAddressingGrammar];
        uint64_t v35 = (void *)[v9 newEditingItemWithValue:v34];

        if (v35)
        {
          int v36 = [(CNContactContentUnitaryViewController *)self contactView];
          [(CNContactContentUnitaryViewController *)self addEditingItem:v35 atIndexPath:v10 forTableView:v36 shouldSetFocus:0];

          if ((v12 & 1) == 0)
          {
            id v37 = [(CNContactContentUnitaryViewController *)self contactView];
            [v37 scrollToRowAtIndexPath:v10 atScrollPosition:2 animated:1];
          }
        }
      }
    }
  }
}

- (void)actionDidFinishFromSecondaryAction:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactContentUnitaryViewController *)self blockReportAction];

  if (v5 == v4)
  {
    [(CNContactContentUnitaryViewController *)self setShouldIgnoreBlockListChange:1];
    [(CNContactContentUnitaryViewController *)self _setupContactBlockingReportingActionPreservingChanges:1 withUpdate:1];
    uint64_t v6 = [(CNContactContentUnitaryViewController *)self delegate];
    id v7 = [(CNContactContentUnitaryViewController *)self contact];
    [v6 didTapBlockAndReportForContact:v7];
  }

  [(CNContactContentUnitaryViewController *)self updateEditNavigationItemsAnimated:1];
}

- (void)actionDidFinish:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactContentUnitaryViewController *)self contactView];
  uint64_t v6 = [(CNContactContentUnitaryViewController *)self contactView];
  id v7 = [v6 indexPathForSelectedRow];
  [v5 deselectRowAtIndexPath:v7 animated:1];

  uint64_t v8 = [(CNContactContentUnitaryViewController *)self deleteContactAction];
  if ((id)v8 == v4)
  {

    goto LABEL_13;
  }
  id v9 = (void *)v8;
  id v10 = [(CNContactContentUnitaryViewController *)self ignoreContactAction];

  if (v10 == v4)
  {
LABEL_13:
    uint64_t v19 = [(CNContactContentUnitaryViewController *)self contactDelegate];
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      id v21 = [(CNContactContentUnitaryViewController *)self contactDelegate];
      id v22 = [(CNContactContentUnitaryViewController *)self contact];
      [v21 contactViewController:self didDeleteContact:v22];
    }
    id v23 = [(CNContactContentUnitaryViewController *)self delegate];
    char v24 = objc_opt_respondsToSelector();

    if ((v24 & 1) == 0) {
      goto LABEL_18;
    }
    long long v25 = [(CNContactContentUnitaryViewController *)self delegate];
    uint64_t v26 = [(CNContactContentUnitaryViewController *)self contact];
    [v25 didDeleteContact:v26];
    goto LABEL_17;
  }
  id v11 = [(CNContactContentUnitaryViewController *)self addFavoriteAction];

  if (v11 == v4)
  {
    long long v29 = [(CNContactContentUnitaryViewController *)self addFavoriteAction];
    char v30 = [v29 canPerformAction];

    if ((v30 & 1) == 0)
    {
      int v31 = [(CNContactContentUnitaryViewController *)self cardActionsGroup];
      uint64_t v32 = CNContactsUIBundle();
      uint64_t v33 = [v32 localizedStringForKey:@"PHONE_ACTION_ADD_TO_FAVORITES" value:&stru_1ED8AC728 table:@"Localized"];
      [v31 removeActionWithTitle:v33];
    }
    id v27 = [(CNContactContentUnitaryViewController *)self contactView];
    [(CNContactContentUnitaryViewController *)self reloadCardGroupsForFavoritesUpdateInTableView:v27];
    goto LABEL_27;
  }
  id v12 = [(CNContactContentUnitaryViewController *)self createNewContactAction];

  if (v12 == v4)
  {
    id v27 = [(CNContactContentUnitaryViewController *)self createNewContactAction];
    uint64_t v34 = [v27 createdContact];
    [(CNContactContentUnitaryViewController *)self createdNewContact:v34];
    goto LABEL_26;
  }
  id v13 = [(CNContactContentUnitaryViewController *)self addToExistingContactAction];

  if (v13 == v4)
  {
    id v27 = [(CNContactContentUnitaryViewController *)self addToExistingContactAction];
    uint64_t v35 = [v27 chosenContact];
LABEL_25:
    uint64_t v34 = (void *)v35;
    [(CNContactContentUnitaryViewController *)self updatedExistingContact:v35];
    goto LABEL_26;
  }
  id v14 = [(CNContactContentUnitaryViewController *)self updateExistingContactAction];

  if (v14 == v4)
  {
    id v27 = [(CNContactContentUnitaryViewController *)self updateExistingContactAction];
    uint64_t v35 = [v27 existingContact];
    goto LABEL_25;
  }
  id v15 = [(CNContactContentUnitaryViewController *)self addLinkedCardAction];

  if (v15 == v4)
  {
    id v27 = [(CNContactContentUnitaryViewController *)self addLinkedCardAction];
    uint64_t v34 = [v27 chosenContact];
    [(CNContactContentUnitaryViewController *)self addLinkedContact:v34];
    goto LABEL_26;
  }
  id v16 = [(CNContactContentUnitaryViewController *)self addToGroupAction];

  if (v16 == v4)
  {
    id v27 = [(CNContactContentUnitaryViewController *)self addToGroupAction];
    uint64_t v34 = [v27 selectedGroup];
    [(CNContactContentUnitaryViewController *)self addContactToGroup:v34];
    goto LABEL_26;
  }
  uint64_t v17 = [(CNContactContentUnitaryViewController *)self actionProvider];
  id v18 = [v17 addStaticIdentityAction];

  if (v18 == v4)
  {
    id v27 = [(CNContactContentUnitaryViewController *)self actionProvider];
    uint64_t v34 = [v27 addStaticIdentityAction];
    int v36 = [v34 chosenIdentity];
    [(CNContactContentUnitaryViewController *)self addStaticIdentity:v36];
LABEL_32:

    goto LABEL_26;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(CNContactContentUnitaryViewController *)self reloadUnifiedContact];
    goto LABEL_28;
  }
  id v37 = [(CNContactContentUnitaryViewController *)self blockAction];

  if (v37 == v4)
  {
    [(CNContactContentUnitaryViewController *)self setShouldIgnoreBlockListChange:1];
    [(CNContactContentUnitaryViewController *)self _setupContactBlockingActionPreservingChanges:1 withUpdate:1];
    goto LABEL_28;
  }
  id v38 = [(CNContactContentUnitaryViewController *)self blockReportAction];

  if (v38 == v4)
  {
    [(CNContactContentUnitaryViewController *)self setShouldIgnoreBlockListChange:1];
    [(CNContactContentUnitaryViewController *)self _setupContactBlockingReportingActionPreservingChanges:1 withUpdate:1];
    goto LABEL_28;
  }
  uint64_t v39 = [(CNContactContentUnitaryViewController *)self actionProvider];
  id v40 = [v39 shareWithFamilyAction];

  if (v40 == v4)
  {
    [(CNContactContentUnitaryViewController *)self updateContact:v4];
    goto LABEL_28;
  }
  uint64_t v41 = [(CNContactContentUnitaryViewController *)self actionProvider];
  id v42 = [v41 stopSharingWithFamilyAction];

  if (v42 == v4)
  {
    long long v51 = [(CNContactContentUnitaryViewController *)self cardActionsGroup];
    long long v52 = [(CNContactContentUnitaryViewController *)self stopSharingWithFamilyAction];
    long long v53 = [v52 title];
    [v51 removeActionWithTitle:v53];

    [(CNContactContentUnitaryViewController *)self setStopSharingWithFamilyAction:0];
    id v54 = [(CNContactContentUnitaryViewController *)self delegate];
    [v54 didExecuteDeleteFromDowntimeWhitelistAction];

    if (![(CNContactContentViewController *)self ignoresParentalRestrictions]
      && [(CNContactContentUnitaryViewController *)self isEditing])
    {
      [(CNContactContentUnitaryViewController *)self setEditing:0 animated:1];
      [(CNContactContentUnitaryViewController *)self saveChanges];
    }
    goto LABEL_28;
  }
  id v43 = [(CNContactContentUnitaryViewController *)self suggestedContactAction];

  if (v43 == v4)
  {
    id v55 = [(CNContactContentUnitaryViewController *)self contactDelegate];
    char v56 = objc_opt_respondsToSelector();

    if (v56)
    {
      id v57 = [(CNContactContentUnitaryViewController *)self contactDelegate];
      uint64_t v58 = [(CNContactContentUnitaryViewController *)self suggestedContactAction];
      v59 = [v58 contact];
      [v57 contactViewController:self didDeleteContact:v59];
    }
    id v60 = [(CNContactContentUnitaryViewController *)self delegate];

    if (!v60) {
      goto LABEL_18;
    }
    long long v25 = [(CNContactContentUnitaryViewController *)self delegate];
    uint64_t v26 = [(CNContactContentUnitaryViewController *)self suggestedContactAction];
    double v61 = [v26 contact];
    [v25 didDeleteContact:v61];

LABEL_17:
LABEL_18:
    id v27 = [(CNContactContentUnitaryViewController *)self navigationController];
    id v28 = (id)[v27 popViewControllerAnimated:1];
LABEL_27:

    goto LABEL_28;
  }
  id v44 = [(CNContactContentUnitaryViewController *)self clearRecentsDataAction];

  if (v44 == v4)
  {
    id v27 = [(CNContactContentUnitaryViewController *)self delegate];
    [v27 didExecuteClearRecentsDataAction];
    goto LABEL_27;
  }
  id v45 = [(CNContactContentUnitaryViewController *)self stopSharingWithFamilyAction];

  if (v45 == v4)
  {
    id v27 = [(CNContactContentUnitaryViewController *)self delegate];
    [v27 didExecuteDeleteFromDowntimeWhitelistAction];
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v27 = v4;
    long long v46 = [v27 propertyItem];
    uint64_t v34 = [v46 group];

    uint64_t v47 = [v27 selectedChoice];
    if (v47 == 2)
    {
      [v27 reject];
      [v34 reloadDataPreservingChanges:0];
      goto LABEL_26;
    }
    if (v47 == 1)
    {
      long long v48 = [v27 propertyItem];
      int v36 = [(CNContactContentUnitaryViewController *)self indexPathOfDisplayedPropertyItem:v48];

      uint64_t v49 = [(CNContactContentUnitaryViewController *)self contactView];
      [v49 selectRowAtIndexPath:v36 animated:0 scrollPosition:0];

      dispatch_time_t v50 = dispatch_time(0, 500000000);
      uint64_t v66 = MEMORY[0x1E4F143A8];
      uint64_t v67 = 3221225472;
      id v68 = __57__CNContactContentUnitaryViewController_actionDidFinish___block_invoke;
      v69 = &unk_1E549BF80;
      id v70 = v27;
      id v71 = v34;
      dispatch_after(v50, MEMORY[0x1E4F14428], &v66);

      goto LABEL_32;
    }
LABEL_26:

    goto LABEL_27;
  }
  id v62 = [(CNContactContentUnitaryViewController *)self selectContainersAction];

  if (v62 == v4)
  {
    [(CNContactContentUnitaryViewController *)self reloadDataPreservingChanges:1];
    goto LABEL_28;
  }
  id v63 = [(CNContactContentUnitaryViewController *)self addAddressingGrammarAction];

  if (v63 == v4)
  {
    id v27 = [(CNContactContentUnitaryViewController *)self addAddressingGrammarAction];
    [(CNContactContentUnitaryViewController *)self completeAddAddressingGrammarAction:v27];
    goto LABEL_27;
  }
  id v64 = [(CNContactContentUnitaryViewController *)self gameCenterAddFriendAction];

  if (v64 == v4)
  {
    v65 = [(CNContactContentUnitaryViewController *)self gameCenterManager];
    [v65 setHasSentInvite:1];

    [(CNContactContentUnitaryViewController *)self _reloadGameCenterGroup];
  }
LABEL_28:
  -[CNContactContentUnitaryViewController updateEditNavigationItemsAnimated:](self, "updateEditNavigationItemsAnimated:", 1, v66, v67, v68, v69);
}

uint64_t __57__CNContactContentUnitaryViewController_actionDidFinish___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) confirm];
  id v2 = *(void **)(a1 + 40);

  return [v2 reloadDataPreservingChanges:0];
}

- (void)actionDidUpdate:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CNContactContentUnitaryViewController *)self addFavoriteAction];

  if (v5 == v4)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v6 = [(CNContactContentUnitaryViewController *)self cardActionsGroup];
    id v7 = [v6 actions];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v25;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v24 + 1) + 8 * v11) target];
        id v13 = [(CNContactContentUnitaryViewController *)self addFavoriteAction];

        if (v12 == v13) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v9) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }

      char v20 = [(CNContactContentUnitaryViewController *)self addFavoriteAction];
      char v21 = [v20 canPerformAction];

      if (v21) {
        goto LABEL_15;
      }
      id v16 = [(CNContactContentUnitaryViewController *)self cardActionsGroup];
      uint64_t v17 = [v4 target];
      objc_msgSend(v16, "removeActionWithTarget:selector:", v17, objc_msgSend(v4, "selector"));
      goto LABEL_14;
    }
LABEL_10:

    id v14 = [(CNContactContentUnitaryViewController *)self addFavoriteAction];
    int v15 = [v14 canPerformAction];

    if (v15)
    {
      id v16 = [(CNContactContentUnitaryViewController *)self cardActionsGroup];
      uint64_t v17 = [(CNContactContentUnitaryViewController *)self addFavoriteAction];
      id v18 = CNContactsUIBundle();
      uint64_t v19 = [v18 localizedStringForKey:@"PHONE_ACTION_ADD_TO_FAVORITES" value:&stru_1ED8AC728 table:@"Localized"];
      [v16 addAction:v17 withTitle:v19];

LABEL_14:
      id v22 = [(CNContactContentUnitaryViewController *)self cardActionsGroup];
      id v23 = [(CNContactContentUnitaryViewController *)self contactView];
      [(CNContactContentUnitaryViewController *)self reloadCardGroup:v22 forTableView:v23];
    }
  }
LABEL_15:
}

- (void)action:(id)a3 pushViewController:(id)a4 sender:(id)a5
{
  id v6 = a4;
  [(CNContactContentUnitaryViewController *)self setBackgroundColorIfNeededForPresentedViewController:v6];
  id v7 = [(CNContactContentUnitaryViewController *)self navigationItem];
  uint64_t v8 = [v7 prompt];
  uint64_t v9 = [v6 navigationItem];
  [v9 setPrompt:v8];

  id v10 = [(CNContactContentUnitaryViewController *)self navigationController];
  [v10 pushViewController:v6 animated:1];
}

- (void)action:(id)a3 dismissViewController:(id)a4 sender:(id)a5
{
  id v21 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [(CNContactContentUnitaryViewController *)self createNewContactAction];
  uint64_t v11 = v21;
  if (v10 != v21)
  {
    uint64_t v12 = [(CNContactContentUnitaryViewController *)self addToExistingContactAction];
    if ((id)v12 != v21)
    {
      id v13 = (void *)v12;
      id v14 = [(CNContactContentUnitaryViewController *)self updateExistingContactAction];

      if (v14 != v21) {
        goto LABEL_10;
      }
      goto LABEL_7;
    }

    uint64_t v11 = v10;
  }

LABEL_7:
  uint64_t v15 = [(CNContactContentUnitaryViewController *)self delegate];
  if (v15)
  {
    id v16 = (void *)v15;
    uint64_t v17 = [(CNContactContentUnitaryViewController *)self delegate];
    char v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      uint64_t v19 = [(CNContactContentUnitaryViewController *)self delegate];
      [v19 isPresentingEditingController:0];
    }
  }
LABEL_10:
  char v20 = [(CNContactContentUnitaryViewController *)self presentingDelegate];
  [v20 sender:v8 dismissViewController:v9];
}

- (void)action:(id)a3 presentViewController:(id)a4 modalPresentationStyle:(int64_t)a5 sender:(id)a6
{
  id v23 = a3;
  id v10 = a6;
  id v11 = a4;
  id v12 = [(CNContactContentUnitaryViewController *)self createNewContactAction];
  id v13 = v23;
  if (v12 != v23)
  {
    uint64_t v14 = [(CNContactContentUnitaryViewController *)self addToExistingContactAction];
    if ((id)v14 != v23)
    {
      uint64_t v15 = (void *)v14;
      id v16 = [(CNContactContentUnitaryViewController *)self updateExistingContactAction];

      if (v16 != v23) {
        goto LABEL_10;
      }
      goto LABEL_7;
    }

    id v13 = v12;
  }

LABEL_7:
  uint64_t v17 = [(CNContactContentUnitaryViewController *)self delegate];
  if (v17)
  {
    char v18 = (void *)v17;
    uint64_t v19 = [(CNContactContentUnitaryViewController *)self delegate];
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      id v21 = [(CNContactContentUnitaryViewController *)self delegate];
      [v21 isPresentingEditingController:1];
    }
  }
LABEL_10:
  id v22 = [(CNContactContentUnitaryViewController *)self presentingDelegate];
  [v22 sender:v10 presentViewController:v11 modalPresentationStyle:a5];
}

- (void)action:(id)a3 presentViewController:(id)a4 sender:(id)a5
{
  id v21 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [(CNContactContentUnitaryViewController *)self createNewContactAction];
  id v11 = v21;
  if (v10 != v21)
  {
    uint64_t v12 = [(CNContactContentUnitaryViewController *)self addToExistingContactAction];
    if ((id)v12 != v21)
    {
      id v13 = (void *)v12;
      id v14 = [(CNContactContentUnitaryViewController *)self updateExistingContactAction];

      if (v14 != v21) {
        goto LABEL_10;
      }
      goto LABEL_7;
    }

    id v11 = v10;
  }

LABEL_7:
  uint64_t v15 = [(CNContactContentUnitaryViewController *)self delegate];
  if (v15)
  {
    id v16 = (void *)v15;
    uint64_t v17 = [(CNContactContentUnitaryViewController *)self delegate];
    char v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      uint64_t v19 = [(CNContactContentUnitaryViewController *)self delegate];
      [v19 isPresentingEditingController:1];
    }
  }
LABEL_10:
  char v20 = [(CNContactContentUnitaryViewController *)self presentingDelegate];
  [v20 sender:v8 presentViewController:v9];
}

- (id)action:(id)a3 cellForPropertyItem:(id)a4 sender:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [v6 property];
  id v8 = +[CNContactView cellIdentifierForProperty:v7];

  id v9 = +[CNContactView classForCellIdentifier:v8];
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 alloc];
    uint64_t v12 = NSStringFromClass(v10);
    id v10 = (objc_class *)[v11 initWithStyle:0 reuseIdentifier:v12];

    [(objc_class *)v10 setIgnoreSuggested:1];
    [(objc_class *)v10 setCardGroupItem:v6];
    [(objc_class *)v10 setDelegate:self];
    if (objc_opt_respondsToSelector()) {
      [(objc_class *)v10 setAllowsActions:[(CNContactContentUnitaryViewController *)self allowsActions]];
    }
    v15[0] = v6;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [(CNContactContentUnitaryViewController *)self _updateAvailableTransportsForItems:v13];

    [(CNContactContentUnitaryViewController *)self prepareCell:v10];
  }

  return v10;
}

- (void)action:(id)a3 prepareChildContactViewController:(id)a4 sender:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(CNContactContentUnitaryViewController *)self createNewContactAction];

  id v10 = &unk_1ED915C38;
  if (v9 == v7)
  {
    id v10 = [&unk_1ED915C38 arrayByExcludingObjectsInArray:&unk_1ED915C50];
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v17 = -[CNContactContentUnitaryViewController valueForKey:](self, "valueForKey:", v16, (void)v27);
        if (v17) {
          [v8 setValue:v17 forKey:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v13);
  }

  if ([(CNContactContentUnitaryViewController *)self isEditing]) {
    [v8 setAllowsSettingLinkedContactsAsPreferred:0];
  }
  objc_msgSend(v8, "setAllowsAddToFavorites:", 0, (void)v27);
  [v8 setAllowsAddingToAddressBook:0];
  [v8 setShouldShowLinkedContacts:0];
  char v18 = [(CNContactContentViewController *)self parentGroup];
  [v8 setParentGroup:v18];

  uint64_t v19 = [(CNContactContentUnitaryViewController *)self linkedCardsAction];
  char v20 = v7;
  if ((id)v19 == v7) {
    goto LABEL_17;
  }
  id v21 = (void *)v19;
  id v22 = [(CNContactContentUnitaryViewController *)self addToGroupAction];

  if (v22 != v7)
  {
    char v20 = [(CNContactContentViewController *)self parentContainer];
    [v8 setParentContainer:v20];
LABEL_17:
  }
  id v23 = [(CNContactContentUnitaryViewController *)self prohibitedPropertyKeys];
  [v8 setProhibitedPropertyKeys:v23];

  long long v24 = [v8 contactView];
  long long v25 = [(CNContactContentUnitaryViewController *)self contactView];
  long long v26 = [(CNContactContentUnitaryViewController *)self environment];
  objc_msgSend(v24, "setAttributesFromContactView:runningInContactsAppOniPad:", v25, objc_msgSend(v26, "runningInContactsAppOniPad"));
}

- (void)contactInlineActionsViewControllerDidDismissDisambiguationUI:(id)a3
{
  id v4 = [(CNContactContentUnitaryViewController *)self contactDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CNContactContentUnitaryViewController *)self contactDelegate];
    [v6 contactViewControllerDidDismissDisambiguationUI:self];
  }
}

- (void)contactInlineActionsViewControllerWillPresentDisambiguationUI:(id)a3
{
  id v4 = [(CNContactContentUnitaryViewController *)self contactDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CNContactContentUnitaryViewController *)self contactDelegate];
    [v6 contactViewControllerWillPresentDisambiguationUI:self];
  }
}

- (BOOL)contactInlineActionsViewController:(id)a3 shouldPerformActionOfType:(id)a4 withContactProperty:(id)a5
{
  id v6 = a5;
  id v7 = [v6 contact];
  id v8 = [v6 key];
  id v9 = [v6 identifier];

  LOBYTE(self) = [(CNContactContentUnitaryViewController *)self contactViewController:self shouldPerformDefaultActionForContact:v7 propertyKey:v8 propertyIdentifier:v9];
  return (char)self;
}

- (void)viewController:(id)a3 presentationControllerWillDismiss:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  id v7 = [(CNContactContentUnitaryViewController *)self presentedViewController];

  if (v7 == v6) {
    [(CNContactContentUnitaryViewController *)self presentationControllerWillDismiss:v8];
  }
}

- (BOOL)isPresentingModalViewController
{
  id v2 = [(CNContactContentUnitaryViewController *)self presentedViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)sender:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(CNContactContentUnitaryViewController *)self isOutOfProcess])
  {
    id v9 = [(CNContactContentUnitaryViewController *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10) {
      [(CNContactContentUnitaryViewController *)self shouldPresentFullscreen:0];
    }
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __88__CNContactContentUnitaryViewController_sender_dismissViewController_completionHandler___block_invoke;
  v12[3] = &unk_1E549B710;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v7 dismissViewControllerAnimated:1 completion:v12];
}

uint64_t __88__CNContactContentUnitaryViewController_sender_dismissViewController_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(unsigned char **)(a1 + 32);
  if (v2[1322])
  {
    [v2 _endDisablingInterfaceAutorotation];
    *(unsigned char *)(*(void *)(a1 + 32) + 1322) = 0;
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)sender:(id)a3 dismissViewController:(id)a4
{
}

- (void)setBackgroundColorIfNeededForPresentedViewController:(id)a3
{
  id v20 = a3;
  id v4 = +[CNContactStyle currentStyle];
  char v5 = [v4 backgroundColor];
  if (v5)
  {
    id v6 = +[CNContactStyle currentStyle];
    id v7 = [v6 backgroundColor];
    id v8 = [MEMORY[0x1E4FB1618] clearColor];
    char v9 = [v7 isEqual:v8];

    char v10 = v9 ^ 1;
  }
  else
  {
    char v10 = 1;
  }

  id v11 = [(CNContactContentUnitaryViewController *)self view];
  uint64_t v12 = [v11 superview];
  id v13 = [v12 backgroundColor];
  uint64_t v14 = [MEMORY[0x1E4FB1618] clearColor];
  char v15 = [v13 isEqual:v14];

  if ((v10 & 1) == 0 && (v15 & 1) == 0)
  {
    uint64_t v16 = [(CNContactContentUnitaryViewController *)self view];
    uint64_t v17 = [v16 superview];
    char v18 = [v17 backgroundColor];
    uint64_t v19 = [v20 view];
    [v19 setBackgroundColor:v18];
  }
}

- (int64_t)_modalPresentationStyleForViewController:(id)a3
{
  id v4 = a3;
  if (NSClassFromString(&cfstr_Qlpreviewcontr.isa) && (objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ![v4 modalPresentationStyle])
  {
    int64_t v5 = 0;
    goto LABEL_56;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = [v4 view];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
LABEL_9:
      int64_t v5 = 7;
      goto LABEL_56;
    }
    getSLComposeViewControllerClass_63561();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v5 = 5;
      goto LABEL_56;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [v4 viewControllers];
      char v9 = [v8 firstObject];
      objc_opt_class();
      char v10 = objc_opt_isKindOfClass();

      if (v10)
      {
        id v11 = +[CNContactStyle currentStyle];
        if ([v11 shouldPresentInCurrentContext]) {
          int64_t v5 = 6;
        }
        else {
          int64_t v5 = -2;
        }
LABEL_55:

        goto LABEL_56;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = [v4 viewControllers];
      id v13 = [v12 firstObject];
      objc_opt_class();
      char v14 = objc_opt_isKindOfClass();

      if (v14)
      {
        id v11 = +[CNContactStyle currentStyle];
        if ([v11 shouldPresentInCurrentContext])
        {
          int64_t v5 = 3;
        }
        else
        {
          id v20 = [MEMORY[0x1E4FB16C8] currentDevice];
          uint64_t v21 = [v20 userInterfaceIdiom];

          if ((v21 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
            int64_t v5 = 2;
          }
          else {
            int64_t v5 = -2;
          }
        }
        goto LABEL_55;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v15 = [v4 viewControllers];
      id v11 = [v15 firstObject];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v16 = 1;
      }
      else
      {
        objc_opt_class();
        int v16 = objc_opt_isKindOfClass();
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        char v17 = 1;
LABEL_28:
        if ([(UIViewController *)self ab_isInPopover]
          || CNUIIsFaceTime()
          && ([MEMORY[0x1E4FB16C8] currentDevice],
              char v18 = objc_claimAutoreleasedReturnValue(),
              uint64_t v19 = [v18 userInterfaceIdiom],
              v18,
              (v19 & 0xFFFFFFFFFFFFFFFBLL) == 1))
        {
          int64_t v5 = 2;
        }
        else
        {
          if ([(CNContactContentUnitaryViewController *)self isOutOfProcess]
            || CNUIIsDDActionsService())
          {
            id v22 = [MEMORY[0x1E4FB16C8] currentDevice];
            uint64_t v23 = [v22 userInterfaceIdiom];

            if ((v23 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
              goto LABEL_50;
            }
          }
          if ((v17 & 1) != 0
            && ([MEMORY[0x1E4FB16C8] currentDevice],
                long long v24 = objc_claimAutoreleasedReturnValue(),
                uint64_t v25 = [v24 userInterfaceIdiom],
                v24,
                (v25 & 0xFFFFFFFFFFFFFFFBLL) != 1))
          {
LABEL_50:
            int64_t v5 = 0;
          }
          else
          {
            long long v26 = +[CNContactStyle currentStyle];
            if ([v26 shouldPresentInCurrentContext])
            {
              int64_t v5 = 3;
            }
            else
            {
              long long v29 = [MEMORY[0x1E4FB16C8] currentDevice];
              uint64_t v30 = [v29 userInterfaceIdiom];

              if ((v30 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
                int64_t v5 = 2;
              }
              else {
                int64_t v5 = -2;
              }
            }
          }
        }
        goto LABEL_55;
      }
      objc_opt_class();
      int v27 = objc_opt_isKindOfClass();
      char v17 = v27;
      if ((v16 | v27)) {
        goto LABEL_28;
      }
    }
    if (![(UIViewController *)self ab_isInPopover]
      && ![(UIViewController *)self ab_isInSheet])
    {
      long long v28 = +[CNContactStyle currentStyle];
      if (([v28 shouldPresentInCurrentContext] & 1) != 0 || CNUIIsDDActionsService())
      {
      }
      else
      {
        int v32 = _CFMZEnabled();

        if (!v32) {
          goto LABEL_9;
        }
      }
    }
    int64_t v5 = 3;
    goto LABEL_56;
  }
  int64_t v5 = [v4 modalPresentationStyle];
LABEL_56:

  return v5;
}

- (void)performConfirmedCancel
{
  [(CNContactContentUnitaryViewController *)self cancelAsyncLookups];
  BOOL v3 = [(CNContactContentUnitaryViewController *)self contact];
  if ([v3 isUnknown])
  {
    uint64_t v4 = [(CNContactContentUnitaryViewController *)self shadowCopyOfReadonlyContact];
    if (!v4)
    {

      goto LABEL_8;
    }
    int64_t v5 = (void *)v4;
    BOOL v6 = [(CNContactContentViewController *)self alwaysEditing];

    if (v6) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  BOOL v7 = [(CNContactContentViewController *)self alwaysEditing];

  if (!v7) {
LABEL_6:
  }
    [(CNContactContentUnitaryViewController *)self setEditing:0 animated:1];
LABEL_8:
  [(CNContactContentUnitaryViewController *)self _didCompleteWithContact:0];
  if ([(CNContactContentUnitaryViewController *)self mode] == 3)
  {
    id v8 = [(CNContactContentUnitaryViewController *)self contact];
    char v9 = [v8 identifier];

    if (v9) {
      [(CNContactContentUnitaryViewController *)self cleanupRecentMetadata];
    }
  }
  char v10 = [(CNContactContentUnitaryViewController *)self view];
  [v10 endEditing:1];

  [(CNContactContentUnitaryViewController *)self setEditingLinkedContacts:0];
  id v11 = [(CNContactContentUnitaryViewController *)self cardStaticIdentityGroup];
  [v11 clearDisplay];

  [(CNContactContentUnitaryViewController *)self setGroupEditingContext:0];
  [(CNContactContentUnitaryViewController *)self reloadDataPreservingChanges:0];
  uint64_t v12 = [(CNContactContentUnitaryViewController *)self editingContactView];
  [v12 reloadData];

  if ([(CNContactContentUnitaryViewController *)self supportsDrafts])
  {
    +[CNUIDraftSupport deleteDrafts];
  }
}

- (void)presentationControllerWillDismiss:(id)a3
{
  if ([(CNContactContentUnitaryViewController *)self isOutOfProcess])
  {
    [(CNContactContentUnitaryViewController *)self shouldPresentFullscreen:0];
  }
}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  id v13 = a3;
  id v8 = a5;
  if (a4 != 5)
  {
    if ([(CNContactContentUnitaryViewController *)self isOutOfProcess])
    {
      char v9 = [(CNContactContentUnitaryViewController *)self delegate];
      char v10 = objc_opt_respondsToSelector();

      if (v10)
      {
        id v11 = [v13 presentedViewController];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0) {
          [(CNContactContentUnitaryViewController *)self shouldPresentFullscreen:1];
        }
      }
    }
  }
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  BOOL v3 = objc_msgSend(MEMORY[0x1E4FB16C8], "currentDevice", a3);
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1 && CNUIIsDDActionsService()) {
    return -1;
  }
  else {
    return -2;
  }
}

- (void)updateOutOfProcessFullscreenPresentationIfNeeded
{
  if ([(CNContactContentUnitaryViewController *)self isOutOfProcess]
    && [(CNContactContentUnitaryViewController *)self isPresentingModalViewController])
  {
    id v6 = [(CNContactContentUnitaryViewController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      BOOL v3 = [(CNContactContentUnitaryViewController *)self presentedViewController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        BOOL v5 = [(CNContactContentUnitaryViewController *)self isPresentingFullscreenForOutOfProcess];
        [(CNContactContentUnitaryViewController *)self shouldPresentFullscreen:v5];
      }
    }
    else
    {
    }
  }
}

- (void)updateStaticDisplayHeaderImageVisibility
{
  BOOL v3 = [(CNContactContentUnitaryViewController *)self contactHeaderView];
  staticDisplayHeaderView = self->_staticDisplayHeaderView;

  if (v3 == staticDisplayHeaderView)
  {
    BOOL v5 = self->_staticDisplayHeaderView;
    [(CNContactHeaderStaticDisplayView *)v5 updateImageViewVisiblity];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CNContactContentUnitaryViewController;
  -[CNContactContentUnitaryViewController viewWillTransitionToSize:withTransitionCoordinator:](&v21, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  id v8 = [(CNContactContentUnitaryViewController *)self presentedViewController];
  char v9 = [v8 popoverPresentationController];
  char v10 = [v9 sourceView];

  if (v10)
  {
    id v11 = [v10 superview];
    uint64_t v12 = [(CNContactContentUnitaryViewController *)self contactView];
    BOOL v13 = v11 == v12;
  }
  else
  {
    BOOL v13 = 0;
  }
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __92__CNContactContentUnitaryViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v18[3] = &unk_1E549B6C0;
  objc_copyWeak(&v19, &location);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __92__CNContactContentUnitaryViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v15[3] = &unk_1E549B6E8;
  BOOL v17 = v13;
  v15[4] = self;
  id v14 = v10;
  id v16 = v14;
  [v7 animateAlongsideTransition:v18 completion:v15];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __92__CNContactContentUnitaryViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained shouldUseStaticHeader])
  {
    if (([WeakRetained hasSetupViewHierarchy] & 1) == 0) {
      [WeakRetained setupViewHierarchy];
    }
    [WeakRetained setupConstraints];
    [WeakRetained updateStaticDisplayHeaderImageVisibility];
    id v1 = (id)[WeakRetained applyContactStyle];
  }
  if ([WeakRetained displayNavigationButtonsShouldUsePlatterStyle])
  {
    id v2 = [MEMORY[0x1E4FB16C8] currentDevice];
    BOOL v3 = [v2 userInterfaceIdiom] == 0;

    [WeakRetained updateEditNavigationItemsAnimated:1 updateTintColor:v3];
  }
}

void __92__CNContactContentUnitaryViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    id v7 = v3;
    uint64_t v4 = [*(id *)(a1 + 32) presentedViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v3 = v7;
    if (isKindOfClass)
    {
      id v6 = [*(id *)(a1 + 32) contactView];
      [*(id *)(a1 + 40) frame];
      objc_msgSend(v6, "scrollRectToVisible:animated:", 0);

      id v3 = v7;
    }
  }
}

- (void)shouldPresentFullscreen:(BOOL)a3
{
  BOOL v3 = a3;
  -[CNContactContentUnitaryViewController setIsPresentingFullscreenForOutOfProcess:](self, "setIsPresentingFullscreenForOutOfProcess:");
  BOOL v5 = [(CNContactContentUnitaryViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CNContactContentUnitaryViewController *)self delegate];
    [v7 isPresentingFullscreen:v3];
  }
}

- (CGRect)centeredSourceRect:(CGRect)a3 inContactView:(id)a4
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  char v10 = [(CNContactContentUnitaryViewController *)self contactView];
  char v11 = [v10 isEditing];

  if ((v11 & 1) == 0)
  {
    [v9 layoutMargins];
    double v13 = v12;
    [v9 layoutMargins];
    double width = width - (v13 + v14);
    [v9 layoutMargins];
    double v16 = v15;
    BOOL v17 = +[CNContactStyle currentStyle];
    [v17 sectionContentInset];
    double x = x + v16 - v18;
  }
  double v19 = x;
  double v20 = y;
  double v21 = width;
  double v22 = height;
  result.size.CGFloat height = v22;
  result.size.double width = v21;
  result.origin.CGFloat y = v20;
  result.origin.double x = v19;
  return result;
}

- (void)sender:(id)a3 presentViewController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(CNContactContentUnitaryViewController *)self sender:v7 presentViewController:v6 modalPresentationStyle:[(CNContactContentUnitaryViewController *)self _modalPresentationStyleForViewController:v6]];
}

- (void)sender:(id)a3 presentViewController:(id)a4 modalPresentationStyle:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(CNContactContentUnitaryViewController *)self splitViewController];
  if (v10)
  {
    char v11 = (void *)v10;
    double v12 = [(CNContactContentUnitaryViewController *)self splitViewController];
    double v13 = [v12 firstResponder];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      double v15 = [(CNContactContentUnitaryViewController *)self splitViewController];
      double v16 = [v15 view];
      [v16 endEditing:1];
    }
  }
  [v9 setModalPresentationStyle:a5];
  BOOL v17 = +[CNContactStyle currentStyle];
  objc_msgSend(v9, "setModalTransitionStyle:", objc_msgSend(v17, "modalTransitionStyle"));

  objc_opt_class();
  id v46 = v8;
  if (objc_opt_isKindOfClass()) {
    double v18 = v46;
  }
  else {
    double v18 = 0;
  }
  id v19 = v18;

  double v20 = [v9 popoverPresentationController];
  [v20 setSourceView:v19];

  [v19 bounds];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  long long v29 = [(CNContactContentUnitaryViewController *)self contactView];
  -[CNContactContentUnitaryViewController centeredSourceRect:inContactView:](self, "centeredSourceRect:inContactView:", v29, v22, v24, v26, v28);
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  id v38 = [v9 popoverPresentationController];
  objc_msgSend(v38, "setSourceRect:", v31, v33, v35, v37);

  uint64_t v39 = [v9 popoverPresentationController];
  [v39 setPermittedArrowDirections:15];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v40 = [v9 presentationController];
    [v40 setDelegate:self];
  }
  objc_opt_class();
  char v41 = objc_opt_isKindOfClass();
  if (!self->_disablingRotation && (v41 & 1) == 0)
  {
    id v42 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([v42 userInterfaceIdiom])
    {
LABEL_15:

      goto LABEL_16;
    }
    id v43 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v43 _referenceBounds];
    if (CGRectGetHeight(v48) <= 667.0 || [v9 modalPresentationStyle])
    {

      goto LABEL_15;
    }
    uint64_t v44 = [v9 supportedInterfaceOrientations];
    uint64_t v45 = [(CNContactContentUnitaryViewController *)self supportedInterfaceOrientations];

    if (v44 != v45)
    {
      [(CNContactContentUnitaryViewController *)self _beginDisablingInterfaceAutorotation];
      self->_disablingRotation = 1;
    }
  }
LABEL_16:
  [(CNContactContentUnitaryViewController *)self setBackgroundColorIfNeededForPresentedViewController:v9];
  [(CNContactContentUnitaryViewController *)self presentViewController:v9 animated:1 completion:0];
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (![(CNContactContentUnitaryViewController *)self isPersonHeaderIndexPath:v6 forTableView:v8]&& ![(CNContactContentUnitaryViewController *)self isSharedProfileBannerSectionIndexPath:v6 forTableView:v8])
  {
    id v7 = [v8 cellForRowAtIndexPath:v6];
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v7 shouldPerformAccessoryAction]) {
      [v7 performAccessoryAction];
    }
  }
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CNContactContentUnitaryViewController *)self isPersonHeaderIndexPath:v7 forTableView:v6]|| [(CNContactContentUnitaryViewController *)self isSharedProfileBannerSectionIndexPath:v7 forTableView:v6])
  {
    id v8 = 0;
  }
  else
  {
    id v9 = [(CNContactContentUnitaryViewController *)self _itemAtIndexPath:v7 forTableView:v6];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = CNContactsUIBundle();
      char v11 = v10;
      double v12 = @"UNLINK";
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      uint64_t v10 = CNContactsUIBundle();
      char v11 = v10;
      if (isKindOfClass) {
        double v12 = @"LIST_SWIPE_ACTION_REMOVE_FROM_GROUP";
      }
      else {
        double v12 = @"DELETE";
      }
    }
    id v8 = [v10 localizedStringForKey:v12 value:&stru_1ED8AC728 table:@"Localized"];
  }

  return v8;
}

- (void)tableView:(id)a3 performAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  if (sel_copy_ == a4)
  {
    id v7 = [a3 cellForRowAtIndexPath:a5];
    [v7 a4];
  }
}

- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  BOOL v11 = !-[CNContactContentUnitaryViewController isPersonHeaderIndexPath:forTableView:](self, "isPersonHeaderIndexPath:forTableView:", v10, v9)&& !-[CNContactContentUnitaryViewController isSharedProfileBannerSectionIndexPath:forTableView:](self, "isSharedProfileBannerSectionIndexPath:forTableView:", v10, v9)&& ([v9 isEditing] & 1) == 0&& !-[CNContactContentUnitaryViewController _indexPathIsActionItem:forTableView:](self, "_indexPathIsActionItem:forTableView:", v10, v9)&& sel_copy_ == a4;

  return v11;
}

- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CNContactContentUnitaryViewController *)self isPersonHeaderIndexPath:v7 forTableView:v6]|| [(CNContactContentUnitaryViewController *)self isSharedProfileBannerSectionIndexPath:v7 forTableView:v6])
  {
    char v8 = 0;
  }
  else
  {
    id v9 = [(CNContactContentUnitaryViewController *)self _itemAtIndexPath:v7 forTableView:v6];
    char v10 = [(CNContactContentUnitaryViewController *)self isEditing];
    char v8 = 0;
    if ((v10 & 1) == 0 && v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        char v8 = objc_opt_isKindOfClass() ^ 1;
      }
      else
      {
        char v8 = 0;
      }
    }
  }
  return v8 & 1;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(CNContactContentUnitaryViewController *)self isPersonHeaderIndexPath:v7 forTableView:v6]&& ![(CNContactContentUnitaryViewController *)self isSharedProfileBannerSectionIndexPath:v7 forTableView:v6])
  {
    id v9 = [(CNContactContentUnitaryViewController *)self _itemAtIndexPath:v7 forTableView:v6];
    if ([(CNContactContentUnitaryViewController *)self isEditing])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = v9;
        if (([v10 isReadonly] & 1) != 0
          || ![v10 canRemove]
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          int64_t v8 = 0;
        }
        else
        {
          objc_opt_class();
          int64_t v8 = (objc_opt_isKindOfClass() & 1) == 0;
        }

        goto LABEL_16;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
            {
              int64_t v8 = 1;
              goto LABEL_16;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_opt_class();
                    int64_t v8 = objc_opt_isKindOfClass() & 1;
                    goto LABEL_16;
                  }
                }
              }
            }
          }
        }
      }
      int64_t v8 = 2;
    }
    else
    {
      int64_t v8 = 0;
    }
LABEL_16:

    goto LABEL_17;
  }
  int64_t v8 = 0;
LABEL_17:

  return v8;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  BOOL v5 = [(CNContactContentUnitaryViewController *)self _cellIdentifierForTableView:a3 indexPath:a4];
  id v6 = [(CNContactContentUnitaryViewController *)self contactView];
  id v7 = (void *)[(id)objc_opt_class() classForCellIdentifier:v5];

  LOBYTE(v6) = [v7 shouldIndentWhileEditing];
  return (char)v6;
}

- (id)groupContext
{
  BOOL v3 = [(CNContactContentUnitaryViewController *)self groupEditingContext];

  if (!v3) {
    goto LABEL_4;
  }
  uint64_t v4 = *MEMORY[0x1E4F5A258];
  BOOL v5 = [(CNContactContentUnitaryViewController *)self groupEditingContext];
  id v6 = [v5 addedGroups];
  if ((*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v6))
  {
    id v7 = [(CNContactContentUnitaryViewController *)self groupEditingContext];
    int64_t v8 = [v7 removedGroups];
    char v9 = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v8);

    if (v9)
    {
LABEL_4:
      id v10 = 0;
      goto LABEL_7;
    }
  }
  else
  {
  }
  BOOL v11 = [(CNContactContentUnitaryViewController *)self groupsAndContainersSaveManager];
  double v12 = [(CNContactContentUnitaryViewController *)self groupEditingContext];
  double v13 = [v12 addedGroups];
  double v14 = [v11 groupsByContainerDictForContainers:0 groups:v13];

  double v15 = [CNUIGroupContext alloc];
  double v16 = [(CNContactContentUnitaryViewController *)self groupEditingContext];
  BOOL v17 = [v16 removedGroups];
  id v10 = [(CNUIGroupContext *)v15 initWithAddedGroupsByContainerDict:v14 removedGroups:v17];

LABEL_7:

  return v10;
}

- (void)authorizeEditContactWithTargetGroup:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if (v6)
  {
    if ([(CNContactContentUnitaryViewController *)self saveWasAuthorized]) {
      goto LABEL_4;
    }
    int64_t v8 = [(CNContactContentUnitaryViewController *)self groupsAndContainersSaveManager];
    char v9 = [(CNContactContentUnitaryViewController *)self contact];
    id v10 = [v6 identifier];
    char v11 = objc_msgSend(v8, "isAuthorizedToEditContact:withTargetGroupWithIdentifier:ignoresParentalRestrictions:", v9, v10, -[CNContactContentUnitaryViewController saveWasAuthorized](self, "saveWasAuthorized"));

    if (v11)
    {
LABEL_4:
      v7[2](v7);
    }
    else
    {
      objc_initWeak(&location, self);
      double v12 = [(CNContactContentUnitaryViewController *)self groupsAndContainersSaveManager];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      void v13[2] = __88__CNContactContentUnitaryViewController_authorizeEditContactWithTargetGroup_completion___block_invoke;
      v13[3] = &unk_1E549B698;
      objc_copyWeak(&v15, &location);
      double v14 = v7;
      [v12 authorizeForViewController:self sender:self animated:1 completionBlock:v13];

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
}

void __88__CNContactContentUnitaryViewController_authorizeEditContactWithTargetGroup_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setEditAuthorizationResult:a2];
  if (a2 == 2) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)authorizedAddContactToGroup:(id)a3
{
  id v4 = a3;
  if ([(CNContactContentUnitaryViewController *)self isEditing])
  {
    BOOL v5 = [(CNContactContentUnitaryViewController *)self groupEditingContext];
    [v5 addGroup:v4];

    [(CNContactContentUnitaryViewController *)self reloadDataPreservingChanges:1];
  }
  else
  {
    id v6 = [(CNContactContentUnitaryViewController *)self groupsAndContainersSaveManager];
    id v7 = [(CNContactContentUnitaryViewController *)self contact];
    id v8 = (id)[v6 addContact:v7 toGroup:v4 moveWasAuthorized:1];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__CNContactContentUnitaryViewController_authorizedAddContactToGroup___block_invoke;
    aBlock[3] = &unk_1E549B488;
    void aBlock[4] = self;
    char v9 = _Block_copy(aBlock);
    [(CNContactContentUnitaryViewController *)self performWhenViewIsLaidOut:v9];
  }
}

void __69__CNContactContentUnitaryViewController_authorizedAddContactToGroup___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [v2 contactView];
  BOOL v3 = [*(id *)(a1 + 32) cardGroupMembershipGroup];
  [v2 _scrollContactView:v4 toVisibleGroup:v3 animated:0];
}

- (void)addContactToGroup:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__CNContactContentUnitaryViewController_addContactToGroup___block_invoke;
  v6[3] = &unk_1E549B670;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(CNContactContentUnitaryViewController *)self authorizeEditContactWithTargetGroup:v5 completion:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __59__CNContactContentUnitaryViewController_addContactToGroup___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained authorizedAddContactToGroup:*(void *)(a1 + 32)];
}

- (void)authorizedRemoveContactFromGroup:(id)a3
{
  id v4 = a3;
  if ([(CNContactContentUnitaryViewController *)self isEditing])
  {
    id v5 = [(CNContactContentUnitaryViewController *)self groupEditingContext];
    [v5 removeGroup:v4];

    [(CNContactContentUnitaryViewController *)self reloadDataPreservingChanges:1];
  }
  else
  {
    id v6 = [(CNContactContentUnitaryViewController *)self groupsAndContainersSaveManager];
    id v7 = [(CNContactContentUnitaryViewController *)self contact];
    [v6 removeContact:v7 fromGroup:v4 ignoresGuardianRestrictions:1];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__CNContactContentUnitaryViewController_authorizedRemoveContactFromGroup___block_invoke;
    aBlock[3] = &unk_1E549B488;
    void aBlock[4] = self;
    id v8 = _Block_copy(aBlock);
    [(CNContactContentUnitaryViewController *)self performWhenViewIsLaidOut:v8];
  }
}

void __74__CNContactContentUnitaryViewController_authorizedRemoveContactFromGroup___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [v2 contactView];
  BOOL v3 = [*(id *)(a1 + 32) cardGroupMembershipGroup];
  [v2 _scrollContactView:v4 toVisibleGroup:v3 animated:0];
}

- (void)removeContactFromGroup:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__CNContactContentUnitaryViewController_removeContactFromGroup___block_invoke;
  v6[3] = &unk_1E549B670;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(CNContactContentUnitaryViewController *)self authorizeEditContactWithTargetGroup:v5 completion:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __64__CNContactContentUnitaryViewController_removeContactFromGroup___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained authorizedRemoveContactFromGroup:*(void *)(a1 + 32)];
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CNContactContentUnitaryViewController *)self environment];
  char v9 = [v8 runningInContactsAppOniPad];

  if (v9)
  {
    id v10 = 0;
  }
  else
  {
    char v11 = [(CNContactContentUnitaryViewController *)self _itemAtIndexPath:v7 forTableView:v6];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [(CNContactContentUnitaryViewController *)self allowsEditing])
    {
      id v12 = v11;
      double v13 = [v12 group];
      if (v13)
      {
        id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v15 = CNContactsUIBundle();
        double v16 = [v15 localizedStringForKey:@"LIST_SWIPE_ACTION_REMOVE_FROM_GROUP" value:&stru_1ED8AC728 table:@"Localized"];

        objc_initWeak(&location, self);
        BOOL v17 = (void *)MEMORY[0x1E4FB1688];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __102__CNContactContentUnitaryViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke;
        v20[3] = &unk_1E549B648;
        objc_copyWeak(&v22, &location);
        id v21 = v13;
        double v18 = [v17 contextualActionWithStyle:1 title:v16 handler:v20];
        [v14 addObject:v18];
        id v10 = [MEMORY[0x1E4FB1CC0] configurationWithActions:v14];

        objc_destroyWeak(&v22);
        objc_destroyWeak(&location);
      }
      else
      {
        id v10 = 0;
      }
    }
    else
    {
      id v10 = 0;
    }
  }

  return v10;
}

void __102__CNContactContentUnitaryViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained removeContactFromGroup:*(void *)(a1 + 32)];
}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  id v19 = a3;
  id v7 = a4;
  [v7 updateConstraintsIfNeeded];
  id v8 = [v7 backgroundView];
  char v9 = [(CNContactContentUnitaryViewController *)self contactView];
  id v10 = [v9 sectionBackgroundColor];
  if (v10)
  {
    int v11 = 1;
  }
  else
  {
    id v12 = [(CNContactContentUnitaryViewController *)self environment];
    int v11 = [v12 runningInContactsAppOniPad];
  }
  if (v11 && !v8)
  {
    id v13 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    id v8 = objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  id v14 = [(CNContactContentUnitaryViewController *)self environment];
  int v15 = [v14 runningInContactsAppOniPad];
  if (v15)
  {
    id v10 = [(CNContactContentUnitaryViewController *)self displayContactView];
    if (v10 == v19)
    {
      double v18 = +[CNUIColorRepository contactCardBackgroundiPadOverwriteColor];
      [v8 setBackgroundColor:v18];

      id v10 = v19;
      goto LABEL_12;
    }
  }
  double v16 = [(CNContactContentUnitaryViewController *)self contactView];
  BOOL v17 = [v16 sectionBackgroundColor];
  [v8 setBackgroundColor:v17];

  if (v15) {
LABEL_12:
  }

  [v7 setBackgroundView:v8];
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v21 = a3;
  id v8 = a4;
  [(CNContactContentUnitaryViewController *)self tableView:v21 willDisplayFooterView:v8 forSection:a5];
  objc_msgSend(v8, "_cnui_applyContactStyle");
  char v9 = [(CNContactContentUnitaryViewController *)self _cardGroupAtTableViewSectionIndex:a5 forTableView:v21];
  id v10 = [(CNContactContentUnitaryViewController *)self cardEditingDeleteContactGroup];
  if (v9 == v10
    && ([(CNContactContentUnitaryViewController *)self ignoreContactAction],
        BOOL v17 = objc_claimAutoreleasedReturnValue(),
        id v10 = v9,
        v17))
  {
    double v18 = [(CNContactContentUnitaryViewController *)self contactView];
    id v19 = [v18 sectionBackgroundColor];

    if (v19)
    {
      id v13 = [(CNContactContentUnitaryViewController *)self contactView];
      uint64_t v14 = [v13 sectionBackgroundColor];
      goto LABEL_15;
    }
  }
  else
  {
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int v11 = +[CNContactStyle currentStyle];
      id v12 = [v11 backgroundColor];

      if (v12)
      {
        id v13 = +[CNContactStyle currentStyle];
        uint64_t v14 = [v13 backgroundColor];
LABEL_15:
        double v16 = (void *)v14;
        double v20 = [v8 backgroundView];
        [v20 setBackgroundColor:v16];

        goto LABEL_16;
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v13 = [(CNContactContentUnitaryViewController *)self environment];
    if (![v13 runningInContactsAppOniPad])
    {
LABEL_17:

      goto LABEL_18;
    }
    id v15 = [(CNContactContentUnitaryViewController *)self displayContactView];

    if (v15 != v21) {
      goto LABEL_18;
    }
    id v13 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    double v16 = [v8 textLabel];
    [v16 setFont:v13];
LABEL_16:

    goto LABEL_17;
  }
LABEL_18:
}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(CNContactContentUnitaryViewController *)self _cardGroupAtTableViewSectionIndex:a4 forTableView:v6];
  id v8 = [(CNContactContentUnitaryViewController *)self displayContactView];
  if (v8 != v6)
  {

LABEL_4:
    id v11 = [(CNContactContentUnitaryViewController *)self editingContactView];

    if (v11 != v6)
    {
LABEL_5:
      char isKindOfClass = 0;
      goto LABEL_27;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = [(CNContactContentUnitaryViewController *)self nameEditingGroups];
      uint64_t v14 = [v13 indexOfObject:v7];
      id v15 = [(CNContactContentUnitaryViewController *)self nameEditingGroups];
      char isKindOfClass = v14 == [v15 count] - 1;

      goto LABEL_27;
    }
    goto LABEL_26;
  }
  char v9 = [(CNContactContentUnitaryViewController *)self environment];
  char v10 = [v9 runningInContactsAppOniPad];

  if (v10) {
    goto LABEL_4;
  }
  double v16 = [(CNContactContentUnitaryViewController *)self cardMedicalIDGroup];

  BOOL v17 = [(CNContactContentUnitaryViewController *)self cardMedicalIDGroup];

  uint64_t v18 = [(CNContactContentUnitaryViewController *)self cardBlockContactGroup];
  if (v7 == (void *)v18)
  {

    goto LABEL_26;
  }
  id v19 = (void *)v18;
  double v20 = [(CNContactContentUnitaryViewController *)self cardShareLocationGroup];

  if (v16) {
    BOOL v21 = v7 == v17;
  }
  else {
    BOOL v21 = 0;
  }
  int v22 = !v21;
  char isKindOfClass = 1;
  if (v7 != v20 && v22)
  {
    if (v16 && [v7 isMemberOfClass:objc_opt_class()])
    {
      double v23 = [(CNContactContentUnitaryViewController *)self cardMedicalIDGroup];
      double v24 = [v23 actionItems];
      if ([v24 count])
      {
        double v25 = [(CNContactContentUnitaryViewController *)self cardMedicalIDGroup];
        int v26 = [v25 addSpacerFromPreviousGroup];

        if (!v26) {
          goto LABEL_5;
        }
      }
      else
      {
      }
    }
    if (([v7 isMemberOfClass:objc_opt_class()] & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        goto LABEL_27;
      }
    }
LABEL_26:
    char isKindOfClass = 1;
  }
LABEL_27:

  return isKindOfClass & 1;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(CNContactContentUnitaryViewController *)self editingContactView];

  if (v7 == v6)
  {
    char isKindOfClass = 1;
  }
  else
  {
    uint64_t v8 = [(CNContactContentUnitaryViewController *)self displayContactView];
    if ((id)v8 != v6)
    {
      id v9 = (id)v8;
      char isKindOfClass = 0;
LABEL_35:

      goto LABEL_36;
    }
    id v11 = [(CNContactContentUnitaryViewController *)self environment];
    int v12 = [v11 runningInContactsAppOniPad];

    if (v12)
    {
      id v13 = [(CNContactContentUnitaryViewController *)self _cardGroupAtTableViewSectionIndex:a4 forTableView:v6];
      objc_opt_class();
      id v14 = v13;
      if (objc_opt_isKindOfClass()) {
        id v15 = v14;
      }
      else {
        id v15 = 0;
      }
      id v16 = v15;

      objc_opt_class();
      id v17 = v14;
      if (objc_opt_isKindOfClass()) {
        uint64_t v18 = v17;
      }
      else {
        uint64_t v18 = 0;
      }
      unint64_t v19 = v18;

      objc_opt_class();
      id v20 = v17;
      if (objc_opt_isKindOfClass()) {
        BOOL v21 = v20;
      }
      else {
        BOOL v21 = 0;
      }
      unint64_t v22 = v21;

      objc_opt_class();
      id v23 = v20;
      if (objc_opt_isKindOfClass()) {
        double v24 = v23;
      }
      else {
        double v24 = 0;
      }
      id v25 = v24;

      objc_opt_class();
      id v26 = v23;
      if (objc_opt_isKindOfClass()) {
        double v27 = v26;
      }
      else {
        double v27 = 0;
      }
      id v28 = v27;

      objc_opt_class();
      id v9 = v26;
      if (objc_opt_isKindOfClass()) {
        long long v29 = v9;
      }
      else {
        long long v29 = 0;
      }
      id v30 = v29;

      if (v16)
      {
        char isKindOfClass = 1;
      }
      else if (v19 | v22)
      {
        char isKindOfClass = 0;
      }
      else
      {
        char isKindOfClass = 1;
        if (!v25 && !v28 && !v30)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();
          }
        }
      }

      goto LABEL_35;
    }
    char isKindOfClass = 0;
  }
LABEL_36:

  return isKindOfClass & 1;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  id v5 = [(CNContactContentUnitaryViewController *)self _cardGroupAtTableViewSectionIndex:a4 forTableView:a3];
  if (![(CNContactContentUnitaryViewController *)self isEditing])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v10 = [(CNContactContentUnitaryViewController *)self contact];
      id v11 = [v10 mainStoreLinkedContacts];
      if ((unint64_t)[v11 count] >= 2)
      {

        goto LABEL_15;
      }
      char v12 = [(CNContactContentUnitaryViewController *)self isEditing];

      if (v12) {
        goto LABEL_16;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_16;
    }
    uint64_t v13 = [(CNContactContentUnitaryViewController *)self cardEditingDeleteContactGroup];
    if (v5 == (void *)v13)
    {

      goto LABEL_16;
    }
    char v10 = (void *)v13;
    uint64_t v14 = [(CNContactContentUnitaryViewController *)self cardShareLocationGroup];
    if (v5 != (void *)v14)
    {
      id v15 = (void *)v14;
      id v16 = [(CNContactContentUnitaryViewController *)self cardGameCenterActionGroup];

      if (v5 != v16)
      {
        char v9 = [v5 addSpacerFromPreviousGroup];
        goto LABEL_17;
      }
LABEL_16:
      char v9 = 1;
      goto LABEL_17;
    }

LABEL_15:
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_16;
  }
  id v6 = [(CNContactContentUnitaryViewController *)self nameEditingGroups];
  id v7 = [v6 firstObject];
  BOOL v8 = v5 != v7;

  char v9 = !v8;
LABEL_17:

  return v9 & 1;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(CNContactContentUnitaryViewController *)self _cardGroupAtTableViewSectionIndex:a4 forTableView:v6];
  if (-[CNContactContentUnitaryViewController isSharedProfileBannerSectionForTableView:section:](self, "isSharedProfileBannerSectionForTableView:section:", v6, a4)|| -[CNContactContentUnitaryViewController isPersonHeaderSectionForTableView:section:](self, "isPersonHeaderSectionForTableView:section:", v6, a4)|| (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)&& (-[CNContactContentUnitaryViewController nameEditingGroups](self, "nameEditingGroups"), BOOL v8 = objc_claimAutoreleasedReturnValue(), [v8 lastObject], v9 = objc_claimAutoreleasedReturnValue(), v9, v8, v7 != v9))
  {
    char v10 = 0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      id v12 = v7;
      if (objc_opt_isKindOfClass()) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = 0;
      }
      id v14 = v13;

      if ([v14 valueEditingItemsCount] >= 2)
      {
        id v15 = CNContactsUIBundle();
        char v10 = [v15 localizedStringForKey:@"ADDRESSING_GRAMMAR_CARD_GROUP_FOOTER" value:&stru_1ED8AC728 table:@"Localized"];
      }
      else
      {
        char v10 = &stru_1ED8AC728;
      }
    }
    else
    {
      char v10 = &stru_1ED8AC728;
    }
  }

  return v10;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if ([(CNContactContentUnitaryViewController *)self isSharedProfileBannerSectionForTableView:v6 section:a4]|| [(CNContactContentUnitaryViewController *)self isPersonHeaderSectionForTableView:v6 section:a4])
  {
    id v7 = 0;
    goto LABEL_16;
  }
  BOOL v8 = [(CNContactContentUnitaryViewController *)self _cardGroupAtTableViewSectionIndex:a4 forTableView:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v9 = [(CNContactContentUnitaryViewController *)self contact];
    char v10 = [v9 mainStoreLinkedContacts];
    if ((unint64_t)[v10 count] >= 2)
    {

      goto LABEL_9;
    }
    int v11 = [(CNContactContentUnitaryViewController *)self isEditing];

    if (v11) {
      goto LABEL_9;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v12 = [(CNContactContentUnitaryViewController *)self cardEditingDeleteContactGroup];
    if (v8 == v12)
    {
      uint64_t v13 = [(CNContactContentUnitaryViewController *)self ignoreContactAction];

      if (v13) {
        id v7 = &stru_1ED8AC728;
      }
      else {
        id v7 = 0;
      }
    }
    else
    {

      id v7 = 0;
    }
    goto LABEL_15;
  }
LABEL_9:
  id v7 = [v8 title];
LABEL_15:

LABEL_16:

  return v7;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  if ([(CNContactContentUnitaryViewController *)self shouldShowVerifiedFooterInSection:a4 inTableView:v6])
  {
    id v7 = (objc_class *)objc_opt_class();
    BOOL v8 = NSStringFromClass(v7);
    char v9 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:v8];

    char v10 = [(CNContactContentViewController *)self verifiedInfoMessage];
    [v9 setAttributedString:v10];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)shouldShowVerifiedFooterInSection:(int64_t)a3 inTableView:(id)a4
{
  id v6 = a4;
  if (([(CNContactContentUnitaryViewController *)self isEditing] & 1) != 0
    || ([(CNContactContentViewController *)self verifiedInfoMessage],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    BOOL v11 = 0;
  }
  else
  {
    BOOL v8 = [(CNContactContentUnitaryViewController *)self _cardGroupAtTableViewSectionIndex:a3 forTableView:v6];
    char v9 = [(CNContactContentUnitaryViewController *)self cardActionsGroup];
    if (v8 == v9)
    {
      BOOL v11 = [(CNContactContentUnitaryViewController *)self tableView:v6 shouldHaveFullLengthBottomSeparatorForSection:a3];
    }
    else
    {
      char v10 = [(CNContactContentUnitaryViewController *)self cardMedicalIDGroup];
      BOOL v11 = v8 == v10
         && ([v8 addSpacerFromPreviousGroup] & 1) == 0
         && [(CNContactContentUnitaryViewController *)self tableView:v6 shouldHaveFullLengthBottomSeparatorForSection:a3];
    }
  }

  return v11;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = (CNContactView *)a3;
  id v7 = v6;
  BOOL v8 = 0;
  if (!a4 && self->_editingContactView == v6)
  {
    uint64_t v9 = *MEMORY[0x1E4F5A298];
    char v10 = [(CNContactContentViewController *)self warningMessage];
    LOBYTE(v9) = (*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v10);

    if (v9)
    {
      BOOL v8 = 0;
    }
    else
    {
      BOOL v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      BOOL v8 = [(CNContactView *)v7 dequeueReusableHeaderFooterViewWithIdentifier:v12];

      uint64_t v13 = *MEMORY[0x1E4F5A258];
      id v14 = [(CNContactContentUnitaryViewController *)self mutableContact];
      uint64_t v15 = [v14 phoneNumbers];
      objc_msgSend(v8, "setShouldDisplayWarningIcon:", (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 16))(v13, v15));

      id v16 = [v8 warningText];
      id v17 = [(CNContactContentViewController *)self warningMessage];
      LOBYTE(v15) = [v16 isEqual:v17];

      if ((v15 & 1) == 0)
      {
        uint64_t v18 = [(CNContactContentViewController *)self warningMessage];
        [v8 setWarningText:v18];
      }
    }
  }

  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = (CNContactView *)a3;
  id v7 = [(CNContactContentUnitaryViewController *)self _cardGroupAtTableViewSectionIndex:a4 forTableView:v6];
  if (self->_editingContactView == v6)
  {
    id v12 = [(CNContactContentUnitaryViewController *)self editingGroups];
    uint64_t v13 = [v12 lastObject];

    if (v7 == v13)
    {
      double v11 = 35.0;
    }
    else
    {
      objc_opt_class();
      double v11 = 0.0;
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        id v14 = v7;
        if (objc_opt_isKindOfClass()) {
          uint64_t v15 = v14;
        }
        else {
          uint64_t v15 = 0;
        }
        id v16 = v15;

        if ([v16 valueEditingItemsCount] <= 1) {
          double v11 = 0.0;
        }
        else {
          double v11 = *MEMORY[0x1E4FB2F28];
        }
      }
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v8 = [(CNContactContentUnitaryViewController *)self contact];
      uint64_t v9 = [v8 mainStoreLinkedContacts];
      if ((unint64_t)[v9 count] <= 1)
      {
      }
      else
      {
        char v10 = [(CNContactContentUnitaryViewController *)self cardGroupMembershipGroup];

        if (!v10)
        {
          double v11 = 44.0;
          goto LABEL_24;
        }
      }
    }
    if ([(CNContactView *)v6 numberOfSections] - 1 == a4)
    {
      id v17 = [(CNContactContentUnitaryViewController *)self contact];
      uint64_t v18 = [v17 phonemeData];

      if (v18) {
        double v11 = 0.0;
      }
      else {
        double v11 = 44.0;
      }
    }
    else if ([(CNContactContentUnitaryViewController *)self shouldShowVerifiedFooterInSection:a4 inTableView:v6])
    {
      double v11 = *MEMORY[0x1E4FB2F28];
    }
    else
    {
      double v11 = 0.0;
    }
  }
LABEL_24:

  return v11;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = (CNContactView *)a3;
  id v7 = [(CNContactContentUnitaryViewController *)self _cardGroupAtTableViewSectionIndex:a4 forTableView:v6];
  BOOL v8 = [v7 title];

  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  int v10 = objc_opt_isKindOfClass();
  objc_opt_class();
  char v11 = objc_opt_isKindOfClass();
  id v12 = +[CNContactStyle currentStyle];
  int v13 = [v12 usesInsetPlatterStyle];

  editingContactView = self->_editingContactView;
  double v15 = 0.0;
  if (!v13 || (editingContactView != v6 ? (BOOL v16 = (v13 & (isKindOfClass | v10)) == 0) : (BOOL v16 = 0), !v16))
  {
    if (editingContactView == v6)
    {
      if (v8) {
        goto LABEL_18;
      }
      if ((v11 & 1) != 0
        && ([(CNContactContentUnitaryViewController *)self nameEditingGroups],
            id v26 = objc_claimAutoreleasedReturnValue(),
            int v27 = [v26 containsObject:v7],
            v26,
            v27))
      {
        if (!a4)
        {
          uint64_t v28 = *MEMORY[0x1E4F5A298];
          long long v29 = [(CNContactContentViewController *)self warningMessage];
          LODWORD(v28) = (*(uint64_t (**)(uint64_t, void *))(v28 + 16))(v28, v29);

          if (v28) {
            double v15 = 0.0;
          }
          else {
            double v15 = *MEMORY[0x1E4FB2F28];
          }
        }
      }
      else
      {
        double v15 = 44.0;
      }
    }
    else
    {
      if (v8)
      {
        if (isKindOfClass)
        {
          id v17 = [(CNContactContentUnitaryViewController *)self contact];
          uint64_t v18 = [v17 mainStoreLinkedContacts];
          unint64_t v19 = [v18 count];

          if (v19 >= 2) {
            goto LABEL_18;
          }
        }
        if (v10)
        {
          id v20 = [(CNContactContentUnitaryViewController *)self cardGroupMembershipGroup];
          BOOL v21 = [v20 parentGroups];
          uint64_t v22 = [v21 count];

          if (!v22)
          {
            double v15 = 55.0;
            goto LABEL_27;
          }
LABEL_18:
          double v24 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
          [v24 _scaledValueForValue:44.0];
          double v15 = v25 + 15.0;

          goto LABEL_27;
        }
      }
      id v23 = [(CNContactContentUnitaryViewController *)self cardShareLocationGroup];

      if (v7 == v23)
      {
        double v15 = 55.0;
      }
      else if (((a4 != 1) & [v7 addSpacerFromPreviousGroup]) != 0)
      {
        double v15 = 55.0;
      }
      else
      {
        double v15 = 0.0;
      }
    }
  }
LABEL_27:

  return v15;
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 section];
  uint64_t v12 = [v10 section];
  int v13 = v9;
  if (v11 == v12)
  {
    objc_opt_class();
    id v14 = -[CNContactContentUnitaryViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", [v9 section], v8);
    if (objc_opt_isKindOfClass()) {
      double v15 = v14;
    }
    else {
      double v15 = 0;
    }
    id v16 = v15;

    uint64_t v17 = [v10 row];
    uint64_t v18 = [v16 valueEditingItemsCount];

    if (v17 >= v18) {
      int v13 = v9;
    }
    else {
      int v13 = v10;
    }
  }
  id v19 = v13;

  return v19;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  objc_opt_class();
  uint64_t v11 = -[CNContactContentUnitaryViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", [v9 section], v10);

  if (objc_opt_isKindOfClass()) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  id v15 = v12;

  uint64_t v13 = [v9 row];
  uint64_t v14 = [v8 row];

  [v15 moveEditingItemFromIndex:v13 toIndex:v14];
  [(CNContactContentUnitaryViewController *)self updateDoneButton];
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v6 = a4;
  if (self->_editingContactView == a3)
  {
    id v8 = a3;
    objc_opt_class();
    id v9 = -[CNContactContentUnitaryViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", [v6 section], v8);

    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;

    if (v11)
    {
      objc_opt_class();
      uint64_t v12 = [v11 editingItems];
      uint64_t v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
      if (objc_opt_isKindOfClass()) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = 0;
      }
      id v15 = v14;

      BOOL v7 = v15 && [v15 canReorder] && objc_msgSend(v11, "valueEditingItemsCount") > 1;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v28 = a3;
  id v6 = a4;
  if (![(CNContactContentUnitaryViewController *)self isPersonHeaderIndexPath:v6 forTableView:v28]&& ![(CNContactContentUnitaryViewController *)self isSharedProfileBannerSectionIndexPath:v6 forTableView:v28])
  {
    BOOL v7 = [v28 cellForRowAtIndexPath:v6];
    if ([(CNContactContentUnitaryViewController *)self _indexPathIsActionItem:v6 forTableView:v28])
    {
      id v8 = [(CNContactContentUnitaryViewController *)self _itemAtIndexPath:v6 forTableView:v28];
      id v9 = [v8 actions];
      id v10 = [v9 objectAtIndexedSubscript:0];

      [v10 performActionWithSender:v7];
      id v11 = [v28 indexPathForSelectedRow];
      [v28 deselectRowAtIndexPath:v11 animated:1];
    }
    else if (objc_opt_respondsToSelector())
    {
      if ([(CNContactContentUnitaryViewController *)self isEditing]
        && [v7 isMemberOfClass:objc_opt_class()])
      {
        [v28 deselectRowAtIndexPath:v6 animated:1];
        objc_opt_class();
        id v12 = v7;
        if (objc_opt_isKindOfClass()) {
          uint64_t v13 = v12;
        }
        else {
          uint64_t v13 = 0;
        }
        id v14 = v13;

        objc_opt_class();
        id v15 = [v14 cardGroupItem];
        if (objc_opt_isKindOfClass()) {
          id v16 = v15;
        }
        else {
          id v16 = 0;
        }
        id v17 = v16;

        uint64_t v18 = [v17 property];
        int v19 = [v18 isEqualToString:*MEMORY[0x1E4F1AD88]];

        if (v19)
        {
          id v20 = [(CNContactContentUnitaryViewController *)self addAddressingGrammarAction];
          [v20 setIndexPath:v6];

          BOOL v21 = [(CNContactContentUnitaryViewController *)self addAddressingGrammarAction];
          [v21 performActionWithSender:v14];
        }
        else
        {
          [(CNContactContentUnitaryViewController *)self addEditingItemAtIndexPath:v6 forTableView:v28];
        }
      }
      else
      {
        BOOL v22 = ([v7 shouldPerformDefaultAction] & 1) != 0
           || [(CNContactContentViewController *)self allowsPropertyActions];
        if (([(CNContactContentUnitaryViewController *)self isEditing] & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && ([v7 isSuggested] & 1) == 0)
          {
            id v23 = [(CNContactContentUnitaryViewController *)self _itemAtIndexPath:v6 forTableView:v28];
            double v24 = [v23 contact];
            double v25 = [v23 property];
            id v26 = [v23 labeledValue];
            int v27 = [v26 identifier];
            BOOL v22 = [(CNContactContentUnitaryViewController *)self contactViewController:self shouldPerformDefaultActionForContact:v24 propertyKey:v25 propertyIdentifier:v27];
          }
        }
        if (([(CNContactContentUnitaryViewController *)self isEditing] & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [(CNContactContentUnitaryViewController *)self _pickName];
          }
        }
        if (v22) {
          [v7 performDefaultAction];
        }
        [v28 deselectRowAtIndexPath:v6 animated:1];
      }
    }
  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 cellForRowAtIndexPath:v7];
  objc_opt_class();
  id v9 = v8;
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  if (v11
    && (([v11 forceSuggested] & 1) != 0 || !objc_msgSend(v11, "allowsCellSelection")))
  {
    char v16 = 0;
  }
  else
  {
    id v12 = -[CNContactContentUnitaryViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", [v7 section], v6);
    uint64_t v13 = [(CNContactContentUnitaryViewController *)self cardGameCenterActionGroup];
    if ([v12 isEqual:v13])
    {
      id v14 = [(CNContactContentUnitaryViewController *)self gameCenterManager];
      char v15 = [v14 hasSentInvite];

      char v16 = v15 ^ 1;
    }
    else
    {

      char v16 = 1;
    }
  }

  return v16;
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  if ([(CNContactContentUnitaryViewController *)self isPersonHeaderIndexPath:a5 forTableView:a3])
  {
    [(CNContactContentUnitaryViewController *)self removePersonHeaderViewControllerFromHierarchy];
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v23 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([(CNContactContentUnitaryViewController *)self isPersonHeaderIndexPath:v9 forTableView:v23])
  {
    id v10 = [(CNContactContentUnitaryViewController *)self personHeaderViewController];
    [v10 didMoveToParentViewController:self];
  }
  objc_opt_class();
  id v11 = v8;
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  objc_opt_class();
  id v14 = -[CNContactContentUnitaryViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", [v9 section], v23);
  if (objc_opt_isKindOfClass()) {
    char v15 = v14;
  }
  else {
    char v15 = 0;
  }
  id v16 = v15;

  if (v13)
  {
    uint64_t v17 = [v9 row];
    uint64_t v18 = objc_msgSend(v23, "numberOfRowsInSection:", objc_msgSend(v9, "section"));
    if (v16
      && v17 < v18 - 1
      && ([(CNContactContentUnitaryViewController *)self displayContactView],
          id v19 = (id)objc_claimAutoreleasedReturnValue(),
          v19,
          v19 == v23))
    {
      id v20 = [(CNContactContentUnitaryViewController *)self environment];
      objc_msgSend(v13, "setShowSeparator:", objc_msgSend(v20, "runningInContactsAppOniPad"));
    }
    else
    {
      [v13 setShowSeparator:1];
    }
  }
  id v21 = [(CNContactContentUnitaryViewController *)self editingContactView];

  if (v21 == v23)
  {
    BOOL v22 = [(CNContactContentUnitaryViewController *)self editingContactView];
    [v22 separatorInsetForCell:v11];
    objc_msgSend(v11, "setSeparatorInset:");
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  [a3 rowHeight];
  return result;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 section];
  id v8 = [(CNContactContentUnitaryViewController *)self cardActionsGroup];
  int64_t v9 = [(CNContactContentUnitaryViewController *)self sectionOfGroup:v8 inTableView:v6];

  if (v7 == v9)
  {
    double v10 = 150.0;
  }
  else
  {
    [v6 estimatedRowHeight];
    double v10 = v11;
  }

  return v10;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v23 = a3;
  id v8 = a5;
  if (![(CNContactContentUnitaryViewController *)self isPersonHeaderIndexPath:v8 forTableView:v23]&& ![(CNContactContentUnitaryViewController *)self isSharedProfileBannerSectionIndexPath:v8 forTableView:v23])
  {
    int64_t v9 = -[CNContactContentUnitaryViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", [v8 section], v23);
    double v10 = [v9 editingItems];
    double v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));

    if (a4 != 2)
    {
      if (a4 != 1)
      {
LABEL_17:
        [(CNContactContentUnitaryViewController *)self updateDoneButton];

        goto LABEL_18;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = [v11 contact];
        [(CNContactContentUnitaryViewController *)self removeLinkedContact:v12];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          [(CNContactContentUnitaryViewController *)self removeEditingItem:v11 atIndexPath:v8 forTableView:v23];
          goto LABEL_17;
        }
        id v12 = [v11 group];
        if (v12) {
          [(CNContactContentUnitaryViewController *)self removeContactFromGroup:v12];
        }
      }
LABEL_16:

      goto LABEL_17;
    }
    id v12 = [v23 cellForRowAtIndexPath:v8];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = [(CNContactContentUnitaryViewController *)self addLinkedCardAction];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v16 = [v11 property];
          int v17 = [v16 isEqualToString:*MEMORY[0x1E4F1AD88]];

          if (v17)
          {
            objc_opt_class();
            uint64_t v18 = [v23 cellForRowAtIndexPath:v8];
            if (objc_opt_isKindOfClass()) {
              id v19 = v18;
            }
            else {
              id v19 = 0;
            }
            id v20 = v19;

            id v21 = [(CNContactContentUnitaryViewController *)self addAddressingGrammarAction];
            [v21 setIndexPath:v8];

            BOOL v22 = [(CNContactContentUnitaryViewController *)self addAddressingGrammarAction];
            [v22 performActionWithSender:v20];
          }
          else
          {
            [(CNContactContentUnitaryViewController *)self addEditingItemAtIndexPath:v8 forTableView:v23];
          }
          goto LABEL_16;
        }
        id v14 = [(CNContactContentUnitaryViewController *)self actionProvider];
        char v15 = [v14 addStaticIdentityAction];
        [v15 performActionWithSender:v12];

        goto LABEL_15;
      }
      id v13 = [(CNContactContentUnitaryViewController *)self addToGroupAction];
    }
    id v14 = v13;
    [v13 performActionWithSender:v12];
LABEL_15:

    goto LABEL_16;
  }
LABEL_18:
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(CNContactContentUnitaryViewController *)self isPersonHeaderIndexPath:v8 forTableView:v7])
  {
    uint64_t v9 = [(CNContactContentUnitaryViewController *)self personHeaderCellForTableView:v7];
LABEL_5:
    double v10 = (void *)v9;
    goto LABEL_21;
  }
  if ([(CNContactContentUnitaryViewController *)self isSharedProfileBannerSectionIndexPath:v8 forTableView:v7])
  {
    uint64_t v9 = [(CNContactContentUnitaryViewController *)self sharedProfileBannerSectionCellForTableView:v7];
    goto LABEL_5;
  }
  double v11 = -[CNContactContentUnitaryViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", [v8 section], v7);
  if ([(CNContactContentUnitaryViewController *)self _indexPathIsActionItem:v8 forTableView:v7]|| [(CNContactContentUnitaryViewController *)self isStandardGroup:v11])
  {
    double v10 = [(CNContactContentUnitaryViewController *)self _cellForIndexPath:v8 forTableView:v7];
  }
  else
  {
    double v10 = 0;
  }
  [(CNContactContentUnitaryViewController *)self _updateLabelWidthForCell:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(CNContactContentUnitaryViewController *)self prepareCell:v10];
  }
  id v12 = [(CNContactContentUnitaryViewController *)self cardGameCenterActionGroup];
  if (![v11 isEqual:v12]) {
    goto LABEL_19;
  }
  id v13 = [(CNContactContentUnitaryViewController *)self gameCenterManager];
  int v14 = [v13 hasSentInvite];

  if (v14)
  {
    objc_opt_class();
    id v15 = v10;
    if (objc_opt_isKindOfClass()) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }
    id v12 = v16;

    if (v12)
    {
      int v17 = [v12 labelTextAttributes];
      uint64_t v18 = (void *)[v17 mutableCopy];

      id v19 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
      [v18 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4FB0700]];

      [v12 setLabelTextAttributes:v18];
    }
LABEL_19:
  }
LABEL_21:
  id v20 = [(CNContactContentUnitaryViewController *)self displayContactView];
  if (v20 == v7)
  {
    id v21 = [(CNContactContentUnitaryViewController *)self environment];
    int v22 = [v21 runningInContactsAppOniPad];

    if (!v22) {
      goto LABEL_25;
    }
    id v20 = +[CNUIColorRepository contactCardBackgroundiPadOverwriteColor];
    [v10 setBackgroundColor:v20];
  }

LABEL_25:
  if (!v10)
  {
    double v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"CNContactContentUnitaryViewController.m" lineNumber:3986 description:@"We have no cell to return!"];
  }

  return v10;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = (CNContactView *)a3;
  if ([(CNContactContentUnitaryViewController *)self isSharedProfileBannerSectionForTableView:v6 section:a4]|| [(CNContactContentUnitaryViewController *)self isPersonHeaderSectionForTableView:v6 section:a4])
  {
    int64_t v7 = 1;
  }
  else
  {
    id v8 = [(CNContactContentUnitaryViewController *)self _cardGroupAtTableViewSectionIndex:a4 forTableView:v6];
    if ([(CNContactContentUnitaryViewController *)self isStandardGroup:v8])
    {
      if (self->_editingContactView == v6) {
        [v8 editingItems];
      }
      else {
      uint64_t v9 = [v8 displayItems];
      }
    }
    else
    {
      uint64_t v9 = [v8 actionItems];
    }
    double v10 = v9;
    int64_t v7 = [v9 count];
  }
  return v7;
}

- (BOOL)isStandardGroup:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_13:
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactContentUnitaryViewController *)self _currentGroupsForTableView:v4];
  uint64_t v6 = [v5 count];
  int64_t v7 = [(CNContactContentUnitaryViewController *)self additionalTopSectionsCountForTableView:v4];

  return v7 + v6;
}

- (void)didChangeToShowTitle:(BOOL)a3
{
  [(CNContactContentUnitaryViewController *)self setLayoutPositionallyAfterNavBar:a3];
  if ([(CNContactContentUnitaryViewController *)self shouldUseStaticHeader])
  {
    id v4 = [(CNContactContentUnitaryViewController *)self staticDisplayHeaderView];
    objc_msgSend(v4, "updateForShowingNavBar:", -[CNContactContentUnitaryViewController layoutPositionallyAfterNavBar](self, "layoutPositionallyAfterNavBar"));

    [(CNContactContentUnitaryViewController *)self displayFloatingCollapsedHeaderView];
  }
  else
  {
    [(CNContactContentUnitaryViewController *)self displayHeaderView];
  id v5 = };
  objc_msgSend(v5, "updateForShowingNavBar:", -[CNContactContentUnitaryViewController layoutPositionallyAfterNavBar](self, "layoutPositionallyAfterNavBar"));

  id v6 = [(CNContactContentUnitaryViewController *)self editingHeaderView];
  objc_msgSend(v6, "updateForShowingNavBar:", -[CNContactContentUnitaryViewController layoutPositionallyAfterNavBar](self, "layoutPositionallyAfterNavBar"));
}

- (void)editCancel
{
}

- (void)didChangeToEditMode:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CNContactContentUnitaryViewController *)self isEditing] != a3)
  {
    [(CNContactContentUnitaryViewController *)self setEditing:v3 animated:0];
  }
}

- (void)setupWithOptions:(id)a3 readyBlock:(id)a4
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int64_t v7 = (void (**)(id, void))a4;
  id v8 = CNUILogContactCard();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_debug_impl(&dword_18B625000, v8, OS_LOG_TYPE_DEBUG, "setupWithOptions: %@", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v9 = [v6 objectForKeyedSubscript:@"Properties"];
  if ([(CNContactContentUnitaryViewController *)self isOutOfProcess])
  {
    [(CNContactContentUnitaryViewController *)self setOutOfProcessSetupComplete:0];
    if ([MEMORY[0x1E4F1B8F8] suggestionsEnabled]) {
      uint64_t v10 = 3;
    }
    else {
      uint64_t v10 = 1;
    }
    double v11 = [(CNContactContentUnitaryViewController *)self managedConfiguration];

    if (v11)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F1B980]);
      id v13 = [(CNContactContentUnitaryViewController *)self environment];
      int v14 = [v13 cnEnvironment];
      id v15 = [(CNContactContentUnitaryViewController *)self managedConfiguration];
      id v16 = (void *)[v12 initWithEnvironment:v14 options:v10 managedConfiguration:v15];
      [(CNContactContentUnitaryViewController *)self setContactStore:v16];
    }
    else
    {
      id v13 = [MEMORY[0x1E4F1B980] storeWithOptions:v10];
      [(CNContactContentUnitaryViewController *)self setContactStore:v13];
    }
  }
  int v17 = [v9 objectForKeyedSubscript:@"showContactPhotoPosterCell"];
  -[CNContactContentUnitaryViewController setShowContactPhotoPosterCell:](self, "setShowContactPhotoPosterCell:", [v17 BOOLValue]);

  uint64_t v18 = [v9 objectForKeyedSubscript:@"runningPPT"];
  -[CNContactContentUnitaryViewController setRunningPPT:](self, "setRunningPPT:", [v18 BOOLValue]);

  id v19 = [v9 objectForKeyedSubscript:@"showingMeContact"];
  -[CNContactContentUnitaryViewController setShowingMeContact:](self, "setShowingMeContact:", [v19 BOOLValue]);

  id v20 = [v6 objectForKeyedSubscript:@"ignoresParentalRestrictions"];
  -[CNContactContentViewController setIgnoresParentalRestrictions:](self, "setIgnoresParentalRestrictions:", [v20 BOOLValue]);

  id v21 = [v6 objectForKeyedSubscript:@"prohibitedPropertyKeys"];
  [(CNContactContentUnitaryViewController *)self setProhibitedPropertyKeys:v21];

  int v22 = [v9 objectForKeyedSubscript:@"warningMessage"];
  [(CNContactContentViewController *)self setWarningMessage:v22];

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  *(void *)&long long buf = @"allowsDeletion";
  *((void *)&buf + 1) = @"allowsCardActions";
  id v63 = @"alwaysEditing";
  id v64 = @"personHeaderView";
  v65 = @"allowsActions";
  uint64_t v66 = @"verifiedInfoMessage";
  uint64_t v67 = @"allowsEditInApp";
  id v68 = @"shouldShowLinkedContacts";
  v69 = @"parentContainer";
  id v70 = @"layoutPositionallyAfterNavBar";
  id v71 = @"mode";
  uint64_t v72 = @"allowsDisplayModePickerActions";
  id v73 = @"allowsAddToFavorites";
  uint64_t v74 = @"ignoresParentalRestrictions";
  char v75 = @"parentGroup";
  uint64_t v76 = @"primaryProperty";
  v77 = @"allowsAddingToAddressBook";
  char v78 = @"alternateName";
  uint64_t v79 = @"allowsEditPhoto";
  int v80 = @"allowsNamePicking";
  unsigned int v81 = @"showsInlineActions";
  unsigned int v82 = @"showsSharedProfile";
  char v83 = @"showsGroupMembership";
  id v84 = @"displayedProperties";
  long long v85 = @"editingProposedInformation";
  long long v86 = @"originalContacts";
  long long v87 = @"allowsContactBlocking";
  long long v88 = @"allowsContactBlockingAndReporting";
  v89 = @"allowsSharing";
  v90 = @"highlightedProperties";
  uint64_t v91 = @"allowsConferencing";
  v92 = @"recentsData";
  v93 = @"showingMeContact";
  v94 = @"runningPPT";
  v95 = @"importantMessage";
  v96 = @"allowsEditing";
  v97 = @"personHeaderViewController";
  v98 = @"personHeaderViewDelegate";
  v99 = @"shouldDrawNavigationBar";
  v100 = @"forcesTransparentBackground";
  v101 = @"usesBrandedCallHeaderFormat";
  v102 = @"shouldShowSharedProfileBanner";
  v103 = @"message";
  v104 = @"contact";
  id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&buf count:44];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v57 objects:v61 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v58 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void *)(*((void *)&v57 + 1) + 8 * i);
        long long v29 = [v9 objectForKeyedSubscript:v28];
        if (v29) {
          [(CNContactContentUnitaryViewController *)self setValue:v29 forKey:v28];
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v57 objects:v61 count:16];
    }
    while (v25);
  }

  if ([(CNContactContentUnitaryViewController *)self isHeaderViewPhotoProhibited]) {
    [(CNContactContentUnitaryViewController *)self setAllowsEditPhoto:0];
  }
  id v30 = [v9 objectForKeyedSubscript:@"forcesTransparentBackground"];
  self->_forcesTransparentBackground = [v30 BOOLValue];

  double v31 = [v9 objectForKeyedSubscript:@"usesBrandedCallHeaderFormat"];
  -[CNContactContentUnitaryViewController setUsesBrandedCallHeaderFormat:](self, "setUsesBrandedCallHeaderFormat:", [v31 BOOLValue]);

  double v32 = [v9 objectForKeyedSubscript:@"highlightedPropertyImportant"];
  -[CNContactContentUnitaryViewController setHighlightedPropertyImportant:](self, "setHighlightedPropertyImportant:", [v32 BOOLValue]);

  double v33 = [v9 objectForKeyedSubscript:@"shouldShowSharedProfileBanner"];
  -[CNContactContentUnitaryViewController setShouldShowSharedProfileBanner:](self, "setShouldShowSharedProfileBanner:", [v33 BOOLValue]);

  if ([(CNContactContentViewController *)self alwaysEditing]
    || ([v9 objectForKeyedSubscript:@"isEditing"],
        double v34 = objc_claimAutoreleasedReturnValue(),
        int v35 = [v34 BOOLValue],
        v34,
        v35))
  {
    [(CNContactContentUnitaryViewController *)self setEditing:1 animated:0];
  }
  double v36 = [v9 objectForKeyedSubscript:@"mainScreenPeripheryInsets"];
  if ([(CNContactContentUnitaryViewController *)self isOutOfProcess]
    && ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))() & 1) == 0)
  {
    self->_peripheryInsets = UIEdgeInsetsFromString(v36);
  }
  if ([(CNContactContentUnitaryViewController *)self isEditing])
  {
    double v37 = [(CNContactContentUnitaryViewController *)self cardStaticIdentityGroup];

    if (v37)
    {
      id v38 = [v9 objectForKeyedSubscript:@"staticIdentity"];
      uint64_t v39 = v38;
      if (v38 && [v38 length])
      {
        [(CNContactContentUnitaryViewController *)self addStaticIdentity:v39];
        [(CNContactContentUnitaryViewController *)self setDidLookUpStaticIdentity:1];
        id v40 = [(CNContactContentUnitaryViewController *)self cardStaticIdentityGroup];
        [v40 addIdentity:v39 isNew:0];

        dispatch_time_t v41 = dispatch_time(0, 400000000);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __69__CNContactContentUnitaryViewController_setupWithOptions_readyBlock___block_invoke;
        block[3] = &unk_1E549B488;
        void block[4] = self;
        dispatch_after(v41, MEMORY[0x1E4F14428], block);
      }
    }
    if (![(CNContactContentUnitaryViewController *)self didLookUpStaticIdentity]) {
      [(CNContactContentUnitaryViewController *)self _lookupStaticIdentity];
    }
  }
  if ([(CNContactContentUnitaryViewController *)self isOutOfProcess])
  {
    [(CNContactContentUnitaryViewController *)self setOutOfProcessSetupComplete:1];
    [(CNContactContentUnitaryViewController *)self setNeedsReloadLazy];
    [(CNContactContentUnitaryViewController *)self reloadDataIfNeeded];
    if ([(CNContactContentUnitaryViewController *)self shouldUseStaticHeader])
    {
      id v42 = [(CNContactContentUnitaryViewController *)self staticDisplayHeaderView];
      objc_msgSend(v42, "updateForShowingNavBar:", -[CNContactContentUnitaryViewController layoutPositionallyAfterNavBar](self, "layoutPositionallyAfterNavBar"));

      id v43 = [(CNContactContentUnitaryViewController *)self staticDisplayHeaderView];
      uint64_t v44 = [(CNContactContentUnitaryViewController *)self mutableContactForHeaderView];
      [v43 updateWithNewContact:v44];

      uint64_t v45 = [(CNContactContentUnitaryViewController *)self displayFloatingCollapsedHeaderView];
      objc_msgSend(v45, "updateForShowingNavBar:", -[CNContactContentUnitaryViewController layoutPositionallyAfterNavBar](self, "layoutPositionallyAfterNavBar"));

      [(CNContactContentUnitaryViewController *)self displayFloatingCollapsedHeaderView];
    }
    else
    {
      id v46 = [(CNContactContentUnitaryViewController *)self displayHeaderView];
      objc_msgSend(v46, "updateForShowingNavBar:", -[CNContactContentUnitaryViewController layoutPositionallyAfterNavBar](self, "layoutPositionallyAfterNavBar"));

      [(CNContactContentUnitaryViewController *)self displayHeaderView];
    uint64_t v47 = };
    CGRect v48 = [(CNContactContentUnitaryViewController *)self mutableContactForHeaderView];
    [v47 updateWithNewContact:v48];

    BOOL v49 = [(CNContactContentUnitaryViewController *)self shouldShowGemini];
    if ([(CNContactContentUnitaryViewController *)self shouldUseStaticHeader]) {
      [(CNContactContentUnitaryViewController *)self staticDisplayHeaderView];
    }
    else {
    dispatch_time_t v50 = [(CNContactContentUnitaryViewController *)self displayHeaderView];
    }
    [v50 setShouldShowGemini:v49];

    [(CNContactContentUnitaryViewController *)self createCardEditingGeminiGroupIfNeeded];
    long long v51 = [(CNContactContentUnitaryViewController *)self cardEditingGeminiGroup];
    [v51 setShouldShowGemini:v49];

    if (self->_editingHeaderView)
    {
      long long v52 = [(CNContactContentUnitaryViewController *)self editingHeaderView];
      objc_msgSend(v52, "updateForShowingNavBar:", -[CNContactContentUnitaryViewController layoutPositionallyAfterNavBar](self, "layoutPositionallyAfterNavBar"));

      long long v53 = [(CNContactContentUnitaryViewController *)self editingHeaderView];
      id v54 = [(CNContactContentUnitaryViewController *)self mutableContactForHeaderView];
      [v53 updateWithNewContact:v54];
    }
    [(CNContactContentUnitaryViewController *)self updateEditNavigationItemsAnimated:0];
    id v55 = [(CNContactContentUnitaryViewController *)self applyContactStyle];
  }
  if (v7) {
    v7[2](v7, 0);
  }
}

void __69__CNContactContentUnitaryViewController_setupWithOptions_readyBlock___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [v2 editingContactView];
  BOOL v3 = [*(id *)(a1 + 32) cardStaticIdentityGroup];
  [v2 _scrollContactView:v4 toVisibleGroup:v3 animated:1];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)updateEditPhotoButtonIfNeeded
{
  if ([(CNContactContentUnitaryViewController *)self isHeaderViewPhotoProhibited])
  {
    if (![(CNContactContentUnitaryViewController *)self allowsEditPhoto]) {
      return;
    }
    BOOL v3 = 0;
  }
  else
  {
    id v4 = [(CNContactContentUnitaryViewController *)self view];
    id v5 = [(CNContactContentUnitaryViewController *)self traitCollection];
    BOOL v3 = +[CNVisualIdentityPickerViewController canShowPhotoPickerForView:v4 withTraitCollection:v5];

    if (v3 == [(CNContactContentUnitaryViewController *)self allowsEditPhoto]) {
      return;
    }
  }

  [(CNContactContentUnitaryViewController *)self setAllowsEditPhoto:v3 preservingChanges:1];
}

- (void)setupTableFooterView
{
  if (([(CNContactContentUnitaryViewController *)self isEditing] & 1) != 0
    || ([(CNContactContentUnitaryViewController *)self contact],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        [v3 phonemeData],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v4))
  {
    id v19 = [(CNContactContentUnitaryViewController *)self contactView];
    [(CNContactViewFooterView *)v19 setTableFooterView:0];
  }
  else
  {
    objc_opt_class();
    id v5 = [(CNContactContentUnitaryViewController *)self contactView];
    id v19 = [v5 tableFooterView];
    if (objc_opt_isKindOfClass()) {
      id v6 = v19;
    }
    else {
      id v6 = 0;
    }
    int64_t v7 = v6;

    if (!v7)
    {
      id v19 = objc_alloc_init(CNContactViewFooterView);
      id v8 = [(CNContactContentUnitaryViewController *)self contactView];
      [v8 setTableFooterView:v19];
    }
    uint64_t v9 = [(CNContactContentUnitaryViewController *)self contact];
    [(CNContactViewFooterView *)v19 setContact:v9];

    uint64_t v10 = [(CNContactViewFooterView *)v19 label];
    double v11 = [(CNContactContentUnitaryViewController *)self view];
    [v11 bounds];
    double v13 = v12;
    int v14 = [(CNContactContentUnitaryViewController *)self view];
    [v14 layoutMargins];
    double v16 = v13 - v15;
    int v17 = [(CNContactContentUnitaryViewController *)self view];
    [v17 layoutMargins];
    objc_msgSend(v10, "sizeThatFits:", v16 - v18, 1.79769313e308);

    [(CNContactViewFooterView *)v19 frame];
    -[CNContactViewFooterView setFrame:](v19, "setFrame:");
  }
}

- (CGSize)setupTableHeaderView
{
  if ([(CNContactContentUnitaryViewController *)self shouldDisplayAvatarHeaderView])
  {
    if ([(CNContactContentUnitaryViewController *)self shouldUseStaticHeader])
    {
      uint64_t v3 = [(CNContactContentUnitaryViewController *)self contactHeaderView];
LABEL_9:
      int64_t v7 = (void *)v3;
      goto LABEL_11;
    }
    if (([(CNContactContentUnitaryViewController *)self isEditing] & 1) == 0
      && objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory"))
    {
      id v8 = [(CNContactContentUnitaryViewController *)self contactHeaderView];
      uint64_t v9 = [v8 backgroundColor];
      uint64_t v10 = [(CNContactContentUnitaryViewController *)self actionsViewController];
      double v11 = [v10 view];
      [v11 setBackgroundColor:v9];

      uint64_t v3 = [(CNContactContentUnitaryViewController *)self actionsWrapperView];
      goto LABEL_9;
    }
  }
  else
  {
    id v4 = [(CNContactContentUnitaryViewController *)self contactView];
    id v5 = [v4 customHeaderView];

    if (v5)
    {
      id v6 = [(CNContactContentUnitaryViewController *)self contactView];
      int64_t v7 = [v6 customHeaderView];

      goto LABEL_11;
    }
  }
  int64_t v7 = 0;
LABEL_11:
  double v12 = [(CNContactContentUnitaryViewController *)self contactView];
  double v13 = [v12 tableHeaderView];
  char v14 = [v13 needsUpdateConstraints];

  if (v7)
  {
    [v7 frame];
    double v16 = v15;
    double v18 = v17;
  }
  else
  {
    double v16 = *MEMORY[0x1E4F1DB30];
    double v18 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  id v19 = [(CNContactContentUnitaryViewController *)self contactView];
  [v19 setTableHeaderView:v7];

  if ((v14 & 1) == 0)
  {
    id v20 = [(CNContactContentUnitaryViewController *)self contactView];
    id v21 = [v20 tableHeaderView];
    int v22 = [v21 needsUpdateConstraints];

    if (v22)
    {
      id v23 = [(CNContactContentUnitaryViewController *)self contactView];
      uint64_t v24 = [v23 tableHeaderView];
      [v24 updateConstraints];
    }
  }

  double v25 = v16;
  double v26 = v18;
  result.CGFloat height = v26;
  result.double width = v25;
  return result;
}

- (void)performWhenViewIsLaidOut:(id)a3
{
  id v4 = a3;
  id v8 = [(CNContactContentUnitaryViewController *)self pendingLayoutBlocks];
  id v5 = (void *)[v4 copy];

  id v6 = _Block_copy(v5);
  int64_t v7 = [v8 arrayByAddingObject:v6];
  [(CNContactContentUnitaryViewController *)self setPendingLayoutBlocks:v7];
}

- (void)viewDidLayoutSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)CNContactContentUnitaryViewController;
  [(CNContactContentUnitaryViewController *)&v33 viewDidLayoutSubviews];
  [(CNContactContentUnitaryViewController *)self _updateCachedLabelWidthsIfNeeded];
  [(CNContactContentUnitaryViewController *)self setupTableHeaderView];
  double v4 = v3;
  double v6 = v5;
  [(CNContactContentUnitaryViewController *)self initializeTableViewsForHeaderHeight];
  [(CNContactContentUnitaryViewController *)self adjustPreferredContentSize];
  int64_t v7 = [(CNContactContentUnitaryViewController *)self contactView];
  id v8 = [v7 tableHeaderView];

  if (v8)
  {
    [v8 frame];
    if (v4 != v10 || v6 != v9)
    {
      double v11 = [(CNContactContentUnitaryViewController *)self contactView];
      [v11 setTableHeaderView:v8];
    }
  }
  [(CNContactContentUnitaryViewController *)self setupTableFooterView];
  [(CNContactContentUnitaryViewController *)self focusOnFirstEditingItemIfNeeded];
  if ([(CNContactContentUnitaryViewController *)self shouldUseStaticHeader])
  {
    double v12 = [(CNContactContentUnitaryViewController *)self displayContactView];
    [v12 frame];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    id v21 = [(CNContactContentUnitaryViewController *)self contactViewBackgroundGradientLayer];
    objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

    int v22 = [(CNContactContentUnitaryViewController *)self displayContactView];
    [v22 frame];
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    double v31 = [(CNContactContentUnitaryViewController *)self contactViewBackgroundView];
    objc_msgSend(v31, "setFrame:", v24, v26, v28, v30);
  }
  double v32 = [(CNContactContentUnitaryViewController *)self pendingLayoutBlocks];
  [v32 enumerateObjectsUsingBlock:&__block_literal_global_515];

  [(CNContactContentUnitaryViewController *)self setPendingLayoutBlocks:MEMORY[0x1E4F1CBF0]];
}

uint64_t __62__CNContactContentUnitaryViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (void)viewWillLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)CNContactContentUnitaryViewController;
  [(CNContactContentUnitaryViewController *)&v8 viewWillLayoutSubviews];
  double v3 = [(CNContactContentUnitaryViewController *)self contactHeaderView];
  [v3 calculateLabelSizesIfNeeded];

  if ([(CNContactContentUnitaryViewController *)self shouldUseStaticHeader])
  {
    double v4 = [(CNContactContentUnitaryViewController *)self displayFloatingCollapsedHeaderView];
    [v4 calculateLabelSizesIfNeeded];
  }
  [(CNContactContentUnitaryViewController *)self updateOutOfProcessFullscreenPresentationIfNeeded];
  [(CNContactContentUnitaryViewController *)self updateEditPhotoButtonIfNeeded];
  if (([(CNContactContentUnitaryViewController *)self isEditing] & 1) == 0)
  {
    double v5 = [(CNContactContentUnitaryViewController *)self contactView];
    int v6 = [v5 isEditing];

    if (v6)
    {
      int64_t v7 = [(CNContactContentUnitaryViewController *)self contactView];
      [v7 setEditing:0 animated:0];
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CNContactContentUnitaryViewController;
  [(CNContactContentUnitaryViewController *)&v13 viewWillDisappear:a3];
  double v4 = [(CNContactContentUnitaryViewController *)self siriContextProvider];
  [v4 setEnabled:0];

  [(CNContactContentUnitaryViewController *)self updateWindowTitleForAppearing:0];
  double v5 = [(CNContactContentUnitaryViewController *)self shareLocationController];
  [v5 stopUpdatingFriends];

  if ([(CNContactContentUnitaryViewController *)self displayNavigationButtonsShouldUsePlatterStyle])
  {
    int v6 = [MEMORY[0x1E4FB1618] tintColor];
    int64_t v7 = [(CNContactContentUnitaryViewController *)self navigationItemController];
    objc_super v8 = [v7 navigationItem];
    double v9 = [v8 navigationBar];
    [v9 setTintColor:v6];

    previousBackGestureDelegate = self->_previousBackGestureDelegate;
    double v11 = [(CNContactContentUnitaryViewController *)self currentNavigationController];
    double v12 = [v11 interactivePopGestureRecognizer];
    [v12 setDelegate:previousBackGestureDelegate];
  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNContactContentUnitaryViewController;
  [(CNContactContentUnitaryViewController *)&v4 viewIsAppearing:a3];
  [(CNContactContentUnitaryViewController *)self updateEditNavigationItemsAnimated:0];
}

- (void)prepareContactDidAppearForPPT
{
  if ([(CNContactContentUnitaryViewController *)self runningPPT])
  {
    objc_initWeak(&location, self);
    double v3 = (void *)*MEMORY[0x1E4FB2608];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __70__CNContactContentUnitaryViewController_prepareContactDidAppearForPPT__block_invoke;
    v4[3] = &unk_1E549B600;
    objc_copyWeak(&v5, &location);
    [v3 installCACommitCompletionBlock:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __70__CNContactContentUnitaryViewController_prepareContactDidAppearForPPT__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained pptDelegate];
  [v1 viewDidAppearForContactViewController:WeakRetained];
}

- (void)didMoveToParentViewController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNContactContentUnitaryViewController;
  [(CNContactContentUnitaryViewController *)&v4 didMoveToParentViewController:a3];
  [(CNContactContentUnitaryViewController *)self updateEditNavigationItemsAnimated:0];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v13.receiver = self;
  v13.super_class = (Class)CNContactContentUnitaryViewController;
  [(CNContactContentUnitaryViewController *)&v13 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if (![(CNContactContentUnitaryViewController *)self isOutOfProcess])
  {
    p_peripheryInsets = &self->_peripheryInsets;
    int v6 = [(CNContactContentUnitaryViewController *)self view];
    int64_t v7 = [v6 window];
    objc_super v8 = [v7 screen];
    [v8 _peripheryInsets];
    p_peripheryInsets->double top = v9;
    p_peripheryInsets->CGFloat left = v10;
    p_peripheryInsets->double bottom = v11;
    p_peripheryInsets->CGFloat right = v12;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNContactContentUnitaryViewController;
  [(CNContactContentUnitaryViewController *)&v4 viewDidAppear:a3];
  [(CNContactContentUnitaryViewController *)self setUpBackGestureIfNeeded];
  if (self->_needsRefetch && ([(CNContactContentUnitaryViewController *)self isEditing] & 1) == 0)
  {
    [(CNContactContentUnitaryViewController *)self _refetchContact];
    self->_needsRefetch = 0;
  }
  if (![(CNContactContentViewController *)self alwaysEditing]) {
    [(CNContactContentUnitaryViewController *)self becomeFirstResponder];
  }
  [(CNContactContentUnitaryViewController *)self updateWindowTitleForAppearing:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CNContactContentUnitaryViewController *)self forcesTransparentBackground])
  {
    uint64_t v5 = +[CNUIColorRepository transparentBackgroundColor];
LABEL_5:
    int v6 = (void *)v5;
    int64_t v7 = [(CNContactContentUnitaryViewController *)self contactView];
LABEL_6:
    objc_super v8 = v7;
    [v7 setBackgroundColor:v6];

    goto LABEL_7;
  }
  if ([(UIViewController *)self ab_shouldUseTransparentBackgroundInPopovers])
  {
    uint64_t v5 = +[CNUIColorRepository popoverBackgroundColor];
    goto LABEL_5;
  }
  double v18 = [(CNContactContentUnitaryViewController *)self environment];
  int v19 = [v18 runningInContactsAppOniPad];

  if (v19)
  {
    int v6 = +[CNUIColorRepository contactCardBackgroundiPadOverwriteColor];
    int64_t v7 = [(CNContactContentUnitaryViewController *)self displayContactView];
    goto LABEL_6;
  }
LABEL_7:
  v20.receiver = self;
  v20.super_class = (Class)CNContactContentUnitaryViewController;
  [(CNContactContentUnitaryViewController *)&v20 viewWillAppear:v3];
  [(CNContactContentUnitaryViewController *)self setDismissedSharedProfileBannerAction:0];
  [(CNContactContentUnitaryViewController *)self setTappedSharedProfileBannerAction:0];
  CGFloat v9 = +[CNContactStyle currentStyle];
  CGFloat v10 = [v9 backgroundColor];

  if (v10)
  {
    CGFloat v11 = +[CNContactStyle currentStyle];
    CGFloat v12 = [v11 backgroundColor];
    objc_super v13 = [(CNContactContentUnitaryViewController *)self view];
    [v13 setBackgroundColor:v12];
  }
  double v14 = [(CNContactContentUnitaryViewController *)self contactView];
  objc_msgSend(v14, "_cnui_applyContactStyle");

  id v15 = [(CNContactContentUnitaryViewController *)self applyContactStyle];
  if (![(CNContactContentUnitaryViewController *)self reloadDataIfNeeded]) {
    [(CNContactContentUnitaryViewController *)self _setNeedsUpdateCachedLabelWidths];
  }
  [(CNContactContentUnitaryViewController *)self updateEditNavigationItemsAnimated:0];
  double v16 = [(CNContactContentUnitaryViewController *)self siriContextProvider];
  [v16 setEnabled:1];

  double v17 = [(CNContactContentUnitaryViewController *)self shareLocationController];
  [v17 startUpdatingFriends];

  [(id)*MEMORY[0x1E4FB2608] setNetworkActivityIndicatorVisible:0];
}

- (void)updateViewConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)CNContactContentUnitaryViewController;
  [(CNContactContentUnitaryViewController *)&v3 updateViewConstraints];
  [(CNContactContentUnitaryViewController *)self setupConstraintsIfNeeded];
}

- (double)actionsBottomMargin
{
  int v3 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
  if (![(CNContactContentUnitaryViewController *)self shouldUseStaticHeader] || v3)
  {
    uint64_t v5 = +[CNContactStyle currentStyle];
    if ([v5 usesInsetPlatterStyle]) {
      double v4 = 16.0;
    }
    else {
      double v4 = 15.0;
    }
  }
  else if ([(CNContactContentUnitaryViewController *)self isPadRegularHorizontalSize])
  {
    return 36.0;
  }
  else if ([(CNContactContentUnitaryViewController *)self isOrientationPhoneLandscape])
  {
    return 9.0;
  }
  else
  {
    return 17.0;
  }
  return v4;
}

- (double)actionsTopMargin
{
  int v3 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
  if (![(CNContactContentUnitaryViewController *)self shouldUseStaticHeader] || v3)
  {
    uint64_t v5 = +[CNContactStyle currentStyle];
    if ([v5 usesInsetPlatterStyle]) {
      double v4 = 20.0;
    }
    else {
      double v4 = 10.0;
    }
  }
  else
  {
    double v4 = 14.0;
    if (![(CNContactContentUnitaryViewController *)self isPadRegularHorizontalSize])
    {
      if ([(CNContactContentUnitaryViewController *)self isOrientationPhoneLandscape]) {
        return 14.0;
      }
      else {
        return 17.0;
      }
    }
  }
  return v4;
}

- (double)editingFloatingHeaderHeight
{
  id v2 = [(CNContactContentUnitaryViewController *)self view];
  [v2 safeAreaInsets];
  double v4 = v3;

  double result = 44.0;
  if (v4 >= 44.0) {
    return v4;
  }
  return result;
}

- (double)staticDisplayHeaderHeight
{
  double v3 = 0.0;
  if ([(CNContactContentUnitaryViewController *)self shouldUseStaticHeader]
    && ([(CNContactContentUnitaryViewController *)self isEditing] & 1) == 0)
  {
    BOOL v4 = [(CNContactContentUnitaryViewController *)self isPadRegularHorizontalSize];
    uint64_t v5 = [(CNContactContentUnitaryViewController *)self staticDisplayHeaderView];
    [v5 minHeight];
    double v3 = v6;

    int64_t v7 = [(CNContactContentUnitaryViewController *)self staticDisplayHeaderView];
    double v8 = v3;
    if (([v7 shouldUseFixedHeight] & 1) == 0)
    {
      if (v4) {
        double v9 = 0.525;
      }
      else {
        double v9 = 0.66;
      }
      CGFloat v10 = [(CNContactContentUnitaryViewController *)self view];
      [v10 frame];
      double v8 = v9 * v11;
    }
    if (v3 < v8) {
      double v3 = v8;
    }
    if (objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory"))
    {
      CGFloat v12 = [(CNContactContentUnitaryViewController *)self actionsWrapperView];
      [v12 frame];
      double v3 = v3 + v13;
    }
  }
  return v3;
}

- (void)setupConstraints
{
  uint64_t v3 = [(CNContactContentUnitaryViewController *)self isEditing];
  BOOL v4 = [(CNContactContentUnitaryViewController *)self shouldDisplayAvatarHeaderView];
  [(CNContactContentUnitaryViewController *)self setHasEditingConstraints:v3];
  [(CNContactContentUnitaryViewController *)self setHasAvatarConstraints:v4];
  uint64_t v5 = (void *)MEMORY[0x1E4F28DC8];
  double v6 = [(CNContactContentUnitaryViewController *)self activatedConstraints];
  [v5 deactivateConstraints:v6];

  id v154 = [MEMORY[0x1E4F1CA48] array];
  if (v4)
  {
    if ((v3 & 1) == 0)
    {
      double v7 = 0.0;
      double v8 = 0.0;
      if (![(CNContactContentViewController *)self isSiri])
      {
        [(CNContactContentUnitaryViewController *)self actionsTopMargin];
        double v8 = v9;
      }
      [(CNContactContentUnitaryViewController *)self actionsBottomMargin];
      double v11 = v10;
      if (![(CNContactContentViewController *)self isSiri]) {
        double v7 = 8.0;
      }
      if ([(CNContactContentUnitaryViewController *)self allowsActionsModel])
      {
        if (![(CNContactContentUnitaryViewController *)self shouldUseStaticHeader])
        {
          CGFloat v12 = [(CNContactContentUnitaryViewController *)self view];
          double v13 = [v12 leadingAnchor];
          double v14 = [(CNContactContentUnitaryViewController *)self actionsWrapperView];
          id v15 = [v14 leadingAnchor];
          double v16 = [v13 constraintEqualToAnchor:v15];
          [v154 addObject:v16];

          double v17 = [(CNContactContentUnitaryViewController *)self view];
          double v18 = [v17 trailingAnchor];
          int v19 = [(CNContactContentUnitaryViewController *)self actionsWrapperView];
          objc_super v20 = [v19 trailingAnchor];
          id v21 = [v18 constraintEqualToAnchor:v20];
          [v154 addObject:v21];

          if ((objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory") & 1) == 0)
          {
            int v22 = [(CNContactContentUnitaryViewController *)self actionsWrapperView];
            double v23 = [v22 topAnchor];
            double v24 = [(CNContactContentUnitaryViewController *)self contactHeaderView];
            double v25 = [v24 bottomAnchor];
            double v26 = [v23 constraintEqualToAnchor:v25];
            [v154 addObject:v26];
          }
        }
        double v27 = [(CNContactContentUnitaryViewController *)self actionsWrapperView];
        objc_msgSend(v27, "setLayoutMargins:", v8, v7, v11, v7);

        double v28 = [(CNContactContentUnitaryViewController *)self view];
        double v29 = objc_msgSend(v28, "_cnui_contactStyle");
        [v29 sectionMaximumPlatterWidth];
        double v31 = v30;
        double v32 = *MEMORY[0x1E4F4BEC8];
        objc_super v33 = [(CNContactInlineActionsViewController *)self->_actionsViewController view];
        objc_msgSend(v33, "setMinimumLayoutSize:", v31, v32);

        double v34 = [(CNContactContentUnitaryViewController *)self actionsWrapperView];
        [v34 setNeedsLayout];

        int v35 = [(CNContactContentUnitaryViewController *)self actionsWrapperView];
        [v35 layoutIfNeeded];

        if ([(CNContactContentUnitaryViewController *)self shouldUseStaticHeader])
        {
          double v36 = [(CNContactContentUnitaryViewController *)self floatingActionsWrapperView];
          objc_msgSend(v36, "setLayoutMargins:", v8, v7, v11, v7);

          double v37 = [(CNContactContentUnitaryViewController *)self view];
          id v38 = objc_msgSend(v37, "_cnui_contactStyle");
          [v38 sectionMaximumPlatterWidth];
          double v40 = v39;
          dispatch_time_t v41 = [(CNContactInlineActionsViewController *)self->_floatingActionsViewController view];
          objc_msgSend(v41, "setMinimumLayoutSize:", v40, v32);

          id v42 = [(CNContactContentUnitaryViewController *)self floatingActionsWrapperView];
          [v42 setNeedsLayout];

          id v43 = [(CNContactContentUnitaryViewController *)self floatingActionsWrapperView];
          [v43 layoutIfNeeded];
        }
      }
      if ([(CNContactContentUnitaryViewController *)self shouldUseStaticHeader])
      {
        uint64_t v44 = (void *)MEMORY[0x1E4F28DC8];
        uint64_t v45 = [(CNContactContentUnitaryViewController *)self displayFloatingCollapsedHeaderView];
        id v46 = [(CNContactContentUnitaryViewController *)self displayFloatingCollapsedHeaderView];
        [v46 maxHeight];
        CGRect v48 = [v44 constraintWithItem:v45 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v47];
        [(CNContactContentUnitaryViewController *)self setFloatingHeaderHeightConstraint:v48];

        BOOL v49 = [(CNContactContentUnitaryViewController *)self floatingHeaderHeightConstraint];
        [v154 addObject:v49];

        dispatch_time_t v50 = [(CNContactContentUnitaryViewController *)self displayFloatingCollapsedHeaderView];
        long long v51 = [v50 leftAnchor];
        long long v52 = [(CNContactContentUnitaryViewController *)self view];
        long long v53 = [v52 leftAnchor];
        id v54 = [v51 constraintEqualToAnchor:v53];
        [v154 addObject:v54];

        id v55 = [(CNContactContentUnitaryViewController *)self displayFloatingCollapsedHeaderView];
        char v56 = [v55 rightAnchor];
        long long v57 = [(CNContactContentUnitaryViewController *)self view];
        long long v58 = [v57 rightAnchor];
        long long v59 = [v56 constraintEqualToAnchor:v58];
        [v154 addObject:v59];

        long long v60 = [(CNContactContentUnitaryViewController *)self displayFloatingCollapsedHeaderView];
        double v61 = [v60 topAnchor];
        id v62 = [(CNContactContentUnitaryViewController *)self view];
        id v63 = [v62 topAnchor];
        id v64 = [v61 constraintEqualToAnchor:v63];
        [v154 addObject:v64];
      }
    }
    if ([(CNContactContentUnitaryViewController *)self shouldUseStaticHeader]
      && [(CNContactContentUnitaryViewController *)self isEditing]
      && ![(CNContactContentUnitaryViewController *)self shouldDrawNavigationBar])
    {
      v65 = [(CNContactContentUnitaryViewController *)self editingFloatingCollapsedHeaderView];
      uint64_t v66 = [v65 leftAnchor];
      uint64_t v67 = [(CNContactContentUnitaryViewController *)self view];
      id v68 = [v67 leftAnchor];
      v69 = [v66 constraintEqualToAnchor:v68];
      [v154 addObject:v69];

      id v70 = [(CNContactContentUnitaryViewController *)self editingFloatingCollapsedHeaderView];
      id v71 = [v70 rightAnchor];
      uint64_t v72 = [(CNContactContentUnitaryViewController *)self view];
      id v73 = [v72 rightAnchor];
      uint64_t v74 = [v71 constraintEqualToAnchor:v73];
      [v154 addObject:v74];

      char v75 = [(CNContactContentUnitaryViewController *)self editingFloatingCollapsedHeaderView];
      uint64_t v76 = [v75 topAnchor];
      v77 = [(CNContactContentUnitaryViewController *)self view];
      char v78 = [v77 topAnchor];
      uint64_t v79 = [v76 constraintEqualToAnchor:v78];
      [v154 addObject:v79];

      int v80 = [(CNContactContentUnitaryViewController *)self editingFloatingCollapsedHeaderView];
      unsigned int v81 = [v80 heightAnchor];
      [(CNContactContentUnitaryViewController *)self editingFloatingHeaderHeight];
      unsigned int v82 = objc_msgSend(v81, "constraintEqualToConstant:");
      [(CNContactContentUnitaryViewController *)self setEditingFloatingHeaderHeightConstraint:v82];

      char v83 = [(CNContactContentUnitaryViewController *)self editingFloatingHeaderHeightConstraint];
      [v154 addObject:v83];
    }
    if ([(CNContactContentUnitaryViewController *)self shouldUseStaticHeader]
      && ([(CNContactContentUnitaryViewController *)self isEditing] & 1) == 0)
    {
      long long v85 = [(CNContactContentUnitaryViewController *)self contactHeaderView];
      long long v86 = [v85 heightAnchor];
      [(CNContactContentUnitaryViewController *)self staticDisplayHeaderHeight];
      uint64_t v88 = objc_msgSend(v86, "constraintEqualToConstant:");
    }
    else
    {
      id v84 = (void *)MEMORY[0x1E4F28DC8];
      long long v85 = [(CNContactContentUnitaryViewController *)self contactHeaderView];
      long long v86 = [(CNContactContentUnitaryViewController *)self contactHeaderView];
      [v86 maxHeight];
      uint64_t v88 = [v84 constraintWithItem:v85 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v87];
    }
    v89 = (void *)v88;
    [(CNContactContentUnitaryViewController *)self setHeaderHeightConstraint:v88];

    v90 = [(CNContactContentUnitaryViewController *)self headerHeightConstraint];
    [v154 addObject:v90];

    if (![(CNContactContentUnitaryViewController *)self shouldUseStaticHeader])
    {
      uint64_t v91 = [(CNContactContentUnitaryViewController *)self contactHeaderView];
      v92 = [v91 topAnchor];
      v93 = [(CNContactContentUnitaryViewController *)self view];
      v94 = [v93 topAnchor];
      v95 = [v92 constraintEqualToAnchor:v94];
      [v154 addObject:v95];
    }
    v96 = [(CNContactContentUnitaryViewController *)self contactHeaderView];
    v97 = [v96 leftAnchor];
    v98 = [(CNContactContentUnitaryViewController *)self view];
    v99 = [v98 leftAnchor];
    v100 = [v97 constraintEqualToAnchor:v99];
    [v154 addObject:v100];

    v101 = [(CNContactContentUnitaryViewController *)self contactHeaderView];
    v102 = [v101 rightAnchor];
    v103 = [(CNContactContentUnitaryViewController *)self view];
    v104 = [v103 rightAnchor];
    uint64_t v105 = [v102 constraintEqualToAnchor:v104];
    [v154 addObject:v105];

    v106 = [(CNContactContentUnitaryViewController *)self contactView];
    v107 = [v106 topAnchor];
    v108 = [(CNContactContentUnitaryViewController *)self view];
    v109 = [v108 topAnchor];
    v110 = [v107 constraintEqualToAnchor:v109];
    [v154 addObject:v110];

    v111 = [(CNContactContentUnitaryViewController *)self contactView];
    v112 = [v111 bottomAnchor];
    v113 = [(CNContactContentUnitaryViewController *)self view];
    v114 = [v113 bottomAnchor];
    v115 = [v112 constraintEqualToAnchor:v114];
    [v154 addObject:v115];

    v116 = [(CNContactContentUnitaryViewController *)self headerDropShadowView];
    v117 = [v116 superview];

    if (v117)
    {
      v118 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v118 scale];
      double v120 = v119;

      v121 = [(CNContactContentUnitaryViewController *)self headerDropShadowView];
      v122 = [v121 heightAnchor];
      v123 = [v122 constraintEqualToConstant:1.0 / v120];
      [v154 addObject:v123];

      v124 = [(CNContactContentUnitaryViewController *)self headerDropShadowView];
      v125 = [v124 bottomAnchor];
      v126 = [(CNContactContentUnitaryViewController *)self headerDropShadowView];
      v127 = [v126 superview];
      v128 = [v127 bottomAnchor];
      v129 = [v125 constraintEqualToAnchor:v128];
      [v154 addObject:v129];

      v130 = [(CNContactContentUnitaryViewController *)self headerDropShadowView];
      v131 = [v130 leftAnchor];
      v132 = [(CNContactContentUnitaryViewController *)self headerDropShadowView];
      v133 = [v132 superview];
      v134 = [v133 leftAnchor];
      v135 = [v131 constraintEqualToAnchor:v134];
      [v154 addObject:v135];

      v136 = [(CNContactContentUnitaryViewController *)self headerDropShadowView];
      v137 = [v136 rightAnchor];
      v138 = [(CNContactContentUnitaryViewController *)self headerDropShadowView];
      v139 = [v138 superview];
      v140 = [v139 rightAnchor];
      v141 = [v137 constraintEqualToAnchor:v140];
      [v154 addObject:v141];
    }
  }
  v142 = [(CNContactContentUnitaryViewController *)self contactView];
  v143 = [v142 leftAnchor];
  v144 = [(CNContactContentUnitaryViewController *)self view];
  v145 = [v144 leftAnchor];
  v146 = [v143 constraintEqualToAnchor:v145];
  [v154 addObject:v146];

  v147 = [(CNContactContentUnitaryViewController *)self contactView];
  v148 = [v147 rightAnchor];
  v149 = [(CNContactContentUnitaryViewController *)self view];
  v150 = [v149 rightAnchor];
  v151 = [v148 constraintEqualToAnchor:v150];
  [v154 addObject:v151];

  [(CNContactContentUnitaryViewController *)self setActivatedConstraints:v154];
  [MEMORY[0x1E4F28DC8] activateConstraints:v154];
  if ([(CNContactContentUnitaryViewController *)self shouldUseStaticHeader])
  {
    v152 = [(CNContactContentUnitaryViewController *)self contactHeaderView];
    [v152 updateConstraints];

    if (([(CNContactContentUnitaryViewController *)self isEditing] & 1) == 0)
    {
      v153 = [(CNContactContentUnitaryViewController *)self displayFloatingCollapsedHeaderView];
      [v153 updateConstraints];
    }
  }
}

- (void)setupViewHierarchyAndConstraints
{
  [(CNContactContentUnitaryViewController *)self setupViewHierarchy];

  [(CNContactContentUnitaryViewController *)self setupConstraints];
}

- (void)setupViewHierarchy
{
  [(CNContactContentUnitaryViewController *)self setupViewHierarchyIncludingAvatarHeader:[(CNContactContentUnitaryViewController *)self shouldDisplayAvatarHeaderView] editing:[(CNContactContentUnitaryViewController *)self isEditing]];
  [(CNContactContentUnitaryViewController *)self setupTableHeaderView];
  [(CNContactContentUnitaryViewController *)self setupTableFooterView];

  [(CNContactContentUnitaryViewController *)self setHasSetupViewHierarchy:1];
}

- (void)setupConstraintsIfNeeded
{
  int v3 = [(CNContactContentUnitaryViewController *)self isEditing];
  int v4 = [(CNContactContentUnitaryViewController *)self shouldDisplayAvatarHeaderView];
  uint64_t v5 = [(CNContactContentUnitaryViewController *)self activatedConstraints];
  if ([v5 count]
    && v3 == [(CNContactContentUnitaryViewController *)self hasEditingConstraints])
  {
    int v6 = [(CNContactContentUnitaryViewController *)self hasAvatarConstraints];

    if (v4 == v6) {
      return;
    }
  }
  else
  {
  }

  [(CNContactContentUnitaryViewController *)self setupViewHierarchyAndConstraints];
}

- (BOOL)shouldDisplayAvatarHeaderView
{
  id v2 = [(CNContactContentUnitaryViewController *)self contactHeaderView];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)currentNavigationController
{
  id v2 = [(CNContactContentUnitaryViewController *)self navigationItemController];
  BOOL v3 = [v2 navigationController];

  int v4 = [v3 navigationBar];
  uint64_t v5 = [v4 backItem];
  if (v5)
  {

LABEL_3:
    id v6 = v3;
    goto LABEL_6;
  }
  double v7 = [v3 navigationController];
  double v8 = [v7 navigationBar];
  double v9 = [v8 backItem];

  if (!v9) {
    goto LABEL_3;
  }
  id v6 = [v3 navigationController];
LABEL_6:
  double v10 = v6;

  return v10;
}

- (id)platterBackBarButtonItem
{
  BOOL v3 = [(CNContactContentUnitaryViewController *)self traitCollection];
  BOOL v4 = [v3 layoutDirection] == 1;

  uint64_t v5 = [[CNPlatterBackBarButtonItem alloc] initWithTarget:self action:sel_popToPrevious_ isRTL:v4];

  return v5;
}

- (void)setUpBackGestureIfNeeded
{
  if (![(CNContactContentUnitaryViewController *)self displayNavigationButtonsShouldUsePlatterStyle])return; {
  BOOL v3 = [(CNContactContentUnitaryViewController *)self currentNavigationController];
  }
  BOOL v4 = [v3 interactivePopGestureRecognizer];
  uint64_t v5 = [v4 delegate];
  if (v5 == self)
  {
    previousBackGestureDelegate = self;
    goto LABEL_7;
  }
  id v6 = v5;
  double v7 = [(CNContactContentUnitaryViewController *)self currentNavigationController];
  double v8 = [v7 interactivePopGestureRecognizer];
  double v9 = [v8 delegate];

  if (v9)
  {
    BOOL v3 = [(CNContactContentUnitaryViewController *)self currentNavigationController];
    BOOL v4 = [v3 interactivePopGestureRecognizer];
    double v10 = [v4 delegate];
    previousBackGestureDelegate = self->_previousBackGestureDelegate;
    self->_previousBackGestureDelegate = v10;
LABEL_7:
  }
  id v13 = [(CNContactContentUnitaryViewController *)self currentNavigationController];
  CGFloat v12 = [v13 interactivePopGestureRecognizer];
  [v12 setDelegate:self];
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)CNContactContentUnitaryViewController;
  [(CNContactContentUnitaryViewController *)&v9 viewDidLoad];
  uint64_t v3 = *MEMORY[0x1E4F5A298];
  BOOL v4 = [(CNContactContentUnitaryViewController *)self initialPrompt];
  LOBYTE(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  if ((v3 & 1) == 0)
  {
    uint64_t v5 = [(CNContactContentUnitaryViewController *)self initialPrompt];
    id v6 = [(CNContactContentUnitaryViewController *)self navigationItem];
    [v6 setPrompt:v5];
  }
  if ([(CNContactContentUnitaryViewController *)self shouldDrawNavigationBar])
  {
    double v7 = [(CNContactContentUnitaryViewController *)self navigationItem];
    [v7 _setBackgroundHidden:0];
  }
  [(CNContactContentUnitaryViewController *)self reloadDataIfNeeded];
  double v8 = [(CNContactContentUnitaryViewController *)self view];
  [v8 setNeedsUpdateConstraints];
}

- (void)setupViewHierarchyIncludingAvatarHeader:(BOOL)a3 editing:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v51[1] = *MEMORY[0x1E4F143B8];
  if ([(CNContactContentUnitaryViewController *)self isViewLoaded])
  {
    double v7 = [(CNContactContentUnitaryViewController *)self view];
    double v8 = [MEMORY[0x1E4F1CA48] array];
    objc_super v9 = [MEMORY[0x1E4F1CA48] array];
    if (![(CNContactContentUnitaryViewController *)self shouldUseStaticHeader])
    {
      uint64_t v10 = [(CNContactContentUnitaryViewController *)self contactHeaderView];
      double v11 = (void *)v10;
      if (v5)
      {
        v51[0] = v10;
        CGFloat v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
        id v13 = v9;
      }
      else
      {
        uint64_t v50 = v10;
        CGFloat v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
        id v13 = v8;
      }
      [v13 addObjectsFromArray:v12];
    }
    BOOL v14 = [(CNContactContentUnitaryViewController *)self shouldUseStaticHeader];
    if (v4)
    {
      if (v14)
      {
        if (self->_displayFloatingCollapsedHeaderView)
        {
          id v15 = [(CNContactContentUnitaryViewController *)self displayFloatingCollapsedHeaderView];
          [v8 addObject:v15];
        }
        if ([(CNContactContentUnitaryViewController *)self shouldDrawNavigationBar]) {
          goto LABEL_21;
        }
        double v16 = [(CNContactContentUnitaryViewController *)self editingFloatingCollapsedHeaderView];
        double v17 = v9;
      }
      else
      {
        if ((objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory") & 1) == 0)
        {
          objc_super v20 = [(CNContactContentUnitaryViewController *)self actionsWrapperView];
          [v8 addObject:v20];
        }
        if (!self->_displayHeaderView) {
          goto LABEL_21;
        }
        double v16 = [(CNContactContentUnitaryViewController *)self displayHeaderView];
        double v17 = v8;
      }
      [v17 addObject:v16];

LABEL_21:
      id v21 = [(CNContactContentUnitaryViewController *)self editingHeaderView];
      int v22 = [(CNContactContentUnitaryViewController *)self headerDropShadowView];
      [v21 addSubview:v22];

      double v23 = [(CNContactContentUnitaryViewController *)self displayContactView];
      [v8 addObject:v23];

      double v24 = [(CNContactContentUnitaryViewController *)self editingContactView];
      double v25 = v9;
      goto LABEL_32;
    }
    if (v14)
    {
      double v18 = [(CNContactContentUnitaryViewController *)self displayFloatingCollapsedHeaderView];
      [v9 addObject:v18];

      if (!self->_editingFloatingCollapsedHeaderView)
      {
LABEL_30:
        int v35 = [(CNContactContentUnitaryViewController *)self displayContactView];
        [v9 addObject:v35];

        if (!self->_editingContactView)
        {
LABEL_33:
          double v36 = [(CNContactContentUnitaryViewController *)self contactView];
          double v37 = [v36 panGestureRecognizer];
          id v38 = [v37 view];
          double v39 = [(CNContactContentUnitaryViewController *)self contactView];
          double v40 = [v39 panGestureRecognizer];
          [v38 removeGestureRecognizer:v40];

          dispatch_time_t v41 = [(CNContactContentUnitaryViewController *)self view];
          id v42 = [(CNContactContentUnitaryViewController *)self contactView];
          id v43 = [v42 panGestureRecognizer];
          [v41 addGestureRecognizer:v43];

          uint64_t v45 = MEMORY[0x1E4F143A8];
          uint64_t v46 = 3221225472;
          double v47 = __89__CNContactContentUnitaryViewController_setupViewHierarchyIncludingAvatarHeader_editing___block_invoke;
          CGRect v48 = &unk_1E549B5B8;
          id v49 = v7;
          id v44 = v7;
          [v9 enumerateObjectsUsingBlock:&v45];
          objc_msgSend(v8, "enumerateObjectsUsingBlock:", &__block_literal_global_489, v45, v46, v47, v48);

          return;
        }
        double v24 = [(CNContactContentUnitaryViewController *)self editingContactView];
        double v25 = v8;
LABEL_32:
        [v25 addObject:v24];

        goto LABEL_33;
      }
      uint64_t v19 = [(CNContactContentUnitaryViewController *)self editingFloatingCollapsedHeaderView];
    }
    else
    {
      if ((objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory") & 1) == 0)
      {
        double v26 = [(CNContactContentUnitaryViewController *)self actionsWrapperView];
        [v9 addObject:v26];

        double v27 = [(CNContactContentUnitaryViewController *)self view];
        double v28 = objc_msgSend(v27, "_cnui_contactStyle");
        int v29 = [v28 usesOpaqueBackground];

        if (v29)
        {
          double v30 = [(CNContactContentUnitaryViewController *)self actionsWrapperView];
          double v31 = [(CNContactContentUnitaryViewController *)self headerDropShadowView];
          [v30 addSubview:v31];
        }
      }
      if (![(CNContactContentUnitaryViewController *)self allowsActionsModel])
      {
        double v32 = [(CNContactContentUnitaryViewController *)self actionsViewController];
        objc_super v33 = [v32 view];
        [v33 removeFromSuperview];
      }
      if (!self->_editingHeaderView) {
        goto LABEL_30;
      }
      uint64_t v19 = [(CNContactContentUnitaryViewController *)self editingHeaderView];
    }
    double v34 = (void *)v19;
    [v8 addObject:v19];

    goto LABEL_30;
  }
}

uint64_t __89__CNContactContentUnitaryViewController_setupViewHierarchyIncludingAvatarHeader_editing___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) insertSubview:a2 atIndex:0];
}

uint64_t __89__CNContactContentUnitaryViewController_setupViewHierarchyIncludingAvatarHeader_editing___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperview];
}

- (void)loadContactViewControllerViews
{
  uint64_t v3 = [(CNContactContentUnitaryViewController *)self contactView];
  BOOL v4 = [(CNContactContentUnitaryViewController *)self contactView];
  BOOL v5 = objc_opt_class();
  id v6 = [v5 cellIdentifierForClass:objc_opt_class()];
  double v7 = [v3 dequeueReusableCellWithIdentifier:v6];
  [(CNContactContentUnitaryViewController *)self setNoteCell:v7];

  id v9 = [(CNContactContentUnitaryViewController *)self view];
  double v8 = [(CNContactContentUnitaryViewController *)self contactView];
  [v9 addSubview:v8];
}

- (void)loadView
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(CNContactContentUnitaryViewController *)self setView:v3];

  [(CNContactContentUnitaryViewController *)self loadContactViewControllerViews];
}

- (void)performAuthorizedSetEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v7 = CNUILogContactCard();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v8) {
      goto LABEL_7;
    }
    *(_WORD *)long long buf = 0;
    id v9 = "[CNContactContentViewController] Entering Edit Mode";
  }
  else
  {
    if (!v8) {
      goto LABEL_7;
    }
    *(_WORD *)long long buf = 0;
    id v9 = "[CNContactContentViewController] Leaving Edit Mode";
  }
  _os_log_impl(&dword_18B625000, v7, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
LABEL_7:

  if ([(CNContactContentUnitaryViewController *)self shouldAllowContainerPicking])
  {
    uint64_t v10 = [(CNContactContentUnitaryViewController *)self contact];
    [(CNContactContentUnitaryViewController *)self setupContainerContextIfNeededForContact:v10];
  }
  if (v5)
  {
    if ([(CNContactContentUnitaryViewController *)self didSetNewContact])
    {
      [(CNContactContentUnitaryViewController *)self setDidSetNewContact:0];
      editingContactView = self->_editingContactView;
      self->_editingContactView = 0;
    }
    [(CNContactContentUnitaryViewController *)self setDidEditPronouns:0];
    CGFloat v12 = [(CNContactContentUnitaryViewController *)self displayContactView];
    uint64_t v13 = [(CNContactContentUnitaryViewController *)self editingContactView];
  }
  else
  {
    CGFloat v12 = [(CNContactContentUnitaryViewController *)self editingContactView];
    uint64_t v13 = [(CNContactContentUnitaryViewController *)self displayContactView];
  }
  BOOL v14 = (void *)v13;
  [(CNContactContentUnitaryViewController *)self updateInsetsIfNeededForTableView:v13 isEditing:v5];
  [v12 _stopScrollingAndZoomingAnimations];
  id v15 = [(CNContactContentUnitaryViewController *)self _currentTopVisibleGroupInContactView:v12];
  double v16 = [(CNContactContentUnitaryViewController *)self environment];
  objc_msgSend(v14, "setAttributesFromContactView:runningInContactsAppOniPad:", v12, objc_msgSend(v16, "runningInContactsAppOniPad"));

  v29.receiver = self;
  v29.super_class = (Class)CNContactContentUnitaryViewController;
  [(CNContactContentUnitaryViewController *)&v29 setEditing:v5 animated:v4];
  [(CNContactContentUnitaryViewController *)self updateEditNavigationItemsAnimated:v4];
  double v17 = [(CNContactContentUnitaryViewController *)self contactView];
  double v18 = [(CNContactContentUnitaryViewController *)self contactView];
  uint64_t v19 = objc_opt_class();
  objc_super v20 = [v19 cellIdentifierForClass:objc_opt_class()];
  id v21 = [v17 dequeueReusableCellWithIdentifier:v20];
  [(CNContactContentUnitaryViewController *)self setNoteCell:v21];

  [v14 reloadData];
  [(CNContactContentUnitaryViewController *)self _scrollContactView:v14 toVisibleGroup:v15 animated:0];
  int v22 = (void *)MEMORY[0x1E4FB1EB0];
  double v23 = [(CNContactContentUnitaryViewController *)self view];
  double v24 = 0.0;
  if (v4) {
    double v24 = 0.25;
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  void v28[2] = __78__CNContactContentUnitaryViewController_performAuthorizedSetEditing_animated___block_invoke;
  v28[3] = &unk_1E549B488;
  v28[4] = self;
  [v22 transitionWithView:v23 duration:5242880 options:v28 animations:0 completion:v24];

  double v25 = [(CNContactContentUnitaryViewController *)self contactDelegate];
  char v26 = objc_opt_respondsToSelector();

  if (v26)
  {
    double v27 = [(CNContactContentUnitaryViewController *)self contactDelegate];
    [v27 contactViewController:self didChangeToEditMode:v5];
  }
}

uint64_t __78__CNContactContentUnitaryViewController_performAuthorizedSetEditing_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setupConstraintsIfNeeded];
}

- (void)resetEditAuthorizationState
{
}

- (void)editAuthorizationController:(id)a3 authorizationDidFinishWithResult:(int64_t)a4
{
  [(CNContactContentUnitaryViewController *)self setEditAuthorizationController:0];
  [(CNContactContentUnitaryViewController *)self setEditAuthorizationResult:a4];
  if ((unint64_t)a4 >= 2)
  {
    if (a4 == 2)
    {
      [(CNContactContentUnitaryViewController *)self performAuthorizedSetEditing:1 animated:1];
      [(CNContactContentUnitaryViewController *)self reloadDataPreservingChanges:1];
    }
  }
  else
  {
    id v6 = [(CNContactContentUnitaryViewController *)self delegate];
    [v6 didCompleteWithContact:0];
  }
}

- (void)showEditAuthorizationPane:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = objc_alloc_init(CNUIEditAuthorizationController);
  [(CNContactContentUnitaryViewController *)self setEditAuthorizationController:v7];

  BOOL v8 = [(CNContactContentUnitaryViewController *)self editAuthorizationController];
  [v8 setDelegate:self];

  id v9 = [(CNContactContentUnitaryViewController *)self editAuthorizationController];
  [v9 setSender:v6];

  uint64_t v10 = [(CNContactContentUnitaryViewController *)self editAuthorizationController];
  [v10 setAnimated:v4];

  double v11 = [(CNContactContentUnitaryViewController *)self editAuthorizationController];
  [v11 setGuardedViewController:self];

  id v12 = [(CNContactContentUnitaryViewController *)self editAuthorizationController];
  [v12 presentAuthorizationUI];
}

- (BOOL)editRequiresAuthorization
{
  id v3 = objc_alloc(MEMORY[0x1E4F5A650]);
  BOOL v4 = [(CNContactContentUnitaryViewController *)self contact];
  BOOL v5 = [(CNContactContentViewController *)self parentContainer];
  BOOL v6 = [(CNContactContentViewController *)self ignoresParentalRestrictions];
  double v7 = [(CNContactContentUnitaryViewController *)self contactViewCache];
  BOOL v8 = (void *)[v3 initWithContact:v4 parentContainer:v5 ignoresParentalRestrictions:v6 linkedParentContainerProvider:v7];

  LOBYTE(v7) = [v8 shouldPromptForPasscodeAuthorization];
  return (char)v7;
}

- (BOOL)editingChangeRequiresAuthorization
{
  if ([(CNContactContentUnitaryViewController *)self isEditing]) {
    return 0;
  }

  return [(CNContactContentUnitaryViewController *)self editRequiresAuthorization];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(CNContactContentUnitaryViewController *)self isEditing] != a3)
  {
    if ([(CNContactContentUnitaryViewController *)self editingChangeRequiresAuthorization])
    {
      id v8 = [(CNContactContentUnitaryViewController *)self navigationItem];
      double v7 = [v8 rightBarButtonItem];
      [(CNContactContentUnitaryViewController *)self showEditAuthorizationPane:v7 animated:v4];
    }
    else
    {
      [(CNContactContentUnitaryViewController *)self performAuthorizedSetEditing:v5 animated:v4];
    }
  }
}

- (void)showUpdateTermOfAddressAlertIfNeeded
{
  if ([(CNContactContentUnitaryViewController *)self didEditPronouns])
  {
    [(CNContactContentUnitaryViewController *)self setDidEditPronouns:0];
    if ([(CNContactContentUnitaryViewController *)self showingMeContact])
    {
      if ([MEMORY[0x1E4F292A8] canSelectUserInflection])
      {
        id v3 = (void *)MEMORY[0x1E4FB1418];
        BOOL v4 = CNContactsUIBundle();
        BOOL v5 = [v4 localizedStringForKey:@"ADDRESSING_GRAMMAR_UPDATE_SETTINGS_ALERT_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
        BOOL v6 = CNContactsUIBundle();
        double v7 = [v6 localizedStringForKey:@"ADDRESSING_GRAMMAR_UPDATE_SETTINGS_ALERT_MESSAGE" value:&stru_1ED8AC728 table:@"Localized"];
        id v8 = [v3 alertControllerWithTitle:v5 message:v7 preferredStyle:1];

        id v9 = (void *)MEMORY[0x1E4FB1410];
        uint64_t v10 = CNContactsUIBundle();
        double v11 = [v10 localizedStringForKey:@"ADDRESSING_GRAMMAR_UPDATE_SETTINGS_ALERT_CANCEL_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __77__CNContactContentUnitaryViewController_showUpdateTermOfAddressAlertIfNeeded__block_invoke;
        v24[3] = &unk_1E549B590;
        id v12 = v8;
        id v25 = v12;
        uint64_t v13 = [v9 actionWithTitle:v11 style:1 handler:v24];
        [v12 addAction:v13];

        BOOL v14 = (void *)MEMORY[0x1E4FB1410];
        id v15 = CNContactsUIBundle();
        double v16 = [v15 localizedStringForKey:@"ADDRESSING_GRAMMAR_UPDATE_SETTINGS_ALERT_UPDATE_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
        uint64_t v19 = MEMORY[0x1E4F143A8];
        uint64_t v20 = 3221225472;
        id v21 = __77__CNContactContentUnitaryViewController_showUpdateTermOfAddressAlertIfNeeded__block_invoke_2;
        int v22 = &unk_1E549B590;
        id v23 = v12;
        id v17 = v12;
        double v18 = [v14 actionWithTitle:v16 style:0 handler:&v19];
        objc_msgSend(v17, "addAction:", v18, v19, v20, v21, v22);

        [(CNContactContentUnitaryViewController *)self presentViewController:v17 animated:1 completion:0];
      }
    }
  }
}

uint64_t __77__CNContactContentUnitaryViewController_showUpdateTermOfAddressAlertIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

uint64_t __77__CNContactContentUnitaryViewController_showUpdateTermOfAddressAlertIfNeeded__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:&__block_literal_global_475];
}

void __77__CNContactContentUnitaryViewController_showUpdateTermOfAddressAlertIfNeeded__block_invoke_3()
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=General&path=INTERNATIONAL"];
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v0 openSensitiveURL:v1 withOptions:0];
}

- (void)finishEditing:(id)a3
{
  id v4 = a3;
  int v5 = [(CNContactContentUnitaryViewController *)self isEditing];
  [(CNContactContentUnitaryViewController *)self cancelAsyncLookups];
  BOOL v6 = [(CNContactContentUnitaryViewController *)self contactView];
  [v6 endEditing:1];

  uint64_t v7 = [(CNContactContentUnitaryViewController *)self splitViewController];
  if (!v7) {
    goto LABEL_3;
  }
  id v8 = (void *)v7;
  id v9 = [(CNContactContentUnitaryViewController *)self splitViewController];
  uint64_t v10 = [v9 firstResponder];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v12 = [(CNContactContentUnitaryViewController *)self splitViewController];
    uint64_t v13 = [v12 view];
    [v13 endEditing:1];

    if (!v5) {
      goto LABEL_7;
    }
  }
  else
  {
LABEL_3:
    if (!v5) {
      goto LABEL_7;
    }
  }
  if (![(CNContactContentUnitaryViewController *)self _modelHasChanges])
  {
    [(CNContactContentUnitaryViewController *)self editCancel:v4];
    goto LABEL_23;
  }
LABEL_7:
  uint64_t v14 = [(CNContactContentUnitaryViewController *)self presentingViewController];
  if (!v14) {
    goto LABEL_12;
  }
  id v15 = (void *)v14;
  double v16 = [(CNContactContentUnitaryViewController *)self parentViewController];
  objc_getClass("ABNewPersonViewController");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int64_t v17 = [(CNContactContentUnitaryViewController *)self mode];

    if (v17 == 3) {
      goto LABEL_13;
    }
LABEL_12:
    [(CNContactContentUnitaryViewController *)self setEditing:v5 ^ 1u animated:1];
    goto LABEL_13;
  }

LABEL_13:
  if (!v5)
  {
    [(CNContactContentUnitaryViewController *)self reloadDataPreservingChanges:0];
    id v23 = [(CNContactContentUnitaryViewController *)self editingContactView];
    [v23 reloadData];

    goto LABEL_26;
  }
  double v18 = [(CNContactContentUnitaryViewController *)self cardEditingGeminiGroup];
  int v19 = [v18 modified];

  if (v19) {
    [(CNContactContentUnitaryViewController *)self requestFavoritesUpdateWithGemini];
  }
  uint64_t v20 = CNUILogContactCard();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v25 = 0;
    _os_log_impl(&dword_18B625000, v20, OS_LOG_TYPE_DEFAULT, "[CNContactContentViewController] Done editing, will save changes", v25, 2u);
  }

  BOOL v21 = [(CNContactContentUnitaryViewController *)self saveChanges];
  [(CNContactContentViewController *)self setAlwaysEditing:0];
  if (v21)
  {
    int v22 = [(CNContactContentUnitaryViewController *)self mutableContact];
    [(CNContactContentUnitaryViewController *)self _didCompleteWithContact:v22];
  }
  else
  {
    [(CNContactContentUnitaryViewController *)self _didCompleteWithContact:0];
  }
  [(CNContactContentUnitaryViewController *)self reloadDataPreservingChanges:0];
  double v24 = [(CNContactContentUnitaryViewController *)self editingContactView];
  [v24 reloadData];

LABEL_23:
  [(CNContactContentUnitaryViewController *)self resetEditAuthorizationState];
  [(CNContactContentUnitaryViewController *)self setRequiresGameCenterRefresh:1];
  if ([(CNContactContentUnitaryViewController *)self supportsDrafts]) {
    +[CNUIDraftSupport deleteDrafts];
  }
  [(CNContactContentUnitaryViewController *)self showUpdateTermOfAddressAlertIfNeeded];
LABEL_26:
}

- (void)toggleEditing:(id)a3
{
  id v11 = a3;
  if (![(CNContactContentUnitaryViewController *)self isEditing]) {
    goto LABEL_7;
  }
  id v4 = [(CNContactContentUnitaryViewController *)self cardStaticIdentityGroup];
  int v5 = [v4 didChange];

  if (v5)
  {
    BOOL v6 = [(CNContactContentUnitaryViewController *)self cardStaticIdentityGroup];
    char v7 = [v6 saveChangesToKTStore];

    if (v7)
    {
      id v8 = objc_alloc(MEMORY[0x1E4F5A700]);
      id v9 = [(CNContactContentUnitaryViewController *)self contact];
      uint64_t v10 = (void *)[v8 initWithContact:v9];
      [(CNContactContentUnitaryViewController *)self setCachedStaticIdentity:v10];

      [(CNContactContentUnitaryViewController *)self setCachedVerifiedHandles:0];
LABEL_7:
      [(CNContactContentUnitaryViewController *)self finishEditing:v11];
      goto LABEL_8;
    }
    [(CNContactContentUnitaryViewController *)self alertStaticIdentitySaveFailed:v11];
  }
  else
  {
    if (![(CNContactContentUnitaryViewController *)self hadAtLeastOneVerifiedHandle]
      || [(CNContactContentUnitaryViewController *)self _hasAtLeastOneVerifiedHandle])
    {
      goto LABEL_7;
    }
    [(CNContactContentUnitaryViewController *)self alertDetailsNotVerified:v11];
  }
LABEL_8:
}

- (void)toggleEditing
{
}

- (BOOL)isContactProviderDataSource
{
  id v2 = [(CNContactContentViewController *)self parentContainer];
  BOOL v3 = [v2 type] == 1003;

  return v3;
}

- (BOOL)showsGroupMembership
{
  if (self->_showsGroupMembership) {
    return ![(CNContactContentUnitaryViewController *)self isContactProviderDataSource];
  }
  else {
    return 0;
  }
}

- (BOOL)allowsEditing
{
  if (self->_allowsEditing) {
    return ![(CNContactContentUnitaryViewController *)self isContactProviderDataSource];
  }
  else {
    return 0;
  }
}

- (void)updateContact:(id)a3
{
  if ([(CNContactContentUnitaryViewController *)self saveChanges])
  {
    id v4 = [(CNContactContentUnitaryViewController *)self mutableContact];
    [(CNContactContentUnitaryViewController *)self _didCompleteWithContact:v4];
  }
  else
  {
    [(CNContactContentUnitaryViewController *)self _didCompleteWithContact:0];
  }

  [(CNContactContentUnitaryViewController *)self reloadDataPreservingChanges:0];
}

- (id)authorizationCheck
{
  id v3 = objc_alloc(MEMORY[0x1E4F5A650]);
  id v4 = [(CNContactContentUnitaryViewController *)self contact];
  int v5 = [(CNContactContentViewController *)self parentContainer];
  BOOL v6 = [(CNContactContentViewController *)self ignoresParentalRestrictions];
  char v7 = [(CNContactContentUnitaryViewController *)self contactViewCache];
  id v8 = (void *)[v3 initWithContact:v4 parentContainer:v5 ignoresParentalRestrictions:v6 linkedParentContainerProvider:v7];

  return v8;
}

- (BOOL)saveWasAuthorized
{
  id v2 = self;
  id v3 = [(CNContactContentUnitaryViewController *)self authorizationCheck];
  LOBYTE(v2) = objc_msgSend(v3, "shouldBypassRestrictionsGivenAuthorizationResult:", -[CNContactContentUnitaryViewController editAuthorizationResult](v2, "editAuthorizationResult"));

  return (char)v2;
}

- (id)saveDescriptionForCurrentState
{
  double v16 = [CNUIContactSaveConfiguration alloc];
  id v15 = [(CNContactContentUnitaryViewController *)self contact];
  id v3 = [(CNContactContentUnitaryViewController *)self mutableContact];
  id v4 = [(CNContactContentUnitaryViewController *)self shadowCopyOfReadonlyContact];
  int v5 = [(CNContactContentUnitaryViewController *)self editingLinkedContacts];
  BOOL v6 = [(CNContactContentUnitaryViewController *)self contactStore];
  char v7 = [(CNContactContentViewController *)self parentGroup];
  id v8 = [(CNContactContentViewController *)self parentContainer];
  id v9 = [(CNContactContentUnitaryViewController *)self containerContext];
  uint64_t v10 = [(CNContactContentUnitaryViewController *)self groupContext];
  BOOL v11 = [(CNContactContentViewController *)self ignoresParentalRestrictions];
  BYTE1(v14) = [(CNContactContentUnitaryViewController *)self saveWasAuthorized];
  LOBYTE(v14) = v11;
  id v12 = -[CNUIContactSaveConfiguration initWithContact:mutableContact:shadowCopyOfReadonlyContact:editingLinkedContacts:contactStore:parentGroup:parentContainer:containerContext:groupContext:ignoresParentalRestrictions:saveWasAuthorized:](v16, "initWithContact:mutableContact:shadowCopyOfReadonlyContact:editingLinkedContacts:contactStore:parentGroup:parentContainer:containerContext:groupContext:ignoresParentalRestrictions:saveWasAuthorized:", v15, v3, v4, v5, v6, v7, v8, v9, v10, v14);

  return v12;
}

- (BOOL)performSave
{
  id v3 = [(CNContactContentUnitaryViewController *)self saveContactExecutor];
  id v4 = [(CNContactContentUnitaryViewController *)self saveDescriptionForCurrentState];
  int v5 = [v3 executeSaveWithConfiguration:v4 saveDelegate:self];

  BOOL v6 = [MEMORY[0x1E4F1CA48] array];
  [(CNContactContentUnitaryViewController *)self setIssuedSaveRequestIdentifiers:v6];

  if ([v5 success])
  {
    [(CNContactContentUnitaryViewController *)self setShadowCopyOfReadonlyContact:0];
    char v7 = _LargeDatabasesSignpostLogQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__CNContactContentUnitaryViewController_performSave__block_invoke;
    block[3] = &unk_1E549B488;
    id v14 = v5;
    dispatch_async(v7, block);
  }
  id v8 = [(CNContactContentUnitaryViewController *)self issuedSaveRequestIdentifiers];
  id v9 = [v5 identifiersOfIssuedSaveRequests];
  [v8 addObjectsFromArray:v9];

  [(CNContactContentUnitaryViewController *)self setEditingLinkedContacts:0];
  [(CNContactContentUnitaryViewController *)self setGroupEditingContext:0];
  uint64_t v10 = [v5 contact];
  [(CNContactContentUnitaryViewController *)self setContact:v10];

  char v11 = [v5 success];
  return v11;
}

void __52__CNContactContentUnitaryViewController_performSave__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) contact];
  +[CNContactContentUnitaryViewController _telemetryForContact:v1];
}

- (void)saveModelChangesToContact
{
  id v3 = [(CNContactContentUnitaryViewController *)self editingGroups];
  [(CNContactContentUnitaryViewController *)self _saveChangesForGroups:v3];

  id v4 = [(CNContactContentUnitaryViewController *)self deletedEditingGroups];
  [(CNContactContentUnitaryViewController *)self _saveChangesForGroups:v4];

  int v5 = [(CNContactContentUnitaryViewController *)self editingHeaderView];
  [v5 saveContactPhoto];

  BOOL v6 = [(CNContactContentUnitaryViewController *)self contact];
  char v7 = [v6 givenName];
  id v8 = [(CNContactContentUnitaryViewController *)self mutableContact];
  id v9 = [v8 givenName];
  if ([v7 isEqualToString:v9])
  {
    uint64_t v10 = [(CNContactContentUnitaryViewController *)self contact];
    char v11 = [v10 familyName];
    id v12 = [(CNContactContentUnitaryViewController *)self mutableContact];
    uint64_t v13 = [v12 familyName];
    char v14 = [v11 isEqualToString:v13];

    if (v14) {
      return;
    }
  }
  else
  {
  }
  id v15 = [(CNContactContentUnitaryViewController *)self mutableContact];
  [v15 setPhonemeData:0];
}

- (void)performSaveToSharedProfile
{
  if ([(CNContactContentUnitaryViewController *)self shouldUpdateSharedProfile])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__CNContactContentUnitaryViewController_performSaveToSharedProfile__block_invoke;
    aBlock[3] = &unk_1E549B488;
    void aBlock[4] = self;
    id v3 = (void (**)(void))_Block_copy(aBlock);
    id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
    if (![v4 userInterfaceIdiom])
    {
      int v5 = [(CNContactContentUnitaryViewController *)self editingNicknameContact];
      uint64_t v6 = [v5 wallpaper];
      if (v6)
      {
        char v7 = (void *)v6;
        id v8 = [(CNContactContentUnitaryViewController *)self editingNicknameContact];
        id v9 = [v8 watchWallpaperImageData];

        if (!v9)
        {
          uint64_t v10 = [(CNContactContentUnitaryViewController *)self editingNicknameContact];
          char v11 = [v10 wallpaper];
          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = 3221225472;
          v12[2] = __67__CNContactContentUnitaryViewController_performSaveToSharedProfile__block_invoke_451;
          v12[3] = &unk_1E549B568;
          v12[4] = self;
          uint64_t v13 = v3;
          [v11 snapshotImageDataForWatchWithCompletion:v12];

          goto LABEL_5;
        }
LABEL_4:
        v3[2](v3);
LABEL_5:

        return;
      }
    }
    goto LABEL_4;
  }

  [(CNContactContentUnitaryViewController *)self setSavingPersonalSharedProfile:0];
}

void __67__CNContactContentUnitaryViewController_performSaveToSharedProfile__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v3 = [v2 nicknameProvider];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__CNContactContentUnitaryViewController_performSaveToSharedProfile__block_invoke_2;
  v4[3] = &unk_1E549B4B0;
  void v4[4] = *(void *)(a1 + 32);
  [v3 fetchPersonalNicknameAsContactWithCompletion:v4];
}

void __67__CNContactContentUnitaryViewController_performSaveToSharedProfile__block_invoke_451(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [v3 editingNicknameContact];
  id v6 = (id)[v5 mutableCopy];

  [v6 setWatchWallpaperImageData:v4];
  [*(id *)(a1 + 32) setEditingNicknameContact:v6];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __67__CNContactContentUnitaryViewController_performSaveToSharedProfile__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = CNUILogContactCard();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    id v24 = v3;
    _os_log_impl(&dword_18B625000, v4, OS_LOG_TYPE_DEFAULT, "[CNContactContentViewController] Personal nickname contact fetched from IMNicknameProvider: %@", (uint8_t *)&v23, 0xCu);
  }

  int v5 = (void *)[v3 mutableCopy];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) editingNicknameContact];
    id v7 = (id)[v8 mutableCopy];
  }
  if (v3)
  {
    id v9 = [*(id *)(a1 + 32) editingNicknameContact];
    uint64_t v10 = [v9 thumbnailImageData];
    [v7 setImageData:v10];

    char v11 = [*(id *)(a1 + 32) editingNicknameContact];
    id v12 = [v11 thumbnailImageData];
    [v7 setThumbnailImageData:v12];

    objc_msgSend(v7, "setCropRect:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v13 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v14 = [v13 userInterfaceIdiom];

    if (!v14)
    {
      id v15 = [*(id *)(a1 + 32) editingNicknameContact];
      double v16 = [v15 wallpaper];
      [v7 setWallpaper:v16];

      int64_t v17 = [*(id *)(a1 + 32) editingNicknameContact];
      double v18 = [v17 watchWallpaperImageData];
      [v7 setWatchWallpaperImageData:v18];
    }
  }
  int v19 = CNUILogContactCard();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v23) = 0;
    _os_log_impl(&dword_18B625000, v19, OS_LOG_TYPE_DEFAULT, "[CNContactContentViewController] Saving personal photo and poster changes to Shared Name & Photo", (uint8_t *)&v23, 2u);
  }

  uint64_t v20 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  BOOL v21 = [v20 nicknameProvider];
  int v22 = [v7 freeze];
  [v21 setPersonalNicknameWithContact:v22];

  [*(id *)(a1 + 32) setEditingNicknameContact:0];
  [*(id *)(a1 + 32) setSavingPersonalSharedProfile:0];
}

- (void)saveModelChangesToSharedProfileContact
{
  id v3 = (void *)[(CNMutableContact *)self->_mutableContact copy];
  [(CNContactContentUnitaryViewController *)self setEditingNicknameContact:v3];

  [(CNContactContentUnitaryViewController *)self setSavingPersonalSharedProfile:1];
}

- (BOOL)shouldUseSharedProfile
{
  BOOL v3 = [(CNContactContentUnitaryViewController *)self showingMeContact];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F5A6D8] unifiedMeContactMonitor];
    int v5 = [(CNContactContentUnitaryViewController *)self contact];
    char v6 = [v4 isMeContact:v5];

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)shouldUpdateSharedProfile
{
  BOOL v3 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v4 = [v3 featureFlags];
  if ([v4 isFeatureEnabled:15]) {
    BOOL v5 = [(CNContactContentUnitaryViewController *)self shouldUseSharedProfile];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)saveChanges
{
  if (self->_saving) {
    return 0;
  }
  self->_saving = 1;
  [(CNContactContentUnitaryViewController *)self saveModelChangesToContact];
  if ([(CNContactContentUnitaryViewController *)self shouldUpdateSharedProfile]) {
    [(CNContactContentUnitaryViewController *)self saveModelChangesToSharedProfileContact];
  }
  id v4 = CNUILogContactCard();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v6 = 0;
    _os_log_impl(&dword_18B625000, v4, OS_LOG_TYPE_DEFAULT, "[CNContactContentViewController] performing save…", v6, 2u);
  }

  BOOL v5 = [(CNContactContentUnitaryViewController *)self performSave];
  BOOL result = 0;
  self->_saving = 0;
  if (v5)
  {
    if ([(CNContactContentUnitaryViewController *)self shouldUpdateSharedProfile]) {
      [(CNContactContentUnitaryViewController *)self performSaveToSharedProfile];
    }
    return 1;
  }
  return result;
}

- (void)clearMapsDataIfEdited
{
  if ([(CNContactContentUnitaryViewController *)self _modelHasChanges])
  {
    id v3 = [(CNContactContentUnitaryViewController *)self mutableContact];
    [v3 setMapsData:0];
  }
}

- (void)presentConfirmCancelAlertController
{
  id v2 = [(CNContactContentUnitaryViewController *)self delegate];
  [v2 presentCancelConfirmationAlert];
}

- (void)popToPrevious:(id)a3
{
  id v4 = [(CNContactContentUnitaryViewController *)self currentNavigationController];
  id v3 = (id)[v4 popViewControllerAnimated:1];
}

- (void)editCancel:(id)a3
{
  if ([(CNContactContentUnitaryViewController *)self hasPendingChanges])
  {
    if ([(CNContactContentUnitaryViewController *)self isOutOfProcess])
    {
      id v4 = [(CNContactContentUnitaryViewController *)self contactView];
      [v4 endEditing:1];
    }
    [(CNContactContentUnitaryViewController *)self presentConfirmCancelAlertController];
  }
  else
  {
    [(CNContactContentUnitaryViewController *)self performConfirmedCancel];
  }
  if (self->_needsRefetch)
  {
    [(CNContactContentUnitaryViewController *)self _refetchContact];
  }
}

- (void)cancelAsyncLookups
{
  id v3 = [(CNContactContentUnitaryViewController *)self faceTimeIDSLookupToken];
  [v3 cancel];

  [(CNContactContentUnitaryViewController *)self setFaceTimeIDSLookupToken:0];
  id v4 = [(CNContactContentUnitaryViewController *)self iMessageIDSLookupToken];
  [v4 cancel];

  [(CNContactContentUnitaryViewController *)self setIMessageIDSLookupToken:0];
  BOOL v5 = [(CNContactContentUnitaryViewController *)self medicalIDLookupToken];
  [v5 cancel];

  [(CNContactContentUnitaryViewController *)self setMedicalIDLookupToken:0];
}

- (BOOL)hasPendingChanges
{
  if ([(CNContactContentUnitaryViewController *)self _modelIsEmpty]
    || ![(CNContactContentUnitaryViewController *)self _modelHasChanges])
  {
    return 0;
  }

  return [(CNContactContentUnitaryViewController *)self isEditing];
}

- (void)updateDoneButton
{
  if ([(CNContactContentUnitaryViewController *)self isOutOfProcess]
    && ![(CNContactContentUnitaryViewController *)self outOfProcessSetupComplete])
  {
    return;
  }
  id v21 = [(CNContactContentUnitaryViewController *)self navigationItemController];
  if ([(CNContactContentUnitaryViewController *)self isEditing])
  {
    BOOL v3 = [(CNContactContentUnitaryViewController *)self hasPendingChanges];
    id v4 = [v21 editButtonItem];
    [v4 setEnabled:v3];

    if ([(CNContactContentUnitaryViewController *)self mode] != 4)
    {
LABEL_13:
      int v12 = 1;
      goto LABEL_14;
    }
    BOOL v5 = CNContactsUIBundle();
    char v6 = [v5 localizedStringForKey:@"UPDATE" value:&stru_1ED8AC728 table:@"Localized"];
    id v7 = [v21 editButtonItem];
    [v7 setTitle:v6];

LABEL_12:
    goto LABEL_13;
  }
  if ([(CNContactContentUnitaryViewController *)self allowsEditing])
  {
    BOOL v5 = [v21 editButtonItem];
    [v5 setEnabled:1];
LABEL_11:
    BOOL v3 = 0;
    goto LABEL_12;
  }
  if ([(CNContactContentUnitaryViewController *)self mode] == 5)
  {
    id v8 = CNContactsUIBundle();
    id v9 = [v8 localizedStringForKey:@"UPDATE" value:&stru_1ED8AC728 table:@"Localized"];
    uint64_t v10 = [v21 editButtonItem];
    [v10 setTitle:v9];

    BOOL v5 = CNContactsUIBundle();
    char v11 = [v5 localizedStringForKey:@"REVIEW" value:&stru_1ED8AC728 table:@"Localized"];
    [v21 setTitle:v11];

    goto LABEL_11;
  }
  BOOL v3 = 0;
  int v12 = 0;
LABEL_14:
  [(CNContactContentUnitaryViewController *)self setSaveKeyboardShortcutEnabled:v3];
  uint64_t v13 = [(CNContactContentUnitaryViewController *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v12 && (v14 & 1) != 0)
  {
    id v15 = [(CNContactContentUnitaryViewController *)self delegate];
    uint64_t v16 = [(CNContactContentUnitaryViewController *)self isEditing];
    int64_t v17 = [v21 editButtonItem];
    uint64_t v18 = [v17 isEnabled];
    int v19 = [v21 editButtonItem];
    uint64_t v20 = [v19 title];
    [v15 updateEditing:v16 doneButtonEnabled:v18 doneButtonText:v20];
  }
}

- (void)updateWindowTitleForAppearing:(BOOL)a3
{
  if (a3)
  {
    id v10 = [(CNContactContentUnitaryViewController *)self title];
    if (!v10)
    {
      id v4 = [(CNContactContentUnitaryViewController *)self navigationController];
      id v10 = [v4 title];

      if (!v10)
      {
        BOOL v5 = [(CNContactContentUnitaryViewController *)self contactFormatter];
        char v6 = [(CNContactContentUnitaryViewController *)self contact];
        id v10 = [v5 stringFromContact:v6];
      }
    }
    id v7 = [(CNContactContentUnitaryViewController *)self view];
    id v8 = [v7 window];
    id v9 = [v8 windowScene];
    [v9 setTitle:v10];
  }
  else
  {
    id v10 = [(CNContactContentUnitaryViewController *)self view];
    id v7 = [v10 window];
    id v8 = [v7 windowScene];
    [v8 setTitle:0];
  }
}

- (void)applyNavigationBarTintColorIfNeeded:(id)a3
{
  id v4 = a3;
  if ([(CNContactContentUnitaryViewController *)self displayNavigationButtonsShouldUsePlatterStyle])
  {
    if ([(CNContactContentUnitaryViewController *)self _appearState] == 3
      || ![(CNContactContentUnitaryViewController *)self _appearState])
    {
      BOOL v5 = CNUILogContactCard();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)id v8 = 0;
        _os_log_debug_impl(&dword_18B625000, v5, OS_LOG_TYPE_DEBUG, "Not updating navigation bar tint color, view controller is being dismissed", v8, 2u);
      }
    }
    else
    {
      if ([(CNContactContentUnitaryViewController *)self isEditing]) {
        [MEMORY[0x1E4FB1618] tintColor];
      }
      else {
      BOOL v5 = +[CNUIColorRepository contactCardStaticHeaderDefaultTintColor];
      }
      char v6 = [v4 navigationItem];
      id v7 = [v6 navigationBar];
      [v7 setTintColor:v5];
    }
  }
}

- (void)applyPlatterStyleToBarButtonItemsIfNeeded:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CNContactContentUnitaryViewController *)self displayNavigationButtonsShouldUsePlatterStyle])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
          if ([(CNContactContentUnitaryViewController *)self isEditing]) {
            [(CNContactContentUnitaryViewController *)self transparentPlatterImage];
          }
          else {
          char v11 = [(CNContactContentUnitaryViewController *)self buttonPlatterImage];
          }
          [v10 setBackgroundImage:v11 forState:0 barMetrics:0];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (BOOL)displayNavigationButtonsShouldUsePlatterStyle
{
  BOOL v3 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v4 = [v3 featureFlags];
  if ([v4 isFeatureEnabled:15]) {
    BOOL v5 = ![(CNContactContentUnitaryViewController *)self shouldDrawNavigationBar];
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)updateEditNavigationItemsAnimated:(BOOL)a3 updateTintColor:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v6 = self;
  v88[1] = *MEMORY[0x1E4F143B8];
  if ([(CNContactContentUnitaryViewController *)self isOutOfProcess]
    && ![(CNContactContentUnitaryViewController *)v6 outOfProcessSetupComplete])
  {
    return;
  }
  uint64_t v7 = [(CNContactContentUnitaryViewController *)v6 navigationItemController];
  uint64_t v8 = [(CNContactContentUnitaryViewController *)v7 navigationItem];
  uint64_t v9 = [(CNContactContentUnitaryViewController *)v6 currentNavigationController];
  id v10 = [v9 navigationBar];
  char v11 = [v10 backItem];

  if (([(CNContactContentUnitaryViewController *)v6 isEditing] & 1) == 0
    && ![(CNContactContentUnitaryViewController *)v6 allowsEditing])
  {
    if ([(CNContactContentUnitaryViewController *)v6 mode] == 5)
    {
      double v28 = [(CNContactContentUnitaryViewController *)v7 editButtonItem];
      [v28 setStyle:2];

      objc_super v29 = [(CNContactContentUnitaryViewController *)v7 editButtonItem];
      [v29 setTarget:v6];

      double v30 = [(CNContactContentUnitaryViewController *)v7 editButtonItem];
      [v30 setAction:sel_updateContact_];

      double v31 = CNContactsUIBundle();
      double v32 = [v31 localizedStringForKey:@"UPDATE" value:&stru_1ED8AC728 table:@"Localized"];
      objc_super v33 = [(CNContactContentUnitaryViewController *)v7 editButtonItem];
      [v33 setTitle:v32];

      double v34 = [(CNContactContentUnitaryViewController *)v7 editButtonItem];
      id v84 = v34;
      uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v84 count:1];

      double v27 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:v6 action:sel_editCancel_];
      char v83 = v27;
      uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
      [(CNContactContentUnitaryViewController *)v6 setCancelKeyboardShortcutEnabled:1];
      [(CNContactContentUnitaryViewController *)v6 setEditKeyboardShortcutEnabled:1];
      goto LABEL_35;
    }
    int v35 = [v8 rightBarButtonItems];
    double v36 = [v35 firstObject];
    double v37 = [(CNContactContentUnitaryViewController *)v7 editButtonItem];

    if (v36 == v37) {
      uint64_t v25 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else {
      uint64_t v25 = 0;
    }
    [(CNContactContentUnitaryViewController *)v6 setCancelKeyboardShortcutEnabled:0];
    [(CNContactContentUnitaryViewController *)v6 setEditKeyboardShortcutEnabled:0];
    id v38 = [v8 backBarButtonItem];

    if (v38)
    {
      double v27 = [v8 backBarButtonItem];
      unsigned int v82 = v27;
      double v39 = (void *)MEMORY[0x1E4F1C978];
      double v40 = &v82;
LABEL_33:
      uint64_t v41 = [v39 arrayWithObjects:v40 count:1];
LABEL_34:
      uint64_t v17 = (void *)v41;
      goto LABEL_35;
    }
    BOOL v79 = [(CNContactContentUnitaryViewController *)v6 displayNavigationButtonsShouldUsePlatterStyle];
    if (v11)
    {
      if (v79)
      {
        double v27 = [(CNContactContentUnitaryViewController *)v6 platterBackBarButtonItem];
        unsigned int v81 = v27;
        double v39 = (void *)MEMORY[0x1E4F1C978];
        double v40 = &v81;
        goto LABEL_33;
      }
    }
    else if (v79)
    {
      double v27 = [v8 leftBarButtonItems];
      uint64_t v41 = objc_msgSend(v27, "_cn_filter:", &__block_literal_global_433);
      goto LABEL_34;
    }
    uint64_t v17 = 0;
    goto LABEL_36;
  }
  if (![(CNContactContentUnitaryViewController *)v6 isEditing])
  {
    [(CNContactContentUnitaryViewController *)v6 setCancelKeyboardShortcutEnabled:0];
    uint64_t v18 = [v8 backBarButtonItem];

    if (v18)
    {
      int v19 = [v8 backBarButtonItem];
      double v87 = v19;
      uint64_t v20 = (void *)MEMORY[0x1E4F1C978];
      id v21 = &v87;
    }
    else
    {
      if (!v11
        || ![(CNContactContentUnitaryViewController *)v6 displayNavigationButtonsShouldUsePlatterStyle])
      {
        double v47 = [(CNContactContentUnitaryViewController *)v6 preEditLeftBarButtonItems];

        if (v47)
        {
          uint64_t v17 = [(CNContactContentUnitaryViewController *)v6 preEditLeftBarButtonItems];
          goto LABEL_16;
        }
        if (v11
          || ![(CNContactContentUnitaryViewController *)v6 displayNavigationButtonsShouldUsePlatterStyle])
        {
          uint64_t v17 = 0;
          goto LABEL_16;
        }
        int v19 = [v8 leftBarButtonItems];
        uint64_t v22 = objc_msgSend(v19, "_cn_filter:", &__block_literal_global_418);
LABEL_15:
        uint64_t v17 = (void *)v22;

LABEL_16:
        [(CNContactContentUnitaryViewController *)v6 setPreEditLeftBarButtonItems:0];
        goto LABEL_17;
      }
      int v19 = [(CNContactContentUnitaryViewController *)v6 platterBackBarButtonItem];
      long long v86 = v19;
      uint64_t v20 = (void *)MEMORY[0x1E4F1C978];
      id v21 = &v86;
    }
    uint64_t v22 = [v20 arrayWithObjects:v21 count:1];
    goto LABEL_15;
  }
  long long v12 = [(CNContactContentUnitaryViewController *)v6 preEditLeftBarButtonItems];

  if (!v12)
  {
    long long v13 = [v8 leftBarButtonItems];
    long long v14 = objc_msgSend(v13, "_cn_filter:", &__block_literal_global_412);

    if (v14) {
      long long v15 = v14;
    }
    else {
      long long v15 = (void *)MEMORY[0x1E4F1CBF0];
    }
    [(CNContactContentUnitaryViewController *)v6 setPreEditLeftBarButtonItems:v15];
  }
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:v6 action:sel_editCancel_];
  v88[0] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:1];
  [(CNContactContentUnitaryViewController *)v6 setCancelKeyboardShortcutEnabled:1];

LABEL_17:
  [(CNContactContentUnitaryViewController *)v6 setEditKeyboardShortcutEnabled:1];
  [(CNContactContentUnitaryViewController *)v6 updateDoneButton];
  if (v7 != v6) {
    [(CNContactContentUnitaryViewController *)v7 setEditing:[(CNContactContentUnitaryViewController *)v6 isEditing]];
  }
  int v23 = [(CNContactContentUnitaryViewController *)v7 editButtonItem];
  [v23 setTarget:v6];

  id v24 = [(CNContactContentUnitaryViewController *)v7 editButtonItem];
  [v24 setAction:sel_toggleEditing_];

  uint64_t v25 = [(CNContactContentUnitaryViewController *)v7 editButtonItem];

  if (v25)
  {
    char v26 = [(CNContactContentUnitaryViewController *)v7 editButtonItem];
    long long v85 = v26;
    uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
  }
  if (v4)
  {
    double v27 = [(CNContactContentUnitaryViewController *)v6 navigationItemController];
    [(CNContactContentUnitaryViewController *)v6 applyNavigationBarTintColorIfNeeded:v27];
LABEL_35:
  }
LABEL_36:
  if ([(UIViewController *)v6 ab_isInSheet])
  {
    id v42 = [v8 rightBarButtonItems];
    id v43 = [v8 leftBarButtonItems];
    id v44 = [(CNContactContentUnitaryViewController *)v6 extraRightBarButtonItems];

    if (!v44)
    {
      if ([v42 count])
      {
        uint64_t v45 = v6;
        uint64_t v46 = v42;
      }
      else
      {
        uint64_t v46 = (void *)MEMORY[0x1E4F1CBF0];
        uint64_t v45 = v6;
      }
      [(CNContactContentUnitaryViewController *)v45 setExtraRightBarButtonItems:v46];
    }
    CGRect v48 = [(CNContactContentUnitaryViewController *)v6 extraRightBarButtonItems];
    if ([v48 count])
    {
      id v49 = v17;
      uint64_t v50 = [v25 count];

      if (v50)
      {
        uint64_t v17 = v49;
        goto LABEL_49;
      }
      [(CNContactContentUnitaryViewController *)v6 extraRightBarButtonItems];
      uint64_t v25 = v48 = v25;
      uint64_t v17 = v49;
    }

LABEL_49:
    long long v51 = [(CNContactContentUnitaryViewController *)v6 extraLeftBarButtonItems];

    if (!v51)
    {
      if ([v43 count])
      {
        long long v52 = v6;
        long long v53 = v43;
      }
      else
      {
        long long v53 = (void *)MEMORY[0x1E4F1CBF0];
        long long v52 = v6;
      }
      [(CNContactContentUnitaryViewController *)v52 setExtraLeftBarButtonItems:v53];
    }
    id v54 = [(CNContactContentUnitaryViewController *)v6 extraLeftBarButtonItems];
    if ([v54 count])
    {
      id v55 = v7;
      char v56 = v17;
      uint64_t v57 = [v17 count];

      if (v57)
      {
        uint64_t v17 = v56;
        uint64_t v7 = v55;
LABEL_59:

        goto LABEL_60;
      }
      uint64_t v17 = [(CNContactContentUnitaryViewController *)v6 extraLeftBarButtonItems];
      id v54 = v56;
      uint64_t v7 = v55;
    }

    goto LABEL_59;
  }
LABEL_60:
  if (v17) {
    [v8 setLeftBarButtonItems:v17 animated:v5];
  }
  uint64_t v58 = *MEMORY[0x1E4F5A258];
  long long v59 = [v8 leftBarButtonItems];
  char v60 = (*(uint64_t (**)(uint64_t, void *))(v58 + 16))(v58, v59);

  if ((v60 & 1) == 0)
  {
    long long v59 = [v8 leftBarButtonItems];
    [(CNContactContentUnitaryViewController *)v6 applyPlatterStyleToBarButtonItemsIfNeeded:v59];
  }
  if (v25) {
    [v8 setRightBarButtonItems:v25 animated:v5];
  }
  double v61 = [v8 rightBarButtonItems];
  char v62 = (*(uint64_t (**)(uint64_t, void *))(v58 + 16))(v58, v61);

  if ((v62 & 1) == 0)
  {
    id v63 = [v8 rightBarButtonItems];
    [(CNContactContentUnitaryViewController *)v6 applyPlatterStyleToBarButtonItemsIfNeeded:v63];
  }
  id v64 = [(CNContactContentUnitaryViewController *)v6 delegate];
  char v65 = objc_opt_respondsToSelector();

  if (v25 && (v65 & 1) != 0)
  {
    uint64_t v66 = [(CNContactContentUnitaryViewController *)v6 delegate];
    unsigned int v80 = [(CNContactContentUnitaryViewController *)v6 isEditing];
    long long v59 = [(CNContactContentUnitaryViewController *)v7 editButtonItem];
    uint64_t v67 = [v59 isEnabled];
    [(CNContactContentUnitaryViewController *)v7 editButtonItem];
    id v64 = v6;
    id v68 = v25;
    v69 = v8;
    id v70 = v7;
    uint64_t v72 = v71 = v17;
    id v73 = [v72 title];
    [v66 updateEditing:v80 doneButtonEnabled:v67 doneButtonText:v73];

    uint64_t v17 = v71;
    uint64_t v7 = v70;
    uint64_t v8 = v69;
    uint64_t v25 = v68;
    uint64_t v6 = v64;
  }
  if ([(CNContactContentUnitaryViewController *)v6 isEditing])
  {
    BOOL v74 = [(CNContactContentUnitaryViewController *)v6 layoutPositionallyAfterNavBar];
    if (v74)
    {
      int v75 = 0;
      uint64_t v76 = 1;
    }
    else
    {
      uint64_t v77 = [v8 title];
      if (v77)
      {
        id v64 = (CNContactContentUnitaryViewController *)v77;
        int v75 = 0;
        uint64_t v76 = 1;
      }
      else
      {
        long long v59 = [v8 titleView];
        id v64 = 0;
        if (v59)
        {
          int v75 = 1;
          uint64_t v76 = 1;
        }
        else
        {
          uint64_t v76 = [v8 _backgroundHidden] ^ 1;
          int v75 = 1;
        }
      }
    }
    char v78 = [(CNContactContentUnitaryViewController *)v6 editingHeaderView];
    [v78 setShouldShowBelowNavigationTitle:v76];

    if (v75) {
    if (!v74)
    }
  }
}

BOOL __91__CNContactContentUnitaryViewController_updateEditNavigationItemsAnimated_updateTintColor___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

BOOL __91__CNContactContentUnitaryViewController_updateEditNavigationItemsAnimated_updateTintColor___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

BOOL __91__CNContactContentUnitaryViewController_updateEditNavigationItemsAnimated_updateTintColor___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (void)updateEditNavigationItemsAnimated:(BOOL)a3
{
}

- (id)navigationItemController
{
  id v2 = self;
  BOOL v3 = v2;
  if (v2)
  {
    BOOL v4 = v2;
    while (1)
    {
      BOOL v5 = [(CNContactContentUnitaryViewController *)v4 parentViewController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        break;
      }
      uint64_t v7 = [(CNContactContentUnitaryViewController *)v4 parentViewController];

      BOOL v4 = (CNContactContentUnitaryViewController *)v7;
      if (!v7) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    BOOL v4 = v3;
  }

  return v4;
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  if (a3 == 4)
  {
    BOOL v5 = [(CNContactContentUnitaryViewController *)self contactView];
  }
  else
  {
    BOOL v5 = 0;
  }
  return v5;
}

- (id)_policyForContact:(id)a3 mode:(int64_t)a4
{
  id v6 = a3;
  if (![(CNContactContentUnitaryViewController *)self allowsAddingToAddressBook]
    && (![(CNContactContentUnitaryViewController *)self allowsEditing]
     || ![v6 hasBeenPersisted]))
  {
    goto LABEL_10;
  }
  if ((unint64_t)a4 <= 5 && ((1 << a4) & 0x32) != 0)
  {
    uint64_t v7 = [(CNContactContentUnitaryViewController *)self contactViewCache];
    uint64_t v8 = v7;
    id v9 = v6;
  }
  else
  {
    uint64_t v7 = [(CNContactContentUnitaryViewController *)self contactViewCache];
    uint64_t v8 = v7;
    id v9 = 0;
  }
  id v10 = [v7 policyForContact:v9];

  if (!v10)
  {
LABEL_10:
    id v10 = [MEMORY[0x1E4F1BA68] sharedPermissivePolicy];
  }

  return v10;
}

- (id)indexPathOfPropertyItem:(id)a3 editing:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 group];
  if (a4)
  {
    uint64_t v8 = [(CNContactContentUnitaryViewController *)self editingContactView];
    int64_t v9 = [(CNContactContentUnitaryViewController *)self sectionOfGroup:v7 inTableView:v8];
    [v7 editingItems];
  }
  else
  {
    uint64_t v8 = [(CNContactContentUnitaryViewController *)self displayContactView];
    int64_t v9 = [(CNContactContentUnitaryViewController *)self sectionOfGroup:v7 inTableView:v8];
    [v7 displayItems];
  id v10 = };
  uint64_t v11 = [v10 indexOfObject:v6];

  long long v12 = 0;
  if (v9 != 0x7FFFFFFFFFFFFFFFLL && v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v12 = [MEMORY[0x1E4F28D58] indexPathForRow:v11 inSection:v9];
  }

  return v12;
}

- (id)indexPathOfEditingPropertyItem:(id)a3
{
  return [(CNContactContentUnitaryViewController *)self indexPathOfPropertyItem:a3 editing:1];
}

- (id)indexPathOfDisplayedPropertyItem:(id)a3
{
  return [(CNContactContentUnitaryViewController *)self indexPathOfPropertyItem:a3 editing:0];
}

- (void)adjustPreferredContentSize
{
  [(CNContactContentUnitaryViewController *)self requiredSizeForVisibleTableView];
  double v4 = v3;
  double v6 = v5;
  [(CNContactContentUnitaryViewController *)self preferredContentSize];
  if (v4 != v8 || v6 != v7)
  {
    -[CNContactContentUnitaryViewController setPreferredContentSize:](self, "setPreferredContentSize:", v4, v6);
    id v10 = [(CNContactContentUnitaryViewController *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = [(CNContactContentUnitaryViewController *)self delegate];
      [(CNContactContentUnitaryViewController *)self preferredContentSize];
      objc_msgSend(v12, "didChangePreferredContentSize:");
    }
  }
}

- (void)reloadCardGroupsForFavoritesUpdateInTableView:(id)a3
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CNContactContentUnitaryViewController *)self isViewLoaded]
    && ![(CNContactContentUnitaryViewController *)self needsReload])
  {
    double v5 = [(CNContactContentUnitaryViewController *)self cardGroupForProperty:*MEMORY[0x1E4F1ADC8]];
    double v6 = [(CNContactContentUnitaryViewController *)self cardGroupForProperty:*MEMORY[0x1E4F1AEE0]];
    v21[0] = v5;
    v21[1] = v6;
    double v7 = [(CNContactContentUnitaryViewController *)self cardActionsGroup];
    v21[2] = v7;
    double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];

    id v9 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          int64_t v15 = -[CNContactContentUnitaryViewController sectionOfGroup:inTableView:](self, "sectionOfGroup:inTableView:", *(void *)(*((void *)&v16 + 1) + 8 * v14), v4, (void)v16);
          if (v15 != 0x7FFFFFFFFFFFFFFFLL) {
            [v9 addIndex:v15];
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }

    [(CNContactContentUnitaryViewController *)self reloadSections:v9 forTableView:v4];
  }
}

- (void)reloadSections:(id)a3 forTableView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v6 beginUpdates];
  [v6 reloadSections:v7 withRowAnimation:0];

  [v6 endUpdates];
  if ([(CNContactContentUnitaryViewController *)self shouldUseStaticHeader]) {
    [(CNContactContentUnitaryViewController *)self updateCollapsedHeaderToMatchScrollViewState:v6 scrollDirection:2 animated:0];
  }
  else {
    [(CNContactContentUnitaryViewController *)self updateHeaderHeightToMatchScrollViewState:v6 scrollDirection:2 animated:0];
  }

  [(CNContactContentUnitaryViewController *)self adjustPreferredContentSize];
}

- (void)reloadCardGroup:(id)a3 forTableView:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([(CNContactContentUnitaryViewController *)self isViewLoaded])
  {
    if (![(CNContactContentUnitaryViewController *)self needsReload])
    {
      int64_t v7 = [(CNContactContentUnitaryViewController *)self sectionOfGroup:v9 inTableView:v6];
      if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      {
        double v8 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v7];
        [(CNContactContentUnitaryViewController *)self reloadSections:v8 forTableView:v6];
      }
    }
  }
}

- (void)removeActionWithTarget:(id)a3 selector:(SEL)a4 inGroup:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [v9 removeActionWithTarget:v8 selector:a4];
  id v10 = [(CNContactContentUnitaryViewController *)self customActions];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  long long v16 = __81__CNContactContentUnitaryViewController_removeActionWithTarget_selector_inGroup___block_invoke;
  long long v17 = &unk_1E549B520;
  id v18 = v8;
  id v19 = v9;
  uint64_t v20 = self;
  SEL v21 = a4;
  id v11 = v9;
  id v12 = v8;
  uint64_t v13 = objc_msgSend(v10, "_cn_filter:", &v14);
  -[CNContactContentUnitaryViewController setCustomActions:](self, "setCustomActions:", v13, v14, v15, v16, v17);

  [(CNContactContentUnitaryViewController *)self setNeedsReload];
}

uint64_t __81__CNContactContentUnitaryViewController_removeActionWithTarget_selector_inGroup___block_invoke(void *a1, void *a2)
{
  return [a2 matchesTarget:a1[4] selector:a1[7] group:a1[5] inContactContentViewController:a1[6]] ^ 1;
}

- (void)addActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5 inGroup:(id)a6
{
}

- (void)addActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5 inGroup:(id)a6 destructive:(BOOL)a7
{
}

- (void)addActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5 menuProvider:(id)a6 inGroup:(id)a7 destructive:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a4;
  id v18 = [[CNContactTargetActionWrapper alloc] initWithTarget:v17 action:a5];

  int64_t v19 = +[CNCustomCardAction placementForGroup:v16 inContactContentViewController:self];
  if (v19)
  {
    int64_t v20 = v19;
    SEL v21 = [CNCustomCardAction alloc];
    uint64_t v22 = [(CNContactContentUnitaryViewController *)self contact];
    int v23 = [v22 identifier];
    id v24 = [(CNCustomCardAction *)v21 initWithTitle:v14 targetActionWrapper:v18 contactIdentifier:v23 placement:v20 isDestructive:v8 menuProvider:v15];

    uint64_t v25 = [(CNContactContentUnitaryViewController *)self customActions];
    char v26 = [v25 arrayByAddingObject:v24];
    [(CNContactContentUnitaryViewController *)self setCustomActions:v26];
  }
  else
  {
    id v24 = CNUILogContactCard();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      int v29 = 138412290;
      id v30 = v14;
      _os_log_impl(&dword_18B625000, v24, OS_LOG_TYPE_INFO, "Found undefined placement for action with title %@", (uint8_t *)&v29, 0xCu);
    }
  }

  if (v15) {
    id v27 = (id)[v16 addActionWithTitle:v14 menuProvider:v15 destructive:v8];
  }
  else {
    id v28 = (id)[v16 addActionWithTitle:v14 target:v18 selector:sel_performActionWithSender_ destructive:v8];
  }
  [(CNContactContentUnitaryViewController *)self setNeedsReload];
}

- (void)addActionWithTitle:(id)a3 menuProvider:(id)a4 inGroup:(id)a5 destructive:(BOOL)a6
{
}

- (void)addCardGroup:(id)a3 afterGroup:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  int64_t v7 = [(CNContactContentUnitaryViewController *)self groupsAfterGroup];
  BOOL v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
    id v9 = [(CNContactContentUnitaryViewController *)self groupsAfterGroup];
    id v10 = [v9 objectForKeyedSubscript:v6];
    [v10 addObject:v11];
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1CA48] arrayWithObject:v11];
    id v10 = [(CNContactContentUnitaryViewController *)self groupsAfterGroup];
    [v10 setObject:v9 forKeyedSubscript:v6];
  }
}

- (int64_t)sectionOfGroup:(id)a3 inTableView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(CNContactContentUnitaryViewController *)self _currentGroupsForTableView:v7];
  id v9 = v8;
  int64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8)
  {
    uint64_t v11 = [v8 indexOfObject:v6];
    if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
      int64_t v10 = [(CNContactContentUnitaryViewController *)self tableViewSectionIndexFromGroupIndex:v11 forTableView:v7];
    }
  }

  return v10;
}

- (id)cardGroupForProperty:(id)a3
{
  id v4 = a3;
  double v5 = [(CNContactContentUnitaryViewController *)self propertyGroups];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)reloadDataPreservingChanges:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if ([(CNContactContentUnitaryViewController *)self isViewLoaded]
    && (![(CNContactContentUnitaryViewController *)self isOutOfProcess]
     || [(CNContactContentUnitaryViewController *)self outOfProcessSetupComplete]))
  {
    self->_needsReload = 0;
    double v5 = [(CNContactContentUnitaryViewController *)self contactStore];

    if (!v5)
    {
      id v6 = [(CNContactContentUnitaryViewController *)self originalContacts];
      id v7 = objc_msgSend(v6, "_cn_filter:", &__block_literal_global_396);

      if ([v7 count]) {
        uint64_t v8 = 7;
      }
      else {
        uint64_t v8 = 1;
      }
      id v9 = [(CNContactContentUnitaryViewController *)self managedConfiguration];

      if (v9)
      {
        id v10 = objc_alloc(MEMORY[0x1E4F1B980]);
        uint64_t v11 = [(CNContactContentUnitaryViewController *)self environment];
        id v12 = [v11 cnEnvironment];
        uint64_t v13 = [(CNContactContentUnitaryViewController *)self managedConfiguration];
        id v14 = (void *)[v10 initWithEnvironment:v12 options:v8 managedConfiguration:v13];
        [(CNContactContentUnitaryViewController *)self setContactStore:v14];
      }
      else
      {
        uint64_t v11 = [MEMORY[0x1E4F1B980] storeWithOptions:v8];
        [(CNContactContentUnitaryViewController *)self setContactStore:v11];
      }
    }
    if (![(CNContactContentUnitaryViewController *)self mode])
    {
      id v15 = [(CNContactContentUnitaryViewController *)self parentViewController];
      objc_getClass("ABNewPersonViewController");
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        [(CNContactContentUnitaryViewController *)self setMode:3];
      }
    }
    if ([MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] != 3)
    {
      id v17 = CNUILogContactCard();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl(&dword_18B625000, v17, OS_LOG_TYPE_ERROR, "CNContactContentViewController does not have authorization to access contacts.", buf, 2u);
      }
    }
    id v18 = [(CNContactContentUnitaryViewController *)self shadowCopyOfReadonlyContact];

    if (!v18)
    {
      int64_t v19 = [(CNContactContentUnitaryViewController *)self contact];
      int64_t v20 = [(CNContactContentUnitaryViewController *)self _policyForContact:v19 mode:[(CNContactContentUnitaryViewController *)self mode]];
      [(CNContactContentUnitaryViewController *)self setPolicy:v20];
    }
    SEL v21 = [(CNContactContentUnitaryViewController *)self contact];
    int v22 = [v21 isUnified];

    if (v22)
    {
      int v23 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v24 = [(CNContactContentUnitaryViewController *)self contact];
      uint64_t v25 = [v24 linkedContacts];

      uint64_t v26 = [v25 countByEnumeratingWithState:&v48 objects:v53 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v49;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v49 != v28) {
              objc_enumerationMutation(v25);
            }
            id v30 = *(void **)(*((void *)&v48 + 1) + 8 * i);
            uint64_t v31 = [(CNContactContentUnitaryViewController *)self _policyForContact:v30 mode:[(CNContactContentUnitaryViewController *)self mode]];
            if (v31)
            {
              double v32 = [v30 identifier];
              [v23 setObject:v31 forKey:v32];
            }
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v48 objects:v53 count:16];
        }
        while (v27);
      }

      objc_super v33 = (void *)[v23 copy];
      [(CNContactContentUnitaryViewController *)self setLinkedPoliciesByContactIdentifier:v33];
    }
    double v34 = [(CNContactContentUnitaryViewController *)self iMessageIDSLookupToken];
    [v34 cancel];

    int v35 = [(CNContactContentUnitaryViewController *)self faceTimeIDSLookupToken];
    [v35 cancel];

    double v36 = +[CNCapabilitiesManager defaultCapabilitiesManager];
    [v36 resetCache];

    if (!self->_propertyGroups)
    {
      double v37 = [(CNContactContentUnitaryViewController *)self _loadPropertyGroups];
      propertyGroups = self->_propertyGroups;
      self->_propertyGroups = v37;
    }
    [(CNContactContentUnitaryViewController *)self _reloadStaticIdentityGroup];
    [(CNContactContentUnitaryViewController *)self _reloadGeminiGroupPreservingChanges:v3];
    [(CNContactContentUnitaryViewController *)self _reloadLinkedCardsGroup];
    [(CNContactContentUnitaryViewController *)self _reloadGroupMembershipGroup];
    [(CNContactContentUnitaryViewController *)self _reloadPropertyGroupsPreservingChanges:v3];
    [(CNContactContentUnitaryViewController *)self _reloadMedicalIDGroup];
    [(CNContactContentUnitaryViewController *)self _reloadAlertGroups];
    [(CNContactContentUnitaryViewController *)self _reloadGameCenterGroup];
    [(CNContactContentUnitaryViewController *)self _reloadNamePickingGroup];
    [(CNContactContentUnitaryViewController *)self _reloadSharedProfileGroup];
    [(CNContactContentUnitaryViewController *)self _reloadMeCardSharedProfileGroup];
    [(CNContactContentUnitaryViewController *)self _reloadContainerContextPreservingChanges:v3];
    [(CNContactContentUnitaryViewController *)self setupActionsPreservingChanges:v3];
    double v39 = [MEMORY[0x1E4F1CA60] dictionary];
    [(CNContactContentUnitaryViewController *)self setGroupsAfterGroup:v39];

    double v40 = [(CNContactContentUnitaryViewController *)self _loadDisplayGroups];
    [(CNContactContentUnitaryViewController *)self setDisplayGroups:v40];

    uint64_t v41 = [(CNContactContentUnitaryViewController *)self _loadEditingGroupsPreservingChanges:v3];
    [(CNContactContentUnitaryViewController *)self setEditingGroups:v41];

    if (!v3)
    {
      id v42 = [MEMORY[0x1E4F1C978] array];
      [(CNContactContentUnitaryViewController *)self setDeletedEditingGroups:v42];
    }
    [(CNContactContentUnitaryViewController *)self _setNeedsUpdateCachedLabelWidths];
    [(CNContactContentUnitaryViewController *)self _updateAvailableTransports];
    id v43 = [(CNContactContentUnitaryViewController *)self contactView];
    [v43 reloadData];

    id v44 = [(CNContactContentUnitaryViewController *)self contactHeaderView];
    [v44 reloadDataPreservingChanges:v3];

    if ([(CNContactContentUnitaryViewController *)self shouldUseStaticHeader])
    {
      uint64_t v45 = [(CNContactContentUnitaryViewController *)self displayFloatingCollapsedHeaderView];
      [v45 reloadDataPreservingChanges:v3];
    }
    if (([MEMORY[0x1E4F1B8F8] quickActionsEnabled] & 1) == 0)
    {
      [(CNContactContentUnitaryViewController *)self _reloadFaceTimeGroup];
      [(CNContactContentUnitaryViewController *)self _reloadDefaultAppGroup];
    }
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __69__CNContactContentUnitaryViewController_reloadDataPreservingChanges___block_invoke_400;
    v47[3] = &unk_1E549B488;
    v47[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v47];
    [(CNContactContentUnitaryViewController *)self _updateUserActivity];
    [(CNContactContentUnitaryViewController *)self adjustPreferredContentSize];
    uint64_t v46 = [(CNContactContentUnitaryViewController *)self contact];
    [(CNContactContentUnitaryViewController *)self updateViewAnnotationWithContact:v46];
  }
}

uint64_t __69__CNContactContentUnitaryViewController_reloadDataPreservingChanges___block_invoke_400(uint64_t a1)
{
  [*(id *)(a1 + 32) _addFaceTimeGroupAnimated:0];
  id v2 = *(void **)(a1 + 32);

  return [v2 _addDefaultAppGroupAnimated:0];
}

uint64_t __69__CNContactContentUnitaryViewController_reloadDataPreservingChanges___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSuggested];
}

- (void)setPersonHeaderViewController:(id)a3
{
  unint64_t v5 = (unint64_t)a3;
  personHeaderViewController = self->_personHeaderViewController;
  if (v5 | (unint64_t)personHeaderViewController)
  {
    unint64_t v10 = v5;
    char v7 = [(UIViewController *)personHeaderViewController isEqual:v5];
    unint64_t v5 = v10;
    if ((v7 & 1) == 0)
    {
      if (self->_personHeaderViewController) {
        [(CNContactContentUnitaryViewController *)self removePersonHeaderViewControllerFromHierarchy];
      }
      objc_storeStrong((id *)&self->_personHeaderViewController, a3);
      int v8 = [(CNContactContentUnitaryViewController *)self isViewLoaded];
      unint64_t v5 = v10;
      if (v8)
      {
        id v9 = [(CNContactContentUnitaryViewController *)self contactView];
        [v9 reloadData];

        unint64_t v5 = v10;
      }
    }
  }
}

- (id)personHeaderView
{
  id v2 = [(CNContactContentUnitaryViewController *)self personHeaderViewController];
  BOOL v3 = [v2 view];
  id v4 = [v3 subviews];
  unint64_t v5 = [v4 firstObject];

  return v5;
}

- (void)setPersonHeaderView:(id)a3
{
  id firstValue = a3;
  if (firstValue)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1EC0]);
    unint64_t v5 = [v4 view];
    [v5 addSubview:firstValue];

    id v6 = [MEMORY[0x1E4F1CA48] array];
    char v7 = _NSDictionaryOfVariableBindings(&cfstr_Personheadervi.isa, firstValue, 0);
    [firstValue setTranslatesAutoresizingMaskIntoConstraints:0];
    int v8 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[personHeaderView]|" options:0 metrics:0 views:v7];
    [v6 addObjectsFromArray:v8];

    id v9 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[personHeaderView]|" options:0 metrics:0 views:v7];
    [v6 addObjectsFromArray:v9];

    [MEMORY[0x1E4F28DC8] activateConstraints:v6];
    [(CNContactContentUnitaryViewController *)self setPersonHeaderViewController:v4];
  }
  else
  {
    [(CNContactContentUnitaryViewController *)self setPersonHeaderViewController:0];
  }
}

- (id)originalContacts
{
  v5[1] = *MEMORY[0x1E4F143B8];
  originalContacts = self->_originalContacts;
  if (originalContacts)
  {
    BOOL v3 = originalContacts;
  }
  else if (self->_contact)
  {
    v5[0] = self->_contact;
    BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  }
  else
  {
    BOOL v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }

  return v3;
}

- (void)_refetchContact
{
  v42[1] = *MEMORY[0x1E4F143B8];
  self->_needsRefetch = 0;
  BOOL v3 = [(CNContactContentUnitaryViewController *)self contact];
  id v4 = [(CNContactContentViewController *)self parentContainer];
  if (v3)
  {
    unint64_t v5 = [MEMORY[0x1E4F5A6D8] unifiedMeContactMonitor];
    id v6 = [(CNContactContentUnitaryViewController *)self contact];
    int v7 = [v5 isMeContact:v6];

    int v8 = CNUILogContactCard();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        unint64_t v10 = [v3 identifier];
        *(_DWORD *)long long buf = 138543362;
        double v34 = v10;
        _os_log_impl(&dword_18B625000, v8, OS_LOG_TYPE_DEFAULT, "Refetching contact, is it the me card, identifier %{public}@", buf, 0xCu);
      }
      uint64_t v11 = [(CNContactContentUnitaryViewController *)self contactStore];
      id v12 = [(id)objc_opt_class() descriptorForRequiredKeysForContact:v3];
      v42[0] = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
      id v32 = 0;
      id v14 = [v11 _crossPlatformUnifiedMeContactWithKeysToFetch:v13 error:&v32];
      id v15 = v32;
    }
    else
    {
      if (v9)
      {
        id v16 = [v3 identifier];
        *(_DWORD *)long long buf = 138543362;
        double v34 = v16;
        _os_log_impl(&dword_18B625000, v8, OS_LOG_TYPE_DEFAULT, "Refetching contact, is it not the me card, identifier %{public}@", buf, 0xCu);
      }
      uint64_t v11 = [(CNContactContentUnitaryViewController *)self contactStore];
      id v12 = [v3 identifier];
      uint64_t v13 = [(id)objc_opt_class() descriptorForRequiredKeysForContact:v3];
      uint64_t v41 = v13;
      id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
      id v31 = 0;
      id v14 = [v11 unifiedContactWithIdentifier:v12 keysToFetch:v17 error:&v31];
      id v15 = v31;
    }
    id v18 = [(CNContactContentUnitaryViewController *)self contactViewCache];
    int64_t v19 = [v18 containerForContact:v14];

    if (v15 || !v14)
    {
      uint64_t v27 = CNUILogContactCard();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = [v3 identifier];
        int v29 = [(CNContactContentUnitaryViewController *)self contactStore];
        *(_DWORD *)long long buf = 138413058;
        double v34 = v28;
        __int16 v35 = 2112;
        id v36 = v15;
        __int16 v37 = 2112;
        id v38 = v29;
        __int16 v39 = 2112;
        double v40 = v3;
        _os_log_error_impl(&dword_18B625000, v27, OS_LOG_TYPE_ERROR, "Error refetching contact with identifier %@, %@, store %@, full contact %@", buf, 0x2Au);
      }
    }
    else
    {
      uint64_t v20 = [v14 isEqual:v3] ^ 1;
      int v21 = [v19 isEqual:v4];
      if (v20) {
        goto LABEL_15;
      }
      if (!v21) {
        goto LABEL_15;
      }
      int v22 = [(CNContactContentUnitaryViewController *)self cardGroupMembershipGroup];

      if (v22)
      {
        int v23 = [(CNContactContentUnitaryViewController *)self groupsAndContainersSaveManager];
        id v24 = [v23 parentGroupsForContact:v14];

        uint64_t v25 = [(CNContactContentUnitaryViewController *)self cardGroupMembershipGroup];
        uint64_t v26 = [v25 parentGroups];
        char v30 = [v24 isEqualToArray:v26];

        if ((v30 & 1) == 0) {
LABEL_15:
        }
          [(CNContactContentUnitaryViewController *)self setContact:v14 shouldScrollToTop:v20];
      }
    }
  }
}

- (void)applicationLeftForeground:(id)a3
{
  if ([(CNContactContentUnitaryViewController *)self isEditing]
    && [(CNContactContentUnitaryViewController *)self hasPendingChanges]
    && [(CNContactContentUnitaryViewController *)self mode] == 3)
  {
    [(CNContactContentUnitaryViewController *)self saveNewContactDraft];
  }
}

- (void)saveNewContactDraft
{
  [(CNContactContentUnitaryViewController *)self saveModelChangesToContact];
  +[CNUIDraftSupport saveNewContactDraft:self->_mutableContact];

  [(CNContactContentUnitaryViewController *)self _refetchContact];
}

- (void)favoritesDidChangeWithNotification:(id)a3
{
  if (([(CNContactContentUnitaryViewController *)self isEditing] & 1) == 0)
  {
    id v4 = [(CNContactContentUnitaryViewController *)self contactView];
    [(CNContactContentUnitaryViewController *)self reloadCardGroupsForFavoritesUpdateInTableView:v4];
  }
}

- (void)contactStoreDidChangeWithNotification:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CNUIContactsEnvironment *)self->_environment defaultSchedulerProvider];
  id v6 = [v5 mainThreadScheduler];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__CNContactContentUnitaryViewController_contactStoreDidChangeWithNotification___block_invoke;
  v8[3] = &unk_1E549BF80;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 performBlock:v8];
}

void __79__CNContactContentUnitaryViewController_contactStoreDidChangeWithNotification___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) shouldIgnoreContactStoreDidChangeNotification]) {
    return;
  }
  id v2 = [*(id *)(a1 + 40) userInfo];
  id v15 = [v2 objectForKey:*MEMORY[0x1E4F1B788]];

  BOOL v3 = [*(id *)(a1 + 40) userInfo];
  id v4 = [v3 objectForKey:*MEMORY[0x1E4F1B790]];

  unint64_t v5 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = [*(id *)(a1 + 32) issuedSaveRequestIdentifiers];
  int v8 = [v6 setWithArray:v7];

  if (v15 && ([v15 BOOLValue] & 1) != 0
    || ![v8 count]
    || ![v5 count]
    || ([v5 isSubsetOfSet:v8] & 1) == 0)
  {
    if (![*(id *)(a1 + 32) isViewLoaded]) {
      goto LABEL_10;
    }
    id v9 = [*(id *)(a1 + 32) view];
    uint64_t v10 = [v9 window];
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      int v12 = [*(id *)(a1 + 32) isEditing];

      if (!v12)
      {
LABEL_10:
        uint64_t v13 = *(unsigned char **)(a1 + 32);
        if (!v13[1323])
        {
          id v14 = [v13 contactViewCache];
          [v14 resetCache];

          [*(id *)(a1 + 32) _refetchContact];
        }
        goto LABEL_14;
      }
    }
    else
    {
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 1321) = 1;
  }
LABEL_14:
}

- (void)adjustInsetsForKeyboardOverlap:(double)a3
{
  [(CNContactContentUnitaryViewController *)self setKeyboardVerticalOverlap:a3];
  if ([(CNContactContentUnitaryViewController *)self isEditing]) {
    [(CNContactContentUnitaryViewController *)self editingContactView];
  }
  else {
  id v4 = [(CNContactContentUnitaryViewController *)self displayContactView];
  }
  [(CNContactContentUnitaryViewController *)self updateInsetsIfNeededForTableView:v4 isEditing:[(CNContactContentUnitaryViewController *)self isEditing]];
}

- (void)keyboardWillHideNotification:(id)a3
{
}

- (void)keyboardDidShowNotification:(id)a3
{
  id v4 = [a3 userInfo];
  unint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FB2BD8]];
  [v5 CGRectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  id v31 = [(CNContactContentUnitaryViewController *)self view];
  id v14 = [v31 window];
  objc_msgSend(v14, "convertRect:fromWindow:", 0, v7, v9, v11, v13);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  objc_msgSend(v31, "convertRect:fromView:", 0, v16, v18, v20, v22);
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  [v31 bounds];
  v35.origin.double x = v24;
  v35.origin.CGFloat y = v26;
  v35.size.double width = v28;
  v35.size.CGFloat height = v30;
  CGRect v34 = CGRectIntersection(v33, v35);
  [(CNContactContentUnitaryViewController *)self adjustInsetsForKeyboardOverlap:CGRectGetHeight(v34)];
}

- (void)setContact:(id)a3 shouldScrollToTop:(BOOL)a4
{
  BOOL v4 = a4;
  v156[1] = *MEMORY[0x1E4F143B8];
  double v6 = (CNContact *)a3;
  double v7 = v6;
  self->_needsRefetch = 0;
  if (self->_contact == v6) {
    goto LABEL_58;
  }
  double v8 = [(CNContact *)v6 identifier];
  double v9 = [(CNContact *)self->_contact identifier];
  char v10 = [v8 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    [(CNContactContentUnitaryViewController *)self setDidSetNewContact:1];
    addToGroupAction = self->_addToGroupAction;
    self->_addToGroupAction = 0;

    addAddressingGrammarAction = self->_addAddressingGrammarAction;
    self->_addAddressingGrammarAction = 0;

    [(CNContactContentUnitaryViewController *)self setEmergencyContactAction:0];
    [(CNContactContentUnitaryViewController *)self setBannerActionTypeForEffectiveState:0];
    [(CNContactContentUnitaryViewController *)self setTappedSharedProfileBannerAction:0];
    [(CNContactContentUnitaryViewController *)self setDismissedSharedProfileBannerAction:0];
    [(CNContactContentUnitaryViewController *)self setHasPerformedSharedProfileBannerAnimation:0];
    [(CNContactContentUnitaryViewController *)self setDidEditPronouns:0];
  }
  double v13 = [(CNContactContentUnitaryViewController *)self environment];
  id v14 = [v13 defaultSchedulerProvider];

  [v14 suspendBackgroundScheduler];
  double v15 = [v14 afterCACommitScheduler];
  v146[0] = MEMORY[0x1E4F143A8];
  v146[1] = 3221225472;
  v146[2] = __70__CNContactContentUnitaryViewController_setContact_shouldScrollToTop___block_invoke;
  v146[3] = &unk_1E549B488;
  id v139 = v14;
  id v147 = v139;
  [v15 performBlock:v146];

  double v16 = [(CNContactContentUnitaryViewController *)self contactViewCache];
  [v16 resetCache];

  LODWORD(v16) = [(CNContactContentUnitaryViewController *)self isOutOfProcess];
  uint64_t v17 = [(id)objc_opt_class() descriptorForRequiredKeys];
  double v18 = (void *)v17;
  if (v16)
  {
    v156[0] = v17;
    double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v156 count:1];
    uint64_t v20 = [(CNContactContentUnitaryViewController *)self _updateContact:v7 withMissingKeysFromRequiredKeys:v19];

    double v7 = (void *)v20;
  }
  else
  {
    uint64_t v155 = v17;
    double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v155 count:1];
    [v7 assertKeysAreAvailable:v19];
  }

  [(CNContactContentUnitaryViewController *)self resetEditAuthorizationState];
  uint64_t v21 = [(CNContactContentViewController *)self parentContainer];
  if (!v21) {
    goto LABEL_10;
  }
  double v22 = (void *)v21;
  uint64_t v23 = [(CNContactContentViewController *)self parentContainer];
  if (!v23)
  {
LABEL_11:

    goto LABEL_12;
  }
  CGFloat v24 = (void *)v23;
  int v25 = [v7 hasBeenPersisted];

  if (v25)
  {
LABEL_10:
    double v22 = [(CNContactContentUnitaryViewController *)self contactViewCache];
    CGFloat v26 = [v22 containerForContact:v7];
    [(CNContactContentViewController *)self setParentContainer:v26];

    goto LABEL_11;
  }
LABEL_12:
  [(CNContactContentUnitaryViewController *)self setContainerContext:0];
  double v27 = [(CNContactContentUnitaryViewController *)self contactViewCache];
  CGFloat v28 = [v27 policyForContact:v7];

  double v29 = [(CNContactContentViewController *)self parentContainer];
  uint64_t v30 = [v29 type];

  if (![v28 isReadonly] || v30 == 1003) {
    goto LABEL_36;
  }
  id v31 = v28;
  BOOL v138 = v4;
  id v32 = [(CNContactContentUnitaryViewController *)self contactStore];
  CGRect v33 = [v7 identifier];
  CGRect v34 = [(id)objc_opt_class() descriptorForRequiredKeysForContact:v7];
  id v154 = v34;
  CGRect v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v154 count:1];
  id v145 = 0;
  id v36 = [v32 unifiedContactWithIdentifier:v33 keysToFetch:v35 error:&v145];
  id v137 = v145;

  if (v36)
  {
    id v37 = v36;

    id v38 = [(CNContactContentUnitaryViewController *)self contactViewCache];
    __int16 v39 = [v38 policyForContact:v37];

    if ([v39 isReadonly])
    {
      v133 = v39;
      v135 = v36;
      id v40 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
      uint64_t v41 = [v37 availableKeyDescriptor];
      v153 = v41;
      id v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v153 count:1];
      id v43 = (void *)[v40 copyWithPropertyKeys:v42];
      id v44 = (void *)[v43 mutableCopy];
      [(CNContactContentUnitaryViewController *)self setShadowCopyOfReadonlyContact:v44];

      long long v143 = 0u;
      long long v144 = 0u;
      long long v141 = 0u;
      long long v142 = 0u;
      uint64_t v45 = +[CNContactView nameProperties];
      uint64_t v46 = [v45 countByEnumeratingWithState:&v141 objects:v152 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = *(void *)v142;
        do
        {
          for (uint64_t i = 0; i != v47; ++i)
          {
            if (*(void *)v142 != v48) {
              objc_enumerationMutation(v45);
            }
            uint64_t v50 = *(void *)(*((void *)&v141 + 1) + 8 * i);
            if (objc_msgSend(v37, "isKeyAvailable:", v50, v133, v135))
            {
              long long v51 = [(CNContactContentUnitaryViewController *)self shadowCopyOfReadonlyContact];
              long long v52 = [v37 valueForKey:v50];
              [v51 setValue:v52 forKey:v50];
            }
          }
          uint64_t v47 = [v45 countByEnumeratingWithState:&v141 objects:v152 count:16];
        }
        while (v47);
      }

      long long v53 = (void *)MEMORY[0x1E4F1CA48];
      uint64_t v54 = [(CNContactContentUnitaryViewController *)self shadowCopyOfReadonlyContact];
      id v55 = [v53 arrayWithObject:v54];

      if ([v37 isUnified])
      {
        char v56 = [v37 linkedContacts];
        [v55 addObjectsFromArray:v56];
      }
      else
      {
        [v55 addObject:v37];
      }
      uint64_t v57 = v137;
      double v7 = objc_msgSend(MEMORY[0x1E4F1B8F8], "unifyContacts:", v55, v133, v135);

      uint64_t v58 = [(CNContactContentUnitaryViewController *)self contactViewCache];
      long long v59 = [v58 policyForDefaultContainer];
      [(CNContactContentUnitaryViewController *)self setPolicy:v59];

      char v60 = [(CNContactContentUnitaryViewController *)self policy];

      if (!v60 || v137)
      {
        double v61 = [MEMORY[0x1E4F1BA68] sharedPermissivePolicy];
        [(CNContactContentUnitaryViewController *)self setPolicy:v61];
      }
      BOOL v4 = v138;
      __int16 v39 = v134;
      id v36 = v136;
      goto LABEL_35;
    }
    double v7 = v37;
  }
  else
  {
    __int16 v39 = v31;
  }
  BOOL v4 = v138;
  uint64_t v57 = v137;
LABEL_35:

  CGFloat v28 = v39;
LABEL_36:
  objc_storeStrong((id *)&self->_contact, v7);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v63 = v7;
  if ((isKindOfClass & 1) == 0) {
    id v63 = (void *)[v7 mutableCopy];
  }
  p_mutableContact = &self->_mutableContact;
  objc_storeStrong((id *)&self->_mutableContact, v63);
  if ((isKindOfClass & 1) == 0) {

  }
  char v65 = CNUILogContactCard();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v66 = [v7 identifier];
    uint64_t v67 = *p_mutableContact;
    *(_DWORD *)long long buf = 138543618;
    v149 = v66;
    __int16 v150 = 2050;
    v151 = v67;
    _os_log_impl(&dword_18B625000, v65, OS_LOG_TYPE_DEFAULT, "[CNContactContentViewController] setting contact with identifier %{public}@, mutable contact %{public}p", buf, 0x16u);
  }
  id v68 = [CNContactActionProvider alloc];
  v69 = *p_mutableContact;
  id v70 = [(CNContactContentViewController *)self parentContainer];
  id v71 = [(CNContactContentUnitaryViewController *)self contactViewCache];
  uint64_t v72 = [v71 contactStore];
  id v73 = [(CNContactActionProvider *)v68 initWithContact:v69 inContainer:v70 contactStore:v72];
  [(CNContactContentUnitaryViewController *)self setActionProvider:v73];

  BOOL v74 = [(CNContactContentUnitaryViewController *)self actionProvider];
  [v74 setActionDelegate:self];

  int v75 = [(CNContactContentUnitaryViewController *)self customActions];
  v140[0] = MEMORY[0x1E4F143A8];
  v140[1] = 3221225472;
  v140[2] = __70__CNContactContentUnitaryViewController_setContact_shouldScrollToTop___block_invoke_376;
  v140[3] = &unk_1E549B4D8;
  v140[4] = self;
  uint64_t v76 = objc_msgSend(v75, "_cn_filter:", v140);
  [(CNContactContentUnitaryViewController *)self setCustomActions:v76];

  uint64_t v77 = [MEMORY[0x1E4F1CA60] dictionary];
  [(CNContactContentUnitaryViewController *)self setGroupsAfterGroup:v77];

  char v78 = [[CNCardGroup alloc] initWithContact:*p_mutableContact];
  cardTopGroup = self->_cardTopGroup;
  self->_cardTopGroup = v78;

  unsigned int v80 = [[CNCardGroup alloc] initWithContact:*p_mutableContact];
  cardBottomGroup = self->_cardBottomGroup;
  self->_cardBottomGroup = v80;

  [(CNCardGroup *)self->_cardBottomGroup setAddSpacerFromPreviousGroup:1];
  unsigned int v82 = [[CNCardGroup alloc] initWithContact:*p_mutableContact];
  cardActionsGroup = self->_cardActionsGroup;
  self->_cardActionsGroup = v82;

  id v84 = [[CNCardGroup alloc] initWithContact:*p_mutableContact];
  cardShareLocationGroup = self->_cardShareLocationGroup;
  self->_cardShareLocationGroup = v84;

  long long v86 = [[CNCardGroup alloc] initWithContact:*p_mutableContact];
  cardBlockContactGroup = self->_cardBlockContactGroup;
  self->_cardBlockContactGroup = v86;

  [(CNCardGroup *)self->_cardBlockContactGroup setAddSpacerFromPreviousGroup:1];
  uint64_t v88 = [[CNCardGroup alloc] initWithContact:*p_mutableContact];
  cardFooterGroup = self->_cardFooterGroup;
  self->_cardFooterGroup = v88;

  [(CNCardGroup *)self->_cardFooterGroup setAddSpacerFromPreviousGroup:1];
  v90 = [[CNCardGroup alloc] initWithContact:*p_mutableContact];
  cardEditingActionsGroup = self->_cardEditingActionsGroup;
  self->_cardEditingActionsGroup = v90;

  v92 = [[CNCardGroup alloc] initWithContact:*p_mutableContact];
  cardEditingDeleteContactGroup = self->_cardEditingDeleteContactGroup;
  self->_cardEditingDeleteContactGroup = v92;

  propertyGroups = self->_propertyGroups;
  self->_propertyGroups = 0;

  v95 = [(CNContactContentUnitaryViewController *)self siriContextProvider];
  LODWORD(v76) = [v95 isEnabled];

  v96 = [CNSiriContactContextProvider alloc];
  v97 = [(CNContactContentUnitaryViewController *)self contactStore];
  v98 = [(CNSiriContactContextProvider *)v96 initWithContact:v7 store:v97];
  [(CNContactContentUnitaryViewController *)self setSiriContextProvider:v98];

  if (v76)
  {
    v99 = [(CNContactContentUnitaryViewController *)self siriContextProvider];
    [v99 setEnabled:1];
  }
  linkedCardsAction = self->_linkedCardsAction;
  self->_linkedCardsAction = 0;

  addLinkedCardAction = self->_addLinkedCardAction;
  self->_addLinkedCardAction = 0;

  [(CNContactContentUnitaryViewController *)self setCardFaceTimeGroup:0];
  [(CNContactContentUnitaryViewController *)self setFaceTimeAction:0];
  [(CNContactContentUnitaryViewController *)self setCardDefaultAppGroup:0];
  [(CNContactContentUnitaryViewController *)self setSendMessageAction:0];
  [(CNContactContentUnitaryViewController *)self setBlockAction:0];
  [(CNContactContentUnitaryViewController *)self setBlockReportAction:0];
  [(CNContactContentUnitaryViewController *)self setAddFavoriteAction:0];
  [(CNContactContentUnitaryViewController *)self setCreateReminderAction:0];
  [(CNContactContentUnitaryViewController *)self setShareContactAction:0];
  [(CNContactContentUnitaryViewController *)self setIgnoreContactAction:0];
  [(CNContactContentUnitaryViewController *)self setCardMedicalIDGroup:0];
  [(CNContactContentUnitaryViewController *)self setMedicalIDAction:0];
  [(CNContactContentUnitaryViewController *)self setGameCenterGroup:0];
  [(CNContactContentUnitaryViewController *)self setCardGameCenterActionGroup:0];
  [(CNContactContentUnitaryViewController *)self setNamePickingGroup:0];
  [(CNContactContentUnitaryViewController *)self setCardSharedProfileGroup:0];
  [(CNContactContentUnitaryViewController *)self setMeCardSharedProfileGroup:0];
  [(CNContactContentUnitaryViewController *)self setCardEditingGeminiGroup:0];
  v102 = [(CNContactContentUnitaryViewController *)self geminiDataSource];
  [v102 setContact:v7];

  cardStaticIdentityGroup = self->_cardStaticIdentityGroup;
  self->_cardStaticIdentityGroup = 0;

  self->_didLookUpStaticIdentitCGFloat y = 0;
  cachedStaticIdentitCGFloat y = self->_cachedStaticIdentity;
  self->_cachedStaticIdentitCGFloat y = 0;

  self->_didFindStaticIdentitCGFloat y = 0;
  cachedVerifiedHandles = self->_cachedVerifiedHandles;
  self->_cachedVerifiedHandles = 0;

  mutableContactForHeaderView = self->_mutableContactForHeaderView;
  self->_mutableContactForHeaderView = 0;

  sharedProfileStateOracle = self->_sharedProfileStateOracle;
  self->_sharedProfileStateOracle = 0;

  if (![(CNContactContentUnitaryViewController *)self isOutOfProcess]
    || [(CNContactContentUnitaryViewController *)self outOfProcessSetupComplete])
  {
    if (self->_editingHeaderView)
    {
      v108 = [(CNContactContentUnitaryViewController *)self editingHeaderView];
      v109 = [(CNContactContentUnitaryViewController *)self mutableContactForHeaderView];
      [v108 updateWithNewContact:v109];
    }
    BOOL v110 = [(CNContactContentUnitaryViewController *)self shouldUseStaticHeader];
    v111 = [(CNContactContentUnitaryViewController *)self authorizationCheck];
    uint64_t v112 = [v111 shouldPromptForPasscodeAuthorization];
    if (v110)
    {
      v113 = [(CNContactContentUnitaryViewController *)self staticDisplayHeaderView];
      [v113 setIsRestrictedContact:v112];

      v114 = (void *)MEMORY[0x1E4F1B9C8];
      v115 = [(CNContactContentUnitaryViewController *)self mutableContactForHeaderView];
      uint64_t v116 = [v114 isWhitelistedContact:v115];
      v117 = [(CNContactContentUnitaryViewController *)self staticDisplayHeaderView];
      [v117 setIsDowntimeContact:v116];

      v118 = [(CNContactContentUnitaryViewController *)self staticDisplayHeaderView];
      double v119 = [(CNContactContentUnitaryViewController *)self mutableContactForHeaderView];
      [v118 updateWithNewContact:v119];

      [(CNContactContentUnitaryViewController *)self displayFloatingCollapsedHeaderView];
    }
    else
    {
      double v120 = [(CNContactContentUnitaryViewController *)self displayHeaderView];
      [v120 setIsRestrictedContact:v112];

      v121 = (void *)MEMORY[0x1E4F1B9C8];
      v122 = [(CNContactContentUnitaryViewController *)self mutableContactForHeaderView];
      uint64_t v123 = [v121 isWhitelistedContact:v122];
      v124 = [(CNContactContentUnitaryViewController *)self displayHeaderView];
      [v124 setIsDowntimeContact:v123];

      [(CNContactContentUnitaryViewController *)self displayHeaderView];
    v125 = };
    v126 = [(CNContactContentUnitaryViewController *)self mutableContactForHeaderView];
    [v125 updateWithNewContact:v126];

    [(CNContactContentUnitaryViewController *)self updateEditNavigationItemsAnimated:0];
  }
  [(CNContactContentUnitaryViewController *)self setContactSupportsTTYCalls:0];
  v127 = [(CNContactContentUnitaryViewController *)self shareLocationController];
  [v127 setContact:v7];

  v128 = [(CNContactContentUnitaryViewController *)self actionsViewController];
  [v128 setContact:v7];

  if ([(CNContactContentUnitaryViewController *)self shouldUseStaticHeader])
  {
    v129 = [(CNContactContentUnitaryViewController *)self floatingActionsViewController];
    [v129 setContact:v7];
  }
  [(CNContactContentUnitaryViewController *)self reloadDataPreservingChanges:0];
  if ([(CNContactContentUnitaryViewController *)self isViewLoaded] && v4)
  {
    v130 = [(CNContactContentUnitaryViewController *)self displayContactView];
    [(CNContactContentUnitaryViewController *)self scrollScrollViewAllTheWayUp:v130];
  }
  v131 = +[CNUIDataCollector sharedCollector];
  v132 = [(CNContactContentUnitaryViewController *)self contact];
  [v131 logContactShown:v132];

  [(CNContactContentUnitaryViewController *)self prepareContactDidAppearForPPT];
LABEL_58:
}

uint64_t __70__CNContactContentUnitaryViewController_setContact_shouldScrollToTop___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resumeBackgroundScheduler];
}

uint64_t __70__CNContactContentUnitaryViewController_setContact_shouldScrollToTop___block_invoke_376(uint64_t a1, void *a2)
{
  return [a2 isValidForContact:*(void *)(*(void *)(a1 + 32) + 1560)];
}

- (void)setContact:(id)a3
{
}

- (void)setupContainerContextIfNeededForContact:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CNContactContentUnitaryViewController *)self shouldAllowContainerPicking])
  {
    unint64_t v5 = [(CNContactContentUnitaryViewController *)self containerContext];

    if (!v5)
    {
      if ([v4 hasBeenPersisted])
      {
        double v6 = [v4 identifier];
      }
      else
      {
        double v6 = 0;
      }
      double v7 = [MEMORY[0x1E4F1CA60] dictionary];
      if ([v4 isUnified])
      {
        double v22 = v6;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        double v8 = [v4 mainStoreLinkedContacts];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v24;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v24 != v11) {
                objc_enumerationMutation(v8);
              }
              double v13 = *(void **)(*((void *)&v23 + 1) + 8 * v12);
              id v14 = [(CNContactContentUnitaryViewController *)self contactViewCache];
              double v15 = [v14 containerForContact:v13];

              double v16 = [v13 identifier];
              [v7 setObject:v15 forKeyedSubscript:v16];

              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
          }
          while (v10);
        }

        double v6 = v22;
      }
      uint64_t v17 = [(CNContactContentViewController *)self parentContainer];

      if (v17 && v6)
      {
        double v18 = [(CNContactContentViewController *)self parentContainer];
        [v7 setObject:v18 forKeyedSubscript:v6];
      }
      double v19 = [[CNUIContainerContext alloc] initWithContainers:v7];
      uint64_t v20 = [(CNContactContentViewController *)self parentContainer];

      if (v20 && !v6)
      {
        uint64_t v21 = [(CNContactContentViewController *)self parentContainer];
        [(CNUIContainerContext *)v19 addContainer:v21];
      }
      [(CNContactContentUnitaryViewController *)self setContainerContext:v19];
    }
  }
}

- (BOOL)shouldAllowContainerPicking
{
  BOOL v3 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v4 = [v3 featureFlags];
  int v5 = [v4 isFeatureEnabled:6];

  if (v5)
  {
    double v6 = [(CNContactContentViewController *)self parentContainer];
    int v7 = [v6 isGuardianRestricted] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)prepareCell:(id)a3
{
  id v49 = a3;
  id v4 = [(CNContactContentUnitaryViewController *)self contactView];
  [v4 applyCellAppearance:v49];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_40;
  }
  objc_opt_class();
  id v5 = v49;
  if (objc_opt_isKindOfClass()) {
    double v6 = v5;
  }
  else {
    double v6 = 0;
  }
  id v7 = v6;

  if ([v7 displaysCellSelectionState]) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = 0;
  }
  [v7 setSelectionStyle:v8];
  uint64_t v9 = [v4 labelTextAttributes];
  uint64_t v10 = [v4 valueTextAttributes];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    uint64_t v12 = [v4 actionTextAttributes];
LABEL_21:

    uint64_t v9 = (void *)v12;
    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v13 = v5;
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }
    id v15 = v14;

LABEL_20:
    double v19 = [(CNContactContentUnitaryViewController *)self actionsDataSource];
    [v15 setActionsDataSource:v19];

    uint64_t v20 = [(CNContactContentUnitaryViewController *)self contact];
    [v15 setContact:v20];

    uint64_t v12 = [v4 valueTextAttributes];

    uint64_t v9 = v15;
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v16 = v5;
    if (objc_opt_isKindOfClass()) {
      uint64_t v17 = v16;
    }
    else {
      uint64_t v17 = 0;
    }
    id v15 = v17;

    double v18 = [(CNContactContentUnitaryViewController *)self defaultAppProvider];
    [v15 setDefaultAppProvider:v18];

    goto LABEL_20;
  }
LABEL_22:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v21 = [v4 valueTextAttributes];

    uint64_t v9 = (void *)v21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    double v22 = [(CNContactContentUnitaryViewController *)self view];
    long long v23 = [v22 tintColorOverride];
    long long v24 = 0;
    goto LABEL_31;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v34 = v5;
    if ([v34 supportsValueColorUsesLabelColor])
    {
      CGRect v35 = +[CNContactStyle currentStyle];
      long long v23 = [v35 textColor];
    }
    else
    {
      long long v23 = 0;
    }
    id v36 = [(CNContactContentUnitaryViewController *)self highlightedProperties];
    if ([v36 count])
    {
      id v37 = [(CNContactContentUnitaryViewController *)self highlightedProperties];
      uint64_t v47 = [v34 propertyItem];
      uint64_t v48 = v36;
      [v47 contactProperty];
      __int16 v39 = v38 = v34;
      objc_msgSend(v38, "setHighlightedProperty:", objc_msgSend(v37, "containsObject:", v39));

      id v34 = v38;
      id v36 = v48;
    }
    else
    {
      [v34 setHighlightedProperty:0];
    }

    if ([v34 isSuggested])
    {
      id v40 = +[CNContactStyle currentStyle];
      long long v24 = [v40 suggestedLabelTextColor];

      uint64_t v41 = +[CNContactStyle currentStyle];
      uint64_t v42 = [v41 suggestedValueTextColor];
    }
    else
    {
      if ([v34 isHighlightedProperty]
        && [(CNContactContentUnitaryViewController *)self highlightedPropertyImportant])
      {
        objc_msgSend(v34, "setImportant:", -[CNContactContentUnitaryViewController highlightedPropertyImportant](self, "highlightedPropertyImportant"));
        uint64_t v42 = [MEMORY[0x1E4FB1618] redColor];
        long long v24 = 0;
        goto LABEL_60;
      }
      if (([(CNContactContentUnitaryViewController *)self isEditing] & 1) != 0
        || ![v34 supportsTintColorValue])
      {
        long long v24 = 0;
LABEL_68:
        if ([v34 isHighlightedProperty])
        {
          if (([v34 isImportant] & 1) == 0)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_opt_class();
              id v43 = v34;
              if (objc_opt_isKindOfClass()) {
                id v44 = v43;
              }
              else {
                id v44 = 0;
              }
              id v45 = v44;

              [v45 setShouldShowBadge:1];
            }
          }
        }

        if (!v24)
        {
LABEL_32:
          if (v23)
          {
            long long v25 = (void *)[v10 mutableCopy];
            [v25 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4FB0700]];

            uint64_t v10 = v25;
          }
          if (isKindOfClass) {
            goto LABEL_36;
          }
          goto LABEL_35;
        }
        uint64_t v46 = (void *)[v9 mutableCopy];
        [v46 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4FB0700]];
        double v22 = v9;
        uint64_t v9 = v46;
LABEL_31:

        goto LABEL_32;
      }
      uint64_t v41 = [(CNContactContentUnitaryViewController *)self view];
      uint64_t v42 = [v41 tintColorOverride];

      long long v24 = 0;
    }
    long long v23 = v41;
LABEL_60:

    long long v23 = (void *)v42;
    goto LABEL_68;
  }
  long long v24 = 0;
  if (isKindOfClass) {
    goto LABEL_36;
  }
LABEL_35:
  long long v26 = [v7 labelTextAttributes];
  char v27 = [v26 isEqual:v9];

  if ((v27 & 1) == 0) {
LABEL_36:
  }
    [v7 setLabelTextAttributes:v9];
  uint64_t v28 = [v7 valueTextAttributes];
  char v29 = [v28 isEqual:v10];

  if ((v29 & 1) == 0) {
    [v7 setValueTextAttributes:v10];
  }

LABEL_40:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v30 = v49;
    if (objc_opt_isKindOfClass()) {
      id v31 = v30;
    }
    else {
      id v31 = 0;
    }
    id v32 = v31;

    CGRect v33 = [v4 labelTextAttributes];
    [v32 setLabelTextAttributes:v33];
  }
}

- (void)setImportantMessage:(id)a3
{
  id v6 = a3;
  if (([v6 isEqualToString:self->_importantMessage] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_importantMessage, a3);
    if ([(CNContactContentUnitaryViewController *)self shouldUseStaticHeader]) {
      [(CNContactContentUnitaryViewController *)self staticDisplayHeaderView];
    }
    else {
    id v5 = [(CNContactContentUnitaryViewController *)self displayHeaderView];
    }
    [v5 setImportantMessage:v6];
  }
}

- (void)setMessage:(id)a3
{
  id v6 = a3;
  if (([v6 isEqualToString:self->_message] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_message, a3);
    if ([(CNContactContentUnitaryViewController *)self shouldUseStaticHeader]) {
      [(CNContactContentUnitaryViewController *)self staticDisplayHeaderView];
    }
    else {
    id v5 = [(CNContactContentUnitaryViewController *)self displayHeaderView];
    }
    [v5 setMessage:v6];
  }
}

- (void)localeDidChange:(id)a3
{
}

- (void)setUpFloatingActionsViewController
{
  if ([(CNContactContentUnitaryViewController *)self shouldUseStaticHeader])
  {
    BOOL v3 = [(CNContactContentUnitaryViewController *)self createActionsController];
    floatingActionsViewController = self->_floatingActionsViewController;
    self->_floatingActionsViewController = v3;

    [(CNContactInlineActionsViewController *)self->_floatingActionsViewController setObjectViewControllerDelegate:self];
    [(CNContactInlineActionsViewController *)self->_floatingActionsViewController setDelegate:self];
    id v5 = [(CNContactContentUnitaryViewController *)self contact];
    [(CNContactInlineActionsViewController *)self->_floatingActionsViewController setContact:v5];

    [(CNContactContentUnitaryViewController *)self addChildViewController:self->_floatingActionsViewController];
    [(CNContactInlineActionsViewController *)self->_floatingActionsViewController didMoveToParentViewController:self];
    floatingActionsWrapperView = self->_floatingActionsWrapperView;
    id v7 = [(CNContactInlineActionsViewController *)self->_floatingActionsViewController view];
    [(CNContactActionsContainerView *)floatingActionsWrapperView addArrangedSubview:v7];
  }
}

- (void)rebuildActionsViewControllers
{
  [(CNContactInlineActionsViewController *)self->_actionsViewController willMoveToParentViewController:0];
  [(CNContactInlineActionsViewController *)self->_actionsViewController removeFromParentViewController];
  BOOL v3 = [(CNContactInlineActionsViewController *)self->_actionsViewController view];
  [v3 removeFromSuperview];

  id v4 = [(CNContactContentUnitaryViewController *)self createActionsController];
  actionsViewController = self->_actionsViewController;
  self->_actionsViewController = v4;

  [(CNContactInlineActionsViewController *)self->_actionsViewController setObjectViewControllerDelegate:self];
  [(CNContactInlineActionsViewController *)self->_actionsViewController setDelegate:self];
  id v6 = [(CNContactContentUnitaryViewController *)self contact];
  [(CNContactInlineActionsViewController *)self->_actionsViewController setContact:v6];

  [(CNContactContentUnitaryViewController *)self addChildViewController:self->_actionsViewController];
  [(CNContactInlineActionsViewController *)self->_actionsViewController didMoveToParentViewController:self];
  actionsWrapperView = self->_actionsWrapperView;
  uint64_t v8 = [(CNContactInlineActionsViewController *)self->_actionsViewController view];
  [(CNContactActionsContainerView *)actionsWrapperView addArrangedSubview:v8];

  if ([(CNContactContentUnitaryViewController *)self shouldUseStaticHeader])
  {
    [(CNContactInlineActionsViewController *)self->_floatingActionsViewController willMoveToParentViewController:0];
    [(CNContactInlineActionsViewController *)self->_floatingActionsViewController removeFromParentViewController];
    uint64_t v9 = [(CNContactInlineActionsViewController *)self->_floatingActionsViewController view];
    [v9 removeFromSuperview];

    if ((objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory") & 1) == 0)
    {
      [(CNContactContentUnitaryViewController *)self setUpFloatingActionsViewController];
    }
  }
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  char v4 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory", a3);
  id v5 = [(CNContactContentUnitaryViewController *)self displayContactView];
  [v5 updateFontSizes];

  [(CNContactView *)self->_editingContactView updateFontSizes];
  if (![(CNContactContentUnitaryViewController *)self shouldUseStaticHeader])
  {
    uint64_t v8 = [(CNContactContentUnitaryViewController *)self displayHeaderView];
    [v8 updateFontSizes];
LABEL_7:

    goto LABEL_8;
  }
  id v6 = [(CNContactContentUnitaryViewController *)self staticDisplayHeaderView];
  [v6 updateFontSizes];

  id v7 = [(CNContactContentUnitaryViewController *)self displayFloatingCollapsedHeaderView];
  [v7 updateFontSizes];

  if (v4)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = [(CNContactContentUnitaryViewController *)self floatingActionsWrapperView];
  }
  uint64_t v9 = [(CNContactContentUnitaryViewController *)self displayFloatingCollapsedHeaderView];
  [v9 setActionsWrapperView:v8];

  if ((v4 & 1) == 0) {
    goto LABEL_7;
  }
LABEL_8:
  uint64_t v10 = [(CNContactContentUnitaryViewController *)self editingHeaderView];
  [v10 updateFontSizes];

  [(CNContactView *)self->_displayContactView setTableHeaderView:0];
  [(CNContactContentUnitaryViewController *)self rebuildActionsViewControllers];
  [(CNContactContentUnitaryViewController *)self viewDidLayoutSubviews];
  [(CNContactContentUnitaryViewController *)self reloadDataPreservingChanges:1];
  [(CNContactContentUnitaryViewController *)self setupViewHierarchyAndConstraints];
  id v11 = [(CNContactContentUnitaryViewController *)self applyContactStyle];
}

- (id)cardActions
{
  id v2 = [(CNContactContentUnitaryViewController *)self cardActionsGroup];
  BOOL v3 = [v2 actions];

  return v3;
}

- (BOOL)isOutOfProcess
{
  return 0;
}

- (void)setShowsInlineActions:(BOOL)a3
{
  if (self->_showsInlineActions != a3)
  {
    self->_showsInlineActions = a3;
    if (self->_actionsViewController) {
      [(CNContactContentUnitaryViewController *)self rebuildActionsViewControllers];
    }
  }
}

- (void)setAllowsEditPhoto:(BOOL)a3 preservingChanges:(BOOL)a4
{
  if (self->_allowsEditPhoto != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_allowsEditPhoto = a3;
    id v6 = [(CNContactContentUnitaryViewController *)self editingHeaderView];
    [v6 setAllowsEditPhoto:v5 preservingChanges:v4];
  }
}

- (void)setAllowsEditPhoto:(BOOL)a3
{
}

- (void)setAllowsDisplayModePickerActions:(BOOL)a3
{
  if (self->_allowsDisplayModePickerActions != a3)
  {
    BOOL v3 = a3;
    self->_allowsDisplayModePickerActions = a3;
    if ([(CNContactContentUnitaryViewController *)self shouldUseStaticHeader]) {
      [(CNContactContentUnitaryViewController *)self staticDisplayHeaderView];
    }
    else {
    BOOL v5 = [(CNContactContentUnitaryViewController *)self displayHeaderView];
    }
    [v5 setAllowsPickerActions:v3];

    [(CNContactContentUnitaryViewController *)self _reloadAlertGroups];
  }
}

- (void)setAlternateName:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_alternateName, a3);
  if ([(CNContactContentUnitaryViewController *)self shouldUseStaticHeader])
  {
    BOOL v5 = [(CNContactContentUnitaryViewController *)self staticDisplayHeaderView];
    [v5 setAlternateName:v7];

    [(CNContactContentUnitaryViewController *)self displayFloatingCollapsedHeaderView];
  }
  else
  {
    [(CNContactContentUnitaryViewController *)self displayHeaderView];
  id v6 = };
  [v6 setAlternateName:v7];
}

- (void)setShowContactBlockingFirst:(BOOL)a3
{
  if (self->_showContactBlockingFirst != a3)
  {
    self->_showContactBlockingFirst = a3;
    [(CNContactContentUnitaryViewController *)self reloadDataPreservingChanges:1];
  }
}

- (void)setIsMailVIP:(BOOL)a3
{
  self->_isMailVIP = a3;
  id v7 = [(CNContactContentUnitaryViewController *)self contactView];
  BOOL v4 = [(CNContactContentUnitaryViewController *)self cardGroupForProperty:*MEMORY[0x1E4F1ADC8]];
  int64_t v5 = [(CNContactContentUnitaryViewController *)self sectionOfGroup:v4 inTableView:v7];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v5];
    [v7 reloadSections:v6 withRowAnimation:100];
  }
}

- (BOOL)isMailVIP
{
  return self->_isMailVIP;
}

- (void)setDisplayedProperties:(id)a3
{
  int64_t v5 = (NSArray *)a3;
  if (self->_displayedProperties != v5)
  {
    id v11 = v5;
    if ([(NSArray *)v5 count])
    {
      id v6 = [(NSArray *)v11 objectAtIndexedSubscript:0];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
        [v8 handleFailureInMethod:a2, self, @"CNContactContentUnitaryViewController.m", 1247, @"Properties should be strings, are you still using old AB properties?" object file lineNumber description];
      }
    }
    if (v11)
    {
      uint64_t v9 = (NSArray *)[(NSArray *)v11 copy];
    }
    else
    {
      uint64_t v9 = +[CNContactView allCardProperties];
    }
    displayedProperties = self->_displayedProperties;
    self->_displayedProperties = v9;

    [(CNContactContentUnitaryViewController *)self setNeedsReloadLazy];
    int64_t v5 = v11;
  }
}

- (CNContactView)editingContactView
{
  editingContactView = self->_editingContactView;
  if (!editingContactView)
  {
    BOOL v4 = [CNContactView alloc];
    int64_t v5 = [(CNContactContentUnitaryViewController *)self contact];
    id v6 = -[CNContactView initWithFrame:contact:](v4, "initWithFrame:contact:", v5, 0.0, 0.0, 320.0, 200.0);
    id v7 = self->_editingContactView;
    self->_editingContactView = v6;

    [(CNContactView *)self->_editingContactView setEditing:1];
    [(CNContactView *)self->_editingContactView setDataSource:self];
    [(CNContactView *)self->_editingContactView setDelegate:self];
    [(CNContactView *)self->_editingContactView _setHeaderAndFooterViewsFloat:0];
    [(CNContactView *)self->_editingContactView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CNContactView *)self->_editingContactView setKeyboardDismissMode:1];
    editingContactView = self->_editingContactView;
  }

  return editingContactView;
}

- (id)createActionsController
{
  BOOL v3 = [CNContactInlineActionsViewController alloc];
  actionsDataSource = self->_actionsDataSource;
  int64_t v5 = [(CNContactContentUnitaryViewController *)self environment];
  id v6 = [(CNContactInlineActionsViewController *)v3 initWithActionListDataSource:actionsDataSource environment:v5];

  [(CNContactInlineActionsViewController *)v6 setDisplaysTitles:1];
  [(CNContactInlineActionsViewController *)v6 setDisplaysUnavailableActionTypes:1];
  if ([(CNContactContentUnitaryViewController *)self showsInlineActions])
  {
    id v7 = [MEMORY[0x1E4F5A720] allSupportedActionTypes];
    [(CNContactInlineActionsViewController *)v6 setSupportedActionTypes:v7];
  }
  else
  {
    [(CNContactInlineActionsViewController *)v6 setSupportedActionTypes:MEMORY[0x1E4F1CBF0]];
  }
  uint64_t v8 = [(CNContactInlineActionsViewController *)v6 view];
  LODWORD(v9) = 1148846080;
  [v8 setContentCompressionResistancePriority:0 forAxis:v9];

  return v6;
}

- (BOOL)isHeaderViewPhotoProhibited
{
  BOOL v3 = [(CNContactContentUnitaryViewController *)self prohibitedPropertyKeys];
  if ([v3 containsObject:*MEMORY[0x1E4F1AE28]])
  {
    char v4 = 1;
  }
  else
  {
    int64_t v5 = [(CNContactContentUnitaryViewController *)self prohibitedPropertyKeys];
    char v4 = [v5 containsObject:*MEMORY[0x1E4F1AF98]];
  }
  return v4;
}

- (CNContactView)displayContactView
{
  displayContactView = self->_displayContactView;
  if (!displayContactView)
  {
    char v4 = [CNContactView alloc];
    uint64_t v5 = [(id)objc_opt_class() tableViewStyle];
    id v6 = [(CNContactContentUnitaryViewController *)self contact];
    id v7 = -[CNContactView initWithFrame:style:contact:](v4, "initWithFrame:style:contact:", v5, v6, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v8 = self->_displayContactView;
    self->_displayContactView = v7;

    [(CNContactView *)self->_displayContactView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CNContactView *)self->_displayContactView setDataSource:self];
    [(CNContactView *)self->_displayContactView setDelegate:self];
    [(CNContactView *)self->_displayContactView _setHeaderAndFooterViewsFloat:0];
    double v9 = [(CNContactContentUnitaryViewController *)self environment];
    LODWORD(v5) = [v9 runningInContactsAppOniPad];

    displayContactView = self->_displayContactView;
    if (v5)
    {
      [(CNContactView *)displayContactView setSectionHeaderHeight:0.0];
      displayContactView = self->_displayContactView;
    }
  }

  return displayContactView;
}

- (CNContactHeaderEditView)editingHeaderView
{
  editingHeaderView = self->_editingHeaderView;
  if (!editingHeaderView)
  {
    BOOL v4 = [(CNContactContentUnitaryViewController *)self isHeaderViewPhotoProhibited];
    BOOL v5 = [(CNContactContentUnitaryViewController *)self shouldDrawNavigationBar]
      || [(CNContactContentUnitaryViewController *)self layoutPositionallyAfterNavBar];
    id v6 = [(CNContactContentUnitaryViewController *)self mutableContact];
    id v7 = +[CNContactHeaderEditView contactHeaderViewWithContact:v6 shouldAllowTakePhotoAction:1 showingNavBar:v5 monogramOnly:v4 isOutOfProcess:[(CNContactContentUnitaryViewController *)self isOutOfProcess] delegate:self];
    uint64_t v8 = self->_editingHeaderView;
    self->_editingHeaderView = v7;

    double v9 = [(CNContactContentUnitaryViewController *)self presentingDelegate];
    [(CNContactHeaderEditView *)self->_editingHeaderView setPresenterDelegate:v9];

    uint64_t v10 = +[CNContactStyle currentStyle];
    id v11 = [v10 contactHeaderBackgroundColor];
    [(CNContactHeaderEditView *)self->_editingHeaderView setBackgroundColor:v11];

    [(CNContactHeaderEditView *)self->_editingHeaderView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CNContactHeaderEditView *)self->_editingHeaderView setAllowsEditPhoto:[(CNContactContentUnitaryViewController *)self allowsEditPhoto] & !v4];
    id v12 = [(CNContactContentUnitaryViewController *)self applyContactStyle];
    editingHeaderView = self->_editingHeaderView;
  }

  return editingHeaderView;
}

- (UIView)editingFloatingCollapsedHeaderView
{
  editingFloatingCollapsedHeaderView = self->_editingFloatingCollapsedHeaderView;
  if (!editingFloatingCollapsedHeaderView)
  {
    BOOL v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    BOOL v5 = self->_editingFloatingCollapsedHeaderView;
    self->_editingFloatingCollapsedHeaderView = v4;

    [(UIView *)self->_editingFloatingCollapsedHeaderView setTranslatesAutoresizingMaskIntoConstraints:0];
    id v6 = [(CNContactContentUnitaryViewController *)self applyContactStyle];
    editingFloatingCollapsedHeaderView = self->_editingFloatingCollapsedHeaderView;
  }

  return editingFloatingCollapsedHeaderView;
}

- (CNContactHeaderCollapsedView)displayFloatingCollapsedHeaderView
{
  displayFloatingCollapsedHeaderView = self->_displayFloatingCollapsedHeaderView;
  if (!displayFloatingCollapsedHeaderView)
  {
    BOOL v4 = [(CNContactContentUnitaryViewController *)self isHeaderViewPhotoProhibited];
    int v5 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
    id v6 = [(CNContactContentUnitaryViewController *)self mutableContact];
    id v7 = +[CNContactHeaderCollapsedView collapsedContactHeaderViewWithContact:v6 showingNavBar:[(CNContactContentUnitaryViewController *)self layoutPositionallyAfterNavBar] monogramOnly:v4 delegate:self];
    uint64_t v8 = self->_displayFloatingCollapsedHeaderView;
    self->_displayFloatingCollapsedHeaderView = v7;

    if (v5)
    {
      [(CNContactHeaderCollapsedView *)self->_displayFloatingCollapsedHeaderView setActionsWrapperView:0];
    }
    else
    {
      double v9 = [(CNContactContentUnitaryViewController *)self floatingActionsWrapperView];
      [(CNContactHeaderCollapsedView *)self->_displayFloatingCollapsedHeaderView setActionsWrapperView:v9];
    }
    [(CNContactHeaderView *)self->_displayFloatingCollapsedHeaderView setAlwaysShowsMonogram:1];
    uint64_t v10 = [(CNContactContentUnitaryViewController *)self contactFormatter];
    [(CNContactHeaderCollapsedView *)self->_displayFloatingCollapsedHeaderView setContactFormatter:v10];

    id v11 = [(CNContactContentUnitaryViewController *)self alternateName];
    [(CNContactHeaderCollapsedView *)self->_displayFloatingCollapsedHeaderView setAlternateName:v11];

    id v12 = [(CNContactContentUnitaryViewController *)self presentingDelegate];
    [(CNContactHeaderView *)self->_displayFloatingCollapsedHeaderView setPresenterDelegate:v12];

    [(CNContactHeaderCollapsedView *)self->_displayFloatingCollapsedHeaderView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CNContactHeaderCollapsedView *)self->_displayFloatingCollapsedHeaderView setHidden:1];
    [(CNContactHeaderCollapsedView *)self->_displayFloatingCollapsedHeaderView showLabelAndAvatar:0 animated:0];
    id v13 = [MEMORY[0x1E4FB1618] lightGrayColor];
    [(CNContactHeaderCollapsedView *)self->_displayFloatingCollapsedHeaderView setBackgroundColor:v13];

    id v14 = [(CNContactContentUnitaryViewController *)self applyContactStyle];
    displayFloatingCollapsedHeaderView = self->_displayFloatingCollapsedHeaderView;
  }

  return displayFloatingCollapsedHeaderView;
}

- (CNContactHeaderDisplayView)displayHeaderView
{
  displayHeaderView = self->_displayHeaderView;
  if (!displayHeaderView)
  {
    BOOL v4 = [(CNContactContentUnitaryViewController *)self isHeaderViewPhotoProhibited];
    int v5 = [(CNContactContentUnitaryViewController *)self mutableContact];
    id v6 = +[CNContactHeaderDisplayView contactHeaderViewWithContact:v5 showingNavBar:[(CNContactContentUnitaryViewController *)self layoutPositionallyAfterNavBar] monogramOnly:v4 delegate:self];
    id v7 = self->_displayHeaderView;
    self->_displayHeaderView = v6;

    [(CNContactHeaderView *)self->_displayHeaderView setAlwaysShowsMonogram:1];
    uint64_t v8 = [(CNContactContentUnitaryViewController *)self contactFormatter];
    [(CNContactHeaderDisplayView *)self->_displayHeaderView setContactFormatter:v8];

    double v9 = [(CNContactContentUnitaryViewController *)self alternateName];
    [(CNContactHeaderDisplayView *)self->_displayHeaderView setAlternateName:v9];

    uint64_t v10 = [(CNContactContentUnitaryViewController *)self message];
    [(CNContactHeaderDisplayView *)self->_displayHeaderView setMessage:v10];

    id v11 = [(CNContactContentUnitaryViewController *)self importantMessage];
    [(CNContactHeaderDisplayView *)self->_displayHeaderView setImportantMessage:v11];

    id v12 = [(CNContactContentUnitaryViewController *)self presentingDelegate];
    [(CNContactHeaderView *)self->_displayHeaderView setPresenterDelegate:v12];

    [(CNContactHeaderDisplayView *)self->_displayHeaderView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CNContactHeaderDisplayView *)self->_displayHeaderView setAllowsPickerActions:[(CNContactContentUnitaryViewController *)self allowsDisplayModePickerActions]];
    [(CNContactHeaderEditView *)self->_editingHeaderView setAllowsEditPhoto:v4 ^ 1];
    id v13 = [(CNContactContentUnitaryViewController *)self applyContactStyle];
    displayHeaderView = self->_displayHeaderView;
  }

  return displayHeaderView;
}

- (CNContactHeaderStaticDisplayView)staticDisplayHeaderView
{
  staticDisplayHeaderView = self->_staticDisplayHeaderView;
  if (!staticDisplayHeaderView)
  {
    BOOL v4 = [(CNContactContentUnitaryViewController *)self isHeaderViewPhotoProhibited];
    int v5 = [(CNContactContentUnitaryViewController *)self mutableContact];
    id v6 = +[CNContactHeaderStaticDisplayView contactHeaderViewWithContact:v5 showingNavBar:[(CNContactContentUnitaryViewController *)self layoutPositionallyAfterNavBar] monogramOnly:v4 delegate:self];
    id v7 = self->_staticDisplayHeaderView;
    self->_staticDisplayHeaderView = v6;

    uint64_t v8 = [(CNContactContentUnitaryViewController *)self actionsWrapperView];
    [(CNContactHeaderStaticDisplayView *)self->_staticDisplayHeaderView setActionsWrapperView:v8];

    [(CNContactHeaderView *)self->_staticDisplayHeaderView setAlwaysShowsMonogram:1];
    double v9 = [(CNContactContentUnitaryViewController *)self contactFormatter];
    [(CNContactHeaderStaticDisplayView *)self->_staticDisplayHeaderView setContactFormatter:v9];

    uint64_t v10 = [(CNContactContentUnitaryViewController *)self alternateName];
    [(CNContactHeaderStaticDisplayView *)self->_staticDisplayHeaderView setAlternateName:v10];

    id v11 = [(CNContactContentUnitaryViewController *)self message];
    [(CNContactHeaderStaticDisplayView *)self->_staticDisplayHeaderView setMessage:v11];

    id v12 = [(CNContactContentUnitaryViewController *)self importantMessage];
    [(CNContactHeaderStaticDisplayView *)self->_staticDisplayHeaderView setImportantMessage:v12];

    id v13 = [(CNContactContentUnitaryViewController *)self presentingDelegate];
    [(CNContactHeaderView *)self->_staticDisplayHeaderView setPresenterDelegate:v13];

    [(CNContactHeaderStaticDisplayView *)self->_staticDisplayHeaderView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CNContactHeaderStaticDisplayView *)self->_staticDisplayHeaderView setAllowsPickerActions:[(CNContactContentUnitaryViewController *)self allowsDisplayModePickerActions]];
    id v14 = [(CNContactContentUnitaryViewController *)self applyContactStyle];
    staticDisplayHeaderView = self->_staticDisplayHeaderView;
  }

  return staticDisplayHeaderView;
}

- (id)contactHeaderView
{
  if ([(CNContactContentUnitaryViewController *)self isEditing])
  {
    BOOL v3 = [(CNContactContentUnitaryViewController *)self editingHeaderView];
  }
  else
  {
    if ([(CNContactContentUnitaryViewController *)self shouldUseStaticHeader]) {
      [(CNContactContentUnitaryViewController *)self staticDisplayHeaderView];
    }
    else {
    BOOL v3 = [(CNContactContentUnitaryViewController *)self displayHeaderView];
    }
  }

  return v3;
}

- (CNMutableContact)mutableContactForHeaderView
{
  id v2 = self;
  if (![(CNContactContentUnitaryViewController *)self shouldUseSharedProfile]) {
    goto LABEL_10;
  }
  BOOL v3 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  BOOL v4 = [v3 featureFlags];
  int v5 = [v4 isFeatureEnabled:15];

  if (!v5
    || [(CNContactContentUnitaryViewController *)v2 savingPersonalSharedProfile]
    || ([MEMORY[0x1E4F5A3D8] currentEnvironment],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 nicknameProvider],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isNicknameSharingEnabled],
        v7,
        v6,
        !v8))
  {
LABEL_10:
    p_mutableContact = (id *)&v2->_mutableContact;
    goto LABEL_11;
  }
  p_mutableContact = (id *)&v2->_mutableContactForHeaderView;
  id mutableContactForHeaderView = v2->_mutableContactForHeaderView;
  if (mutableContactForHeaderView)
  {
LABEL_12:
    id v2 = (CNContactContentUnitaryViewController *)mutableContactForHeaderView;
    goto LABEL_13;
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F5A4B8]);
  id v12 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v13 = [v12 nicknameProvider];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  void v26[2] = __68__CNContactContentUnitaryViewController_mutableContactForHeaderView__block_invoke;
  void v26[3] = &unk_1E549B4B0;
  id v14 = v11;
  id v27 = v14;
  [v13 fetchPersonalNicknameAsContactWithCompletion:v26];

  uint64_t v15 = *MEMORY[0x1E4F5A2B0];
  id v16 = [v14 future];
  uint64_t v17 = [v16 resultWithTimeout:0 error:0.2];
  double v18 = (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v17);

  if (v18)
  {
    double v19 = CNUILogContactCard();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v25 = 0;
      _os_log_impl(&dword_18B625000, v19, OS_LOG_TYPE_DEFAULT, "Personal nickname fetched from IMNicknameProvider, me card will show shared profile photo and poster", v25, 2u);
    }

    uint64_t v20 = [v18 imageData];
    [(CNMutableContact *)v2->_mutableContact setImageData:v20];

    uint64_t v21 = [v18 thumbnailImageData];
    [(CNMutableContact *)v2->_mutableContact setThumbnailImageData:v21];

    -[CNMutableContact setCropRect:](v2->_mutableContact, "setCropRect:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    double v22 = [v18 wallpaper];
    [(CNMutableContact *)v2->_mutableContact setWallpaper:v22];

    long long v23 = [v18 watchWallpaperImageData];
    [(CNMutableContact *)v2->_mutableContact setWatchWallpaperImageData:v23];

    objc_storeStrong((id *)&v2->_mutableContactForHeaderView, v2->_mutableContact);
  }
  else
  {
    objc_storeStrong((id *)&v2->_mutableContactForHeaderView, v2->_mutableContact);
    id v2 = (CNContactContentUnitaryViewController *)*p_mutableContact;
  }

  if (v18)
  {
LABEL_11:
    id mutableContactForHeaderView = *p_mutableContact;
    goto LABEL_12;
  }
LABEL_13:

  return (CNMutableContact *)v2;
}

void __68__CNContactContentUnitaryViewController_mutableContactForHeaderView__block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*MEMORY[0x1E4F5A2A8] + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 finishWithResult:v2 error:0];
}

- (id)contactView
{
  if ([(CNContactContentUnitaryViewController *)self isEditing]) {
    [(CNContactContentUnitaryViewController *)self editingContactView];
  }
  else {
  BOOL v3 = [(CNContactContentUnitaryViewController *)self displayContactView];
  }

  return v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dealloc
{
  v12[1] = *MEMORY[0x1E4F143B8];
  [(CNContactView *)self->_displayContactView setDelegate:0];
  [(CNContactView *)self->_editingContactView setDelegate:0];
  [(CNContactView *)self->_displayContactView setDataSource:0];
  [(CNContactView *)self->_editingContactView setDataSource:0];
  [(CNContactHeaderView *)self->_displayHeaderView setDelegate:0];
  [(CNContactHeaderDisplayView *)self->_displayHeaderView didFinishUsing];
  [(CNContactHeaderView *)self->_staticDisplayHeaderView setDelegate:0];
  [(CNContactHeaderStaticDisplayView *)self->_staticDisplayHeaderView didFinishUsing];
  [(CNContactHeaderView *)self->_displayFloatingCollapsedHeaderView setDelegate:0];
  [(CNContactHeaderCollapsedView *)self->_displayFloatingCollapsedHeaderView didFinishUsing];
  [(CNContactHeaderView *)self->_editingHeaderView setDelegate:0];
  [(CNContactHeaderEditView *)self->_editingHeaderView didFinishUsing];
  BOOL v3 = [(CNContactContentUnitaryViewController *)self headerHeightConstraint];

  if (v3)
  {
    BOOL v4 = (void *)MEMORY[0x1E4F28DC8];
    int v5 = [(CNContactContentUnitaryViewController *)self headerHeightConstraint];
    v12[0] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [v4 deactivateConstraints:v6];
  }
  actionsDataSource = self->_actionsDataSource;
  self->_actionsDataSource = 0;

  [(CNContactAction *)self->_addFavoriteAction setDelegate:0];
  int v8 = [(CNContactContentUnitaryViewController *)self iMessageIDSLookupToken];
  [v8 cancel];

  double v9 = [(CNContactContentUnitaryViewController *)self faceTimeIDSLookupToken];
  [v9 cancel];

  uint64_t v10 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v10 removeObserver:self];

  v11.receiver = self;
  v11.super_class = (Class)CNContactContentUnitaryViewController;
  [(CNContactContentUnitaryViewController *)&v11 dealloc];
}

- (void)setUsesBrandedCallHeaderFormat:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_usesBrandedCallHeaderFormat != a3
    || [(CNContactHeaderDisplayView *)self->_displayHeaderView usesBrandedCallFormat] != a3
    || [(CNContactHeaderStaticDisplayView *)self->_staticDisplayHeaderView usesBrandedCallFormat] != v3)
  {
    self->_usesBrandedCallHeaderFormat = v3;
    [(CNContactHeaderDisplayView *)self->_displayHeaderView setUsesBrandedCallFormat:v3];
    staticDisplayHeaderView = self->_staticDisplayHeaderView;
    [(CNContactHeaderStaticDisplayView *)staticDisplayHeaderView setUsesBrandedCallFormat:v3];
  }
}

- (void)setForcesTransparentBackground:(BOOL)a3
{
  if (self->_forcesTransparentBackground != a3)
  {
    self->_forcesTransparentBackground = a3;
    BOOL v4 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    int v5 = [v4 schedulerProvider];
    id v6 = [v5 mainThreadScheduler];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __72__CNContactContentUnitaryViewController_setForcesTransparentBackground___block_invoke;
    void v7[3] = &unk_1E549B488;
    v7[4] = self;
    [v6 performBlock:v7];
  }
}

id __72__CNContactContentUnitaryViewController_setForcesTransparentBackground___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) applyContactStyle];
}

- (void)setTitle:(id)a3
{
  id v5 = a3;
  if (v5
    || ([(CNContactContentUnitaryViewController *)self title],
        (BOOL v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = [(CNContactContentUnitaryViewController *)self title];
    char v7 = [v5 isEqual:v6];

    if (!v5)
    {

      if (v7) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
    if ((v7 & 1) == 0)
    {
LABEL_5:
      v8.receiver = self;
      v8.super_class = (Class)CNContactContentUnitaryViewController;
      [(CNContactContentUnitaryViewController *)&v8 setTitle:v5];
      [(CNContactContentUnitaryViewController *)self didChangeToShowTitle:v5 != 0];
    }
  }
LABEL_6:
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
  id v5 = a3;
  id v6 = [(CNContactContentUnitaryViewController *)self actionsDataSource];
  [v6 setContactStore:v5];

  char v7 = [(CNContactContentUnitaryViewController *)self contactViewCache];
  [v7 setContactStore:v5];

  objc_super v8 = [[CNUIGroupsAndContainersSaveManager alloc] initWithContactStore:v5];
  [(CNContactContentUnitaryViewController *)self setGroupsAndContainersSaveManager:v8];
}

- (CNContactContentUnitaryViewController)initWithContact:(id)a3 prohibitedPropertyKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(CNContactContentUnitaryViewController *)self initWithNibName:0 bundle:0];
  double v9 = v8;
  if (v8)
  {
    [(CNContactContentUnitaryViewController *)v8 setProhibitedPropertyKeys:v7];
    [(CNContactContentUnitaryViewController *)v9 setContact:v6];
    uint64_t v10 = v9;
  }

  return v9;
}

- (CNContactContentUnitaryViewController)initWithContact:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactContentUnitaryViewController *)self initWithNibName:0 bundle:0];
  id v6 = v5;
  if (v5) {
    [(CNContactContentUnitaryViewController *)v5 setContact:v4];
  }

  return v6;
}

- (CNContactContentUnitaryViewController)initWithEnvironment:(id)a3
{
  v88[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v86.receiver = self;
  v86.super_class = (Class)CNContactContentUnitaryViewController;
  id v6 = [(CNContactContentViewController *)&v86 initWithEnvironment:v5];
  objc_storeStrong((id *)v6 + 306, a3);
  id v7 = objc_alloc_init(CNContactViewCache);
  objc_super v8 = (void *)*((void *)v6 + 307);
  *((void *)v6 + 307) = v7;

  if ([MEMORY[0x1E4F1B9F8] deviceSupportsGemini])
  {
    double v9 = [CNUIGeminiDataSource alloc];
    uint64_t v10 = +[CNUIContactsEnvironment currentEnvironment];
    objc_super v11 = [v10 geminiManager];
    uint64_t v12 = [(CNUIGeminiDataSource *)v9 initWithGeminiManager:v11];
    id v13 = (void *)*((void *)v6 + 309);
    *((void *)v6 + 309) = v12;

    [*((id *)v6 + 309) setDelegate:v6];
  }
  id v14 = +[CNUIContactsEnvironment currentEnvironment];
  uint64_t v15 = [v14 defaultSchedulerProvider];
  uint64_t v16 = [v15 mainThreadScheduler];
  uint64_t v17 = (void *)*((void *)v6 + 313);
  *((void *)v6 + 313) = v16;

  double v18 = +[CNUIContactsEnvironment currentEnvironment];
  double v19 = [v18 defaultSchedulerProvider];
  uint64_t v20 = [v19 newSerialSchedulerWithName:@"com.apple.ContactsUI.ktWorkQueue"];
  uint64_t v21 = (void *)*((void *)v6 + 312);
  *((void *)v6 + 312) = v20;

  long long v22 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
  *(_OWORD *)(v6 + 2536) = *MEMORY[0x1E4FB2848];
  *(_OWORD *)(v6 + 2552) = v22;
  objc_storeWeak((id *)v6 + 193, v6);
  v6[1337] = 1;
  v6[1338] = 1;
  v6[1339] = 1;
  v6[1340] = 1;
  v6[1341] = 1;
  v6[1342] = 1;
  v6[1343] = 0;
  v6[1344] = 0;
  v6[1345] = 1;
  v6[1346] = 1;
  v6[1347] = 1;
  v6[1348] = 1;
  v6[1349] = 1;
  v6[1350] = 1;
  v6[1352] = 1;
  v6[1353] = 1;
  v6[1354] = 1;
  v6[1355] = 0;
  v6[1329] = 0;
  v6[1330] = 0;
  v6[1378] = 0;
  uint64_t v23 = [MEMORY[0x1E4F1B910] sharedFullNameFormatter];
  long long v24 = (void *)*((void *)v6 + 210);
  *((void *)v6 + 210) = v23;

  uint64_t v25 = +[CNContactView allCardProperties];
  long long v26 = (void *)*((void *)v6 + 164);
  *((void *)v6 + 164) = v25;

  id v27 = objc_alloc(MEMORY[0x1E4F5A720]);
  uint64_t v28 = [v5 actionDiscoveringEnvironment];
  uint64_t v29 = [v27 initWithDiscoveringEnvironment:v28];
  id v30 = (void *)*((void *)v6 + 300);
  *((void *)v6 + 300) = v29;

  uint64_t v31 = [v6 createActionsController];
  id v32 = (void *)*((void *)v6 + 276);
  *((void *)v6 + 276) = v31;

  [*((id *)v6 + 276) setObjectViewControllerDelegate:v6];
  [*((id *)v6 + 276) setDelegate:v6];
  [v6 addChildViewController:*((void *)v6 + 276)];
  [*((id *)v6 + 276) didMoveToParentViewController:v6];
  CGRect v33 = [CNContactActionsContainerView alloc];
  id v34 = [*((id *)v6 + 276) view];
  v88[0] = v34;
  CGRect v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:1];
  uint64_t v36 = [(CNContactActionsContainerView *)v33 initWithArrangedSubviews:v35];
  id v37 = (void *)*((void *)v6 + 277);
  *((void *)v6 + 277) = v36;

  [*((id *)v6 + 277) setTranslatesAutoresizingMaskIntoConstraints:0];
  double v38 = *MEMORY[0x1E4F4BEC8];
  __int16 v39 = [*((id *)v6 + 276) view];
  objc_msgSend(v39, "setMinimumLayoutSize:", v38, 35.0);

  if ([v6 shouldUseStaticHeader])
  {
    uint64_t v40 = [v6 createActionsController];
    uint64_t v41 = (void *)*((void *)v6 + 278);
    *((void *)v6 + 278) = v40;

    [*((id *)v6 + 278) setObjectViewControllerDelegate:v6];
    [*((id *)v6 + 278) setDelegate:v6];
    [v6 addChildViewController:*((void *)v6 + 278)];
    [*((id *)v6 + 278) didMoveToParentViewController:v6];
    uint64_t v42 = [CNContactActionsContainerView alloc];
    id v43 = [*((id *)v6 + 278) view];
    double v87 = v43;
    id v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v87 count:1];
    uint64_t v45 = [(CNContactActionsContainerView *)v42 initWithArrangedSubviews:v44];
    uint64_t v46 = (void *)*((void *)v6 + 279);
    *((void *)v6 + 279) = v45;

    [*((id *)v6 + 279) setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v47 = +[CNUIColorRepository transparentBackgroundColor];
    [*((id *)v6 + 279) setBackgroundColor:v47];

    uint64_t v48 = [*((id *)v6 + 278) view];
    objc_msgSend(v48, "setMinimumLayoutSize:", v38, 35.0);

    id v49 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    uint64_t v50 = [MEMORY[0x1E4F39BD0] layer];
    long long v51 = [v49 layer];
    [v51 addSublayer:v50];

    long long v52 = (void *)*((void *)v6 + 226);
    *((void *)v6 + 226) = v49;
    id v53 = v49;

    uint64_t v54 = (void *)*((void *)v6 + 227);
    *((void *)v6 + 227) = v50;

    id v55 = [v6 displayContactView];
    [v55 setBackgroundView:v53];
  }
  uint64_t v56 = objc_opt_new();
  uint64_t v57 = (void *)*((void *)v6 + 280);
  *((void *)v6 + 280) = v56;

  [*((id *)v6 + 280) setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v58 = [v6 environment];
  if ([v58 runningInContactsAppOniPad])
  {
    long long v59 = [*((id *)v6 + 280) backgroundColor];
    [*((id *)v6 + 280) setBackgroundColor:v59];
  }
  else
  {
    long long v59 = +[CNContactStyle currentStyle];
    char v60 = [v59 contactHeaderDropShadowColor];
    [*((id *)v6 + 280) setBackgroundColor:v60];
  }
  uint64_t v61 = [v5 inProcessActivityManager];
  char v62 = (void *)*((void *)v6 + 308);
  *((void *)v6 + 308) = v61;

  uint64_t v63 = [MEMORY[0x1E4F1C978] array];
  id v64 = (void *)*((void *)v6 + 238);
  *((void *)v6 + 238) = v63;

  char v65 = objc_alloc_init(CNUIContactStoreSaveExecutor);
  uint64_t v66 = (void *)*((void *)v6 + 184);
  *((void *)v6 + 184) = v65;

  uint64_t v67 = objc_alloc_init(CNUIContactStoreLinkedContactSaveExecutor);
  id v68 = (void *)*((void *)v6 + 185);
  *((void *)v6 + 185) = v67;

  v69 = (void *)*((void *)v6 + 218);
  *((void *)v6 + 218) = 0;

  id v70 = (void *)*((void *)v6 + 314);
  *((void *)v6 + 314) = MEMORY[0x1E4F1CBF0];

  [v6 setNeedsReloadLazy];
  id v71 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v71 addObserver:v6 selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];

  uint64_t v72 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v72 addObserver:v6 selector:sel_localeDidChange_ name:*MEMORY[0x1E4F1C370] object:0];

  id v73 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v73 addObserver:v6 selector:sel_contactStoreDidChangeWithNotification_ name:*MEMORY[0x1E4F1AF80] object:0];

  BOOL v74 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v74 addObserver:v6 selector:sel_contactStoreDidChangeWithNotification_ name:*MEMORY[0x1E4F5A180] object:0 suspensionBehavior:4];

  int v75 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v75 addObserver:v6 selector:sel_keyboardDidShowNotification_ name:*MEMORY[0x1E4FB2BC8] object:0];

  uint64_t v76 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v76 addObserver:v6 selector:sel_keyboardWillHideNotification_ name:*MEMORY[0x1E4FB2C50] object:0];

  uint64_t v77 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v77 addObserver:v6 selector:sel_favoritesDidChangeWithNotification_ name:*MEMORY[0x1E4F1AFF0] object:0];

  char v78 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  BOOL v79 = [v78 featureFlags];
  v6[1372] = [v79 isFeatureEnabled:18];

  if ([v6 supportsDrafts])
  {
    unsigned int v80 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v80 addObserver:v6 selector:sel_applicationLeftForeground_ name:*MEMORY[0x1E4FB2738] object:0];

    unsigned int v81 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v81 addObserver:v6 selector:sel_applicationLeftForeground_ name:*MEMORY[0x1E4FB2740] object:0];
  }
  [v6 setRestorationIdentifier:@"ContactCard"];
  [v6 setRestorationClass:objc_opt_class()];
  unsigned int v82 = [v6 navigationItem];
  [v82 _setBackgroundHidden:1];

  char v83 = [v6 navigationItem];
  [v83 setLargeTitleDisplayMode:2];

  id v84 = (id)[v6 applyContactStyle];
  return (CNContactContentUnitaryViewController *)v6;
}

- (CNContactContentUnitaryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5 = +[CNUIContactsEnvironment currentEnvironment];
  id v6 = [(CNContactContentUnitaryViewController *)self initWithEnvironment:v5];

  return v6;
}

+ (id)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  id v7 = (void *)MEMORY[0x1E4F1B8F8];
  objc_super v8 = +[CNContactContentViewController descriptorForRequiredKeys];
  v26[0] = v8;
  double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  uint64_t v10 = [v7 contactWithStateRestorationCoder:v5 store:v6 keys:v9];

  if (v10)
  {
    id v20 = v6;
    objc_super v11 = [[CNContactContentViewController alloc] initWithContact:v10];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v12 = [a1 BOOLStateRestorationProperties];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          double v18 = [v5 decodeObjectOfClass:objc_opt_class() forKey:v17];
          if (v18) {
            [(CNContactContentViewController *)v11 setValue:v18 forKey:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v14);
    }

    id v6 = v20;
  }
  else
  {
    objc_super v11 = 0;
  }

  return v11;
}

+ (id)BOOLStateRestorationProperties
{
  return &unk_1ED915C68;
}

+ (BOOL)shouldShowGeminiForResult:(id)a3 contact:(id)a4
{
  id v7 = a3;
  if (v7)
  {
    objc_super v8 = [a4 phoneNumbers];
    if ([v8 count] && objc_msgSend(MEMORY[0x1E4F1B9F8], "deviceSupportsGemini"))
    {
      id v4 = [v7 availableChannels];
      if ((unint64_t)[v4 count] > 1)
      {
        BOOL v9 = 1;
LABEL_15:

LABEL_16:
        goto LABEL_17;
      }
      id v5 = [v7 channel];
      int v10 = 1;
      BOOL v9 = 1;
      if (![v5 isAvailable])
      {
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      int v10 = 0;
    }
    objc_super v11 = [v7 channel];
    BOOL v9 = ([v11 isAvailable] & 1) == 0 && objc_msgSend(v7, "usage") == 1;

    if (!v10) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  BOOL v9 = 0;
LABEL_17:

  return v9;
}

+ (BOOL)actionModelIncludesTTY:(id)a3
{
  BOOL v3 = [a3 allActions];
  char v4 = objc_msgSend(v3, "_cn_any:", &__block_literal_global_881);

  return v4;
}

uint64_t __64__CNContactContentUnitaryViewController_actionModelIncludesTTY___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 type];
  if ([v3 isEqual:*MEMORY[0x1E4F1AD60]])
  {
    uint64_t v4 = 1;
  }
  else
  {
    id v5 = [v2 type];
    uint64_t v4 = [v5 isEqual:*MEMORY[0x1E4F1AD68]];
  }
  return v4;
}

+ (void)_telemetryForContact:(id)a3
{
  v38[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v37[0] = @"PhoneNumbers";
  uint64_t v4 = NSNumber;
  id v5 = [v3 phoneNumbers];
  id v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  v38[0] = v6;
  v37[1] = @"EmailAddresses";
  id v7 = NSNumber;
  objc_super v8 = [v3 emailAddresses];
  BOOL v9 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  v38[1] = v9;
  v37[2] = @"PostalAddresses";
  int v10 = NSNumber;
  objc_super v11 = [v3 postalAddresses];
  uint64_t v12 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
  v38[2] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];

  uint64_t v14 = [v3 note];
  unint64_t v15 = [v14 length];

  if (v15 >> 11 >= 5)
  {
    uint64_t v16 = _LargeDatabasesLowSeveritySignpostLogHandle();
    if (os_signpost_enabled(v16))
    {
      uint64_t v17 = [v3 note];
      *(_DWORD *)long long buf = 134349056;
      uint64_t v33 = [v17 length];
      _os_signpost_emit_with_name_impl(&dword_18B625000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LongContactNoteLength", " enableTelemetry=YES %{public, signpost.telemetry:number1, name=NoteLength}lu", buf, 0xCu);
    }
  }
  id v27 = v3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v18 = v13;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        long long v24 = [v18 objectForKeyedSubscript:v23];
        unint64_t v25 = [v24 unsignedIntegerValue];

        if (v25 >= 0xA)
        {
          long long v26 = _LargeDatabasesLowSeveritySignpostLogHandle();
          if (os_signpost_enabled(v26))
          {
            *(_DWORD *)long long buf = 138543618;
            uint64_t v33 = v23;
            __int16 v34 = 2050;
            unint64_t v35 = v25;
            _os_signpost_emit_with_name_impl(&dword_18B625000, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HighContactAttributeCount", " enableTelemetry=YES %{public, signpost.telemetry:string1, name=Label}@ %{public, signpost.telemetry:number1, name=LabelCount}lu", buf, 0x16u);
          }
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v20);
  }
}

+ (BOOL)enablesTransportButtons
{
  if (enablesTransportButtons_s_onceToken_63704 != -1) {
    dispatch_once(&enablesTransportButtons_s_onceToken_63704, &__block_literal_global_63705);
  }
  return enablesTransportButtons_s_enableTransportButtons_63706;
}

uint64_t __64__CNContactContentUnitaryViewController_enablesTransportButtons__block_invoke()
{
  uint64_t result = CFPreferencesGetAppBooleanValue(@"CNEnableTransportButtons", (CFStringRef)*MEMORY[0x1E4F1D3B8], 0);
  enablesTransportButtons_s_enableTransportButtons_63706 = result != 0;
  return result;
}

+ (int64_t)tableViewStyle
{
  return 1;
}

+ (id)descriptorForRequiredKeysForContact:(id)a3
{
  void v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 descriptorForRequiredKeys];
  id v6 = [v4 availableKeyDescriptor];

  v12[0] = v5;
  v12[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  objc_super v8 = (void *)MEMORY[0x1E4F1B8F8];
  BOOL v9 = [NSString stringWithUTF8String:"+[CNContactContentUnitaryViewController descriptorForRequiredKeysForContact:]"];
  int v10 = [v8 descriptorWithKeyDescriptors:v7 description:v9];

  return v10;
}

@end