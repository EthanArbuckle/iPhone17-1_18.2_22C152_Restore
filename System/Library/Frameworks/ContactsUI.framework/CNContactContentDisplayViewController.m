@interface CNContactContentDisplayViewController
+ (BOOL)actionModelIncludesTTY:(id)a3;
+ (BOOL)shouldShowGeminiForResult:(id)a3 contact:(id)a4;
+ (CNContactContentDisplayViewController)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4;
+ (id)BOOLStateRestorationProperties;
+ (id)descriptorForRequiredKeys;
+ (id)descriptorForRequiredKeysForContact:(id)a3;
+ (id)descriptorForRequiredKeysWithDescription:(id)a3;
+ (int64_t)tableViewStyle;
- (BOOL)_canShowWhileLocked;
- (BOOL)_indexPathIsActionItem:(id)a3;
- (BOOL)allowsEditInApp;
- (BOOL)canBecomeFirstResponder;
- (BOOL)contactDisplayViewController:(id)a3 shouldPerformDefaultActionForContact:(id)a4 propertyKey:(id)a5 propertyIdentifier:(id)a6;
- (BOOL)contactInlineActionsViewController:(id)a3 shouldPerformActionOfType:(id)a4 withContactProperty:(id)a5;
- (BOOL)contactSupportsTTYCalls;
- (BOOL)didSetFirstResponder;
- (BOOL)didSetNewContact;
- (BOOL)forcesTransparentBackground;
- (BOOL)hasTableViewHeaderFirstSection;
- (BOOL)headerViewShouldCacheContactBackgroundColor:(id)a3;
- (BOOL)highlightedPropertyImportant;
- (BOOL)isHeaderViewPhotoProhibited;
- (BOOL)isNicknameProhibited;
- (BOOL)isOutOfProcess;
- (BOOL)isPresentingFullscreenForOutOfProcess;
- (BOOL)isPresentingModalViewController;
- (BOOL)isScrollViewControllingHeaderResizeAnimation:(id)a3;
- (BOOL)isStandardGroup:(id)a3;
- (BOOL)isSuggestedContact;
- (BOOL)isTableViewHeaderFirstSectionIndexPath:(id)a3;
- (BOOL)needsReload;
- (BOOL)outOfProcessSetupComplete;
- (BOOL)reloadDataIfNeeded;
- (BOOL)runningPPT;
- (BOOL)saveChanges;
- (BOOL)saveWasAuthorized;
- (BOOL)shouldAddFaceTimeGroup;
- (BOOL)shouldAddShareLocationGroup;
- (BOOL)shouldDisplayAvatarHeaderView;
- (BOOL)shouldDrawNavigationBar;
- (BOOL)shouldIgnoreBlockListChange;
- (BOOL)shouldIgnoreContactStoreDidChangeNotification;
- (BOOL)shouldReallyShowLinkedContacts;
- (BOOL)shouldShowActionsForAvatarView:(id)a3;
- (BOOL)shouldShowGemini;
- (BOOL)shouldShowVerifiedFooterInSection:(int64_t)a3;
- (BOOL)showingMeContact;
- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6;
- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4;
- (CGRect)centeredSourceRect:(CGRect)a3 inContactView:(id)a4;
- (CGSize)requiredSizeForVisibleTableView;
- (CGSize)setupTableHeaderView;
- (CNCancelable)faceTimeIDSLookupToken;
- (CNCancelable)iMessageIDSLookupToken;
- (CNCancelable)medicalIDLookupToken;
- (CNCardFaceTimeGroup)cardFaceTimeGroup;
- (CNCardGroup)cardActionsGroup;
- (CNCardGroup)cardBlockContactGroup;
- (CNCardGroup)cardBottomGroup;
- (CNCardGroup)cardFooterGroup;
- (CNCardGroup)cardMedicalIDGroup;
- (CNCardGroup)cardShareLocationGroup;
- (CNCardGroup)cardTopGroup;
- (CNCardLinkedCardsGroup)cardLinkedCardsGroup;
- (CNCardNamePickingGroup)namePickingGroup;
- (CNContact)contact;
- (CNContactAction)ignoreContactAction;
- (CNContactActionProvider)actionProvider;
- (CNContactActionsContainerView)actionsWrapperView;
- (CNContactAddNewFieldAction)addNewFieldAction;
- (CNContactClearRecentsDataAction)clearRecentsDataAction;
- (CNContactContainerPickerViewController)containerPicker;
- (CNContactContentDisplayViewController)initWithContact:(id)a3 contactViewConfiguration:(id)a4;
- (CNContactContentDisplayViewController)initWithEnvironment:(id)a3;
- (CNContactContentDisplayViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CNContactContentDisplayViewControllerDelegate)delegate;
- (CNContactContentNavigationItemDelegate)navigationItemDelegate;
- (CNContactContentNavigationItemUpdater)contactNavigationItemUpdater;
- (CNContactContentViewControllerConfiguration)contactViewConfiguration;
- (CNContactEditAuthorizationManager)editAuthorizationManager;
- (CNContactFormatter)contactFormatter;
- (CNContactHeaderDisplayView)contactHeaderView;
- (CNContactInlineActionsViewController)actionsViewController;
- (CNContactRecentsReference)recentsData;
- (CNContactSelectContainersAction)selectContainersAction;
- (CNContactStore)contactStore;
- (CNContactSuggestionAction)suggestedContactAction;
- (CNContactToggleBlockCallerAction)blockAction;
- (CNContactToggleBlockReportCallerAction)blockReportAction;
- (CNContactUpdateExistingContactAction)updateExistingContactAction;
- (CNContactView)contactView;
- (CNContactViewCache)contactViewCache;
- (CNEmergencyContactAction)emergencyContactAction;
- (CNHealthStoreManagerToken)medicalIDRegistrationToken;
- (CNManagedConfiguration)managedConfiguration;
- (CNMedicalIDAction)medicalIDAction;
- (CNMutableContact)mutableContact;
- (CNMutableContact)shadowCopyOfReadonlyContact;
- (CNPolicy)policy;
- (CNPresenterDelegate)presentingDelegate;
- (CNPropertyGroupsDataSource)propertyGroupsDataSource;
- (CNPropertyNoteCell)noteCell;
- (CNShareLocationController)shareLocationController;
- (CNSiriContactContextProvider)siriContextProvider;
- (CNUIContactSaveExecutor)saveLinkedContactsExecutor;
- (CNUIContactsEnvironment)environment;
- (CNUIGeminiDataSource)geminiDataSource;
- (CNUIUserActionListDataSource)actionsDataSource;
- (CNUIUserActivityManager)activityManager;
- (Class)groupClassForProperty:(id)a3;
- (HKHealthStore)healthStore;
- (NSArray)activatedConstraints;
- (NSArray)cardActions;
- (NSArray)customActions;
- (NSArray)extraLeftBarButtonItems;
- (NSArray)extraRightBarButtonItems;
- (NSArray)highlightedProperties;
- (NSArray)missingRequiredKeys;
- (NSArray)originalContacts;
- (NSArray)preEditLeftBarButtonItems;
- (NSArray)prohibitedPropertyKeys;
- (NSDictionary)linkedPoliciesByContactIdentifier;
- (NSDictionary)propertyGroups;
- (NSDictionary)userActivityUserInfo;
- (NSLayoutConstraint)headerHeightConstraint;
- (NSMapTable)cachedLabelWidths;
- (NSMutableArray)displayGroups;
- (NSMutableArray)issuedSaveRequestIdentifiers;
- (NSString)emergencyNumberIdentifier;
- (NSString)initialPrompt;
- (UIEdgeInsets)headerViewSafeAreaInsets;
- (UIEdgeInsets)insetsForContactTableView:(id)a3;
- (UIEdgeInsets)scrollIndicatorInsetsForContactTableView:(id)a3 withContentInsets:(UIEdgeInsets)a4;
- (UIKeyCommand)cancelCommand;
- (UIKeyCommand)editCommand;
- (UINavigationItem)effectiveNavigationItem;
- (UIView)headerDropShadowView;
- (UIViewController)personHeaderViewController;
- (double)contentOffsetYForGlobalHeaderHeight:(double)a3 contentInset:(UIEdgeInsets)a4;
- (double)desiredHeightForWidth:(double)a3;
- (double)globalHeaderHeightForContentOffset:(double)a3 contentInset:(UIEdgeInsets)a4;
- (double)keyboardVerticalOverlap;
- (double)navigationBarHeight;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (double)updateHeaderConstraintForGlobalHeaderHeight:(double)a3 direction:(int64_t)a4 animated:(BOOL)a5;
- (id)_addNewFieldAction;
- (id)_cardGroupAtTableViewSectionIndex:(int64_t)a3;
- (id)_cellForIndexPath:(id)a3;
- (id)_cellIdentifierForIndexPath:(id)a3;
- (id)_clearRecentsDataAction;
- (id)_currentTopVisibleGroupInContactView:(id)a3;
- (id)_itemAtIndexPath:(id)a3;
- (id)_labelWidthKeyForGroup:(id)a3;
- (id)_labelWidthKeyForItem:(id)a3;
- (id)_loadDisplayGroups;
- (id)_loadPropertyGroups;
- (id)_phoneticNameForValue:(id)a3 currentPhoneticName:(id)a4 property:(id)a5;
- (id)_policyForContact:(id)a3 mode:(int64_t)a4;
- (id)_propertyGroupsForKeys:(id)a3;
- (id)_removeUnauthorizedKeysFromContact:(id)a3;
- (id)_updateContact:(id)a3 withMissingKeysFromRequiredKeys:(id)a4;
- (id)_updateExistingContactAction;
- (id)applyContactStyle;
- (id)cardGroupForProperty:(id)a3;
- (id)contentScrollViewForEdge:(unint64_t)a3;
- (id)createActionsController;
- (id)currentNavigationController;
- (id)indexPathOfPropertyItem:(id)a3;
- (id)saveDescriptionForRemovingLinkedContact:(id)a3 keys:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableViewHeaderFirstSectionCell;
- (int64_t)_modalPresentationStyleForViewController:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)mode;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)sectionOfGroup:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)groupIndexFromTableViewSectionIndex:(unint64_t)a3;
- (unint64_t)tableViewSectionIndexFromGroupIndex:(unint64_t)a3;
- (void)_addFaceTimeGroupAnimated:(BOOL)a3;
- (void)_addGroup:(id)a3 afterGroup:(id)a4 animated:(BOOL)a5;
- (void)_addMedicalIDGroupAnimated:(BOOL)a3;
- (void)_addShareLocationGroupAnimated:(BOOL)a3;
- (void)_didCompleteWithContact:(id)a3;
- (void)_handleCoalescedBlockListDidChange;
- (void)_pickName;
- (void)_refetchContact;
- (void)_reloadAlertGroups;
- (void)_reloadFaceTimeGroup;
- (void)_reloadGeminiGroupPreservingChanges:(BOOL)a3;
- (void)_reloadLinkedCardsGroup;
- (void)_reloadMedicalIDGroup;
- (void)_reloadPropertyGroupsPreservingChanges:(BOOL)a3;
- (void)_retrieveActionsModelPreservingChanges:(BOOL)a3;
- (void)_saveChangesForGroups:(id)a3;
- (void)_scrollContactView:(id)a3 toVisibleGroup:(id)a4;
- (void)_setNeedsUpdateCachedLabelWidths;
- (void)_setupAddToAddressBookActions;
- (void)_setupCardActions;
- (void)_setupContactBlockingActionPreservingChanges:(BOOL)a3 withUpdate:(BOOL)a4;
- (void)_setupContactBlockingReportingActionPreservingChanges:(BOOL)a3 withUpdate:(BOOL)a4;
- (void)_setupCustomActions;
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
- (void)_updateLabelWidthForCellsInGroup:(id)a3 reset:(BOOL)a4;
- (void)_updateLabelWidthsForAllVisibleCells;
- (void)_updatePhoneTransportButtonsForItems:(id)a3;
- (void)_updateTTYTransportButtonsForItems:(id)a3;
- (void)_updateUserActivity;
- (void)_validateGroup:(id)a3;
- (void)action:(id)a3 dismissViewController:(id)a4 sender:(id)a5;
- (void)action:(id)a3 prepareChildContactViewController:(id)a4 sender:(id)a5;
- (void)action:(id)a3 presentViewController:(id)a4 sender:(id)a5;
- (void)action:(id)a3 pushViewController:(id)a4 sender:(id)a5;
- (void)actionDidFinish:(id)a3;
- (void)actionDidUpdate:(id)a3;
- (void)actionWasCanceled:(id)a3;
- (void)addActionWithTitle:(id)a3 menuProvider:(id)a4 inGroup:(id)a5 destructive:(BOOL)a6;
- (void)addActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5 inGroup:(id)a6;
- (void)addActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5 inGroup:(id)a6 destructive:(BOOL)a7;
- (void)addActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5 menuProvider:(id)a6 inGroup:(id)a7 destructive:(BOOL)a8;
- (void)adjustInsetsForKeyboardOverlap:(double)a3;
- (void)adjustPreferredContentSize;
- (void)blockListDidChange:(id)a3;
- (void)cancelAsyncLookups;
- (void)contactInlineActionsViewControllerDidDismissDisambiguationUI:(id)a3;
- (void)contactInlineActionsViewControllerWillPresentDisambiguationUI:(id)a3;
- (void)contactStoreDidChangeWithNotification:(id)a3;
- (void)contactViewConfigurationDidUpdate;
- (void)contactViewController:(id)a3 didDeleteContact:(id)a4;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)createdNewContact:(id)a3;
- (void)dealloc;
- (void)didChangeToShowTitle:(BOOL)a3;
- (void)encodeRestorableStateWithCoder:(id)a3;
- (void)favoritesDidChangeWithNotification:(id)a3;
- (void)geminiDataSourceDidUpdate:(id)a3;
- (void)headerPhotoDidUpdate;
- (void)headerViewDidChangeHeight:(id)a3;
- (void)headerViewDidPickPreferredChannel:(id)a3;
- (void)headerViewDidTapNameLabel:(id)a3;
- (void)initializeTableViewsForHeaderHeight;
- (void)keyboardDidShowNotification:(id)a3;
- (void)keyboardWillHideNotification:(id)a3;
- (void)loadContactViewControllerViews;
- (void)loadView;
- (void)localeDidChange:(id)a3;
- (void)prepareCell:(id)a3;
- (void)presentViewController:(id)a3 sourceView:(id)a4;
- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)propertyCell:(id)a3 didDeleteLabel:(id)a4 forGroup:(id)a5;
- (void)propertyCell:(id)a3 didUpdateItem:(id)a4 withNewLabel:(id)a5;
- (void)propertyCell:(id)a3 didUpdateItem:(id)a4 withNewValue:(id)a5;
- (void)propertyCell:(id)a3 performActionForItem:(id)a4 withTransportType:(int64_t)a5;
- (void)propertyCellDidChangeLayout:(id)a3;
- (void)reloadCardGroup:(id)a3;
- (void)reloadDataPreservingChanges:(BOOL)a3;
- (void)reloadUnifiedContact;
- (void)removeActionWithTarget:(id)a3 selector:(SEL)a4 inGroup:(id)a5;
- (void)removeFirstSectionHeaderViewControllerFromHierarchy;
- (void)removeLinkedContact:(id)a3;
- (void)requestFavoritesUpdateWithGemini;
- (void)scrollScrollViewAllTheWayUp:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)sender:(id)a3 dismissViewController:(id)a4;
- (void)sender:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (void)sender:(id)a3 presentViewController:(id)a4;
- (void)setActionProvider:(id)a3;
- (void)setActionsDataSource:(id)a3;
- (void)setActionsViewController:(id)a3;
- (void)setActionsWrapperView:(id)a3;
- (void)setActivatedConstraints:(id)a3;
- (void)setAddNewFieldAction:(id)a3;
- (void)setAllowsEditInApp:(BOOL)a3;
- (void)setBackgroundColorIfNeededForPresentedViewController:(id)a3;
- (void)setBlockAction:(id)a3;
- (void)setBlockReportAction:(id)a3;
- (void)setCachedLabelWidths:(id)a3;
- (void)setCancelCommand:(id)a3;
- (void)setCancelKeyboardShortcutEnabled:(BOOL)a3;
- (void)setCardActionsGroup:(id)a3;
- (void)setCardBlockContactGroup:(id)a3;
- (void)setCardBottomGroup:(id)a3;
- (void)setCardFaceTimeGroup:(id)a3;
- (void)setCardLinkedCardsGroup:(id)a3;
- (void)setCardMedicalIDGroup:(id)a3;
- (void)setCardShareLocationGroup:(id)a3;
- (void)setCardTopGroup:(id)a3;
- (void)setClearRecentsDataAction:(id)a3;
- (void)setContact:(id)a3;
- (void)setContactFormatter:(id)a3;
- (void)setContactHeaderView:(id)a3;
- (void)setContactNavigationItemUpdater:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setContactSupportsTTYCalls:(BOOL)a3;
- (void)setContactView:(id)a3;
- (void)setContactViewConfiguration:(id)a3;
- (void)setContainerPicker:(id)a3;
- (void)setCustomActions:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidSetFirstResponder:(BOOL)a3;
- (void)setDidSetNewContact:(BOOL)a3;
- (void)setDisplayGroups:(id)a3;
- (void)setEditAuthorizationManager:(id)a3;
- (void)setEditCommand:(id)a3;
- (void)setEditKeyboardShortcutEnabled:(BOOL)a3;
- (void)setEmergencyContactAction:(id)a3;
- (void)setEmergencyNumberIdentifier:(id)a3;
- (void)setExtraLeftBarButtonItems:(id)a3;
- (void)setExtraRightBarButtonItems:(id)a3;
- (void)setFaceTimeIDSLookupToken:(id)a3;
- (void)setForcesTransparentBackground:(BOOL)a3;
- (void)setHeaderDropShadowView:(id)a3;
- (void)setHeaderHeightConstraint:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setHighlightedProperties:(id)a3;
- (void)setHighlightedPropertyImportant:(BOOL)a3;
- (void)setIMessageIDSLookupToken:(id)a3;
- (void)setIgnoreContactAction:(id)a3;
- (void)setInitialPrompt:(id)a3;
- (void)setIsPresentingFullscreenForOutOfProcess:(BOOL)a3;
- (void)setIssuedSaveRequestIdentifiers:(id)a3;
- (void)setKeyboardVerticalOverlap:(double)a3;
- (void)setLinkedPoliciesByContactIdentifier:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setMedicalIDAction:(id)a3;
- (void)setMedicalIDLookupToken:(id)a3;
- (void)setMedicalIDRegistrationToken:(id)a3;
- (void)setMenuProviderForCell:(id)a3 forActionGroupItem:(id)a4;
- (void)setMissingRequiredKeys:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setMutableContact:(id)a3;
- (void)setNamePickingGroup:(id)a3;
- (void)setNavigationItemDelegate:(id)a3;
- (void)setNeedsReload;
- (void)setNeedsReloadLazy;
- (void)setNoteCell:(id)a3;
- (void)setOriginalContacts:(id)a3;
- (void)setOutOfProcessSetupComplete:(BOOL)a3;
- (void)setPersonHeaderViewController:(id)a3;
- (void)setPolicy:(id)a3;
- (void)setPreEditLeftBarButtonItems:(id)a3;
- (void)setPresentingDelegate:(id)a3;
- (void)setProhibitedPropertyKeys:(id)a3;
- (void)setPropertyGroupsDataSource:(id)a3;
- (void)setRecentsData:(id)a3;
- (void)setRunningPPT:(BOOL)a3;
- (void)setSaveLinkedContactsExecutor:(id)a3;
- (void)setSelectContainersAction:(id)a3;
- (void)setShadowCopyOfReadonlyContact:(id)a3;
- (void)setShareLocationController:(id)a3;
- (void)setShouldDrawNavigationBar:(BOOL)a3;
- (void)setShouldIgnoreBlockListChange:(BOOL)a3;
- (void)setShouldIgnoreContactStoreDidChangeNotification:(BOOL)a3;
- (void)setShowingMeContact:(BOOL)a3;
- (void)setSiriContextProvider:(id)a3;
- (void)setSuggestedContactAction:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUpdateExistingContactAction:(id)a3;
- (void)setUserActivityUserInfo:(id)a3;
- (void)setupActionsPreservingChanges:(BOOL)a3;
- (void)setupConstraints;
- (void)setupShareLocationActionReload:(BOOL)a3;
- (void)setupTableFooterView;
- (void)setupViewHierarchyIncludingAvatarHeader:(BOOL)a3;
- (void)sharingStatusDidChange;
- (void)shouldPresentFullscreen:(BOOL)a3;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 performAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)toggleEditing:(id)a3;
- (void)updateContact:(id)a3;
- (void)updateContactsViewWithBlock:(id)a3 completion:(id)a4;
- (void)updateEditNavigationItemsAnimated:(BOOL)a3;
- (void)updateHeaderHeightToMatchScrollViewState:(id)a3 scrollDirection:(int64_t)a4 animated:(BOOL)a5;
- (void)updateInsetsIfNeeded;
- (void)updateOutOfProcessFullscreenPresentationIfNeeded;
- (void)updateTableView:(id)a3 contentInsetsTo:(UIEdgeInsets)a4 withScrollIndicatorInsets:(UIEdgeInsets)a5;
- (void)updateUserActivityState:(id)a3;
- (void)updateViewConstraints;
- (void)updateWindowTitleForAppearing:(BOOL)a3;
- (void)updateWithContactViewConfiguration:(id)a3;
- (void)updatedExistingContact:(id)a3;
- (void)viewController:(id)a3 presentationControllerWillDismiss:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CNContactContentDisplayViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayGroups, 0);
  objc_storeStrong((id *)&self->_cardFaceTimeGroup, 0);
  objc_storeStrong((id *)&self->_propertyGroups, 0);
  objc_storeStrong((id *)&self->_recentsData, 0);
  objc_storeStrong((id *)&self->_saveLinkedContactsExecutor, 0);
  objc_storeStrong((id *)&self->_contactNavigationItemUpdater, 0);
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, 0);
  objc_storeStrong((id *)&self->_initialPrompt, 0);
  objc_storeStrong((id *)&self->_originalContacts, 0);
  objc_storeStrong((id *)&self->_missingRequiredKeys, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_linkedPoliciesByContactIdentifier, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_geminiDataSource, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
  objc_storeStrong((id *)&self->_contactViewCache, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_preEditLeftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_cancelCommand, 0);
  objc_storeStrong((id *)&self->_editCommand, 0);
  objc_storeStrong((id *)&self->_actionsDataSource, 0);
  objc_storeStrong((id *)&self->_highlightedProperties, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_userActivityUserInfo, 0);
  objc_storeStrong((id *)&self->_faceTimeIDSLookupToken, 0);
  objc_storeStrong((id *)&self->_iMessageIDSLookupToken, 0);
  objc_storeStrong((id *)&self->_siriContextProvider, 0);
  objc_storeStrong((id *)&self->_ignoreContactAction, 0);
  objc_storeStrong((id *)&self->_emergencyNumberIdentifier, 0);
  objc_storeStrong((id *)&self->_medicalIDLookupToken, 0);
  objc_storeStrong((id *)&self->_medicalIDRegistrationToken, 0);
  objc_storeStrong((id *)&self->_emergencyContactAction, 0);
  objc_storeStrong((id *)&self->_medicalIDAction, 0);
  objc_storeStrong((id *)&self->_headerDropShadowView, 0);
  objc_storeStrong((id *)&self->_actionsWrapperView, 0);
  objc_storeStrong((id *)&self->_actionsViewController, 0);
  objc_storeStrong((id *)&self->_shareLocationController, 0);
  objc_storeStrong((id *)&self->_headerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_activatedConstraints, 0);
  objc_storeStrong((id *)&self->_actionProvider, 0);
  objc_storeStrong((id *)&self->_selectContainersAction, 0);
  objc_storeStrong((id *)&self->_clearRecentsDataAction, 0);
  objc_storeStrong((id *)&self->_suggestedContactAction, 0);
  objc_storeStrong((id *)&self->_updateExistingContactAction, 0);
  objc_storeStrong((id *)&self->_addNewFieldAction, 0);
  objc_storeStrong((id *)&self->_blockReportAction, 0);
  objc_storeStrong((id *)&self->_blockAction, 0);
  objc_storeStrong((id *)&self->_noteCell, 0);
  objc_storeStrong((id *)&self->_customActions, 0);
  objc_storeStrong((id *)&self->_cardLinkedCardsGroup, 0);
  objc_storeStrong((id *)&self->_namePickingGroup, 0);
  objc_storeStrong((id *)&self->_cardBlockContactGroup, 0);
  objc_storeStrong((id *)&self->_cardMedicalIDGroup, 0);
  objc_storeStrong((id *)&self->_cardShareLocationGroup, 0);
  objc_storeStrong((id *)&self->_cardActionsGroup, 0);
  objc_storeStrong((id *)&self->_propertyGroupsDataSource, 0);
  objc_storeStrong((id *)&self->_extraLeftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_extraRightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_cachedLabelWidths, 0);
  objc_storeStrong((id *)&self->_containerPicker, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_shadowCopyOfReadonlyContact, 0);
  objc_storeStrong((id *)&self->_issuedSaveRequestIdentifiers, 0);
  objc_storeStrong((id *)&self->_mutableContact, 0);
  objc_destroyWeak((id *)&self->_presentingDelegate);
  objc_storeStrong((id *)&self->_cardFooterGroup, 0);
  objc_storeStrong((id *)&self->_cardBottomGroup, 0);
  objc_storeStrong((id *)&self->_cardTopGroup, 0);
  objc_storeStrong((id *)&self->_personHeaderViewController, 0);
  objc_storeStrong((id *)&self->_editAuthorizationManager, 0);
  objc_storeStrong((id *)&self->_contactViewConfiguration, 0);
  objc_storeStrong((id *)&self->_contactHeaderView, 0);
  objc_storeStrong((id *)&self->_contactView, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_destroyWeak((id *)&self->_navigationItemDelegate);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_displayedProperties, 0);
}

- (void)setDisplayGroups:(id)a3
{
}

- (NSMutableArray)displayGroups
{
  return self->_displayGroups;
}

- (void)setCardFaceTimeGroup:(id)a3
{
}

- (CNCardFaceTimeGroup)cardFaceTimeGroup
{
  return self->_cardFaceTimeGroup;
}

- (NSDictionary)propertyGroups
{
  return self->_propertyGroups;
}

- (void)setShowingMeContact:(BOOL)a3
{
  self->_showingMeContact = a3;
}

- (BOOL)showingMeContact
{
  return self->_showingMeContact;
}

- (void)setRecentsData:(id)a3
{
}

- (CNContactRecentsReference)recentsData
{
  return self->_recentsData;
}

- (void)setSaveLinkedContactsExecutor:(id)a3
{
}

- (CNUIContactSaveExecutor)saveLinkedContactsExecutor
{
  return self->_saveLinkedContactsExecutor;
}

- (void)setContactNavigationItemUpdater:(id)a3
{
}

- (CNContactContentNavigationItemUpdater)contactNavigationItemUpdater
{
  return self->_contactNavigationItemUpdater;
}

- (void)setProhibitedPropertyKeys:(id)a3
{
}

- (NSArray)prohibitedPropertyKeys
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

- (void)setInitialPrompt:(id)a3
{
}

- (NSString)initialPrompt
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

- (NSArray)missingRequiredKeys
{
  return self->_missingRequiredKeys;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (CNManagedConfiguration)managedConfiguration
{
  return self->_managedConfiguration;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setLinkedPoliciesByContactIdentifier:(id)a3
{
}

- (NSDictionary)linkedPoliciesByContactIdentifier
{
  return self->_linkedPoliciesByContactIdentifier;
}

- (void)setPolicy:(id)a3
{
}

- (CNPolicy)policy
{
  return self->_policy;
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

- (void)setHighlightedPropertyImportant:(BOOL)a3
{
  self->_highlightedPropertyImportant = a3;
}

- (BOOL)highlightedPropertyImportant
{
  return self->_highlightedPropertyImportant;
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

- (void)setHeaderDropShadowView:(id)a3
{
}

- (UIView)headerDropShadowView
{
  return self->_headerDropShadowView;
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

- (void)setSelectContainersAction:(id)a3
{
}

- (CNContactSelectContainersAction)selectContainersAction
{
  return self->_selectContainersAction;
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

- (void)setCardLinkedCardsGroup:(id)a3
{
}

- (CNCardLinkedCardsGroup)cardLinkedCardsGroup
{
  return self->_cardLinkedCardsGroup;
}

- (void)setNamePickingGroup:(id)a3
{
}

- (CNCardNamePickingGroup)namePickingGroup
{
  return self->_namePickingGroup;
}

- (void)setCardBlockContactGroup:(id)a3
{
}

- (CNCardGroup)cardBlockContactGroup
{
  return self->_cardBlockContactGroup;
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

- (void)setPropertyGroupsDataSource:(id)a3
{
}

- (CNPropertyGroupsDataSource)propertyGroupsDataSource
{
  return self->_propertyGroupsDataSource;
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

- (void)setContainerPicker:(id)a3
{
}

- (CNContactContainerPickerViewController)containerPicker
{
  return self->_containerPicker;
}

- (void)setContactFormatter:(id)a3
{
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
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

- (void)setPresentingDelegate:(id)a3
{
}

- (CNPresenterDelegate)presentingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingDelegate);

  return (CNPresenterDelegate *)WeakRetained;
}

- (CNCardGroup)cardFooterGroup
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

- (UIViewController)personHeaderViewController
{
  return self->_personHeaderViewController;
}

- (void)setEditAuthorizationManager:(id)a3
{
}

- (CNContactEditAuthorizationManager)editAuthorizationManager
{
  return self->_editAuthorizationManager;
}

- (void)setContactViewConfiguration:(id)a3
{
}

- (CNContactContentViewControllerConfiguration)contactViewConfiguration
{
  return self->_contactViewConfiguration;
}

- (void)setContactHeaderView:(id)a3
{
}

- (void)setContactView:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setNavigationItemDelegate:(id)a3
{
}

- (CNContactContentNavigationItemDelegate)navigationItemDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationItemDelegate);

  return (CNContactContentNavigationItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CNContactContentDisplayViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNContactContentDisplayViewControllerDelegate *)WeakRetained;
}

- (id)applyContactStyle
{
  v47[2] = *MEMORY[0x1E4F143B8];
  v3 = +[CNContactStyle currentStyle];
  if ([(CNContactContentDisplayViewController *)self forcesTransparentBackground])
  {
    uint64_t v4 = +[CNUIColorRepository transparentBackgroundColor];
  }
  else
  {
    v5 = [v3 backgroundColor];

    if (!v5) {
      goto LABEL_6;
    }
    uint64_t v4 = [v3 backgroundColor];
  }
  v6 = (void *)v4;
  v7 = [(CNContactContentDisplayViewController *)self contactView];
  [v7 setBackgroundColor:v6];

LABEL_6:
  v8 = [v3 sectionBackgroundColor];
  v9 = [(CNContactContentDisplayViewController *)self contactView];
  [v9 setSectionBackgroundColor:v8];

  v10 = [v3 separatorColor];
  v11 = [(CNContactContentDisplayViewController *)self contactView];
  [v11 setSeparatorColor:v10];

  v12 = [v3 selectedCellBackgroundColor];
  v13 = [(CNContactContentDisplayViewController *)self contactView];
  [v13 setSelectedCellBackgroundColor:v12];

  v14 = (void *)MEMORY[0x1E4F1CA60];
  v15 = [(CNContactContentDisplayViewController *)self contactView];
  v16 = [v15 valueTextAttributes];
  v17 = [v14 dictionaryWithDictionary:v16];

  uint64_t v18 = *MEMORY[0x1E4FB0700];
  v46[0] = *MEMORY[0x1E4FB0700];
  v19 = [v3 textColor];
  v46[1] = @"ABNotesTextColorAttributeName";
  v47[0] = v19;
  v20 = [v3 notesTextColor];
  v47[1] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];
  [v17 addEntriesFromDictionary:v21];

  v22 = [(CNContactContentDisplayViewController *)self contactView];
  [v22 setValueTextAttributes:v17];

  if ([(CNContactContentDisplayViewController *)self forcesTransparentBackground])
  {
    v23 = +[CNUIColorRepository transparentBackgroundColor];
    [(CNContactHeaderDisplayView *)self->_contactHeaderView setBackgroundColor:v23];

    uint64_t v24 = +[CNUIColorRepository transparentBackgroundColor];
  }
  else
  {
    v25 = [(CNContactContentDisplayViewController *)self environment];
    int v26 = [v25 runningInContactsAppOniPad];

    if (v26)
    {
      v27 = +[CNUIColorRepository contactCardBackgroundiPadOverwriteColor];
      [(CNContactHeaderDisplayView *)self->_contactHeaderView setBackgroundColor:v27];

      +[CNUIColorRepository contactCardBackgroundiPadOverwriteColor];
    }
    else
    {
      v28 = [v3 contactHeaderBackgroundColor];
      [(CNContactHeaderDisplayView *)self->_contactHeaderView setBackgroundColor:v28];

      [v3 contactHeaderBackgroundColor];
    uint64_t v24 = };
  }
  v29 = (void *)v24;
  [(CNContactActionsContainerView *)self->_actionsWrapperView setBackgroundColor:v24];

  contactHeaderView = self->_contactHeaderView;
  uint64_t v44 = v18;
  v31 = [v3 taglineTextColor];
  v45 = v31;
  v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
  [contactHeaderView cn_updateDictionaryForKey:@"taglineTextAttributes" withChanges:v32];

  v33 = [(CNContactContentDisplayViewController *)self actionsViewController];
  objc_msgSend(v33, "setViewStyle:", objc_msgSend(v3, "topActionsViewStyle"));

  int v34 = [v3 usesOpaqueBackground];
  v35 = [(CNContactContentDisplayViewController *)self actionsViewController];
  v36 = [v35 view];
  v37 = [v36 layer];
  v38 = v37;
  if (v34)
  {
    [v37 setShadowRadius:8.0];

    v39 = [(CNContactContentDisplayViewController *)self actionsViewController];
    v40 = [v39 view];
    v41 = [v40 layer];
    objc_msgSend(v41, "setShadowOffset:", 0.0, 2.0);

    v35 = [(CNContactContentDisplayViewController *)self actionsViewController];
    v36 = [v35 view];
    v37 = [v36 layer];
    v38 = v37;
    LODWORD(v42) = 1025758986;
  }
  else
  {
    double v42 = 0.0;
  }
  [v37 setShadowOpacity:v42];

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
  [(CNContactContentDisplayViewController *)self keyboardVerticalOverlap];
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
  v5 = [(CNContactContentDisplayViewController *)self contactHeaderView];
  [v5 minHeight];
  double v7 = v6;

  id v8 = [(CNContactContentDisplayViewController *)self contactHeaderView];
  [v8 maxHeight];
  double v10 = v9;

  if (v10 == 0.0)
  {
    double v15 = *MEMORY[0x1E4FB2848];
    double v27 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v45 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v29 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    goto LABEL_21;
  }
  double v11 = 0.0;
  if ((objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory") & 1) == 0)
  {
    double v12 = [(CNContactContentDisplayViewController *)self actionsWrapperView];
    [v12 frame];
    double v11 = v13;
  }
  [v4 _systemContentInset];
  double v15 = v10 + v11 - v14;
  [v4 bounds];
  double v17 = v10 - v7 + v16;
  [v4 _systemContentInset];
  double v19 = v17 - v18 - v15;
  [v4 _systemContentInset];
  double v21 = v20;
  [(CNContactContentDisplayViewController *)self keyboardVerticalOverlap];
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
  [(CNContactContentDisplayViewController *)self keyboardVerticalOverlap];
  if (v30 <= 0.0)
  {
    [v4 _systemContentInset];
    double v47 = -v46;
    goto LABEL_18;
  }
  v31 = [(CNContactContentDisplayViewController *)self view];
  uint64_t v32 = [v31 window];
  if (!v32)
  {
    double v40 = 0.0;
    goto LABEL_16;
  }
  v33 = (void *)v32;
  int v34 = [(CNContactContentDisplayViewController *)self view];
  v35 = [v34 window];
  [v35 bounds];
  double v37 = v36;
  [v4 bounds];
  double v39 = v38;

  double v40 = 0.0;
  if (v37 > v39)
  {
    v31 = [(CNContactContentDisplayViewController *)self view];
    v41 = [v31 window];
    [v41 bounds];
    double v43 = v42;
    [v4 bounds];
    double v40 = v43 - v44;

LABEL_16:
  }
  [(CNContactContentDisplayViewController *)self keyboardVerticalOverlap];
  double v49 = v48;
  [v4 _systemContentInset];
  double v47 = v40 + v49 - v50;
LABEL_18:
  if (v25 >= v47) {
    double v45 = v25;
  }
  else {
    double v45 = v47;
  }
LABEL_21:

  double v51 = v15;
  double v52 = v27;
  double v53 = v45;
  double v54 = v29;
  result.CGFloat right = v54;
  result.double bottom = v53;
  result.CGFloat left = v52;
  result.double top = v51;
  return result;
}

- (void)initializeTableViewsForHeaderHeight
{
  id v7 = [(CNContactContentDisplayViewController *)self contactView];
  [v7 layoutIfNeeded];
  v3 = [(CNContactContentDisplayViewController *)self actionsWrapperView];
  [v3 setNeedsLayout];

  id v4 = [(CNContactContentDisplayViewController *)self actionsWrapperView];
  [v4 layoutIfNeeded];

  v5 = [(CNContactContentDisplayViewController *)self contactHeaderView];
  [v5 calculateLabelSizesIfNeeded];

  double v6 = [(CNContactContentDisplayViewController *)self headerDropShadowView];
  [v6 setAlpha:1.0];

  [(CNContactContentDisplayViewController *)self updateInsetsIfNeeded];
  [(CNContactContentDisplayViewController *)self updateHeaderHeightToMatchScrollViewState:v7 scrollDirection:2 animated:0];
}

- (void)updateInsetsIfNeeded
{
  id v45 = [(CNContactContentDisplayViewController *)self contactView];
  [(CNContactContentDisplayViewController *)self keyboardVerticalOverlap];
  if (v3 <= 0.0
    || ([(CNContactContentDisplayViewController *)self view],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 bounds],
        double v6 = v5,
        v4,
        v6 <= 0.0))
  {
    double v13 = [(CNContactContentDisplayViewController *)self contactHeaderView];
    double v14 = [(CNContactContentDisplayViewController *)self contactHeaderView];
    [v14 maxHeight];
    double v17 = v13;
    BOOL v16 = 0;
  }
  else
  {
    id v7 = [(CNContactContentDisplayViewController *)self view];
    [v7 bounds];
    double v9 = v8;
    [(CNContactContentDisplayViewController *)self keyboardVerticalOverlap];
    double v11 = v9 - v10 + -64.0;

    double v12 = fmax(v11, 0.0);
    double v13 = [(CNContactContentDisplayViewController *)self contactHeaderView];
    double v14 = [(CNContactContentDisplayViewController *)self contactHeaderView];
    [v14 maxHeight];
    BOOL v16 = v12 <= v15;
    double v17 = v13;
    double v18 = v12;
  }
  [v17 setConstrainedMaxHeight:v16 enabled:v18];

  [v45 contentInset];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  [(CNContactContentDisplayViewController *)self insetsForContactTableView:v45];
  double v30 = v27;
  double v32 = v31;
  double v33 = v28;
  double v34 = v29;
  if (v31 != v22 || v27 != v20 || v29 != v26 || v28 != v24)
  {
    v35 = [(CNContactContentDisplayViewController *)self contactView];
    -[CNContactContentDisplayViewController scrollIndicatorInsetsForContactTableView:withContentInsets:](self, "scrollIndicatorInsetsForContactTableView:withContentInsets:", v35, v30, v32, v33, v34);
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    double v43 = v42;

    double v44 = [(CNContactContentDisplayViewController *)self contactView];
    -[CNContactContentDisplayViewController updateTableView:contentInsetsTo:withScrollIndicatorInsets:](self, "updateTableView:contentInsetsTo:withScrollIndicatorInsets:", v44, v30, v32, v33, v34, v37, v39, v41, v43);
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

- (BOOL)isScrollViewControllingHeaderResizeAnimation:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactContentDisplayViewController *)self contactView];

  return v5 == v4;
}

- (double)updateHeaderConstraintForGlobalHeaderHeight:(double)a3 direction:(int64_t)a4 animated:(BOOL)a5
{
  double v8 = 0.0;
  if ((objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory", a4, a5) & 1) == 0)
  {
    double v9 = [(CNContactContentDisplayViewController *)self actionsWrapperView];
    [v9 frame];
    double v8 = v10;
  }
  double v11 = [(CNContactContentDisplayViewController *)self headerHeightConstraint];
  [v11 constant];
  double v13 = v12;

  if (a3 - v8 == v13 || !a4 && a3 - v8 <= v13) {
    return v8 + v13;
  }
  double v14 = [(CNContactContentDisplayViewController *)self headerHeightConstraint];
  [v14 setConstant:a3 - v8];

  return a3;
}

- (void)updateHeaderHeightToMatchScrollViewState:(id)a3 scrollDirection:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  [v8 contentOffset];
  double v10 = v9;
  [v8 contentInset];
  -[CNContactContentDisplayViewController globalHeaderHeightForContentOffset:contentInset:](self, "globalHeaderHeightForContentOffset:contentInset:", v10, v11, v12, v13, v14);
  -[CNContactContentDisplayViewController updateHeaderConstraintForGlobalHeaderHeight:direction:animated:](self, "updateHeaderConstraintForGlobalHeaderHeight:direction:animated:", a4, v5);
  double v16 = v15;
  objc_opt_class();
  id v19 = v8;
  if (objc_opt_isKindOfClass()) {
    double v17 = v19;
  }
  else {
    double v17 = 0;
  }
  id v18 = v17;

  [v18 setMaskingInset:v16];
}

- (double)contentOffsetYForGlobalHeaderHeight:(double)a3 contentInset:(UIEdgeInsets)a4
{
  return -a3;
}

- (double)globalHeaderHeightForContentOffset:(double)a3 contentInset:(UIEdgeInsets)a4
{
  double top = a4.top;
  double v7 = 0.0;
  if ((objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory", a3, a4.top, a4.left, a4.bottom, a4.right) & 1) == 0)
  {
    id v8 = [(CNContactContentDisplayViewController *)self actionsWrapperView];
    [v8 frame];
    double v7 = v9;
  }
  double v10 = [(CNContactContentDisplayViewController *)self contactView];
  [v10 _systemContentInset];
  double v12 = top + v11;

  if (-v12 <= a3) {
    double v13 = -a3;
  }
  else {
    double v13 = v12;
  }
  double v14 = [(CNContactContentDisplayViewController *)self contactHeaderView];
  [v14 minHeight];
  double v16 = v7 + v15;

  if (v13 >= v16) {
    return v13;
  }
  else {
    return v16;
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
  id v8 = [(CNContactContentDisplayViewController *)self contactHeaderView];
  [v8 minHeight];
  double v10 = v9;

  double v11 = [(CNContactContentDisplayViewController *)self contactHeaderView];
  [v11 maxHeight];
  double v13 = v12;

  if ([(CNContactContentDisplayViewController *)self isScrollViewControllingHeaderResizeAnimation:v25])
  {
    double v14 = v13 - a5->y;
    [v25 contentInset];
    double v16 = v14 - v15;
    [v25 _systemContentInset];
    double v18 = v16 - v17;
    if (y <= 0.0)
    {
      id v19 = v25;
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
      id v19 = v25;
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

- (void)scrollViewDidScroll:(id)a3
{
  id v5 = a3;
  if (-[CNContactContentDisplayViewController isScrollViewControllingHeaderResizeAnimation:](self, "isScrollViewControllingHeaderResizeAnimation:"))
  {
    [v5 _verticalVelocity];
    [(CNContactContentDisplayViewController *)self updateHeaderHeightToMatchScrollViewState:v5 scrollDirection:v4 >= 0.0 animated:1];
  }
}

- (void)setEditKeyboardShortcutEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNContactContentDisplayViewController *)self editCommand];

  if (v3)
  {
    if (!v5)
    {
      double v6 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"l" modifierFlags:0x100000 action:sel_toggleEditing_];
      [(CNContactContentDisplayViewController *)self setEditCommand:v6];

      double v7 = CNContactsUIBundle();
      id v8 = [v7 localizedStringForKey:@"EDIT_CONTACT_KEYBOARD_DISCOVERY" value:&stru_1ED8AC728 table:@"Localized"];
      double v9 = [(CNContactContentDisplayViewController *)self editCommand];
      [v9 setDiscoverabilityTitle:v8];

      id v11 = [(CNContactContentDisplayViewController *)self editCommand];
      [(CNContactContentDisplayViewController *)self addKeyCommand:v11];
    }
  }
  else if (v5)
  {
    double v10 = [(CNContactContentDisplayViewController *)self editCommand];
    [(CNContactContentDisplayViewController *)self removeKeyCommand:v10];

    [(CNContactContentDisplayViewController *)self setEditCommand:0];
  }
}

- (void)setCancelKeyboardShortcutEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNContactContentDisplayViewController *)self cancelCommand];

  if (v3)
  {
    if (!v5)
    {
      double v6 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B08] modifierFlags:0 action:sel_editCancel_];
      [(CNContactContentDisplayViewController *)self setCancelCommand:v6];

      id v8 = [(CNContactContentDisplayViewController *)self cancelCommand];
      [(CNContactContentDisplayViewController *)self addKeyCommand:v8];
    }
  }
  else if (v5)
  {
    double v7 = [(CNContactContentDisplayViewController *)self cancelCommand];
    [(CNContactContentDisplayViewController *)self removeKeyCommand:v7];

    [(CNContactContentDisplayViewController *)self setCancelCommand:0];
  }
}

- (void)updateUserActivityState:(id)a3
{
  id v4 = a3;
  id v6 = [(CNContactContentDisplayViewController *)self activityManager];
  id v5 = [(CNContactContentDisplayViewController *)self contact];
  [v6 updateUserActivityState:v4 withContentsOfContact:v5];
}

- (void)_updateUserActivity
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (CNUIIsContacts() || CNUIIsMobilePhone())
  {
    BOOL v3 = CNUILogContactCard();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = [MEMORY[0x1E4F28B50] mainBundle];
      id v5 = [v4 bundleIdentifier];
      int v17 = 138412290;
      double v18 = v5;
      _os_log_impl(&dword_18B625000, v3, OS_LOG_TYPE_INFO, "Activity continuity - running in %@", (uint8_t *)&v17, 0xCu);
    }
    id v6 = [(CNContactContentDisplayViewController *)self activityManager];
    double v7 = [(CNContactContentDisplayViewController *)self contact];
    id v8 = [v6 makeActivityAdvertisingViewingOfContact:v7];

    double v9 = [(CNContactContentDisplayViewController *)self userActivity];
    double v10 = v9;
    if (v8)
    {

      if (!v10)
      {
        [(CNContactContentDisplayViewController *)self setUserActivity:v8];
        id v11 = [(CNContactContentDisplayViewController *)self userActivity];
        [v11 becomeCurrent];

        double v12 = CNUILogContactCard();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          double v13 = [(CNContactContentDisplayViewController *)self userActivity];
          int v17 = 138412546;
          double v18 = self;
          __int16 v19 = 2112;
          double v20 = v13;
          _os_log_impl(&dword_18B625000, v12, OS_LOG_TYPE_INFO, "Activity continuity -  %@ created %@", (uint8_t *)&v17, 0x16u);
        }
      }
      double v14 = [(CNContactContentDisplayViewController *)self userActivity];
      [v14 setNeedsSave:1];
    }
    else
    {
      [v9 resignCurrent];

      double v15 = CNUILogContactCard();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        double v16 = [(CNContactContentDisplayViewController *)self userActivity];
        int v17 = 138412546;
        double v18 = self;
        __int16 v19 = 2112;
        double v20 = v16;
        _os_log_impl(&dword_18B625000, v15, OS_LOG_TYPE_INFO, "Activity continuity -  %@ removed %@", (uint8_t *)&v17, 0x16u);
      }
      [(CNContactContentDisplayViewController *)self setUserActivity:0];
    }
  }
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CNContactContentDisplayViewController;
  [(CNContactContentDisplayViewController *)&v18 encodeRestorableStateWithCoder:v4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = +[CNContactContentDisplayViewController BOOLStateRestorationProperties];
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
        id v11 = [(CNContactContentDisplayViewController *)self valueForKey:v10];
        if (v11) {
          [v4 encodeObject:v11 forKey:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v7);
  }

  double v12 = [(CNContactContentDisplayViewController *)self contact];
  double v13 = [v12 identifier];

  if (v13) {
    [v4 encodeObject:v13 forKey:@"Identifier"];
  }
}

- (BOOL)_indexPathIsActionItem:(id)a3
{
  id v4 = a3;
  id v5 = -[CNContactContentDisplayViewController _cardGroupAtTableViewSectionIndex:](self, "_cardGroupAtTableViewSectionIndex:", [v4 section]);
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v6 = [(CNContactContentDisplayViewController *)self _itemAtIndexPath:v4];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
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

- (id)_itemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = -[CNContactContentDisplayViewController _cardGroupAtTableViewSectionIndex:](self, "_cardGroupAtTableViewSectionIndex:", [v4 section]);
  if ([(CNContactContentDisplayViewController *)self isStandardGroup:v5])
  {
    uint64_t v6 = [v5 displayItems];
LABEL_5:
    uint64_t v7 = v6;
    uint64_t v8 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));

    goto LABEL_7;
  }
  if ([(CNContactContentDisplayViewController *)self _indexPathIsActionItem:v4])
  {
    uint64_t v6 = [v5 actionItems];
    goto LABEL_5;
  }
  uint64_t v8 = 0;
LABEL_7:

  return v8;
}

- (id)_cardGroupAtTableViewSectionIndex:(int64_t)a3
{
  unint64_t v4 = [(CNContactContentDisplayViewController *)self groupIndexFromTableViewSectionIndex:a3];
  id v5 = [(CNContactContentDisplayViewController *)self _currentGroups];
  if ([v5 count] <= v4)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [v5 objectAtIndexedSubscript:v4];
  }

  return v6;
}

- (void)_saveChangesForGroups:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        double v9 = objc_opt_class();
        if ([v9 isSubclassOfClass:objc_opt_class()]) {
          [v8 saveChanges];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)_validateGroup:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 propertyItems];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    objc_super v18 = self;
    char v8 = 0;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v12 = [v11 labeledValue];
        long long v13 = [v12 value];
        char v14 = [v11 isValidValue:v13];

        if ((v14 & 1) == 0)
        {
          uint64_t v15 = [v11 labeledValue];
          long long v16 = [v15 value];
          long long v17 = [v11 replacementForInvalidValue:v16];
          [v11 updateLabeledValueWithValue:v17];

          char v8 = 1;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
    if (v8) {
      [(CNContactContentDisplayViewController *)v18 reloadCardGroup:v4];
    }
  }
}

- (void)_reloadGeminiGroupPreservingChanges:(BOOL)a3
{
  if (!a3)
  {
    id v6 = [(CNContactContentDisplayViewController *)self geminiDataSource];
    [v6 resetDataSource];
    uint64_t v5 = [(CNContactContentDisplayViewController *)self contact];
    [v6 setContact:v5];
  }
}

- (id)_loadDisplayGroups
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(CNContactContentDisplayViewController *)self cardTopGroup];
  uint64_t v5 = [v4 actions];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = [(CNContactContentDisplayViewController *)self cardTopGroup];
    [v3 addObject:v7];
  }
  v70 = v3;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  char v8 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  uint64_t v9 = [v8 displayedProperties];

  obuint64_t j = v9;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v77 objects:v82 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v72 = *(void *)v78;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v78 != v72) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v77 + 1) + 8 * i);
        char v14 = [(CNContactContentDisplayViewController *)self propertyGroups];
        uint64_t v15 = [v14 objectForKeyedSubscript:v13];

        long long v16 = [v15 displayItems];
        if ([v16 count])
        {
          long long v17 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
          objc_super v18 = [v17 primaryProperty];
          long long v19 = [v15 property];
          char v20 = [v18 isEqualToString:v19];

          if (v20) {
            goto LABEL_20;
          }
          [v70 addObject:v15];
          long long v75 = 0u;
          long long v76 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          long long v16 = [v15 displayItems];
          uint64_t v21 = [v16 countByEnumeratingWithState:&v73 objects:v81 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v74;
            do
            {
              for (uint64_t j = 0; j != v22; ++j)
              {
                if (*(void *)v74 != v23) {
                  objc_enumerationMutation(v16);
                }
                id v25 = *(void **)(*((void *)&v73 + 1) + 8 * j);
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  [v25 setDelegate:self];
                }
              }
              uint64_t v22 = [v16 countByEnumeratingWithState:&v73 objects:v81 count:16];
            }
            while (v22);
          }
        }

LABEL_20:
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v77 objects:v82 count:16];
    }
    while (v11);
  }

  double v26 = [(CNContactContentDisplayViewController *)self cardBottomGroup];
  double v27 = [v26 actions];
  uint64_t v28 = [v27 count];

  if (v28)
  {
    double v29 = [(CNContactContentDisplayViewController *)self cardBottomGroup];
    [v70 addObject:v29];
  }
  double v30 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  if ([v30 hideCardActions]) {
    goto LABEL_32;
  }
  double v31 = [(CNContactContentDisplayViewController *)self cardActionsGroup];
  double v32 = [v31 actions];
  uint64_t v33 = [v32 count];

  if (v33)
  {
    double v34 = [(CNContactContentDisplayViewController *)self cardBottomGroup];
    v35 = [v34 actions];
    if (![v35 count])
    {
      double v36 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
      double v37 = [v36 primaryProperty];
      if (!v37)
      {
        v68 = [(CNContactContentDisplayViewController *)self contact];
        char v69 = [v68 isSuggested];

        if ((v69 & 1) == 0)
        {
          double v38 = [(CNContactContentDisplayViewController *)self cardActionsGroup];
          double v39 = v38;
          uint64_t v40 = 0;
          goto LABEL_31;
        }
LABEL_30:
        double v38 = [(CNContactContentDisplayViewController *)self cardActionsGroup];
        double v39 = v38;
        uint64_t v40 = 1;
LABEL_31:
        [v38 setAddSpacerFromPreviousGroup:v40];

        double v30 = [(CNContactContentDisplayViewController *)self cardActionsGroup];
        [v70 addObject:v30];
LABEL_32:

        goto LABEL_33;
      }
    }
    goto LABEL_30;
  }
LABEL_33:
  uint64_t v41 = [(CNContactContentDisplayViewController *)self cardMedicalIDGroup];
  if (v41)
  {
    double v42 = (void *)v41;
    double v43 = [(CNContactContentDisplayViewController *)self cardMedicalIDGroup];
    double v44 = [v43 actionItems];
    uint64_t v45 = [v44 count];

    if (v45)
    {
      double v46 = [(CNContactContentDisplayViewController *)self cardMedicalIDGroup];
      [v70 addObject:v46];
    }
  }
  double v47 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  if (([v47 hideCardActions] & 1) == 0)
  {
    double v48 = [(CNContactContentDisplayViewController *)self cardShareLocationGroup];
    double v49 = [v48 actionItems];
    uint64_t v50 = [v49 count];

    if (!v50) {
      goto LABEL_40;
    }
    double v47 = [(CNContactContentDisplayViewController *)self cardShareLocationGroup];
    [v70 addObject:v47];
  }

LABEL_40:
  double v51 = [(CNContactContentDisplayViewController *)self cardFooterGroup];
  double v52 = [v51 actions];
  double v53 = (void *)[v52 count];

  if (v53)
  {
    double v51 = [(CNContactContentDisplayViewController *)self cardFooterGroup];
    [v70 addObject:v51];
  }
  BOOL v54 = [(CNContactContentDisplayViewController *)self isSuggestedContact];
  if (v54)
  {
    int v55 = 0;
  }
  else
  {
    double v51 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
    if ([v51 allowsContactBlocking])
    {
      int v55 = 0;
    }
    else
    {
      double v53 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
      if (([v53 allowsContactBlockingAndReporting] & 1) == 0)
      {

LABEL_58:
        goto LABEL_59;
      }
      int v55 = 1;
    }
  }
  v56 = [(CNContactContentDisplayViewController *)self cardBlockContactGroup];
  v57 = [v56 actions];
  uint64_t v58 = [v57 count];

  if (v55)
  {

    if (!v54) {
      goto LABEL_48;
    }
LABEL_51:
    if (!v58) {
      goto LABEL_59;
    }
    goto LABEL_52;
  }
  if (v54) {
    goto LABEL_51;
  }
LABEL_48:

  if (v58)
  {
LABEL_52:
    v59 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
    int v60 = [v59 showContactBlockingFirst];

    v61 = [(CNContactContentDisplayViewController *)self cardBlockContactGroup];
    double v51 = v61;
    if (v60)
    {
      [v61 setAddSpacerFromPreviousGroup:0];

      double v51 = [(CNContactContentDisplayViewController *)self cardBlockContactGroup];
      [v70 insertObject:v51 atIndex:0];
    }
    else
    {
      [v70 addObject:v61];
    }
    goto LABEL_58;
  }
LABEL_59:
  v62 = [(CNContactContentDisplayViewController *)self cardLinkedCardsGroup];

  if (v62)
  {
    v63 = [(CNContactContentDisplayViewController *)self cardLinkedCardsGroup];
    [v70 addObject:v63];
  }
  v64 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  int v65 = [v64 allowsNamePicking];

  if (v65)
  {
    v66 = [(CNContactContentDisplayViewController *)self namePickingGroup];
    [v70 addObject:v66];
  }

  return v70;
}

- (void)_reloadLinkedCardsGroup
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(CNContactContentDisplayViewController *)self shouldReallyShowLinkedContacts])
  {
    uint64_t v3 = [(CNContactContentDisplayViewController *)self actionProvider];
    id v4 = [v3 linkedCardsAction];

    if (!v4)
    {
      uint64_t v5 = [(CNContactContentDisplayViewController *)self actionProvider];
      [v5 buildLinkedContactActions];
    }
    uint64_t v6 = [(CNContactContentDisplayViewController *)self actionProvider];
    uint64_t v7 = [v6 linkedCardsAction];
    [v7 setContactDelegate:self];

    char v8 = [CNCardLinkedCardsGroup alloc];
    uint64_t v9 = [(CNContactContentDisplayViewController *)self mutableContact];
    uint64_t v10 = [(CNCardGroup *)v8 initWithContact:v9];
    [(CNContactContentDisplayViewController *)self setCardLinkedCardsGroup:v10];

    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    long long v12 = [(CNContactContentDisplayViewController *)self contact];
    uint64_t v13 = [v12 mainStoreLinkedContacts];

    char v14 = [(CNContactContentDisplayViewController *)self shadowCopyOfReadonlyContact];

    if (!v14)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v15 = v13;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v22 != v18) {
              objc_enumerationMutation(v15);
            }
            objc_msgSend(v11, "addObject:", *(void *)(*((void *)&v21 + 1) + 8 * i), (void)v21);
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v17);
      }
    }
    if ((unint64_t)objc_msgSend(v11, "count", (void)v21) < 2)
    {
      [(CNContactContentDisplayViewController *)self setCardLinkedCardsGroup:0];
    }
    else
    {
      char v20 = [(CNContactContentDisplayViewController *)self cardLinkedCardsGroup];
      [v20 setLinkedContacts:v11];
    }
  }
  else
  {
    [(CNContactContentDisplayViewController *)self setCardLinkedCardsGroup:0];
  }
}

- (BOOL)shouldReallyShowLinkedContacts
{
  uint64_t v3 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  if ([v3 shouldShowLinkedContacts])
  {
    id v4 = [(CNContactContentDisplayViewController *)self contact];
    uint64_t v5 = [v4 mainStoreLinkedContacts];
    if ((unint64_t)[v5 count] < 2)
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      uint64_t v6 = [(CNContactContentDisplayViewController *)self shadowCopyOfReadonlyContact];
      if (v6)
      {
        LOBYTE(v7) = 0;
      }
      else
      {
        char v8 = [(CNContactContentDisplayViewController *)self contact];
        int v7 = [v8 isSuggestedMe] ^ 1;
      }
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)_reloadAlertGroups
{
  uint64_t v3 = [(CNContactContentDisplayViewController *)self propertyGroups];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1ADA0]];
  uint64_t v5 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  objc_msgSend(v4, "setAllowsDisplayModePickerActions:", objc_msgSend(v5, "allowsDisplayModePickerActions"));

  id v8 = [(CNContactContentDisplayViewController *)self propertyGroups];
  uint64_t v6 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F1AF90]];
  int v7 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  objc_msgSend(v6, "setAllowsDisplayModePickerActions:", objc_msgSend(v7, "allowsDisplayModePickerActions"));
}

- (void)_reloadMedicalIDGroup
{
  uint64_t v3 = [(CNContactContentDisplayViewController *)self environment];
  id v4 = [v3 healthStoreManager];

  uint64_t v5 = [(CNContactContentDisplayViewController *)self medicalIDLookupToken];
  [v5 cancel];

  [(CNContactContentDisplayViewController *)self setMedicalIDLookupToken:0];
  [(CNContactContentDisplayViewController *)self setMedicalIDRegistrationToken:0];
  [(CNContactContentDisplayViewController *)self setCardMedicalIDGroup:0];
  uint64_t v6 = [(CNContactContentDisplayViewController *)self contactHeaderView];
  [v6 setIsEmergencyContact:0];

  int v7 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  if (([v7 allowsActions] & 1) == 0)
  {

    goto LABEL_5;
  }
  id v8 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  int v9 = [v8 allowsCardActions];

  if (!v9)
  {
LABEL_5:
    [(CNContactContentDisplayViewController *)self setCardMedicalIDGroup:0];
    [(CNContactContentDisplayViewController *)self setMedicalIDAction:0];
    [(CNContactContentDisplayViewController *)self setEmergencyContactAction:0];
    [(CNContactContentDisplayViewController *)self setEmergencyNumberIdentifier:0];
    goto LABEL_6;
  }
  objc_initWeak(&location, self);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __62__CNContactContentDisplayViewController__reloadMedicalIDGroup__block_invoke;
  v22[3] = &unk_1E549BBA8;
  objc_copyWeak(&v24, &location);
  id v10 = v4;
  id v23 = v10;
  uint64_t v11 = [v10 registerMedicalIDDataHandler:v22];
  [(CNContactContentDisplayViewController *)self setMedicalIDRegistrationToken:v11];
  long long v12 = (void *)MEMORY[0x1E4F5A368];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __62__CNContactContentDisplayViewController__reloadMedicalIDGroup__block_invoke_4;
  uint64_t v18 = &unk_1E549BBD0;
  objc_copyWeak(&v21, &location);
  id v19 = v10;
  id v13 = v11;
  id v20 = v13;
  char v14 = [v12 tokenWithCancelationBlock:&v15];
  -[CNContactContentDisplayViewController setMedicalIDLookupToken:](self, "setMedicalIDLookupToken:", v14, v15, v16, v17, v18);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
LABEL_6:
}

void __62__CNContactContentDisplayViewController__reloadMedicalIDGroup__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = [WeakRetained environment];
  int v9 = [v8 defaultSchedulerProvider];
  id v10 = [v9 mainThreadScheduler];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__CNContactContentDisplayViewController__reloadMedicalIDGroup__block_invoke_2;
  v13[3] = &unk_1E549BB80;
  id v14 = v6;
  id v15 = WeakRetained;
  id v16 = *(id *)(a1 + 32);
  id v17 = v5;
  id v11 = v5;
  id v12 = v6;
  [v10 performBlock:v13];
}

void __62__CNContactContentDisplayViewController__reloadMedicalIDGroup__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setMedicalIDRegistrationToken:0];
  [*(id *)(a1 + 32) unregisterHandlerForToken:*(void *)(a1 + 40)];
}

void __62__CNContactContentDisplayViewController__reloadMedicalIDGroup__block_invoke_2(uint64_t a1)
{
  v74[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) medicalIDRegistrationToken];

  if (v2 == v3)
  {
    id v4 = [*(id *)(a1 + 40) contact];
    id v5 = [v4 phoneNumbers];
    id v6 = (void *)[v5 count];

    if (([*(id *)(a1 + 40) showingMeContact] & 1) != 0 || v6)
    {
      int v7 = [*(id *)(a1 + 40) cardMedicalIDGroup];

      if (v7)
      {
        id v8 = [*(id *)(a1 + 40) cardMedicalIDGroup];
        [v8 removeAllActions];
      }
      else
      {
        int v9 = [CNCardGroup alloc];
        id v8 = [*(id *)(a1 + 40) mutableContact];
        id v10 = [(CNCardGroup *)v9 initWithContact:v8];
        [*(id *)(a1 + 40) setCardMedicalIDGroup:v10];
      }
      id v11 = [*(id *)(a1 + 40) cardMedicalIDGroup];
      [v11 setAddSpacerFromPreviousGroup:0];

      if ([*(id *)(a1 + 40) showingMeContact])
      {
        id v12 = [*(id *)(a1 + 40) medicalIDAction];

        if (!v12)
        {
          id v13 = [CNMedicalIDAction alloc];
          id v14 = [*(id *)(a1 + 40) contact];
          id v15 = [(CNPropertyAction *)v13 initWithContact:v14];
          [*(id *)(a1 + 40) setMedicalIDAction:v15];

          uint64_t v16 = *(void *)(a1 + 48);
          id v17 = [*(id *)(a1 + 40) medicalIDAction];
          [v17 setHealthStoreManager:v16];

          uint64_t v18 = *(void **)(a1 + 40);
          id v19 = [v18 medicalIDAction];
          [v19 setDelegate:v18];

          id v20 = [*(id *)(a1 + 40) medicalIDAction];
          [v20 setShowBackgroundPlatter:0];
        }
        id v21 = [*(id *)(a1 + 40) cardMedicalIDGroup];
        uint64_t v22 = 1;
        [v21 setAddSpacerFromPreviousGroup:1];

        id v23 = [*(id *)(a1 + 40) contactHeaderView];
        [v23 setIsEmergencyContact:0];

        uint64_t v24 = *(void *)(a1 + 56);
        id v25 = CNContactsUIBundle();
        uint64_t v26 = v25;
        if (v24) {
          double v27 = @"CARD_ACTION_SHOW_MEDICAL_ID";
        }
        else {
          double v27 = @"CARD_ACTION_CREATE_MEDICAL_ID";
        }
        if (v24) {
          uint64_t v22 = 2;
        }
        uint64_t v28 = [v25 localizedStringForKey:v27 value:&stru_1ED8AC728 table:@"Localized"];

        double v29 = [*(id *)(a1 + 40) medicalIDAction];
        [v29 setMedicalIDActionType:v22];

        double v30 = [*(id *)(a1 + 40) cardMedicalIDGroup];
        double v31 = [*(id *)(a1 + 40) medicalIDAction];
        double v32 = +[CNUIColorRepository contactListEmergencyContactAddTextColor];
        uint64_t v33 = +[CNUIColorRepository contactListEmergencyContactGlyphColor];
        [v30 addAction:v31 withTitle:v28 color:v32 glyphColor:v33 transportType:6];

        id v6 = 0;
      }
      else if (v6)
      {
        double v34 = [*(id *)(a1 + 40) emergencyContactAction];

        if (!v34)
        {
          v35 = [*(id *)(a1 + 40) propertyGroupsDataSource];
          v74[0] = *MEMORY[0x1E4F1AEE0];
          double v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:1];
          double v37 = [v35 allDisplayPropertyItemsForPropertyKeys:v36];

          double v38 = [CNEmergencyContactAction alloc];
          double v39 = [*(id *)(a1 + 40) contact];
          uint64_t v40 = [(CNEmergencyContactAction *)v38 initWithContact:v39 healthStoreManager:*(void *)(a1 + 48) propertyItems:v37];
          [*(id *)(a1 + 40) setEmergencyContactAction:v40];

          uint64_t v41 = *(void **)(a1 + 40);
          double v42 = [v41 emergencyContactAction];
          [v42 setDelegate:v41];
        }
        double v43 = [*(id *)(a1 + 56) emergencyContacts];
        double v44 = [*(id *)(a1 + 40) contact];
        uint64_t v45 = +[CNHealthStoreManager emergencyContactMatchingContact:v44];
        double v46 = objc_msgSend(v43, "_cn_firstObjectPassingTest:", v45);

        double v47 = CNContactsUIBundle();
        double v48 = v47;
        if (v46)
        {
          double v49 = [v47 localizedStringForKey:@"CARD_ACTION_EMERGENCY_REMOVE" value:&stru_1ED8AC728 table:@"Localized"];

          id v6 = [v46 phoneNumberContactIdentifier];
        }
        else
        {
          double v49 = [v47 localizedStringForKey:@"CARD_ACTION_EMERGENCY_ADD" value:&stru_1ED8AC728 table:@"Localized"];

          id v6 = 0;
        }
        uint64_t v50 = [*(id *)(a1 + 40) emergencyContactAction];
        [v50 setAddingToEmergency:v46 == 0];

        double v51 = [*(id *)(a1 + 40) contactHeaderView];
        [v51 setIsEmergencyContact:v46 != 0];

        double v52 = [*(id *)(a1 + 40) contactStore];
        double v53 = [*(id *)(a1 + 40) emergencyContactAction];
        [v53 setContactStore:v52];

        if (v46) {
          +[CNUIColorRepository contactListEmergencyContactGlyphColor];
        }
        else {
        BOOL v54 = +[CNUIColorRepository contactListEmergencyContactAddTextColor];
        }
        int v55 = [*(id *)(a1 + 40) cardMedicalIDGroup];
        v56 = [*(id *)(a1 + 40) emergencyContactAction];
        [v55 addAction:v56 withTitle:v49 color:v54 transportType:0 wrapTitle:1];
      }
      v57 = [*(id *)(a1 + 40) displayGroups];
      uint64_t v58 = (void *)MEMORY[0x1E4FB1EB0];
      uint64_t v68 = MEMORY[0x1E4F143A8];
      uint64_t v69 = 3221225472;
      v70 = __62__CNContactContentDisplayViewController__reloadMedicalIDGroup__block_invoke_3;
      v71 = &unk_1E549BF80;
      id v59 = v57;
      uint64_t v60 = *(void *)(a1 + 40);
      id v72 = v59;
      uint64_t v73 = v60;
      [v58 performWithoutAnimation:&v68];
      uint64_t v61 = objc_msgSend(*(id *)(a1 + 40), "emergencyNumberIdentifier", v68, v69, v70, v71);
      v62 = v6;
      if (v6 != (void *)v61)
      {
        v63 = (void *)v61;
        v64 = [*(id *)(a1 + 40) emergencyNumberIdentifier];
        char v65 = [v6 isEqualToString:v64];

        if (v65)
        {
LABEL_30:

          return;
        }
        [*(id *)(a1 + 40) setEmergencyNumberIdentifier:v6];
        v66 = *(void **)(a1 + 40);
        v62 = [v66 propertyGroups];
        v67 = [v62 objectForKeyedSubscript:*MEMORY[0x1E4F1AEE0]];
        [v66 reloadCardGroup:v67];
      }
      goto LABEL_30;
    }
  }
}

void __62__CNContactContentDisplayViewController__reloadMedicalIDGroup__block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) cardMedicalIDGroup];
  LODWORD(v2) = [v2 containsObject:v3];

  id v4 = *(void **)(a1 + 40);
  if (v2)
  {
    id v5 = [v4 cardMedicalIDGroup];
    [v4 reloadCardGroup:v5];
  }
  else
  {
    [v4 _addMedicalIDGroupAnimated:0];
  }
}

- (void)_addMedicalIDGroupAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNContactContentDisplayViewController *)self displayGroups];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__CNContactContentDisplayViewController__addMedicalIDGroupAnimated___block_invoke;
  aBlock[3] = &unk_1E549BB58;
  aBlock[4] = self;
  id v6 = _Block_copy(aBlock);
  uint64_t v7 = [v5 indexOfObjectPassingTest:v6];
  if (v7)
  {
    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      [v5 lastObject];
    }
    else {
    id v8 = [v5 objectAtIndexedSubscript:v7 - 1];
    }
  }
  else
  {
    id v8 = 0;
  }
  int v9 = [(CNContactContentDisplayViewController *)self cardMedicalIDGroup];
  [(CNContactContentDisplayViewController *)self _addGroup:v9 afterGroup:v8 animated:v3];
}

BOOL __68__CNContactContentDisplayViewController__addMedicalIDGroupAnimated___block_invoke(uint64_t a1, void *a2)
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
        id v7 = [*(id *)(a1 + 32) cardLinkedCardsGroup];
        BOOL v8 = v7 == v3;
      }
    }
  }
  return v8;
}

- (void)_addGroup:(id)a3 afterGroup:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v16 = a4;
  id v8 = a3;
  int v9 = [(CNContactContentDisplayViewController *)self contactView];
  id v10 = [(CNContactContentDisplayViewController *)self displayGroups];
  if (v16 && (uint64_t v11 = [v10 indexOfObject:v16], v11 != 0x7FFFFFFFFFFFFFFFLL)) {
    uint64_t v12 = v11 + 1;
  }
  else {
    uint64_t v12 = 0;
  }
  [v9 beginUpdates];
  [v10 insertObject:v8 atIndex:v12];

  unint64_t v13 = [(CNContactContentDisplayViewController *)self tableViewSectionIndexFromGroupIndex:v12];
  id v14 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v13];
  if (v5) {
    uint64_t v15 = 6;
  }
  else {
    uint64_t v15 = 5;
  }
  [v9 insertSections:v14 withRowAnimation:v15];

  [v9 endUpdates];
  [(CNContactContentDisplayViewController *)self adjustPreferredContentSize];
}

- (BOOL)shouldAddShareLocationGroup
{
  if ([(CNContactContentDisplayViewController *)self isEditing]) {
    return 0;
  }
  id v3 = [(CNContactContentDisplayViewController *)self displayGroups];

  if (!v3) {
    return 0;
  }
  id v4 = [(CNContactContentDisplayViewController *)self cardShareLocationGroup];

  if (!v4) {
    return 0;
  }
  BOOL v5 = [(CNContactContentDisplayViewController *)self displayGroups];
  id v6 = [(CNContactContentDisplayViewController *)self cardShareLocationGroup];
  char v7 = objc_msgSend(v5, "_cn_containsObject:", v6);

  return v7 ^ 1;
}

- (void)_addShareLocationGroupAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CNContactContentDisplayViewController *)self shouldAddShareLocationGroup])
  {
    if (([(CNContactContentDisplayViewController *)self isEditing] & 1) == 0)
    {
      BOOL v5 = [(CNContactContentDisplayViewController *)self displayGroups];

      if (v5)
      {
        id v6 = [(CNContactContentDisplayViewController *)self displayGroups];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __72__CNContactContentDisplayViewController__addShareLocationGroupAnimated___block_invoke;
        v12[3] = &unk_1E549BAE8;
        v12[4] = self;
        uint64_t v7 = objc_msgSend(v6, "_cn_indexOfFirstObjectPassingTest:", v12);

        if (v7 && v7 != 0x7FFFFFFFFFFFFFFFLL)
        {
          id v8 = [(CNContactContentDisplayViewController *)self displayGroups];
          uint64_t v9 = [v8 objectAtIndexedSubscript:v7 - 1];
        }
        else
        {
          id v8 = [(CNContactContentDisplayViewController *)self displayGroups];
          uint64_t v9 = [v8 lastObject];
        }
        id v10 = (void *)v9;

        uint64_t v11 = [(CNContactContentDisplayViewController *)self cardShareLocationGroup];
        [(CNContactContentDisplayViewController *)self _addGroup:v11 afterGroup:v10 animated:v3];
      }
    }
  }
}

BOOL __72__CNContactContentDisplayViewController__addShareLocationGroupAnimated___block_invoke(uint64_t a1, void *a2)
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

- (BOOL)shouldAddFaceTimeGroup
{
  id v3 = [(CNContactContentDisplayViewController *)self displayGroups];

  if (!v3) {
    return 0;
  }
  id v4 = [(CNContactContentDisplayViewController *)self cardFaceTimeGroup];

  if (!v4) {
    return 0;
  }
  id v5 = [(CNContactContentDisplayViewController *)self displayGroups];
  id v6 = [(CNContactContentDisplayViewController *)self cardFaceTimeGroup];
  char v7 = [v5 containsObject:v6];

  if (v7) {
    return 0;
  }
  uint64_t v9 = [(CNContactContentDisplayViewController *)self cardFaceTimeGroup];
  uint64_t v10 = [v9 contact];

  uint64_t v11 = [(CNContactContentDisplayViewController *)self displayGroups];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__CNContactContentDisplayViewController_shouldAddFaceTimeGroup__block_invoke;
  v14[3] = &unk_1E549BAC0;
  id v15 = (id)v10;
  id v12 = (id)v10;
  LOBYTE(v10) = objc_msgSend(v11, "_cn_any:", v14);

  char v8 = v10 ^ 1;
  return v8;
}

uint64_t __63__CNContactContentDisplayViewController_shouldAddFaceTimeGroup__block_invoke(uint64_t a1, void *a2)
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

- (void)_addFaceTimeGroupAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v10[2] = *MEMORY[0x1E4F143B8];
  if (([(CNContactContentDisplayViewController *)self isEditing] & 1) == 0)
  {
    if ([(CNContactContentDisplayViewController *)self shouldAddFaceTimeGroup])
    {
      uint64_t v5 = *MEMORY[0x1E4F1ADC8];
      v10[0] = *MEMORY[0x1E4F1AEE0];
      v10[1] = v5;
      id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
      char v7 = [(CNContactContentDisplayViewController *)self _propertyGroupsForKeys:v6];

      char v8 = [v7 firstObject];
      uint64_t v9 = [(CNContactContentDisplayViewController *)self cardFaceTimeGroup];
      [(CNContactContentDisplayViewController *)self _addGroup:v9 afterGroup:v8 animated:v3];
    }
  }
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
        id v12 = [(CNContactContentDisplayViewController *)self propertyGroups];
        unint64_t v13 = [v12 objectForKeyedSubscript:v11];

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

- (void)_reloadFaceTimeGroup
{
  v26[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[CNCapabilitiesManager defaultCapabilitiesManager];
  if ([v3 isFaceTimeAppAvailable]) {
    int v4 = [v3 isConferencingAvailable] ^ 1;
  }
  else {
    int v4 = 1;
  }
  uint64_t v5 = [(CNContactContentDisplayViewController *)self propertyGroupsDataSource];
  uint64_t v6 = *MEMORY[0x1E4F1ADC8];
  v26[0] = *MEMORY[0x1E4F1AEE0];
  v26[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  uint64_t v8 = [v5 allDisplayPropertyItemsForPropertyKeys:v7];

  uint64_t v9 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  if (![v9 allowsActions]) {
    goto LABEL_12;
  }
  uint64_t v10 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  if (([v10 allowsConferencing] & 1) == 0)
  {

    goto LABEL_12;
  }
  uint64_t v11 = [(CNContactContentDisplayViewController *)self contact];
  if ((([v11 isSuggested] | v4) & 1) != 0 || !objc_msgSend(v8, "count"))
  {

    goto LABEL_12;
  }
  id v12 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  unint64_t v13 = [v12 primaryProperty];
  BOOL v14 = v13 == 0;

  if (v14)
  {
    long long v15 = objc_msgSend(v8, "_cn_filter:", &__block_literal_global_3_57815);
    uint64_t v9 = objc_msgSend(v15, "_cn_map:", &__block_literal_global_57810);

    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__CNContactContentDisplayViewController__reloadFaceTimeGroup__block_invoke;
    aBlock[3] = &unk_1E549BA98;
    objc_copyWeak(&v24, &location);
    long long v16 = _Block_copy(aBlock);
    long long v17 = (void *)MEMORY[0x1E4F5A698];
    long long v18 = [(CNContactContentDisplayViewController *)self environment];
    id v19 = [v18 idsAvailabilityProvider];
    uint64_t v20 = [(CNContactContentDisplayViewController *)self environment];
    id v21 = [v20 defaultSchedulerProvider];
    uint64_t v22 = [v17 validateHandlesForFaceTime:v9 availabilityProvider:v19 schedulerProvider:v21 handler:v16];
    [(CNContactContentDisplayViewController *)self setFaceTimeIDSLookupToken:v22];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
LABEL_12:
  }
}

void __61__CNContactContentDisplayViewController__reloadFaceTimeGroup__block_invoke(uint64_t a1, void *a2)
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
        uint64_t v5 = [CNCardFaceTimeGroup alloc];
        uint64_t v6 = [WeakRetained mutableContact];
        uint64_t v7 = [(CNCardGroup *)v5 initWithContact:v6];
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
  int v4 = [(CNContactContentDisplayViewController *)self propertyGroups];
  uint64_t v5 = [v4 allValues];

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

- (id)_loadPropertyGroups
{
  BOOL v3 = [CNPropertyGroupsDataSource alloc];
  int v4 = [(CNContactContentDisplayViewController *)self mutableContact];
  uint64_t v5 = [(CNContactContentDisplayViewController *)self contactStore];
  uint64_t v6 = [(CNContactContentDisplayViewController *)self policy];
  uint64_t v7 = [(CNContactContentDisplayViewController *)self linkedPoliciesByContactIdentifier];
  uint64_t v8 = [(CNContactContentDisplayViewController *)self prohibitedPropertyKeys];
  uint64_t v9 = [(CNPropertyGroupsDataSource *)v3 initWithMutableContact:v4 contactStore:v5 policy:v6 linkedPolicies:v7 prohibitedKeys:v8];
  propertyGroupsDataSource = self->_propertyGroupsDataSource;
  self->_propertyGroupsDataSource = v9;

  long long v11 = [(CNContactContentDisplayViewController *)self propertyGroupsDataSource];
  [v11 buildPropertyGroups];

  long long v12 = [(CNContactContentDisplayViewController *)self propertyGroupsDataSource];
  long long v13 = [v12 propertyGroups];

  return v13;
}

- (BOOL)shouldShowGemini
{
  BOOL v3 = [(CNContactContentDisplayViewController *)self geminiDataSource];
  int v4 = [v3 geminiResult];

  if (v4 && ![(CNContactContentDisplayViewController *)self showingMeContact])
  {
    uint64_t v6 = [(CNContactContentDisplayViewController *)self contact];
    if ([v6 isSuggested])
    {
      BOOL v5 = 0;
    }
    else
    {
      uint64_t v7 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
      uint64_t v8 = [v7 displayedProperties];
      if ([v8 containsObject:*MEMORY[0x1E4F1AEE0]])
      {
        uint64_t v9 = [(CNContactContentDisplayViewController *)self contact];
        BOOL v5 = +[CNContactContentDisplayViewController shouldShowGeminiForResult:v4 contact:v9];
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
    && ([v3 isEqualToString:*MEMORY[0x1E4F1ADC0]] & 1) == 0)
  {
    [v3 isEqualToString:*MEMORY[0x1E4F1AD88]];
  }
  int v4 = objc_opt_class();

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
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v11 = [v10 property];
        int v12 = [v11 isEqualToString:v8];

        if (v12) {
          objc_msgSend(v10, "setAllowsTTY:", -[CNContactContentDisplayViewController contactSupportsTTYCalls](self, "contactSupportsTTYCalls"));
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
        long long v10 = [v9 property];
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
        long long v10 = [v9 property];
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
  double v27 = [MEMORY[0x1E4F1CA48] arrayWithArray:v3];
  uint64_t v4 = *MEMORY[0x1E4F1B758];
  v38[0] = *MEMORY[0x1E4F1B728];
  v38[1] = v4;
  v38[2] = *MEMORY[0x1E4F1B708];
  double v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:3];
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
    aBlock[2] = __81__CNContactContentDisplayViewController__updateIMessageTransportButtonsForItems___block_invoke;
    aBlock[3] = &unk_1E549BA48;
    id v31 = v17;
    id v32 = v27;
    id v18 = v17;
    uint64_t v19 = _Block_copy(aBlock);
    uint64_t v20 = (void *)MEMORY[0x1E4F5A698];
    id v21 = [(CNContactContentDisplayViewController *)v26 environment];
    uint64_t v22 = [v21 idsAvailabilityProvider];
    id v23 = [(CNContactContentDisplayViewController *)v26 environment];
    id v24 = [v23 defaultSchedulerProvider];
    id v25 = [v20 validateHandlesForIMessage:v18 availabilityProvider:v22 schedulerProvider:v24 handler:v19];
    [(CNContactContentDisplayViewController *)v26 setIMessageIDSLookupToken:v25];
  }
}

void __81__CNContactContentDisplayViewController__updateIMessageTransportButtonsForItems___block_invoke(uint64_t a1, void *a2)
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
    v17[2] = __81__CNContactContentDisplayViewController__updateIMessageTransportButtonsForItems___block_invoke_2;
    v17[3] = &unk_1E549B9F8;
    id v18 = v6;
    uint64_t v8 = objc_msgSend(v7, "_cn_firstObjectPassingTest:", v17);
    uint64_t v9 = *(void **)(a1 + 40);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    long long v14 = __81__CNContactContentDisplayViewController__updateIMessageTransportButtonsForItems___block_invoke_3;
    int v15 = &unk_1E549BA20;
    id v16 = v8;
    id v10 = v8;
    int v11 = objc_msgSend(v9, "_cn_firstObjectPassingTest:", &v12);
    objc_msgSend(v11, "setAllowsIMessage:", objc_msgSend(v3, "isAvailable", v12, v13, v14, v15));
  }
}

uint64_t __81__CNContactContentDisplayViewController__updateIMessageTransportButtonsForItems___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isEqual:a2];
}

uint64_t __81__CNContactContentDisplayViewController__updateIMessageTransportButtonsForItems___block_invoke_3(uint64_t a1, void *a2)
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
    [(CNContactContentDisplayViewController *)self _updateIMessageTransportButtonsForItems:v5];
  }
  if ([v4 isPhoneAppAvailable]) {
    [(CNContactContentDisplayViewController *)self _updatePhoneTransportButtonsForItems:v5];
  }
  if ([v4 isMailAppAvailable]) {
    [(CNContactContentDisplayViewController *)self _updateEmailTransportButtonsForItems:v5];
  }
  [(CNContactContentDisplayViewController *)self _updateTTYTransportButtonsForItems:v5];
}

- (void)_updateAvailableTransports
{
  v7[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(CNContactContentDisplayViewController *)self propertyGroupsDataSource];
  uint64_t v4 = *MEMORY[0x1E4F1ADC8];
  v7[0] = *MEMORY[0x1E4F1AEE0];
  v7[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  id v6 = [v3 allDisplayPropertyItemsForPropertyKeys:v5];

  [(CNContactContentDisplayViewController *)self _updateAvailableTransportsForItems:v6];
}

- (id)_clearRecentsDataAction
{
  id v3 = [(CNContactContentDisplayViewController *)self recentsData];

  if (v3 && ![(CNContactContentDisplayViewController *)self isSuggestedContact])
  {
    id v5 = [CNContactClearRecentsDataAction alloc];
    id v6 = [(CNContactContentDisplayViewController *)self recentsData];
    uint64_t v7 = [(CNContactContentDisplayViewController *)self environment];
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
  id v3 = [(CNContactContentDisplayViewController *)self contactFormatter];
  uint64_t v4 = [(CNContactContentDisplayViewController *)self contact];
  id v5 = [v3 stringFromContact:v4];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingName:v5];
    id v7 = objc_alloc(MEMORY[0x1E4F1B908]);
    uint64_t v8 = [(CNContactContentDisplayViewController *)self contactFormatter];
    uint64_t v9 = [v8 descriptorForRequiredKeys];
    v26[0] = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    int v11 = (void *)[v7 initWithKeysToFetch:v10];

    [v11 setOnlyMainStore:1];
    [v11 setUnifyResults:1];
    [v11 setPredicate:v6];
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x3032000000;
    id v23 = __Block_byref_object_copy__58439;
    id v24 = __Block_byref_object_dispose__58440;
    id v25 = 0;
    uint64_t v12 = [(CNContactContentDisplayViewController *)self contactStore];
    v18[4] = &v20;
    id v19 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __69__CNContactContentDisplayViewController__updateExistingContactAction__block_invoke;
    v18[3] = &unk_1E549B878;
    [v12 enumerateContactsWithFetchRequest:v11 error:&v19 usingBlock:v18];
    id v13 = v19;

    if (v21[5])
    {
      long long v14 = [CNContactUpdateExistingContactAction alloc];
      int v15 = [(CNContactContentDisplayViewController *)self contact];
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

void __69__CNContactContentDisplayViewController__updateExistingContactAction__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v6 + 40);
  id v7 = (id *)(v6 + 40);
  uint64_t v8 = v9;
  if (v9)
  {
    id *v7 = 0;

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
    id v5 = [(CNContactContentDisplayViewController *)self environment];
    uint64_t v6 = [v5 idsAvailabilityProvider];
    id v7 = [(CNShareLocationController *)v4 initWithIDSAvailabilityProvider:v6];
    uint64_t v8 = self->_shareLocationController;
    self->_shareLocationController = v7;

    [(CNShareLocationController *)self->_shareLocationController setShareLocationDelegate:self];
    shareLocationController = self->_shareLocationController;
  }

  return shareLocationController;
}

- (id)_addNewFieldAction
{
  id v3 = [CNContactAddNewFieldAction alloc];
  uint64_t v4 = [(CNContactContentDisplayViewController *)self contact];
  id v5 = [(CNContactAction *)v3 initWithContact:v4];

  uint64_t v6 = [(CNContactContentDisplayViewController *)self prohibitedPropertyKeys];
  [(CNContactAddNewFieldAction *)v5 setProhibitedPropertyKeys:v6];

  [(CNContactAction *)v5 setDelegate:self];
  [(CNContactAddNewFieldAction *)v5 setGroupPickerDelegate:self];

  return v5;
}

- (void)_setupCustomActions
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ([(CNContactContentDisplayViewController *)self allowsEditInApp])
  {
    id v3 = [(CNContactContentDisplayViewController *)self contact];
    char v4 = [v3 isSuggested];

    if ((v4 & 1) == 0)
    {
      id v5 = [CNEditInAppAction alloc];
      uint64_t v6 = [(CNContactContentDisplayViewController *)self contact];
      id v7 = [(CNContactContentDisplayViewController *)self activityManager];
      uint64_t v8 = [(CNEditInAppAction *)v5 initWithContact:v6 activityManager:v7];

      uint64_t v9 = [(CNContactContentDisplayViewController *)self cardFooterGroup];
      id v10 = [(CNEditInAppAction *)v8 title];
      [v9 addAction:v8 withTitle:v10];
    }
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  int v11 = [(CNContactContentDisplayViewController *)self customActions];
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
        id v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v17 = +[CNCustomCardAction groupForActionGivenPlacement:inContactContentViewController:](CNCustomCardAction, "groupForActionGivenPlacement:inContactContentViewController:", [v16 placement], self);
        id v18 = [v16 menuProvider];

        if (v18)
        {
          [v17 setDisplaysDropdownMenu:1];
          id v19 = [v16 title];
          uint64_t v20 = [v16 menuProvider];
          id v21 = (id)objc_msgSend(v17, "addActionWithTitle:menuProvider:destructive:", v19, v20, objc_msgSend(v16, "isDestructive"));
        }
        else
        {
          id v19 = [v16 title];
          uint64_t v20 = [v16 targetActionWrapper];
          id v22 = (id)objc_msgSend(v17, "addActionWithTitle:target:selector:destructive:", v19, v20, sel_performActionWithSender_, objc_msgSend(v16, "isDestructive"));
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }
}

- (void)_setupAddToAddressBookActions
{
  id v3 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  int v4 = [v3 allowsAddingToAddressBook];

  if (v4)
  {
    id v5 = [(CNContactContentDisplayViewController *)self actionProvider];
    [v5 buildAddContactActions];

    uint64_t v6 = [(CNContactContentDisplayViewController *)self cardActionsGroup];
    id v7 = [(CNContactContentDisplayViewController *)self actionProvider];
    uint64_t v8 = [v7 createNewContactAction];
    uint64_t v9 = CNContactsUIBundle();
    id v10 = [v9 localizedStringForKey:@"UNKNOWN_CARD_CREATE_NEW_CONTACT" value:&stru_1ED8AC728 table:@"Localized"];
    [v6 addAction:v8 withTitle:v10];

    int v11 = [(CNContactContentDisplayViewController *)self cardActionsGroup];
    uint64_t v12 = [(CNContactContentDisplayViewController *)self actionProvider];
    uint64_t v13 = [v12 addToExistingContactAction];
    uint64_t v14 = CNContactsUIBundle();
    int v15 = [v14 localizedStringForKey:@"UNKNOWN_CARD_ADD_TO_EXISTING_CONTACT" value:&stru_1ED8AC728 table:@"Localized"];
    [v11 addAction:v13 withTitle:v15];

    id v30 = [(CNContactContentDisplayViewController *)self _updateExistingContactAction];
    if (v30)
    {
      [(CNContactContentDisplayViewController *)self setUpdateExistingContactAction:v30];
      id v16 = NSString;
      long long v17 = CNContactsUIBundle();
      id v18 = [v17 localizedStringForKey:@"UNKNOWN_CARD_ADD_UPDATE_CONTACT-%@" value:&stru_1ED8AC728 table:@"Localized"];
      id v19 = [(CNContactContentDisplayViewController *)self contactFormatter];
      uint64_t v20 = [v30 existingContact];
      id v21 = [v19 stringFromContact:v20];
      id v22 = objc_msgSend(v16, "stringWithFormat:", v18, v21);

      long long v23 = [(CNContactContentDisplayViewController *)self cardActionsGroup];
      [v23 addAction:v30 withTitle:v22];
    }
    long long v24 = [(CNContactContentDisplayViewController *)self suggestedContactAction];

    if (v24)
    {
      long long v25 = [(CNContactContentDisplayViewController *)self cardBlockContactGroup];
      long long v26 = [(CNContactContentDisplayViewController *)self suggestedContactAction];
      double v27 = CNContactsUIBundle();
      uint64_t v28 = [v27 localizedStringForKey:@"SUGGESTION_IGNORE_CONTACT" value:&stru_1ED8AC728 table:@"Localized"];
      double v29 = +[CNUIColorRepository contactCardDestructiveActionTitleTextColor];
      [v25 addAction:v26 withTitle:v28 color:v29 transportType:0];
    }
  }
}

- (void)_setupSuggestionActions
{
  id v3 = [(CNContactContentDisplayViewController *)self originalContacts];
  objc_msgSend(v3, "_cn_filter:", &__block_literal_global_603);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if ([v8 count] == 1)
  {
    int v4 = [CNContactSuggestionAction alloc];
    id v5 = [v8 firstObject];
    uint64_t v6 = [(CNContactAction *)v4 initWithContact:v5];
    [(CNContactContentDisplayViewController *)self setSuggestedContactAction:v6];

    id v7 = [(CNContactContentDisplayViewController *)self suggestedContactAction];
    [v7 setDelegate:self];
  }
  else
  {
    [(CNContactContentDisplayViewController *)self setSuggestedContactAction:0];
  }
}

uint64_t __64__CNContactContentDisplayViewController__setupSuggestionActions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSuggested];
}

- (void)_setupContactBlockingReportingActionPreservingChanges:(BOOL)a3 withUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v41 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  if ([v41 allowsContactBlockingAndReporting])
  {
    BOOL v7 = [(CNContactContentDisplayViewController *)self showingMeContact];

    if (v7) {
      return;
    }
    id v8 = [(CNContactContentDisplayViewController *)self blockReportAction];

    uint64_t v9 = [(CNContactContentDisplayViewController *)self blockReportAction];

    if (!v9)
    {
      id v10 = [CNContactToggleBlockReportCallerAction alloc];
      int v11 = [(CNContactContentDisplayViewController *)self contact];
      uint64_t v12 = [(CNContactAction *)v10 initWithContact:v11];
      [(CNContactContentDisplayViewController *)self setBlockReportAction:v12];

      uint64_t v13 = [(CNContactContentDisplayViewController *)self blockReportAction];
      [v13 setDelegate:self];

      uint64_t v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v14 addObserver:self selector:sel_blockListDidChange_ name:*MEMORY[0x1E4F59E40] object:0];
    }
    int v15 = [(CNContactContentDisplayViewController *)self blockReportAction];
    int v16 = [v15 isContactBlockedPreservingChanges:v5];

    if (v8)
    {
      long long v17 = CNContactsUIBundle();
      id v18 = v17;
      if (v16) {
        id v19 = @"BLOCK_CALLER";
      }
      else {
        id v19 = @"UNBLOCK_CALLER";
      }
      uint64_t v20 = [v17 localizedStringForKey:v19 value:&stru_1ED8AC728 table:@"Localized"];

      id v21 = [(CNContactContentDisplayViewController *)self cardBlockContactGroup];
      [v21 removeActionWithTitle:v20];
    }
    id v22 = CNContactsUIBundle();
    long long v23 = v22;
    if (v16)
    {
      id v41 = [v22 localizedStringForKey:@"UNBLOCK_CALLER" value:&stru_1ED8AC728 table:@"Localized"];

      long long v24 = [(CNContactContentDisplayViewController *)self cardBlockContactGroup];
      [v24 removeActionWithTitle:v41];

      +[CNUIColorRepository contactsApplicationTintColor];
    }
    else
    {
      id v41 = [v22 localizedStringForKey:@"BLOCK_CALLER" value:&stru_1ED8AC728 table:@"Localized"];

      long long v25 = [(CNContactContentDisplayViewController *)self cardBlockContactGroup];
      [v25 removeActionWithTitle:v41];

      +[CNUIColorRepository contactCardDestructiveActionTitleTextColor];
    long long v26 = };
    double v27 = [(CNContactContentDisplayViewController *)self cardBlockContactGroup];
    uint64_t v28 = [(CNContactContentDisplayViewController *)self blockReportAction];
    [v27 addAction:v28 withTitle:v41 color:v26 transportType:0];

    if (v4)
    {
      double v29 = [(CNContactContentDisplayViewController *)self cardBlockContactGroup];
      int64_t v30 = [(CNContactContentDisplayViewController *)self sectionOfGroup:v29];

      if (v30 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v31 = [(CNContactContentDisplayViewController *)self contactView];
        [v31 contentOffset];
        double v33 = v32;
        double v35 = v34;

        long long v36 = [(CNContactContentDisplayViewController *)self contactView];
        [v36 beginUpdates];

        double v37 = [(CNContactContentDisplayViewController *)self contactView];
        double v38 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v30];
        [v37 reloadSections:v38 withRowAnimation:0];

        double v39 = [(CNContactContentDisplayViewController *)self contactView];
        [v39 endUpdates];

        uint64_t v40 = [(CNContactContentDisplayViewController *)self contactView];
        objc_msgSend(v40, "setContentOffset:", v33, v35);

        [(CNContactContentDisplayViewController *)self adjustPreferredContentSize];
      }
    }
  }
}

- (void)_setupContactBlockingActionPreservingChanges:(BOOL)a3 withUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v41 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  if ([v41 allowsContactBlocking])
  {
    BOOL v7 = [(CNContactContentDisplayViewController *)self showingMeContact];

    if (v7) {
      return;
    }
    id v8 = [(CNContactContentDisplayViewController *)self blockAction];

    uint64_t v9 = [(CNContactContentDisplayViewController *)self blockAction];

    if (!v9)
    {
      id v10 = [CNContactToggleBlockCallerAction alloc];
      int v11 = [(CNContactContentDisplayViewController *)self contact];
      uint64_t v12 = [(CNContactAction *)v10 initWithContact:v11];
      [(CNContactContentDisplayViewController *)self setBlockAction:v12];

      uint64_t v13 = [(CNContactContentDisplayViewController *)self blockAction];
      [v13 setDelegate:self];

      uint64_t v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v14 addObserver:self selector:sel_blockListDidChange_ name:*MEMORY[0x1E4F59E40] object:0];
    }
    int v15 = [(CNContactContentDisplayViewController *)self blockAction];
    int v16 = [v15 isContactBlockedPreservingChanges:v5];

    if (v8)
    {
      long long v17 = CNContactsUIBundle();
      id v18 = v17;
      if (v16) {
        id v19 = @"BLOCK_THIS_CALLER";
      }
      else {
        id v19 = @"UNBLOCK_THIS_CALLER";
      }
      uint64_t v20 = [v17 localizedStringForKey:v19 value:&stru_1ED8AC728 table:@"Localized"];

      id v21 = [(CNContactContentDisplayViewController *)self cardBlockContactGroup];
      [v21 removeActionWithTitle:v20];
    }
    id v22 = CNContactsUIBundle();
    long long v23 = v22;
    if (v16)
    {
      id v41 = [v22 localizedStringForKey:@"UNBLOCK_THIS_CALLER" value:&stru_1ED8AC728 table:@"Localized"];

      long long v24 = [(CNContactContentDisplayViewController *)self cardBlockContactGroup];
      [v24 removeActionWithTitle:v41];

      +[CNUIColorRepository contactsApplicationTintColor];
    }
    else
    {
      id v41 = [v22 localizedStringForKey:@"BLOCK_THIS_CALLER" value:&stru_1ED8AC728 table:@"Localized"];

      long long v25 = [(CNContactContentDisplayViewController *)self cardBlockContactGroup];
      [v25 removeActionWithTitle:v41];

      +[CNUIColorRepository contactCardDestructiveActionTitleTextColor];
    long long v26 = };
    double v27 = [(CNContactContentDisplayViewController *)self cardBlockContactGroup];
    uint64_t v28 = [(CNContactContentDisplayViewController *)self blockAction];
    [v27 addAction:v28 withTitle:v41 color:v26 transportType:0];

    if (v4)
    {
      double v29 = [(CNContactContentDisplayViewController *)self cardBlockContactGroup];
      int64_t v30 = [(CNContactContentDisplayViewController *)self sectionOfGroup:v29];

      if (v30 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v31 = [(CNContactContentDisplayViewController *)self contactView];
        [v31 contentOffset];
        double v33 = v32;
        double v35 = v34;

        long long v36 = [(CNContactContentDisplayViewController *)self contactView];
        [v36 beginUpdates];

        double v37 = [(CNContactContentDisplayViewController *)self contactView];
        double v38 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v30];
        [v37 reloadSections:v38 withRowAnimation:0];

        double v39 = [(CNContactContentDisplayViewController *)self contactView];
        [v39 endUpdates];

        uint64_t v40 = [(CNContactContentDisplayViewController *)self contactView];
        objc_msgSend(v40, "setContentOffset:", v33, v35);

        [(CNContactContentDisplayViewController *)self adjustPreferredContentSize];
      }
    }
  }
}

- (void)setupShareLocationActionReload:(BOOL)a3
{
  if (![(CNContactContentDisplayViewController *)self showingMeContact] && !CNUIIsMessages())
  {
    BOOL v5 = [(CNContactContentDisplayViewController *)self cardShareLocationGroup];
    [v5 setDisplaysDropdownMenu:1];

    uint64_t v6 = [(CNContactContentDisplayViewController *)self cardShareLocationGroup];
    BOOL v7 = [(CNContactContentDisplayViewController *)self shareLocationController];
    [v6 removeActionWithTarget:v7 selector:sel_perform_];

    objc_initWeak(&location, self);
    id v8 = [(CNContactContentDisplayViewController *)self shareLocationController];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __72__CNContactContentDisplayViewController_setupShareLocationActionReload___block_invoke;
    v9[3] = &unk_1E549B9B0;
    objc_copyWeak(&v10, &location);
    BOOL v11 = a3;
    [v8 canShareWithCompletion:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __72__CNContactContentDisplayViewController_setupShareLocationActionReload___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v5 = WeakRetained;
  if (a2)
  {
    uint64_t v6 = [WeakRetained actionProvider];
    BOOL v7 = [v5 shareLocationController];
    [v6 buildSharingLocationActionsWithShareLocationController:v7];

    objc_initWeak(&location, v5);
    id v8 = [v5 shareLocationController];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __72__CNContactContentDisplayViewController_setupShareLocationActionReload___block_invoke_2;
    v9[3] = &unk_1E549B9B0;
    objc_copyWeak(&v10, &location);
    char v11 = *(unsigned char *)(a1 + 40);
    [v8 isSharingWithCompletion:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __72__CNContactContentDisplayViewController_setupShareLocationActionReload___block_invoke_2(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__CNContactContentDisplayViewController_setupShareLocationActionReload___block_invoke_3;
  v5[3] = &unk_1E549ADF8;
  v5[4] = WeakRetained;
  char v6 = a2;
  char v7 = *(unsigned char *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __72__CNContactContentDisplayViewController_setupShareLocationActionReload___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) actionProvider];
  id v7 = [v2 appropriateLocationSharingActionWhenSharing:*(unsigned __int8 *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) cardShareLocationGroup];
  BOOL v4 = [v7 title];
  [v3 addAction:v7 withTitle:v4];

  if ([*(id *)(a1 + 32) shouldAddShareLocationGroup]) {
    [*(id *)(a1 + 32) _addShareLocationGroupAnimated:1];
  }
  if (*(unsigned char *)(a1 + 41))
  {
    BOOL v5 = *(void **)(a1 + 32);
    char v6 = [v5 cardShareLocationGroup];
    [v5 reloadCardGroup:v6];
  }
}

- (void)_setupCardActions
{
  id v3 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  int v4 = [v3 allowsActions];

  if (!v4) {
    return;
  }
  BOOL v5 = [(CNContactContentDisplayViewController *)self actionProvider];
  [v5 buildStandardActions];

  char v6 = [(CNContactContentDisplayViewController *)self actionProvider];
  [v6 buildCommunicationLimitsActions];

  id v7 = [(CNContactContentDisplayViewController *)self actionProvider];
  [v7 buildStaticIdentityActions];

  id v8 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  if (![v8 allowsCardActions]) {
    goto LABEL_26;
  }
  uint64_t v9 = [(CNContactContentDisplayViewController *)self contact];
  char v10 = [v9 isSuggested];

  if (v10) {
    goto LABEL_27;
  }
  char v11 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  if ([v11 allowsSendMessage])
  {
    uint64_t v12 = [(CNContactContentDisplayViewController *)self actionProvider];
    uint64_t v13 = [v12 sendMessageAction];
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      int v15 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
      int v16 = [v15 primaryProperty];

      if (v16) {
        goto LABEL_10;
      }
      char v11 = [(CNContactContentDisplayViewController *)self cardActionsGroup];
      uint64_t v12 = [(CNContactContentDisplayViewController *)self actionProvider];
      long long v17 = [v12 sendMessageAction];
      id v18 = CNContactsUIBundle();
      id v19 = [v18 localizedStringForKey:@"PHONE_ACTION_TEXT" value:&stru_1ED8AC728 table:@"Localized"];
      [v11 addAction:v17 withTitle:v19];
    }
  }

LABEL_10:
  uint64_t v20 = [(CNContactContentDisplayViewController *)self actionProvider];
  id v21 = [v20 createReminderAction];

  if (v21)
  {
    id v22 = [(CNContactContentDisplayViewController *)self cardActionsGroup];
    long long v23 = [(CNContactContentDisplayViewController *)self actionProvider];
    long long v24 = [v23 createReminderAction];
    long long v25 = CNContactsUIBundle();
    long long v26 = [v25 localizedStringForKey:@"CREATE_REMINDER_ACTION" value:&stru_1ED8AC728 table:@"Localized"];
    [v22 addAction:v24 withTitle:v26];
  }
  BOOL v27 = [(CNContactContentDisplayViewController *)self isHeaderViewPhotoProhibited];
  uint64_t v28 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  if (![v28 allowsSharing] || v27) {
    goto LABEL_16;
  }
  double v29 = [(CNContactContentDisplayViewController *)self actionProvider];
  int64_t v30 = [v29 shareContactAction];

  if (v30)
  {
    uint64_t v28 = [(CNContactContentDisplayViewController *)self cardActionsGroup];
    id v31 = [(CNContactContentDisplayViewController *)self actionProvider];
    double v32 = [v31 shareContactAction];
    double v33 = CNContactsUIBundle();
    double v34 = [v33 localizedStringForKey:@"SHARE_CONTACT_ACTION_BUTTON_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
    [v28 addAction:v32 withTitle:v34];

LABEL_16:
  }
  double v35 = [(CNContactContentDisplayViewController *)self actionProvider];
  long long v36 = [v35 addFavoriteAction];

  if (v36)
  {
    double v37 = [(CNContactContentDisplayViewController *)self cardActionsGroup];
    double v38 = [(CNContactContentDisplayViewController *)self actionProvider];
    double v39 = [v38 addFavoriteAction];
    uint64_t v40 = CNContactsUIBundle();
    id v41 = [v40 localizedStringForKey:@"PHONE_ACTION_ADD_TO_FAVORITES" value:&stru_1ED8AC728 table:@"Localized"];
    [v37 addAction:v39 withTitle:v41];
  }
  double v42 = [(CNContactContentDisplayViewController *)self actionProvider];
  id v8 = [v42 shareWithFamilyAction];

  if (v8 && [v8 canPerformAction])
  {
    double v43 = [(CNContactContentDisplayViewController *)self cardActionsGroup];
    double v44 = [v8 title];
    [v43 addAction:v8 withTitle:v44];
  }
  uint64_t v45 = [(CNContactContentDisplayViewController *)self actionProvider];
  double v46 = [v45 stopSharingWithFamilyAction];
  int v47 = [v46 canPerformAction];

  if (v47)
  {
    double v48 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
    int v49 = [v48 ignoresParentalRestrictions];

    if (v49)
    {
      uint64_t v50 = [(CNContactContentDisplayViewController *)self cardActionsGroup];
      double v51 = [(CNContactContentDisplayViewController *)self actionProvider];
      double v52 = [v51 stopSharingWithFamilyAction];
      double v53 = [(CNContactContentDisplayViewController *)self actionProvider];
      BOOL v54 = [v53 stopSharingWithFamilyAction];
      int v55 = [v54 title];
      [v50 addAction:v52 withTitle:v55];
    }
  }
  [(CNContactContentDisplayViewController *)self setupShareLocationActionReload:0];
LABEL_26:

LABEL_27:
  v56 = [(CNContactContentDisplayViewController *)self _clearRecentsDataAction];
  [(CNContactContentDisplayViewController *)self setClearRecentsDataAction:v56];

  v57 = [(CNContactContentDisplayViewController *)self clearRecentsDataAction];

  if (v57)
  {
    uint64_t v58 = [(CNContactContentDisplayViewController *)self clearRecentsDataAction];
    [v58 setDelegate:self];

    id v62 = [(CNContactContentDisplayViewController *)self cardActionsGroup];
    id v59 = [(CNContactContentDisplayViewController *)self clearRecentsDataAction];
    uint64_t v60 = CNContactsUIBundle();
    uint64_t v61 = [v60 localizedStringForKey:@"CLEAR_RECENTS" value:&stru_1ED8AC728 table:@"Localized"];
    [v62 addAction:v59 withTitle:v61];
  }
}

- (void)_retrieveActionsModelPreservingChanges:(BOOL)a3
{
  BOOL v5 = [(CNContactContentDisplayViewController *)self contact];

  if (v5)
  {
    if (!a3)
    {
      objc_initWeak(&location, self);
      char v6 = [MEMORY[0x1E4F5A720] allActionTypes];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __80__CNContactContentDisplayViewController__retrieveActionsModelPreservingChanges___block_invoke;
      void v7[3] = &unk_1E549B918;
      v7[4] = self;
      objc_copyWeak(&v8, &location);
      [v6 enumerateObjectsUsingBlock:v7];

      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

void __80__CNContactContentDisplayViewController__retrieveActionsModelPreservingChanges___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) actionsDataSource];
  BOOL v5 = [*(id *)(a1 + 32) contact];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__CNContactContentDisplayViewController__retrieveActionsModelPreservingChanges___block_invoke_2;
  v8[3] = &unk_1E549B8F0;
  id v6 = v3;
  id v9 = v6;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  id v7 = (id)[v4 consumer:0 actionModelsForContact:v5 actionType:v6 handler:v8];

  objc_destroyWeak(&v10);
}

void __80__CNContactContentDisplayViewController__retrieveActionsModelPreservingChanges___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isEqual:*MEMORY[0x1E4F1AD20]])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __80__CNContactContentDisplayViewController__retrieveActionsModelPreservingChanges___block_invoke_3;
    v4[3] = &unk_1E549B670;
    objc_copyWeak(&v6, (id *)(a1 + 40));
    id v5 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v4);

    objc_destroyWeak(&v6);
  }
}

void __80__CNContactContentDisplayViewController__retrieveActionsModelPreservingChanges___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setContactSupportsTTYCalls:", objc_msgSend((id)objc_opt_class(), "actionModelIncludesTTY:", *(void *)(a1 + 32)));
  [WeakRetained _updateAvailableTransports];
}

- (void)setupActionsPreservingChanges:(BOOL)a3
{
  BOOL v29 = a3;
  BOOL v27 = [CNContactActionProvider alloc];
  long long v26 = [(CNContactContentDisplayViewController *)self mutableContact];
  uint64_t v28 = [(CNContactContentDisplayViewController *)self contactViewCache];
  int v4 = [(CNContactContentDisplayViewController *)self contact];
  id v5 = [v28 containerForContact:v4];
  id v6 = [(CNContactContentDisplayViewController *)self contactViewCache];
  id v7 = [v6 contactStore];
  id v8 = [(CNContactContentDisplayViewController *)self propertyGroupsDataSource];
  id v9 = [(CNContactContentDisplayViewController *)self actionsDataSource];
  id v10 = +[CNCapabilitiesManager defaultCapabilitiesManager];
  char v11 = [(CNContactContentDisplayViewController *)self environment];
  uint64_t v12 = [(CNContactActionProvider *)v27 initWithContact:v26 inContainer:v5 contactStore:v7 propertyGroupsDataSource:v8 actionsDataSource:v9 capabilities:v10 environment:v11];
  [(CNContactContentDisplayViewController *)self setActionProvider:v12];

  uint64_t v13 = [(CNContactContentDisplayViewController *)self actionProvider];
  [v13 setActionDelegate:self];

  uint64_t v14 = [(CNCardGroup *)self->_cardActionsGroup actions];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    int v16 = [CNCardGroup alloc];
    long long v17 = [(CNContactContentDisplayViewController *)self mutableContact];
    id v18 = [(CNCardGroup *)v16 initWithContact:v17];
    cardActionsGroup = self->_cardActionsGroup;
    self->_cardActionsGroup = v18;
  }
  uint64_t v20 = [(CNCardGroup *)self->_cardShareLocationGroup actions];
  uint64_t v21 = [v20 count];

  if (v21)
  {
    id v22 = [CNCardGroup alloc];
    long long v23 = [(CNContactContentDisplayViewController *)self mutableContact];
    long long v24 = [(CNCardGroup *)v22 initWithContact:v23];
    cardShareLocationGroup = self->_cardShareLocationGroup;
    self->_cardShareLocationGroup = v24;
  }
  [(CNContactContentDisplayViewController *)self _retrieveActionsModelPreservingChanges:v29];
  [(CNContactContentDisplayViewController *)self _setupCardActions];
  [(CNContactContentDisplayViewController *)self _setupContactBlockingActionPreservingChanges:v29 withUpdate:!v29];
  [(CNContactContentDisplayViewController *)self _setupSuggestionActions];
  [(CNContactContentDisplayViewController *)self _setupAddToAddressBookActions];

  [(CNContactContentDisplayViewController *)self _setupCustomActions];
}

- (void)_handleCoalescedBlockListDidChange
{
  if ([(CNContactContentDisplayViewController *)self shouldIgnoreBlockListChange])
  {
    [(CNContactContentDisplayViewController *)self setShouldIgnoreBlockListChange:0];
  }
  else
  {
    [(CNContactContentDisplayViewController *)self _setupContactBlockingActionPreservingChanges:0 withUpdate:1];
  }
}

- (void)blockListDidChange:(id)a3
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__handleCoalescedBlockListDidChange object:0];

  [(CNContactContentDisplayViewController *)self performSelector:sel__handleCoalescedBlockListDidChange withObject:0 afterDelay:0.1];
}

- (void)updateContactsViewWithBlock:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  ++self->_animating;
  id v8 = [(CNContactContentDisplayViewController *)self contactView];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__CNContactContentDisplayViewController_updateContactsViewWithBlock_completion___block_invoke;
  v13[3] = &unk_1E549B8A0;
  id v14 = v6;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__CNContactContentDisplayViewController_updateContactsViewWithBlock_completion___block_invoke_2;
  v11[3] = &unk_1E549B8C8;
  v11[4] = self;
  id v12 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBatchUpdates:v13 completion:v11];
}

uint64_t __80__CNContactContentDisplayViewController_updateContactsViewWithBlock_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__CNContactContentDisplayViewController_updateContactsViewWithBlock_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  --*(_DWORD *)(*(void *)(a1 + 32) + 988);
  id v3 = *(void **)(a1 + 32);

  return [v3 reloadDataIfNeeded];
}

- (CGSize)requiredSizeForVisibleTableView
{
  id v3 = [(CNContactContentDisplayViewController *)self contactView];
  [v3 contentSize];
  double v5 = v4;
  [v3 contentInset];
  double v7 = v6;
  if ([(CNContactContentDisplayViewController *)self hasTableViewHeaderFirstSection]
    && [(UIViewController *)self ab_isInPopover])
  {
    *(double *)&uint64_t v8 = 400.0;
  }
  else
  {
    *(double *)&uint64_t v8 = 0.0;
  }

  double v9 = *(double *)&v8;
  double v10 = v5 + v7;
  result.height = v10;
  result.width = v9;
  return result;
}

- (double)desiredHeightForWidth:(double)a3
{
  double v4 = [(CNContactContentDisplayViewController *)self view];
  [v4 frame];
  objc_msgSend(v4, "setFrame:");
  [(CNContactContentDisplayViewController *)self reloadDataIfNeeded];
  double v5 = [(CNContactContentDisplayViewController *)self contactView];
  id v6 = (id)[v5 visibleCells];

  double v7 = [(CNContactContentDisplayViewController *)self view];
  [v7 layoutIfNeeded];

  uint64_t v8 = [(CNContactContentDisplayViewController *)self contactHeaderView];
  [v8 setNeedsLayout];

  [(CNContactContentDisplayViewController *)self requiredSizeForVisibleTableView];
  double v10 = v9;
  char v11 = [v4 superview];
  [v11 frame];
  objc_msgSend(v4, "setFrame:");

  return v10;
}

- (void)reloadUnifiedContact
{
  id v3 = [(CNContactContentDisplayViewController *)self contact];
  double v4 = objc_opt_class();

  double v5 = [(CNContactContentDisplayViewController *)self contact];
  id v8 = [v5 linkedContacts];

  id v6 = v8;
  if (v8)
  {
    double v7 = [v4 unifyContacts:v8];
    [(CNContactContentDisplayViewController *)self setContact:v7];

    id v6 = v8;
  }
}

- (void)removeLinkedContact:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    double v5 = [(CNContactContentDisplayViewController *)self contact];
    id v6 = [v5 mainStoreLinkedContacts];
    int v7 = [v6 containsObject:v9];

    id v4 = v9;
    if (v7)
    {
      [(CNContactContentDisplayViewController *)self reloadDataPreservingChanges:1];
      id v8 = +[CNUIDataCollector sharedCollector];
      [v8 logContactActionType:CNUIContactActionTypeUnlink attributes:0];

      id v4 = v9;
    }
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
    id v5 = [(CNContactContentDisplayViewController *)self contact];
  }
  id v6 = v5;
  [(CNContactContentDisplayViewController *)self setContact:v5];
  [(CNContactContentDisplayViewController *)self _didCompleteWithContact:v6];
}

- (void)createdNewContact:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (v4)
  {
    [(CNContactContentDisplayViewController *)self setContact:v4];
    [(CNContactContentDisplayViewController *)self setMode:1];
    id v5 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
    [v5 setAllowsAddingToAddressBook:0];

    id v4 = v6;
  }
  [(CNContactContentDisplayViewController *)self _didCompleteWithContact:v4];
}

- (void)updateContact:(id)a3
{
  if ([(CNContactContentDisplayViewController *)self saveChanges])
  {
    id v4 = [(CNContactContentDisplayViewController *)self mutableContact];
    [(CNContactContentDisplayViewController *)self _didCompleteWithContact:v4];
  }
  else
  {
    [(CNContactContentDisplayViewController *)self _didCompleteWithContact:0];
  }

  [(CNContactContentDisplayViewController *)self reloadDataPreservingChanges:0];
}

- (BOOL)saveChanges
{
  return 1;
}

- (void)_didCompleteWithContact:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    id v16 = [(CNContactContentDisplayViewController *)self _removeUnauthorizedKeysFromContact:v4];

    if (self->_contact != &self->_mutableContact->super)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = [v16 copy];

        id v16 = (id)v6;
      }
    }
    id v7 = [(CNContactContentDisplayViewController *)self suggestedContactAction];
    [v7 confirmSuggestion];
  }
  else
  {
    id v16 = 0;
  }
  if ([(CNContactContentDisplayViewController *)self mode] == 3)
  {
    id v8 = [(CNContactContentDisplayViewController *)self originalContacts];
    uint64_t v9 = [v8 count];

    if (v9 == 1)
    {
      if (v16)
      {
        double v10 = +[CNUIDataCollector sharedCollector];
        char v11 = [(CNContactContentDisplayViewController *)self originalContacts];
        id v12 = [v11 objectAtIndexedSubscript:0];
        [v10 logContactCreated:v16 originalContact:v12];
      }
    }
  }
  uint64_t v13 = [(CNContactContentDisplayViewController *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    uint64_t v15 = [(CNContactContentDisplayViewController *)self delegate];
    [v15 contactDisplayViewController:self didCompleteWithContact:v16];
  }
}

- (id)_removeUnauthorizedKeysFromContact:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactContentDisplayViewController *)self missingRequiredKeys];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = (void *)[v4 mutableCopy];
    id v8 = [(CNContactContentDisplayViewController *)self missingRequiredKeys];
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
    id v12 = [v8 second];
    [(CNContactContentDisplayViewController *)self setMissingRequiredKeys:v12];

    uint64_t v24 = 0;
    long long v25 = &v24;
    uint64_t v26 = 0x3032000000;
    BOOL v27 = __Block_byref_object_copy__58439;
    uint64_t v28 = __Block_byref_object_dispose__58440;
    id v29 = 0;
    id v13 = objc_alloc(MEMORY[0x1E4F1B908]);
    char v14 = [(CNContactContentDisplayViewController *)self missingRequiredKeys];
    uint64_t v15 = (void *)[v13 initWithKeysToFetch:v14];

    id v16 = (void *)MEMORY[0x1E4F1B8F8];
    long long v17 = [v6 identifier];
    v30[0] = v17;
    id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    id v19 = [v16 predicateForContactsWithIdentifiers:v18];
    [v15 setPredicate:v19];

    objc_msgSend(v15, "setUnifyResults:", objc_msgSend(v6, "isUnified"));
    uint64_t v20 = [(CNContactContentDisplayViewController *)self contactStore];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __88__CNContactContentDisplayViewController__updateContact_withMissingKeysFromRequiredKeys___block_invoke;
    v23[3] = &unk_1E549B878;
    v23[4] = &v24;
    [v20 enumerateContactsWithFetchRequest:v15 error:0 usingBlock:v23];

    uint64_t v21 = (void *)[v6 mutableCopy];
    [v21 overwriteStateFromContact:v25[5]];
    id v11 = [v21 freeze];

    _Block_object_dispose(&v24, 8);
  }

  return v11;
}

void __88__CNContactContentDisplayViewController__updateContact_withMissingKeysFromRequiredKeys___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (id)saveDescriptionForRemovingLinkedContact:(id)a3 keys:(id)a4
{
  id v5 = a4;
  id v6 = [(CNContactContentDisplayViewController *)self contact];
  int v7 = [v6 isUnified];

  if (v7)
  {
    id v8 = [(CNContactContentDisplayViewController *)self contact];
    uint64_t v9 = [v8 mainStoreLinkedContacts];
    uint64_t v10 = [v9 mutableCopy];
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F1CA48];
    id v8 = [(CNContactContentDisplayViewController *)self contact];
    uint64_t v9 = (void *)[v8 copyWithPropertyKeys:v5];
    uint64_t v10 = [v11 arrayWithObject:v9];
  }
  id v12 = (void *)v10;

  id v13 = [CNUIContactSaveConfiguration alloc];
  char v14 = [(CNContactContentDisplayViewController *)self contact];
  uint64_t v15 = [(CNContactContentDisplayViewController *)self mutableContact];
  id v16 = [(CNContactContentDisplayViewController *)self contactStore];
  long long v17 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  uint64_t v18 = [v17 ignoresParentalRestrictions];
  id v19 = [(CNContactContentDisplayViewController *)self editAuthorizationManager];
  uint64_t v20 = -[CNUIContactSaveConfiguration initWithContact:mutableContact:editingLinkedContacts:contactStore:ignoresParentalRestrictions:saveWasAuthorized:](v13, "initWithContact:mutableContact:editingLinkedContacts:contactStore:ignoresParentalRestrictions:saveWasAuthorized:", v14, v15, v12, v16, v18, [v19 saveWasAuthorized]);

  return v20;
}

- (void)_updateLabelWidthsForAllVisibleCells
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(CNContactContentDisplayViewController *)self contactView];
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
        [(CNContactContentDisplayViewController *)self _updateLabelWidthForCell:*(void *)(*((void *)&v13 + 1) + 8 * v12++)];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  objc_msgSend(v3, "setContentOffset:", v5, v7);
  [(CNContactContentDisplayViewController *)self adjustPreferredContentSize];
}

- (void)_updateLabelWidthForCellsInGroup:(id)a3 reset:(BOOL)a4
{
  BOOL v4 = a4;
  id v14 = a3;
  double v6 = [(CNContactContentDisplayViewController *)self contactView];
  if (v4)
  {
    double v7 = [(CNContactContentDisplayViewController *)self _labelWidthKeyForGroup:v14];
    id v8 = [(CNContactContentDisplayViewController *)self cachedLabelWidths];
    [v8 removeObjectForKey:v7];
  }
  [(CNContactContentDisplayViewController *)self _updateCachedLabelWidthsForGroup:v14];
  int64_t v9 = [(CNContactContentDisplayViewController *)self sectionOfGroup:v14];
  uint64_t v10 = [v14 displayItems];
  if ([v10 count])
  {
    unint64_t v11 = 0;
    do
    {
      uint64_t v12 = [MEMORY[0x1E4F28D58] indexPathForRow:v11 inSection:v9];
      long long v13 = [v6 cellForRowAtIndexPath:v12];
      [(CNContactContentDisplayViewController *)self _updateLabelWidthForCell:v13];

      ++v11;
    }
    while (v11 < [v10 count]);
  }
}

- (void)_updateLabelWidthForCell:(id)a3
{
  id v15 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  double v5 = v15;
  if (isKindOfClass)
  {
    id v6 = v15;
    char v7 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
    id v8 = [v6 propertyItem];
    int64_t v9 = v8;
    if (v7)
    {
      uint64_t v10 = [(CNContactContentDisplayViewController *)self _labelWidthKeyForItem:v8];
    }
    else
    {
      unint64_t v11 = [v8 group];
      uint64_t v10 = [(CNContactContentDisplayViewController *)self _labelWidthKeyForGroup:v11];
    }
    uint64_t v12 = [(CNContactContentDisplayViewController *)self cachedLabelWidths];
    long long v13 = [v12 objectForKey:v10];
    [v13 floatValue];
    [v6 setLabelWidth:v14];

    double v5 = v15;
  }
}

- (void)_updateCachedLabelWidthsIfNeeded
{
  id v3 = [(CNContactContentDisplayViewController *)self cachedLabelWidths];

  if (!v3)
  {
    BOOL v4 = [(CNContactContentDisplayViewController *)self traitCollection];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if (v5 == 3)
    {
      [(CNContactContentDisplayViewController *)self _updateCachedLabelWidths];
    }
  }
}

- (void)_setNeedsUpdateCachedLabelWidths
{
  [(CNContactContentDisplayViewController *)self setCachedLabelWidths:0];
  if ([(CNContactContentDisplayViewController *)self isViewLoaded])
  {
    id v3 = [(CNContactContentDisplayViewController *)self view];
    [v3 setNeedsLayout];
  }
}

- (void)_updateCachedLabelWidths
{
  id v3 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
  [(CNContactContentDisplayViewController *)self setCachedLabelWidths:v3];

  BOOL v4 = [(CNContactContentDisplayViewController *)self displayGroups];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = 0;
    do
    {
      char v7 = [(CNContactContentDisplayViewController *)self displayGroups];
      id v8 = [v7 objectAtIndexedSubscript:v6];

      [(CNContactContentDisplayViewController *)self _updateCachedLabelWidthsForGroup:v8];
      ++v6;
      int64_t v9 = [(CNContactContentDisplayViewController *)self displayGroups];
      unint64_t v10 = [v9 count];
    }
    while (v6 < v10);
  }

  [(CNContactContentDisplayViewController *)self _updateLabelWidthsForAllVisibleCells];
}

- (void)_updateCachedLabelWidthsForGroup:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v4 = objc_msgSend(a3, "displayItems", 0);
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
        [(CNContactContentDisplayViewController *)self _updateCachedLabelWidthsForItem:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
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
    uint64_t v8 = [(CNContactContentDisplayViewController *)self contactView];
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
    long long v13 = [(CNContactContentDisplayViewController *)self contactView];
    [v13 frame];
    double Width = CGRectGetWidth(v39);
    if (v7)
    {
      id v15 = [(CNContactContentDisplayViewController *)self contactView];
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
    uint64_t v20 = [(CNContactContentDisplayViewController *)self contactView];
    uint64_t v21 = [v20 labelTextAttributes];
    id v22 = (void *)[v18 initWithString:v19 attributes:v21];

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
    BOOL v27 = [(CNContactContentDisplayViewController *)self _labelWidthKeyForGroup:v26];
    uint64_t v28 = [(CNContactContentDisplayViewController *)self _labelWidthKeyForItem:v6];
    id v29 = [(CNContactContentDisplayViewController *)self cachedLabelWidths];
    int64_t v30 = [v29 objectForKey:v27];
    [v30 floatValue];
    float v32 = v31;

    if (v25 > 0.0)
    {
      double v33 = [(CNContactContentDisplayViewController *)self cachedLabelWidths];
      double v34 = [NSNumber numberWithDouble:v25];
      [v33 setObject:v34 forKey:v28];

      if (v25 > v32)
      {
        double v35 = [(CNContactContentDisplayViewController *)self cachedLabelWidths];
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

- (void)removeFirstSectionHeaderViewControllerFromHierarchy
{
  id v3 = [(CNContactContentDisplayViewController *)self personHeaderViewController];
  id v4 = [v3 parentViewController];

  if (v4)
  {
    uint64_t v5 = [(CNContactContentDisplayViewController *)self personHeaderViewController];
    [v5 willMoveToParentViewController:0];

    id v6 = [(CNContactContentDisplayViewController *)self personHeaderViewController];
    int v7 = [v6 isViewLoaded];

    if (v7)
    {
      uint64_t v8 = [(CNContactContentDisplayViewController *)self personHeaderViewController];
      long long v9 = [v8 view];
      [v9 removeFromSuperview];
    }
    id v10 = [(CNContactContentDisplayViewController *)self personHeaderViewController];
    [v10 removeFromParentViewController];
  }
}

- (unint64_t)tableViewSectionIndexFromGroupIndex:(unint64_t)a3
{
  return a3
       + [(CNContactContentDisplayViewController *)self hasTableViewHeaderFirstSection];
}

- (unint64_t)groupIndexFromTableViewSectionIndex:(unint64_t)a3
{
  return a3
       - [(CNContactContentDisplayViewController *)self hasTableViewHeaderFirstSection];
}

- (BOOL)isTableViewHeaderFirstSectionIndexPath:(id)a3
{
  id v4 = a3;
  if ([(CNContactContentDisplayViewController *)self hasTableViewHeaderFirstSection]) {
    BOOL v5 = [v4 section] == 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)tableViewHeaderFirstSectionCell
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(CNContactContentDisplayViewController *)self contactView];
  id v4 = [v3 dequeueReusableCellWithIdentifier:@"FirstSectionCellIdentifier"];
  if (!v4)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"FirstSectionCellIdentifier"];
    [v4 setSelectionStyle:0];
    [v4 setSeparatorStyle:0];
    objc_msgSend(v4, "_cnui_applyContactStyle");
  }
  BOOL v5 = self;
  id v6 = [(CNContactContentDisplayViewController *)v5 personHeaderViewController];
  int v7 = [v6 parentViewController];

  if (v7 != v5)
  {
    [(CNContactContentDisplayViewController *)v5 removeFirstSectionHeaderViewControllerFromHierarchy];
    uint64_t v8 = [(CNContactContentDisplayViewController *)v5 personHeaderViewController];
    [(CNContactContentDisplayViewController *)v5 addChildViewController:v8];

    long long v9 = [(CNContactContentDisplayViewController *)v5 personHeaderViewController];
    id v10 = [v9 view];

    double v11 = [v4 contentView];
    [v11 addSubview:v10];

    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v12 = [v4 contentView];
    long long v13 = [v12 layoutMarginsGuide];

    uint64_t v20 = @"personHeaderView";
    v21[0] = v10;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    id v15 = [MEMORY[0x1E4F1CA48] array];
    double v16 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:[personHeaderView]|" options:0 metrics:0 views:v14];
    [v15 addObjectsFromArray:v16];

    double v17 = [MEMORY[0x1E4F28DC8] constraintWithItem:v10 attribute:5 relatedBy:0 toItem:v13 attribute:5 multiplier:1.0 constant:0.0];
    [v15 addObject:v17];

    id v18 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[personHeaderView]|" options:0 metrics:0 views:v14];
    [v15 addObjectsFromArray:v18];

    [MEMORY[0x1E4F28DC8] activateConstraints:v15];
  }

  return v4;
}

- (BOOL)hasTableViewHeaderFirstSection
{
  uint64_t v2 = [(CNContactContentDisplayViewController *)self personHeaderViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)geminiDataSourceDidUpdate:(id)a3
{
  id v7 = [a3 geminiResult];
  BOOL v4 = [(CNContactContentDisplayViewController *)self shouldShowGemini];
  BOOL v5 = [(CNContactContentDisplayViewController *)self contactHeaderView];
  [v5 updateGeminiResult:v7];

  id v6 = [(CNContactContentDisplayViewController *)self contactHeaderView];
  [v6 setShouldShowGemini:v4];
}

- (void)setMenuProviderForCell:(id)a3 forActionGroupItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    goto LABEL_4;
  }
  uint64_t v8 = [(CNContactContentDisplayViewController *)self cardShareLocationGroup];
  long long v9 = [v8 actions];
  id v10 = [v7 actions];
  int v11 = [v9 isEqualToArray:v10];

  if (v11)
  {
    double v12 = [(CNContactContentDisplayViewController *)self shareLocationController];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __83__CNContactContentDisplayViewController_setMenuProviderForCell_forActionGroupItem___block_invoke;
    v23[3] = &unk_1E549B788;
    id v24 = v6;
    [v12 actionsMenuProviderWithCompletion:v23];
  }
  else
  {
LABEL_4:
    long long v13 = [v7 actions];
    uint64_t v14 = [v13 firstObject];

    objc_opt_class();
    id v15 = v14;
    if (objc_opt_isKindOfClass()) {
      double v16 = v15;
    }
    else {
      double v16 = 0;
    }
    id v17 = v16;

    if (v17)
    {
      id v18 = [v17 menuProvider];
      [v6 setMenuProvider:v18];
    }
    else
    {
      id v19 = [v15 target];
      if ([v19 conformsToProtocol:&unk_1ED94A278]) {
        uint64_t v20 = v19;
      }
      else {
        uint64_t v20 = 0;
      }
      id v18 = v20;

      if (v18)
      {
        uint64_t v21 = [v6 contextMenuInteraction];
        id v22 = [v18 menuProviderForContextMenuInteraction:v21];
        [v6 setMenuProvider:v22];
      }
    }
  }
}

void __83__CNContactContentDisplayViewController_setMenuProviderForCell_forActionGroupItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __83__CNContactContentDisplayViewController_setMenuProviderForCell_forActionGroupItem___block_invoke_2;
  v5[3] = &unk_1E549B710;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __83__CNContactContentDisplayViewController_setMenuProviderForCell_forActionGroupItem___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMenuProvider:*(void *)(a1 + 40)];
}

- (id)_cellForIndexPath:(id)a3
{
  id v5 = a3;
  id v6 = [(CNContactContentDisplayViewController *)self _itemAtIndexPath:v5];
  id v7 = [(CNContactContentDisplayViewController *)self _cellIdentifierForIndexPath:v5];
  uint64_t v8 = [(CNContactContentDisplayViewController *)self noteCell];
  if (!v8) {
    goto LABEL_4;
  }
  long long v9 = (void *)v8;
  id v10 = [(CNContactContentDisplayViewController *)self contactView];
  int v11 = objc_opt_class();
  double v12 = [v11 cellIdentifierForClass:objc_opt_class()];
  int v13 = [v7 isEqualToString:v12];

  if (v13)
  {
    uint64_t v14 = [(CNContactContentDisplayViewController *)self noteCell];
    [(CNContactContentDisplayViewController *)self setNoteCell:0];
  }
  else
  {
LABEL_4:
    id v15 = [(CNContactContentDisplayViewController *)self contactView];
    uint64_t v14 = [v15 dequeueReusableCellWithIdentifier:v7];
  }
  if (!v14)
  {
    double v48 = [MEMORY[0x1E4F28B00] currentHandler];
    [v48 handleFailureInMethod:a2, self, @"CNContactContentDisplayViewController.m", 3093, @"We couldn’t create a cell with identifier: %@ indexPath: %@", v7, v5 object file lineNumber description];
  }
  if ([(CNContactContentDisplayViewController *)self mode] == 5)
  {
    objc_opt_class();
    id v16 = v6;
    if (objc_opt_isKindOfClass()) {
      id v17 = v16;
    }
    else {
      id v17 = 0;
    }
    id v18 = v17;

    if (v18)
    {
      id v19 = [(CNContactContentDisplayViewController *)self highlightedProperties];
      if ([v19 count])
      {
        uint64_t v20 = [(CNContactContentDisplayViewController *)self highlightedProperties];
        uint64_t v21 = [v18 contactProperty];
        int v22 = [v20 containsObject:v21];

        if (v22 && (objc_opt_respondsToSelector() & 1) != 0) {
          [v14 setForceSuggested:1];
        }
      }
      else
      {
      }
    }
  }
  if (objc_opt_respondsToSelector()) {
    [v14 setDelegate:self];
  }
  [v14 setCardGroupItem:v6];
  if (objc_opt_respondsToSelector())
  {
    double v23 = [(CNContactContentDisplayViewController *)self presentingDelegate];
    [v14 setPresentingDelegate:v23];
  }
  if (objc_opt_respondsToSelector())
  {
    id v24 = [(CNContactContentDisplayViewController *)self contactView];
    double v25 = objc_opt_class();
    uint64_t v26 = [v25 cellIdentifierForClass:objc_opt_class()];
    int v27 = [v7 isEqualToString:v26];

    uint64_t v28 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
    uint64_t v29 = [v28 allowsEditing];
    uint64_t v30 = v29;
    if (v27)
    {
      if (v29)
      {
        float v31 = [(CNContactContentDisplayViewController *)self editAuthorizationManager];
        objc_msgSend(v14, "setAllowsEditing:", objc_msgSend(v31, "shouldPromptForPasscodeAuthorization") ^ 1);

LABEL_29:
        goto LABEL_30;
      }
      float v32 = v14;
      uint64_t v30 = 0;
    }
    else
    {
      float v32 = v14;
    }
    [v32 setAllowsEditing:v30];
    goto LABEL_29;
  }
LABEL_30:
  if (objc_opt_respondsToSelector())
  {
    double v33 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
    objc_msgSend(v14, "setAllowsActions:", objc_msgSend(v33, "allowsActions"));
  }
  if (objc_opt_respondsToSelector())
  {
    id v34 = v14;
    double v35 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
    objc_msgSend(v34, "setVIP:", objc_msgSend(v35, "isMailVIP"));
  }
  if (objc_opt_respondsToSelector())
  {
    id v36 = v14;
    id v37 = [(CNContactContentDisplayViewController *)self emergencyNumberIdentifier];
    double v38 = [v36 propertyItem];
    CGRect v39 = [v38 contactProperty];
    CGRect v40 = [v39 identifier];
    objc_msgSend(v36, "setEmergencyPhoneNumber:", objc_msgSend(v37, "isEqualToString:", v40));
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v41 = v6;
    if (objc_opt_isKindOfClass()) {
      double v42 = v41;
    }
    else {
      double v42 = 0;
    }
    id v43 = v42;

    objc_opt_class();
    id v44 = v14;
    if (objc_opt_isKindOfClass()) {
      uint64_t v45 = v44;
    }
    else {
      uint64_t v45 = 0;
    }
    id v46 = v45;

    [(CNContactContentDisplayViewController *)self setMenuProviderForCell:v46 forActionGroupItem:v43];
  }

  return v14;
}

- (id)_cellIdentifierForIndexPath:(id)a3
{
  id v5 = a3;
  id v6 = [(CNContactContentDisplayViewController *)self _itemAtIndexPath:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v6 property];
    uint64_t v8 = +[CNContactView cellIdentifierForProperty:v7];
    goto LABEL_3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = +[CNContactView cellIdentifierForPropertyPlaceholder];
    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = -[CNContactContentDisplayViewController _cardGroupAtTableViewSectionIndex:](self, "_cardGroupAtTableViewSectionIndex:", [v5 section]);
    if ([v7 useSplitActions])
    {
      uint64_t v8 = +[CNContactView cellIdentifierForSplitActions];
    }
    else
    {
      if ([v7 displaysDropdownMenu]) {
        +[CNContactView cellIdentifierForDropdownMenuActions];
      }
      else {
      uint64_t v8 = +[CNContactView cellIdentifierForActions];
      }
    }
LABEL_3:
    long long v9 = (void *)v8;

    if (v9) {
      goto LABEL_23;
    }
    goto LABEL_26;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = +[CNContactView cellIdentifierForFaceTimeGroup];
    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = +[CNContactView cellIdentifierForLinkedCardsGroup];
    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = +[CNContactView cellIdentifierForLinkedCardsPlaceholderGroup];
    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = +[CNContactView cellIdentifierForCardNamePickingGroup];
LABEL_22:
    long long v9 = (void *)v10;
    if (v10) {
      goto LABEL_23;
    }
  }
LABEL_26:
  double v12 = [MEMORY[0x1E4F28B00] currentHandler];
  [v12 handleFailureInMethod:a2, self, @"CNContactContentDisplayViewController.m", 3073, @"Unknown group item: %@", v6 object file lineNumber description];

  long long v9 = 0;
LABEL_23:

  return v9;
}

- (void)_scrollContactView:(id)a3 toVisibleGroup:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  [v16 _effectiveContentInset];
  objc_msgSend(v16, "setContentOffset:", 0.0, -v7);
  if (v6)
  {
    int64_t v8 = [(CNContactContentDisplayViewController *)self sectionOfGroup:v6];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v9 = v8;
      uint64_t v10 = [v6 displayItems];
      uint64_t v11 = (uint64_t)(double)((unint64_t)[v10 count] >> 1);

      double v12 = [MEMORY[0x1E4F28D58] indexPathForRow:v11 inSection:v9];
      uint64_t v13 = [v16 numberOfSections];
      if (v13 > [v12 section])
      {
        uint64_t v14 = objc_msgSend(v16, "numberOfRowsInSection:", objc_msgSend(v12, "section"));
        if (v14 > [v12 row])
        {
LABEL_7:
          if (!v12) {
            goto LABEL_10;
          }
          [v16 scrollToRowAtIndexPath:v12 atScrollPosition:2 animated:0];
          goto LABEL_9;
        }
        if (objc_msgSend(v16, "numberOfRowsInSection:", objc_msgSend(v12, "section")) >= 1)
        {
          uint64_t v15 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:v9];

          double v12 = (void *)v15;
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
  double v7 = [v4 tableHeaderView];
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
    double v12 = objc_msgSend(v4, "visibleCells", 0);
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
        id v17 = *(void **)(*((void *)&v23 + 1) + 8 * v16);
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
      uint64_t v20 = [v19 propertyItem];
      uint64_t v21 = [v20 property];
      id v18 = [(CNContactContentDisplayViewController *)self cardGroupForProperty:v21];

      double v12 = v19;
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
  [(CNContactContentDisplayViewController *)self reloadDataPreservingChanges:0];
  return 1;
}

- (void)setNeedsReloadLazy
{
  self->_needsReload = 1;
}

- (void)setNeedsReload
{
  self->_needsReload = 1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__CNContactContentDisplayViewController_setNeedsReload__block_invoke;
  block[3] = &unk_1E549B488;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __55__CNContactContentDisplayViewController_setNeedsReload__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadDataIfNeeded];
}

- (BOOL)isSuggestedContact
{
  uint64_t v2 = [(CNContactContentDisplayViewController *)self contact];
  char v3 = [v2 isSuggested];

  return v3;
}

- (BOOL)contactDisplayViewController:(id)a3 shouldPerformDefaultActionForContact:(id)a4 propertyKey:(id)a5 propertyIdentifier:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  double v12 = [(CNContactContentDisplayViewController *)self delegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    uint64_t v14 = [(CNContactContentDisplayViewController *)self delegate];
    char v15 = [v14 contactDisplayViewController:self shouldPerformDefaultActionForContact:v9 propertyKey:v10 propertyIdentifier:v11];
  }
  else
  {
    char v15 = 1;
  }

  return v15;
}

- (void)contactViewController:(id)a3 didDeleteContact:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  double v6 = [(CNContactContentDisplayViewController *)self contact];
  double v7 = [v6 mainStoreLinkedContacts];
  int v8 = [v7 containsObject:v5];

  if (v8)
  {
    [(CNContactContentDisplayViewController *)self removeLinkedContact:v5];
    id v9 = [(CNContactContentDisplayViewController *)self saveLinkedContactsExecutor];
    id v10 = [(CNContactContentDisplayViewController *)self contact];
    id v11 = [v10 availableKeyDescriptor];
    v19[0] = v11;
    double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    char v13 = [(CNContactContentDisplayViewController *)self saveDescriptionForRemovingLinkedContact:v5 keys:v12];
    uint64_t v14 = [v9 executeSaveWithConfiguration:v13 saveDelegate:self];

    char v15 = [(CNContactContentDisplayViewController *)self issuedSaveRequestIdentifiers];
    uint64_t v16 = [v14 identifiersOfIssuedSaveRequests];
    [v15 addObjectsFromArray:v16];

    id v17 = [v14 contact];

    if (v17)
    {
      id v18 = [v14 contact];
      [(CNContactContentDisplayViewController *)self setContact:v18];
    }
  }
}

- (BOOL)shouldShowActionsForAvatarView:(id)a3
{
  return 1;
}

- (BOOL)headerViewShouldCacheContactBackgroundColor:(id)a3
{
  return [(CNContactContentDisplayViewController *)self mode] == 1;
}

- (double)navigationBarHeight
{
  uint64_t v2 = [(CNContactContentDisplayViewController *)self currentNavigationController];
  char v3 = [v2 navigationBar];
  [v3 frame];
  double v5 = v4;

  return v5;
}

- (UIEdgeInsets)headerViewSafeAreaInsets
{
  char v3 = [(CNContactContentDisplayViewController *)self view];
  [v3 safeAreaInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  [(CNContactContentDisplayViewController *)self navigationBarHeight];
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

- (void)_pickName
{
}

- (void)headerViewDidTapNameLabel:(id)a3
{
  double v4 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  int v5 = [v4 allowsNamePicking];

  if (v5)
  {
    [(CNContactContentDisplayViewController *)self _pickName];
  }
}

- (void)headerViewDidChangeHeight:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactContentDisplayViewController *)self contactHeaderView];

  if (v5 == v4)
  {
    [(CNContactContentDisplayViewController *)self viewDidLayoutSubviews];
    [(CNContactContentDisplayViewController *)self reloadDataPreservingChanges:1];
    [(CNContactContentDisplayViewController *)self setupConstraints];
  }
}

- (BOOL)isNicknameProhibited
{
  uint64_t v2 = [(CNContactContentDisplayViewController *)self prohibitedPropertyKeys];
  char v3 = [v2 containsObject:*MEMORY[0x1E4F1AEC0]];

  return v3;
}

- (void)requestFavoritesUpdateWithGemini
{
  char v3 = [(CNContactContentDisplayViewController *)self environment];
  id v4 = [v3 inProcessFavorites];
  id v5 = [(CNContactContentDisplayViewController *)self contact];
  double v6 = [v4 entriesForContact:v5];

  if (v6)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.contacts.clientDidDisplayFavorites", 0, 0, 0);
  }
}

- (void)headerViewDidPickPreferredChannel:(id)a3
{
  id v13 = a3;
  id v4 = [(CNContactContentDisplayViewController *)self contact];
  id v5 = [v4 preferredChannel];
  char v6 = [v5 isEqualToString:v13];

  if ((v6 & 1) == 0)
  {
    double v7 = [(CNContactContentDisplayViewController *)self contact];
    double v8 = (void *)[v7 mutableCopy];

    [v8 setPreferredChannel:v13];
    id v9 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
    [v9 setIgnoresGuardianRestrictions:1];
    [v9 setIgnoresContactProviderRestrictions:1];
    double v10 = [(CNContactContentDisplayViewController *)self issuedSaveRequestIdentifiers];
    double v11 = [v9 saveRequestIdentifier];
    [v10 addObject:v11];

    [v9 updateContact:v8];
    double v12 = [(CNContactContentDisplayViewController *)self contactStore];
    [v12 executeSaveRequest:v9 error:0];

    [(CNContactContentDisplayViewController *)self setContact:v8];
    [(CNContactContentDisplayViewController *)self requestFavoritesUpdateWithGemini];
    [(CNContactContentDisplayViewController *)self updateInsetsIfNeeded];
  }
}

- (void)headerPhotoDidUpdate
{
  id v7 = [(CNContactContentDisplayViewController *)self contactNavigationItemUpdater];
  char v3 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  uint64_t v4 = [v3 allowsEditing];
  int64_t v5 = [(CNContactContentDisplayViewController *)self mode];
  char v6 = [(CNContactContentDisplayViewController *)self editAuthorizationManager];
  objc_msgSend(v7, "updateDisplayDoneButtonForController:allowsEditing:viewMode:editRequiresAuthorization:", self, v4, v5, objc_msgSend(v6, "shouldPromptForPasscodeAuthorization"));
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
    double v14 = &stru_1ED8AC728;
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
    double v14 = 0;
  }

  id v9 = v14;
LABEL_10:

  return v9;
}

- (void)propertyCellDidChangeLayout:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(CNContactContentDisplayViewController *)self contactView];
  int64_t v5 = [v4 indexPathForCell:v6];
  if (v5)
  {
    [v6 setValue:MEMORY[0x1E4F1CC38] forKey:@"needsHeightCalculation"];
    [v4 _heightForRowAtIndexPath:v5];
    objc_msgSend(v4, "_setHeight:forRowAtIndexPath:", v5);
  }
}

- (void)propertyCell:(id)a3 didDeleteLabel:(id)a4 forGroup:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v25 = a5;
  [v25 itemsUsingLabel:a4];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v26 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v26)
  {
    uint64_t v23 = *(void *)v32;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v31 + 1) + 8 * v6);
        id v8 = [v25 nextAvailableLabel];
        [v7 updateLabeledValueWithLabel:v8];
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v9 = [(CNContactContentDisplayViewController *)self contactView];
        double v10 = [v9 visibleCells];

        uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v28;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v28 != v13) {
                objc_enumerationMutation(v10);
              }
              int v15 = *(void **)(*((void *)&v27 + 1) + 8 * v14);
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
            uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
          }
          while (v12);
        }

        ++v6;
      }
      while (v6 != v26);
      uint64_t v26 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v26);
  }
  [(CNContactContentDisplayViewController *)self _updateLabelWidthForCellsInGroup:v25 reset:1];
  id v17 = [(CNContactContentDisplayViewController *)self contactNavigationItemUpdater];
  id v18 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  uint64_t v19 = [v18 allowsEditing];
  int64_t v20 = [(CNContactContentDisplayViewController *)self mode];
  uint64_t v21 = [(CNContactContentDisplayViewController *)self editAuthorizationManager];
  objc_msgSend(v17, "updateDisplayDoneButtonForController:allowsEditing:viewMode:editRequiresAuthorization:", self, v19, v20, objc_msgSend(v21, "shouldPromptForPasscodeAuthorization"));
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
      uint64_t v12 = [(CNContactContentDisplayViewController *)self actionProvider];
      uint64_t v13 = [v12 faceTimeAction];
      [v13 setType:a5];

      double v10 = [(CNContactContentDisplayViewController *)self actionProvider];
      uint64_t v11 = [v10 faceTimeAction];
      goto LABEL_9;
    case 3:
      goto LABEL_6;
    case 2:
      double v10 = [(CNContactContentDisplayViewController *)self actionProvider];
      uint64_t v11 = [v10 sendMessageAction];
LABEL_9:
      uint64_t v14 = v11;
      [v11 performActionForItem:v9 sender:v8];
LABEL_10:

      goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v10 = [(CNContactContentDisplayViewController *)self actionProvider];
    uint64_t v11 = [v10 linkedCardsAction];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v10 = [(CNContactContentDisplayViewController *)self actionProvider];
    uint64_t v14 = [v10 addLinkedCardAction];
    [v14 performActionWithSender:v8];
    goto LABEL_10;
  }
  if ([v8 isSuggested])
  {
    int v15 = [CNPropertySuggestionAction alloc];
    uint64_t v16 = [(CNContactContentDisplayViewController *)self contact];
    id v17 = [(CNPropertyAction *)v15 initWithContact:v16 propertyItem:v9];

    [(CNContactAction *)v17 setDelegate:self];
    [(CNPropertySuggestionAction *)v17 performActionForItem:v9 sender:v8];
  }
  else
  {
    if (a5 != 7)
    {
      +[CNPropertyAction performDefaultActionForItem:v9 sender:v8];
      goto LABEL_11;
    }
    id v17 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
    id v18 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v19 = CNContactsUIBundle();
    int64_t v20 = [v19 localizedStringForKey:@"PHONE_ACTION_TTY_CALL" value:&stru_1ED8AC728 table:@"Localized"];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __93__CNContactContentDisplayViewController_propertyCell_performActionForItem_withTransportType___block_invoke;
    v40[3] = &unk_1E549B738;
    v40[4] = self;
    id v21 = v9;
    id v41 = v21;
    id v22 = v8;
    id v42 = v22;
    uint64_t v23 = [v18 actionWithTitle:v20 style:0 handler:v40];
    [(CNPropertySuggestionAction *)v17 addAction:v23];

    long long v24 = (void *)MEMORY[0x1E4FB1410];
    id v25 = CNContactsUIBundle();
    uint64_t v26 = [v25 localizedStringForKey:@"PHONE_ACTION_TTY_RELAY_CALL" value:&stru_1ED8AC728 table:@"Localized"];
    uint64_t v33 = MEMORY[0x1E4F143A8];
    uint64_t v34 = 3221225472;
    double v35 = __93__CNContactContentDisplayViewController_propertyCell_performActionForItem_withTransportType___block_invoke_2;
    id v36 = &unk_1E549B738;
    uint64_t v37 = self;
    id v38 = v21;
    id v27 = v22;
    id v39 = v27;
    long long v28 = [v24 actionWithTitle:v26 style:0 handler:&v33];
    -[CNPropertySuggestionAction addAction:](v17, "addAction:", v28, v33, v34, v35, v36, v37);

    long long v29 = (void *)MEMORY[0x1E4FB1410];
    long long v30 = CNContactsUIBundle();
    long long v31 = [v30 localizedStringForKey:@"CANCEL" value:&stru_1ED8AC728 table:@"Localized"];
    long long v32 = [v29 actionWithTitle:v31 style:1 handler:0];
    [(CNPropertySuggestionAction *)v17 addAction:v32];

    [(CNContactContentDisplayViewController *)self sender:v27 presentViewController:v17];
  }

LABEL_11:
}

void __93__CNContactContentDisplayViewController_propertyCell_performActionForItem_withTransportType___block_invoke(uint64_t a1)
{
  uint64_t v2 = [CNPropertyTTYAction alloc];
  char v3 = [*(id *)(a1 + 32) contact];
  uint64_t v4 = [(CNPropertyAction *)v2 initWithContact:v3 propertyItem:*(void *)(a1 + 40)];

  [(CNContactAction *)v4 setDelegate:*(void *)(a1 + 32)];
  [(CNPropertyTTYAction *)v4 performActionForItem:*(void *)(a1 + 40) sender:*(void *)(a1 + 48)];
}

void __93__CNContactContentDisplayViewController_propertyCell_performActionForItem_withTransportType___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [CNPropertyTTYRelayAction alloc];
  char v3 = [*(id *)(a1 + 32) contact];
  uint64_t v4 = [(CNPropertyAction *)v2 initWithContact:v3 propertyItem:*(void *)(a1 + 40)];

  [(CNContactAction *)v4 setDelegate:*(void *)(a1 + 32)];
  [(CNPropertyTTYRelayAction *)v4 performActionForItem:*(void *)(a1 + 40) sender:*(void *)(a1 + 48)];
}

- (void)propertyCell:(id)a3 didUpdateItem:(id)a4 withNewValue:(id)a5
{
  id v24 = a3;
  id v8 = a4;
  [v8 updateLabeledValueWithValue:a5];
  if (objc_opt_respondsToSelector()) {
    [v24 updateWithPropertyItem:v8];
  }
  id v9 = [v8 group];
  [(CNContactContentDisplayViewController *)self _updateLabelWidthForCellsInGroup:v9 reset:1];

  double v10 = [v8 property];
  uint64_t v11 = *MEMORY[0x1E4F1ADA0];
  if ([v10 isEqualToString:*MEMORY[0x1E4F1ADA0]])
  {

    uint64_t v12 = *MEMORY[0x1E4F1AF90];
  }
  else
  {
    uint64_t v13 = [v8 property];
    uint64_t v12 = *MEMORY[0x1E4F1AF90];
    int v14 = [v13 isEqualToString:*MEMORY[0x1E4F1AF90]];

    if (!v14) {
      goto LABEL_7;
    }
  }
  int v15 = [(CNContactContentDisplayViewController *)self propertyGroups];
  uint64_t v16 = [v15 objectForKeyedSubscript:v11];
  [(CNContactContentDisplayViewController *)self _validateGroup:v16];

  id v17 = [(CNContactContentDisplayViewController *)self propertyGroups];
  id v18 = [v17 objectForKeyedSubscript:v12];
  [(CNContactContentDisplayViewController *)self _validateGroup:v18];

LABEL_7:
  uint64_t v19 = [(CNContactContentDisplayViewController *)self contactNavigationItemUpdater];
  int64_t v20 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  uint64_t v21 = [v20 allowsEditing];
  int64_t v22 = [(CNContactContentDisplayViewController *)self mode];
  uint64_t v23 = [(CNContactContentDisplayViewController *)self editAuthorizationManager];
  objc_msgSend(v19, "updateDisplayDoneButtonForController:allowsEditing:viewMode:editRequiresAuthorization:", self, v21, v22, objc_msgSend(v23, "shouldPromptForPasscodeAuthorization"));
}

- (void)propertyCell:(id)a3 didUpdateItem:(id)a4 withNewLabel:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  [v8 updateLabeledValueWithLabel:a5];
  [v9 updateWithPropertyItem:v8];

  double v10 = [v8 group];

  [(CNContactContentDisplayViewController *)self _updateLabelWidthForCellsInGroup:v10 reset:1];
  id v15 = [(CNContactContentDisplayViewController *)self contactNavigationItemUpdater];
  uint64_t v11 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  uint64_t v12 = [v11 allowsEditing];
  int64_t v13 = [(CNContactContentDisplayViewController *)self mode];
  int v14 = [(CNContactContentDisplayViewController *)self editAuthorizationManager];
  objc_msgSend(v15, "updateDisplayDoneButtonForController:allowsEditing:viewMode:editRequiresAuthorization:", self, v12, v13, objc_msgSend(v14, "shouldPromptForPasscodeAuthorization"));
}

- (void)actionWasCanceled:(id)a3
{
  id v6 = [(CNContactContentDisplayViewController *)self contactView];
  uint64_t v4 = [(CNContactContentDisplayViewController *)self contactView];
  int64_t v5 = [v4 indexPathForSelectedRow];
  [v6 deselectRowAtIndexPath:v5 animated:1];
}

- (void)actionDidFinish:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CNContactContentDisplayViewController *)self contactView];
  id v6 = [(CNContactContentDisplayViewController *)self contactView];
  id v7 = [v6 indexPathForSelectedRow];
  [v5 deselectRowAtIndexPath:v7 animated:1];

  id v8 = [(CNContactContentDisplayViewController *)self ignoreContactAction];

  if (v8 == v4)
  {
    id v18 = [(CNContactContentDisplayViewController *)self delegate];
    char v19 = objc_opt_respondsToSelector();

    if (v19)
    {
      int64_t v20 = [(CNContactContentDisplayViewController *)self delegate];
      uint64_t v21 = [(CNContactContentDisplayViewController *)self contact];
      [v20 contactDisplayViewController:self didDeleteContact:v21];
LABEL_10:
    }
LABEL_11:
    id v15 = [(CNContactContentDisplayViewController *)self navigationController];
    id v22 = (id)[v15 popViewControllerAnimated:1];
LABEL_20:

    goto LABEL_21;
  }
  id v9 = [(CNContactContentDisplayViewController *)self actionProvider];
  id v10 = [v9 addFavoriteAction];

  uint64_t v11 = [(CNContactContentDisplayViewController *)self actionProvider];
  uint64_t v12 = v11;
  if (v10 == v4)
  {
    uint64_t v23 = [v11 addFavoriteAction];
    char v24 = [v23 canPerformAction];

    if ((v24 & 1) == 0)
    {
      id v25 = [(CNContactContentDisplayViewController *)self cardActionsGroup];
      uint64_t v26 = CNContactsUIBundle();
      id v27 = [v26 localizedStringForKey:@"PHONE_ACTION_ADD_TO_FAVORITES" value:&stru_1ED8AC728 table:@"Localized"];
      [v25 removeActionWithTitle:v27];
    }
    long long v28 = self;
    uint64_t v29 = 0;
    goto LABEL_15;
  }
  id v13 = [v11 createNewContactAction];

  int v14 = [(CNContactContentDisplayViewController *)self actionProvider];
  id v15 = v14;
  if (v13 == v4)
  {
    long long v30 = [v14 createNewContactAction];
    long long v31 = [v30 createdContact];
    [(CNContactContentDisplayViewController *)self createdNewContact:v31];
    goto LABEL_18;
  }
  id v16 = [v14 addToExistingContactAction];

  if (v16 == v4)
  {
    id v15 = [(CNContactContentDisplayViewController *)self actionProvider];
    long long v30 = [v15 addToExistingContactAction];
    long long v31 = [v30 chosenContact];
    [(CNContactContentDisplayViewController *)self updatedExistingContact:v31];
    goto LABEL_18;
  }
  id v17 = [(CNContactContentDisplayViewController *)self updateExistingContactAction];

  if (v17 == v4)
  {
    id v15 = [(CNContactContentDisplayViewController *)self updateExistingContactAction];
    long long v30 = [v15 existingContact];
    [(CNContactContentDisplayViewController *)self updatedExistingContact:v30];
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v32 = [(CNContactContentDisplayViewController *)self blockAction];

    if (v32 == v4)
    {
      [(CNContactContentDisplayViewController *)self setShouldIgnoreBlockListChange:1];
      [(CNContactContentDisplayViewController *)self _setupContactBlockingActionPreservingChanges:1 withUpdate:1];
      goto LABEL_21;
    }
    id v33 = [(CNContactContentDisplayViewController *)self blockReportAction];

    if (v33 == v4)
    {
      [(CNContactContentDisplayViewController *)self setShouldIgnoreBlockListChange:1];
      [(CNContactContentDisplayViewController *)self _setupContactBlockingReportingActionPreservingChanges:1 withUpdate:1];
      id v15 = [(CNContactContentDisplayViewController *)self delegate];
      long long v30 = [(CNContactContentDisplayViewController *)self contact];
      [v15 didTapBlockAndReportForContact:v30];
      goto LABEL_19;
    }
    uint64_t v34 = [(CNContactContentDisplayViewController *)self actionProvider];
    id v35 = [v34 shareWithFamilyAction];

    if (v35 == v4)
    {
      [(CNContactContentDisplayViewController *)self updateContact:v4];
      goto LABEL_21;
    }
    id v36 = [(CNContactContentDisplayViewController *)self actionProvider];
    id v37 = [v36 stopSharingWithFamilyAction];

    if (v37 == v4)
    {
      uint64_t v45 = [(CNContactContentDisplayViewController *)self cardActionsGroup];
      id v46 = [(CNContactContentDisplayViewController *)self actionProvider];
      int v47 = [v46 stopSharingWithFamilyAction];
      double v48 = [v47 title];
      [v45 removeActionWithTitle:v48];

      [(CNContactContentDisplayViewController *)self reloadDataPreservingChanges:0];
      id v15 = [(CNContactContentDisplayViewController *)self delegate];
      [v15 contactDisplayViewControllerDidExecuteDeleteFromDowntimeWhitelistAction:self];
      goto LABEL_20;
    }
    id v38 = [(CNContactContentDisplayViewController *)self suggestedContactAction];

    if (v38 != v4)
    {
      id v39 = [(CNContactContentDisplayViewController *)self clearRecentsDataAction];

      if (v39 == v4)
      {
        id v15 = [(CNContactContentDisplayViewController *)self delegate];
        [v15 contactDisplayViewControllerDidExecuteClearRecentsDataAction:self];
        goto LABEL_20;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = v4;
        CGRect v40 = [v15 propertyItem];
        long long v30 = [v40 group];

        uint64_t v41 = [v15 selectedChoice];
        if (v41 == 2)
        {
          [v15 reject];
          [v30 reloadDataPreservingChanges:0];
          goto LABEL_19;
        }
        if (v41 != 1)
        {
LABEL_19:

          goto LABEL_20;
        }
        id v42 = [v15 propertyItem];
        long long v31 = [(CNContactContentDisplayViewController *)self indexPathOfDisplayedPropertyItem:v42];

        id v43 = [(CNContactContentDisplayViewController *)self contactView];
        [v43 selectRowAtIndexPath:v31 animated:0 scrollPosition:0];

        dispatch_time_t v44 = dispatch_time(0, 500000000);
        uint64_t v53 = MEMORY[0x1E4F143A8];
        uint64_t v54 = 3221225472;
        int v55 = __57__CNContactContentDisplayViewController_actionDidFinish___block_invoke;
        v56 = &unk_1E549BF80;
        id v57 = v15;
        id v58 = v30;
        dispatch_after(v44, MEMORY[0x1E4F14428], &v53);

LABEL_18:
        goto LABEL_19;
      }
      id v52 = [(CNContactContentDisplayViewController *)self selectContainersAction];

      if (v52 != v4) {
        goto LABEL_21;
      }
      long long v28 = self;
      uint64_t v29 = 1;
LABEL_15:
      [(CNContactContentDisplayViewController *)v28 reloadDataPreservingChanges:v29];
      goto LABEL_21;
    }
    int v49 = [(CNContactContentDisplayViewController *)self delegate];
    char v50 = objc_opt_respondsToSelector();

    if (v50)
    {
      int64_t v20 = [(CNContactContentDisplayViewController *)self delegate];
      uint64_t v21 = [(CNContactContentDisplayViewController *)self suggestedContactAction];
      double v51 = [v21 contact];
      [v20 contactDisplayViewController:self didDeleteContact:v51];

      goto LABEL_10;
    }
    goto LABEL_11;
  }
  [(CNContactContentDisplayViewController *)self reloadUnifiedContact];
LABEL_21:
  -[CNContactContentDisplayViewController updateEditNavigationItemsAnimated:](self, "updateEditNavigationItemsAnimated:", 1, v53, v54, v55, v56);
}

uint64_t __57__CNContactContentDisplayViewController_actionDidFinish___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) confirm];
  uint64_t v2 = *(void **)(a1 + 40);

  return [v2 reloadDataPreservingChanges:0];
}

- (void)actionDidUpdate:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [(CNContactContentDisplayViewController *)self actionProvider];
  id v6 = [v5 addFavoriteAction];

  if (v6 == v4)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v7 = [(CNContactContentDisplayViewController *)self cardActionsGroup];
    id v8 = [v7 actions];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v29;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v28 + 1) + 8 * v12) target];
        int v14 = [(CNContactContentDisplayViewController *)self actionProvider];
        id v15 = [v14 addFavoriteAction];

        if (v13 == v15) {
          break;
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
          if (v10) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }

      char v24 = [(CNContactContentDisplayViewController *)self actionProvider];
      id v25 = [v24 addFavoriteAction];
      char v26 = [v25 canPerformAction];

      if (v26) {
        goto LABEL_15;
      }
      char v19 = [(CNContactContentDisplayViewController *)self cardActionsGroup];
      int64_t v20 = [v4 target];
      objc_msgSend(v19, "removeActionWithTarget:selector:", v20, objc_msgSend(v4, "selector"));
      goto LABEL_14;
    }
LABEL_10:

    id v16 = [(CNContactContentDisplayViewController *)self actionProvider];
    id v17 = [v16 addFavoriteAction];
    int v18 = [v17 canPerformAction];

    if (v18)
    {
      char v19 = [(CNContactContentDisplayViewController *)self cardActionsGroup];
      int64_t v20 = [(CNContactContentDisplayViewController *)self actionProvider];
      uint64_t v21 = [v20 addFavoriteAction];
      id v22 = CNContactsUIBundle();
      uint64_t v23 = [v22 localizedStringForKey:@"PHONE_ACTION_ADD_TO_FAVORITES" value:&stru_1ED8AC728 table:@"Localized"];
      [v19 addAction:v21 withTitle:v23];

LABEL_14:
      id v27 = [(CNContactContentDisplayViewController *)self cardActionsGroup];
      [(CNContactContentDisplayViewController *)self reloadCardGroup:v27];
    }
  }
LABEL_15:
}

- (void)action:(id)a3 pushViewController:(id)a4 sender:(id)a5
{
  id v6 = a4;
  [(CNContactContentDisplayViewController *)self setBackgroundColorIfNeededForPresentedViewController:v6];
  id v7 = [(CNContactContentDisplayViewController *)self navigationItem];
  id v8 = [v7 prompt];
  uint64_t v9 = [v6 navigationItem];
  [v9 setPrompt:v8];

  id v10 = [(CNContactContentDisplayViewController *)self navigationController];
  [v10 pushViewController:v6 animated:1];
}

- (void)action:(id)a3 dismissViewController:(id)a4 sender:(id)a5
{
  id v23 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [(CNContactContentDisplayViewController *)self actionProvider];
  id v11 = [v10 createNewContactAction];
  uint64_t v12 = v23;
  if (v11 != v23)
  {
    id v13 = [(CNContactContentDisplayViewController *)self actionProvider];
    uint64_t v14 = [v13 addToExistingContactAction];
    if ((id)v14 != v23)
    {
      id v15 = (void *)v14;
      id v16 = [(CNContactContentDisplayViewController *)self updateExistingContactAction];

      if (v16 != v23) {
        goto LABEL_10;
      }
      goto LABEL_7;
    }

    uint64_t v12 = v11;
  }

LABEL_7:
  uint64_t v17 = [(CNContactContentDisplayViewController *)self delegate];
  if (v17)
  {
    int v18 = (void *)v17;
    char v19 = [(CNContactContentDisplayViewController *)self delegate];
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      uint64_t v21 = [(CNContactContentDisplayViewController *)self delegate];
      [v21 contactDisplayViewControllerIsDismissingEditingController:self];
    }
  }
LABEL_10:
  id v22 = [(CNContactContentDisplayViewController *)self presentingDelegate];
  [v22 sender:v8 dismissViewController:v9];
}

- (void)action:(id)a3 presentViewController:(id)a4 sender:(id)a5
{
  id v23 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [(CNContactContentDisplayViewController *)self actionProvider];
  id v11 = [v10 createNewContactAction];
  uint64_t v12 = v23;
  if (v11 != v23)
  {
    id v13 = [(CNContactContentDisplayViewController *)self actionProvider];
    uint64_t v14 = [v13 addToExistingContactAction];
    if ((id)v14 != v23)
    {
      id v15 = (void *)v14;
      id v16 = [(CNContactContentDisplayViewController *)self updateExistingContactAction];

      if (v16 != v23) {
        goto LABEL_10;
      }
      goto LABEL_7;
    }

    uint64_t v12 = v11;
  }

LABEL_7:
  uint64_t v17 = [(CNContactContentDisplayViewController *)self delegate];
  if (v17)
  {
    int v18 = (void *)v17;
    char v19 = [(CNContactContentDisplayViewController *)self delegate];
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      uint64_t v21 = [(CNContactContentDisplayViewController *)self delegate];
      [v21 contactDisplayViewControllerIsPresentingEditingController:self];
    }
  }
LABEL_10:
  id v22 = [(CNContactContentDisplayViewController *)self presentingDelegate];
  [v22 sender:v8 presentViewController:v9];
}

- (void)action:(id)a3 prepareChildContactViewController:(id)a4 sender:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(CNContactContentDisplayViewController *)self delegate];
  [v9 contactDisplayViewController:self prepareChildContactViewController:v7 forAction:v8];
}

- (void)contactInlineActionsViewControllerDidDismissDisambiguationUI:(id)a3
{
  id v4 = [(CNContactContentDisplayViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CNContactContentDisplayViewController *)self delegate];
    [v6 contactDisplayViewControllerDidDismissDisambiguationUI:self];
  }
}

- (void)contactInlineActionsViewControllerWillPresentDisambiguationUI:(id)a3
{
  id v4 = [(CNContactContentDisplayViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CNContactContentDisplayViewController *)self delegate];
    [v6 contactDisplayViewControllerWillPresentDisambiguationUI:self];
  }
}

- (BOOL)contactInlineActionsViewController:(id)a3 shouldPerformActionOfType:(id)a4 withContactProperty:(id)a5
{
  id v6 = a5;
  id v7 = [v6 contact];
  id v8 = [v6 key];
  id v9 = [v6 identifier];

  LOBYTE(self) = [(CNContactContentDisplayViewController *)self contactDisplayViewController:self shouldPerformDefaultActionForContact:v7 propertyKey:v8 propertyIdentifier:v9];
  return (char)self;
}

- (void)viewController:(id)a3 presentationControllerWillDismiss:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  id v7 = [(CNContactContentDisplayViewController *)self presentedViewController];

  if (v7 == v6) {
    [(CNContactContentDisplayViewController *)self presentationControllerWillDismiss:v8];
  }
}

- (BOOL)isPresentingModalViewController
{
  uint64_t v2 = [(CNContactContentDisplayViewController *)self presentedViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)sender:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(CNContactContentDisplayViewController *)self isOutOfProcess])
  {
    id v9 = [(CNContactContentDisplayViewController *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      [(CNContactContentDisplayViewController *)self setIsPresentingFullscreenForOutOfProcess:0];
      id v11 = [(CNContactContentDisplayViewController *)self delegate];
      [v11 contactDisplayViewControllerWillDismissFullscreen:self];
    }
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__CNContactContentDisplayViewController_sender_dismissViewController_completionHandler___block_invoke;
  v13[3] = &unk_1E549B710;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v7 dismissViewControllerAnimated:1 completion:v13];
}

uint64_t __88__CNContactContentDisplayViewController_sender_dismissViewController_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[986])
  {
    [v2 _endDisablingInterfaceAutorotation];
    *(unsigned char *)(*(void *)(a1 + 32) + 986) = 0;
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

  id v11 = [(CNContactContentDisplayViewController *)self view];
  id v12 = [v11 superview];
  id v13 = [v12 backgroundColor];
  id v14 = [MEMORY[0x1E4FB1618] clearColor];
  char v15 = [v13 isEqual:v14];

  if ((v10 & 1) == 0 && (v15 & 1) == 0)
  {
    id v16 = [(CNContactContentDisplayViewController *)self view];
    uint64_t v17 = [v16 superview];
    int v18 = [v17 backgroundColor];
    char v19 = [v20 view];
    [v19 setBackgroundColor:v18];
  }
}

- (int64_t)_modalPresentationStyleForViewController:(id)a3
{
  id v5 = a3;
  if (NSClassFromString(&cfstr_Qlpreviewcontr.isa) && (objc_opt_isKindOfClass() & 1) != 0) {
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![v5 modalPresentationStyle]) {
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v6 = [v5 modalPresentationStyle];
    goto LABEL_28;
  }
  id v7 = [v5 view];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    int64_t v6 = 7;
    goto LABEL_28;
  }
  getSLComposeViewControllerClass_58505();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v6 = 5;
    goto LABEL_28;
  }
  objc_opt_class();
  char v9 = objc_opt_isKindOfClass();
  if (v9)
  {
    id v7 = [v5 viewControllers];
    BOOL v3 = [v7 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {

LABEL_17:
      if ([(UIViewController *)self ab_isInPopover])
      {
        int64_t v6 = 2;
        goto LABEL_28;
      }
      if ([(CNContactContentDisplayViewController *)self isOutOfProcess] || CNUIIsDDActionsService())
      {
        char v15 = [MEMORY[0x1E4FB16C8] currentDevice];
        uint64_t v16 = [v15 userInterfaceIdiom];

        if ((v16 & 0xFFFFFFFFFFFFFFFBLL) == 1)
        {
LABEL_27:
          int64_t v6 = 0;
          goto LABEL_28;
        }
      }
      id v14 = +[CNContactStyle currentStyle];
      if ([v14 shouldPresentInCurrentContext])
      {
        int64_t v6 = 3;
      }
      else
      {
        char v19 = [MEMORY[0x1E4FB16C8] currentDevice];
        uint64_t v20 = [v19 userInterfaceIdiom];

        if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
          int64_t v6 = 2;
        }
        else {
          int64_t v6 = -2;
        }
      }
LABEL_38:

      goto LABEL_28;
    }
  }
  objc_opt_class();
  char v10 = objc_opt_isKindOfClass();
  if (v9)
  {
  }
  if (v10) {
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [v5 viewControllers];
    id v12 = [v11 firstObject];
    objc_opt_class();
    char v13 = objc_opt_isKindOfClass();

    if (v13)
    {
      id v14 = +[CNContactStyle currentStyle];
      if ([v14 shouldPresentInCurrentContext]) {
        int64_t v6 = 6;
      }
      else {
        int64_t v6 = -2;
      }
      goto LABEL_38;
    }
  }
  if ([(UIViewController *)self ab_isInPopover]
    || [(UIViewController *)self ab_isInSheet])
  {
LABEL_40:
    int64_t v6 = 3;
    goto LABEL_28;
  }
  int v18 = +[CNContactStyle currentStyle];
  if ([v18 shouldPresentInCurrentContext])
  {

    goto LABEL_40;
  }
  BOOL v21 = CNUIIsDDActionsService();

  if (v21) {
    goto LABEL_40;
  }
  if (_CFMZEnabled()) {
    int64_t v6 = 3;
  }
  else {
    int64_t v6 = 7;
  }
LABEL_28:

  return v6;
}

- (void)presentationControllerWillDismiss:(id)a3
{
  if ([(CNContactContentDisplayViewController *)self isOutOfProcess])
  {
    id v4 = [(CNContactContentDisplayViewController *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      [(CNContactContentDisplayViewController *)self setIsPresentingFullscreenForOutOfProcess:0];
      id v6 = [(CNContactContentDisplayViewController *)self delegate];
      [v6 contactDisplayViewControllerWillDismissFullscreen:self];
    }
  }
}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  id v14 = a3;
  id v8 = a5;
  if (a4 != 5)
  {
    if ([(CNContactContentDisplayViewController *)self isOutOfProcess])
    {
      char v9 = [(CNContactContentDisplayViewController *)self delegate];
      char v10 = objc_opt_respondsToSelector();

      if (v10)
      {
        id v11 = [v14 presentedViewController];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          [(CNContactContentDisplayViewController *)self setIsPresentingFullscreenForOutOfProcess:1];
          char v13 = [(CNContactContentDisplayViewController *)self delegate];
          [v13 contactDisplayViewControllerWillPresentFullscreen:self];
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
  if ([(CNContactContentDisplayViewController *)self isOutOfProcess])
  {
    if ([(CNContactContentDisplayViewController *)self isPresentingModalViewController])
    {
      BOOL v3 = [(CNContactContentDisplayViewController *)self presentedViewController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        if ([(CNContactContentDisplayViewController *)self isPresentingFullscreenForOutOfProcess]&& ([(CNContactContentDisplayViewController *)self delegate], v5 = objc_claimAutoreleasedReturnValue(), char v6 = objc_opt_respondsToSelector(), v5, (v6 & 1) != 0))
        {
          id v9 = [(CNContactContentDisplayViewController *)self delegate];
          [v9 contactDisplayViewControllerWillPresentFullscreen:self];
        }
        else
        {
          if ([(CNContactContentDisplayViewController *)self isPresentingFullscreenForOutOfProcess])
          {
            return;
          }
          id v7 = [(CNContactContentDisplayViewController *)self delegate];
          char v8 = objc_opt_respondsToSelector();

          if ((v8 & 1) == 0) {
            return;
          }
          id v9 = [(CNContactContentDisplayViewController *)self delegate];
          [v9 contactDisplayViewControllerWillDismissFullscreen:self];
        }
      }
    }
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CNContactContentDisplayViewController;
  -[CNContactContentDisplayViewController viewWillTransitionToSize:withTransitionCoordinator:](&v17, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  char v8 = [(CNContactContentDisplayViewController *)self presentedViewController];
  id v9 = [v8 popoverPresentationController];
  char v10 = [v9 sourceView];

  if (v10)
  {
    id v11 = [v10 superview];
    id v12 = [(CNContactContentDisplayViewController *)self contactView];

    if (v11 == v12)
    {
      char v13 = [(CNContactContentDisplayViewController *)self presentedViewController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __92__CNContactContentDisplayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
        v15[3] = &unk_1E549ADD0;
        v15[4] = self;
        id v16 = v10;
        [v7 animateAlongsideTransition:0 completion:v15];
      }
    }
  }
}

void __92__CNContactContentDisplayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contactView];
  [*(id *)(a1 + 40) frame];
  objc_msgSend(v2, "scrollRectToVisible:animated:", 0);
}

- (void)shouldPresentFullscreen:(BOOL)a3
{
  BOOL v3 = a3;
  -[CNContactContentDisplayViewController setIsPresentingFullscreenForOutOfProcess:](self, "setIsPresentingFullscreenForOutOfProcess:");
  char v5 = [(CNContactContentDisplayViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CNContactContentDisplayViewController *)self delegate];
    [v7 contactDisplayViewController:self isPresentingFullscreen:v3];
  }
}

- (CGRect)centeredSourceRect:(CGRect)a3 inContactView:(id)a4
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  [v8 layoutMargins];
  double v10 = v9;
  [v8 layoutMargins];
  double v12 = width - (v10 + v11);
  [v8 layoutMargins];
  double v14 = v13;

  char v15 = +[CNContactStyle currentStyle];
  [v15 sectionContentInset];
  double v17 = x + v14 - v16;

  double v18 = v17;
  double v19 = y;
  double v20 = v12;
  double v21 = height;
  result.size.CGFloat height = v21;
  result.size.double width = v20;
  result.origin.CGFloat y = v19;
  result.origin.double x = v18;
  return result;
}

- (void)sender:(id)a3 presentViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_msgSend(v7, "setModalPresentationStyle:", -[CNContactContentDisplayViewController _modalPresentationStyleForViewController:](self, "_modalPresentationStyleForViewController:", v7));
  id v8 = +[CNContactStyle currentStyle];
  objc_msgSend(v7, "setModalTransitionStyle:", objc_msgSend(v8, "modalTransitionStyle"));

  objc_opt_class();
  id v36 = v6;
  if (objc_opt_isKindOfClass()) {
    double v9 = v36;
  }
  else {
    double v9 = 0;
  }
  id v10 = v9;

  double v11 = [v7 popoverPresentationController];
  [v11 setSourceView:v10];

  [v10 bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v20 = [(CNContactContentDisplayViewController *)self contactView];
  -[CNContactContentDisplayViewController centeredSourceRect:inContactView:](self, "centeredSourceRect:inContactView:", v20, v13, v15, v17, v19);
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  long long v29 = [v7 popoverPresentationController];
  objc_msgSend(v29, "setSourceRect:", v22, v24, v26, v28);

  long long v30 = [v7 popoverPresentationController];
  [v30 setPermittedArrowDirections:15];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v31 = [v7 presentationController];
    [v31 setDelegate:self];
  }
  if (!self->_disablingRotation)
  {
    id v32 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([v32 userInterfaceIdiom])
    {
LABEL_11:

      goto LABEL_12;
    }
    uint64_t v33 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v33 _referenceBounds];
    if (CGRectGetHeight(v38) <= 667.0 || [v7 modalPresentationStyle])
    {

      goto LABEL_11;
    }
    uint64_t v34 = [v7 supportedInterfaceOrientations];
    uint64_t v35 = [(CNContactContentDisplayViewController *)self supportedInterfaceOrientations];

    if (v34 != v35)
    {
      [(CNContactContentDisplayViewController *)self _beginDisablingInterfaceAutorotation];
      self->_disablingRotation = 1;
    }
  }
LABEL_12:
  [(CNContactContentDisplayViewController *)self setBackgroundColorIfNeededForPresentedViewController:v7];
  [(CNContactContentDisplayViewController *)self presentViewController:v7 animated:1 completion:0];
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (![(CNContactContentDisplayViewController *)self isTableViewHeaderFirstSectionIndexPath:v6])
  {
    id v7 = [v8 cellForRowAtIndexPath:v6];
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v7 shouldPerformAccessoryAction]) {
      [v7 performAccessoryAction];
    }
  }
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(CNContactContentDisplayViewController *)self isTableViewHeaderFirstSectionIndexPath:v5])
  {
    id v6 = 0;
  }
  else
  {
    id v7 = [(CNContactContentDisplayViewController *)self _itemAtIndexPath:v5];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    double v9 = CNContactsUIBundle();
    id v10 = v9;
    if (isKindOfClass) {
      double v11 = @"UNLINK";
    }
    else {
      double v11 = @"DELETE";
    }
    id v6 = [v9 localizedStringForKey:v11 value:&stru_1ED8AC728 table:@"Localized"];
  }

  return v6;
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
  id v8 = a5;
  if ([(CNContactContentDisplayViewController *)self isTableViewHeaderFirstSectionIndexPath:v8])
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    unsigned int v9 = (sel_copy_ == a4) & ~[(CNContactContentDisplayViewController *)self _indexPathIsActionItem:v8];
  }

  return v9;
}

- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(CNContactContentDisplayViewController *)self isTableViewHeaderFirstSectionIndexPath:v5])
  {
    char v6 = 0;
  }
  else
  {
    id v7 = [(CNContactContentDisplayViewController *)self _itemAtIndexPath:v5];
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_opt_class();
      char v6 = objc_opt_isKindOfClass() ^ 1;
    }
    else
    {
      char v6 = 0;
    }
  }
  return v6 & 1;
}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  id v15 = a4;
  [v15 updateConstraintsIfNeeded];
  char v6 = [v15 backgroundView];
  id v7 = [(CNContactContentDisplayViewController *)self contactView];
  id v8 = [v7 sectionBackgroundColor];
  if (v8)
  {
    int v9 = 1;
  }
  else
  {
    id v10 = [(CNContactContentDisplayViewController *)self environment];
    int v9 = [v10 runningInContactsAppOniPad];
  }
  if (v9 && !v6)
  {
    id v11 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    char v6 = objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  double v12 = [(CNContactContentDisplayViewController *)self environment];
  if ([v12 runningInContactsAppOniPad])
  {
    double v13 = +[CNUIColorRepository contactCardBackgroundiPadOverwriteColor];
    [v6 setBackgroundColor:v13];
  }
  else
  {
    double v13 = [(CNContactContentDisplayViewController *)self contactView];
    double v14 = [v13 sectionBackgroundColor];
    [v6 setBackgroundColor:v14];
  }
  [v15 setBackgroundView:v6];
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v16 = a4;
  [(CNContactContentDisplayViewController *)self tableView:a3 willDisplayFooterView:v16 forSection:a5];
  objc_msgSend(v16, "_cnui_applyContactStyle");
  id v8 = [(CNContactContentDisplayViewController *)self _cardGroupAtTableViewSectionIndex:a5];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v9 = +[CNContactStyle currentStyle];
    id v10 = [v9 backgroundColor];

    if (v10)
    {
      id v11 = +[CNContactStyle currentStyle];
      double v12 = [v11 backgroundColor];
      double v13 = [v16 backgroundView];
      [v13 setBackgroundColor:v12];

LABEL_7:
      goto LABEL_8;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v14 = [(CNContactContentDisplayViewController *)self environment];
    int v15 = [v14 runningInContactsAppOniPad];

    if (v15)
    {
      id v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
      double v12 = [v16 textLabel];
      [v12 setFont:v11];
      goto LABEL_7;
    }
  }
LABEL_8:
}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4
{
  id v5 = [(CNContactContentDisplayViewController *)self _cardGroupAtTableViewSectionIndex:a4];
  char v6 = [(CNContactContentDisplayViewController *)self environment];
  char v7 = [v6 runningInContactsAppOniPad];

  if (v7) {
    goto LABEL_2;
  }
  int v9 = [(CNContactContentDisplayViewController *)self cardMedicalIDGroup];

  id v10 = [(CNContactContentDisplayViewController *)self cardMedicalIDGroup];

  uint64_t v11 = [(CNContactContentDisplayViewController *)self cardBlockContactGroup];
  if (v5 == (void *)v11)
  {

    goto LABEL_20;
  }
  double v12 = (void *)v11;
  double v13 = [(CNContactContentDisplayViewController *)self cardShareLocationGroup];

  if (v9) {
    BOOL v14 = v5 == v10;
  }
  else {
    BOOL v14 = 0;
  }
  int v15 = !v14;
  char isKindOfClass = 1;
  if (v5 != v13 && v15)
  {
    if (v9 && [v5 isMemberOfClass:objc_opt_class()])
    {
      id v16 = [(CNContactContentDisplayViewController *)self cardMedicalIDGroup];
      double v17 = [v16 actionItems];
      if ([v17 count])
      {
        double v18 = [(CNContactContentDisplayViewController *)self cardMedicalIDGroup];
        int v19 = [v18 addSpacerFromPreviousGroup];

        if (!v19)
        {
LABEL_2:
          char isKindOfClass = 0;
          goto LABEL_22;
        }
      }
      else
      {
      }
    }
    if (([v5 isMemberOfClass:objc_opt_class()] & 1) == 0)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      goto LABEL_22;
    }
LABEL_20:
    char isKindOfClass = 1;
  }
LABEL_22:

  return isKindOfClass & 1;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  char v6 = [(CNContactContentDisplayViewController *)self environment];
  int v7 = [v6 runningInContactsAppOniPad];

  if (v7)
  {
    id v8 = [(CNContactContentDisplayViewController *)self _cardGroupAtTableViewSectionIndex:a4];
    objc_opt_class();
    id v9 = v8;
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;

    objc_opt_class();
    id v12 = v9;
    if (objc_opt_isKindOfClass()) {
      double v13 = v12;
    }
    else {
      double v13 = 0;
    }
    id v14 = v13;

    objc_opt_class();
    id v15 = v12;
    if (objc_opt_isKindOfClass()) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }
    unint64_t v17 = v16;

    objc_opt_class();
    id v18 = v15;
    if (objc_opt_isKindOfClass()) {
      int v19 = v18;
    }
    else {
      int v19 = 0;
    }
    unint64_t v20 = v19;

    if (v11)
    {
      double v21 = [v11 property];
      int v22 = [v21 isEqualToString:*MEMORY[0x1E4F1AED0]] ^ 1;
    }
    else if (v14)
    {
      LOBYTE(v22) = 0;
    }
    else
    {
      LOBYTE(v22) = (v17 | v20) != 0;
    }
  }
  else
  {
    LOBYTE(v22) = 0;
  }
  return v22;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  id v5 = [(CNContactContentDisplayViewController *)self _cardGroupAtTableViewSectionIndex:a4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(CNContactContentDisplayViewController *)self contact],
        char v6 = objc_claimAutoreleasedReturnValue(),
        [v6 mainStoreLinkedContacts],
        int v7 = objc_claimAutoreleasedReturnValue(),
        unint64_t v8 = [v7 count],
        v7,
        v6,
        v8 > 1))
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    id v10 = [(CNContactContentDisplayViewController *)self cardShareLocationGroup];

    if (v5 == v10)
    {
      id v11 = [(CNContactContentDisplayViewController *)self environment];
      int v9 = [v11 runningInContactsAppOniPad] ^ 1;
    }
    else
    {
      LOBYTE(v9) = [v5 addSpacerFromPreviousGroup];
    }
  }

  return v9;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (((a4 == 0) & [(CNContactContentDisplayViewController *)self hasTableViewHeaderFirstSection]) != 0)return 0; {
  else
  }
    return &stru_1ED8AC728;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  BOOL v6 = [(CNContactContentDisplayViewController *)self hasTableViewHeaderFirstSection];
  if (a4 || !v6)
  {
    unint64_t v8 = [(CNContactContentDisplayViewController *)self _cardGroupAtTableViewSectionIndex:a4];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([(CNContactContentDisplayViewController *)self contact],
          int v9 = objc_claimAutoreleasedReturnValue(),
          [v9 mainStoreLinkedContacts],
          id v10 = objc_claimAutoreleasedReturnValue(),
          unint64_t v11 = [v10 count],
          v10,
          v9,
          v11 >= 2))
    {
      int v7 = [v8 title];
    }
    else
    {
      int v7 = 0;
    }
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  if ([(CNContactContentDisplayViewController *)self shouldShowVerifiedFooterInSection:a4])
  {
    int v7 = (objc_class *)objc_opt_class();
    unint64_t v8 = NSStringFromClass(v7);
    int v9 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:v8];

    id v10 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
    unint64_t v11 = [v10 verifiedInfoMessage];
    [v9 setAttributedString:v11];
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

- (BOOL)shouldShowVerifiedFooterInSection:(int64_t)a3
{
  id v5 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  id v6 = [v5 verifiedInfoMessage];

  if (v6)
  {
    int v7 = [(CNContactContentDisplayViewController *)self _cardGroupAtTableViewSectionIndex:a3];
    unint64_t v8 = [(CNContactContentDisplayViewController *)self cardActionsGroup];
    if (v7 != v8)
    {
      int v9 = [(CNContactContentDisplayViewController *)self cardMedicalIDGroup];
      if (v7 != v9)
      {
        BOOL v10 = 0;
        goto LABEL_9;
      }
      if ([v7 addSpacerFromPreviousGroup])
      {
        BOOL v10 = 0;
        int v9 = v7;
        goto LABEL_9;
      }
    }
    unint64_t v11 = [(CNContactContentDisplayViewController *)self contactView];
    BOOL v10 = [(CNContactContentDisplayViewController *)self tableView:v11 shouldHaveFullLengthBottomSeparatorForSection:a3];

    int v9 = v7;
    if (v7 == v8)
    {
LABEL_10:

      return v10;
    }
LABEL_9:

    goto LABEL_10;
  }
  return 0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  int v7 = [(CNContactContentDisplayViewController *)self _cardGroupAtTableViewSectionIndex:a4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(CNContactContentDisplayViewController *)self contact],
        unint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v8 mainStoreLinkedContacts],
        int v9 = objc_claimAutoreleasedReturnValue(),
        unint64_t v10 = [v9 count],
        v9,
        v8,
        v10 > 1))
  {
    double v11 = 44.0;
  }
  else if ([v6 numberOfSections] - 1 == a4)
  {
    id v12 = [(CNContactContentDisplayViewController *)self contact];
    double v13 = [v12 phonemeData];

    if (v13) {
      double v11 = 0.0;
    }
    else {
      double v11 = 44.0;
    }
  }
  else if ([(CNContactContentDisplayViewController *)self shouldShowVerifiedFooterInSection:a4])
  {
    double v11 = *MEMORY[0x1E4FB2F28];
  }
  else
  {
    double v11 = 0.0;
  }

  return v11;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = [(CNContactContentDisplayViewController *)self _cardGroupAtTableViewSectionIndex:a4];
  int v7 = [v6 title];

  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();
  int v9 = +[CNContactStyle currentStyle];
  int v10 = [v9 usesInsetPlatterStyle];

  double v11 = 0.0;
  if (v10) {
    BOOL v12 = (v10 & isKindOfClass) == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (!v12)
  {
    if (((v7 != 0) & isKindOfClass) == 1
      && ([(CNContactContentDisplayViewController *)self contact],
          double v13 = objc_claimAutoreleasedReturnValue(),
          [v13 mainStoreLinkedContacts],
          id v14 = objc_claimAutoreleasedReturnValue(),
          unint64_t v15 = [v14 count],
          v14,
          v13,
          v15 >= 2))
    {
      id v16 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
      [v16 _scaledValueForValue:44.0];
      double v11 = v17 + 15.0;
    }
    else
    {
      id v18 = [(CNContactContentDisplayViewController *)self cardShareLocationGroup];

      if (v6 == v18)
      {
        double v11 = 55.0;
      }
      else if (((a4 != 1) & [v6 addSpacerFromPreviousGroup]) != 0)
      {
        double v11 = 55.0;
      }
      else
      {
        double v11 = 0.0;
      }
    }
  }

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  if (![(CNContactContentDisplayViewController *)self isTableViewHeaderFirstSectionIndexPath:v6])
  {
    int v7 = [v19 cellForRowAtIndexPath:v6];
    if ([(CNContactContentDisplayViewController *)self _indexPathIsActionItem:v6])
    {
      unint64_t v8 = [(CNContactContentDisplayViewController *)self _itemAtIndexPath:v6];
      int v9 = [v8 actions];
      int v10 = [v9 objectAtIndexedSubscript:0];

      [v10 performActionWithSender:v7];
      double v11 = [v19 indexPathForSelectedRow];
      [v19 deselectRowAtIndexPath:v11 animated:1];
    }
    else if (objc_opt_respondsToSelector())
    {
      if ([v7 shouldPerformDefaultAction])
      {
        int v12 = 1;
      }
      else
      {
        double v13 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
        int v12 = [v13 allowsPropertyActions];
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && ([v7 isSuggested] & 1) == 0)
      {
        id v14 = [(CNContactContentDisplayViewController *)self _itemAtIndexPath:v6];
        unint64_t v15 = [v14 contact];
        id v16 = [v14 property];
        double v17 = [v14 labeledValue];
        id v18 = [v17 identifier];
        int v12 = [(CNContactContentDisplayViewController *)self contactDisplayViewController:self shouldPerformDefaultActionForContact:v15 propertyKey:v16 propertyIdentifier:v18];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(CNContactContentDisplayViewController *)self _pickName];
      }
      if (v12) {
        [v7 performDefaultAction];
      }
      [v19 deselectRowAtIndexPath:v6 animated:1];
    }
  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v4 = [a3 cellForRowAtIndexPath:a4];
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  BOOL v8 = !v7 || ([v7 forceSuggested] & 1) == 0 && objc_msgSend(v7, "allowsCellSelection");
  return v8;
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  if (-[CNContactContentDisplayViewController isTableViewHeaderFirstSectionIndexPath:](self, "isTableViewHeaderFirstSectionIndexPath:", a5, a4))
  {
    [(CNContactContentDisplayViewController *)self removeFirstSectionHeaderViewControllerFromHierarchy];
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a4;
  if ([(CNContactContentDisplayViewController *)self isTableViewHeaderFirstSectionIndexPath:a5])
  {
    BOOL v8 = [(CNContactContentDisplayViewController *)self personHeaderViewController];
    [v8 didMoveToParentViewController:self];
  }
  objc_opt_class();
  id v12 = v7;
  if (objc_opt_isKindOfClass()) {
    int v9 = v12;
  }
  else {
    int v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    double v11 = [(CNContactContentDisplayViewController *)self environment];
    objc_msgSend(v10, "setShowSeparator:", objc_msgSend(v11, "runningInContactsAppOniPad"));
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
  BOOL v8 = [(CNContactContentDisplayViewController *)self cardActionsGroup];
  int64_t v9 = [(CNContactContentDisplayViewController *)self sectionOfGroup:v8];

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

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  if ([(CNContactContentDisplayViewController *)self isTableViewHeaderFirstSectionIndexPath:v6])
  {
    uint64_t v7 = [(CNContactContentDisplayViewController *)self tableViewHeaderFirstSectionCell];
  }
  else
  {
    if ([(CNContactContentDisplayViewController *)self _indexPathIsActionItem:v6])
    {
      uint64_t v7 = [(CNContactContentDisplayViewController *)self _cellForIndexPath:v6];
    }
    else
    {
      BOOL v8 = -[CNContactContentDisplayViewController _cardGroupAtTableViewSectionIndex:](self, "_cardGroupAtTableViewSectionIndex:", [v6 section]);
      if ([(CNContactContentDisplayViewController *)self isStandardGroup:v8])
      {
        uint64_t v7 = [(CNContactContentDisplayViewController *)self _cellForIndexPath:v6];
      }
      else
      {
        uint64_t v7 = 0;
      }
    }
    [(CNContactContentDisplayViewController *)self _updateLabelWidthForCell:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(CNContactContentDisplayViewController *)self prepareCell:v7];
    }
  }
  int64_t v9 = [(CNContactContentDisplayViewController *)self environment];
  int v10 = [v9 runningInContactsAppOniPad];

  if (v10)
  {
    double v11 = +[CNUIColorRepository contactCardBackgroundiPadOverwriteColor];
    [v7 setBackgroundColor:v11];
  }
  if (!v7)
  {
    double v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"CNContactContentDisplayViewController.m" lineNumber:1890 description:@"We have no cell to return!"];
  }

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  BOOL v6 = [(CNContactContentDisplayViewController *)self hasTableViewHeaderFirstSection];
  if (!a4 && v6) {
    return 1;
  }
  BOOL v8 = [(CNContactContentDisplayViewController *)self _cardGroupAtTableViewSectionIndex:a4];
  if ([(CNContactContentDisplayViewController *)self isStandardGroup:v8]) {
    [v8 displayItems];
  }
  else {
  int64_t v9 = [v8 actionItems];
  }
  int64_t v10 = [v9 count];

  return v10;
}

- (BOOL)isStandardGroup:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
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

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v4 = [(CNContactContentDisplayViewController *)self _currentGroups];
  uint64_t v5 = [v4 count];
  int64_t v6 = v5
     + [(CNContactContentDisplayViewController *)self hasTableViewHeaderFirstSection];

  return v6;
}

- (void)didChangeToShowTitle:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  [v5 setLayoutPositionallyAfterNavBar:v3];

  id v7 = [(CNContactContentDisplayViewController *)self contactHeaderView];
  int64_t v6 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  objc_msgSend(v7, "updateForShowingNavBar:", objc_msgSend(v6, "layoutPositionallyAfterNavBar"));
}

- (void)updateWithContactViewConfiguration:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = CNUILogContactCard();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_debug_impl(&dword_18B625000, v5, OS_LOG_TYPE_DEBUG, "display updateWithContactViewConfiguration: %@", (uint8_t *)&v13, 0xCu);
  }

  [(CNContactContentDisplayViewController *)self reloadDataIfNeeded];
  int64_t v6 = [(CNContactContentDisplayViewController *)self contactHeaderView];
  id v7 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  objc_msgSend(v6, "updateForShowingNavBar:", objc_msgSend(v7, "layoutPositionallyAfterNavBar"));

  BOOL v8 = [(CNContactContentDisplayViewController *)self contactHeaderView];
  int64_t v9 = [(CNContactContentDisplayViewController *)self mutableContact];
  [v8 updateWithNewContact:v9];

  BOOL v10 = [(CNContactContentDisplayViewController *)self shouldShowGemini];
  double v11 = [(CNContactContentDisplayViewController *)self contactHeaderView];
  [v11 setShouldShowGemini:v10];

  [(CNContactContentDisplayViewController *)self updateEditNavigationItemsAnimated:0];
  id v12 = [(CNContactContentDisplayViewController *)self applyContactStyle];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)setupTableFooterView
{
  if (([(CNContactContentDisplayViewController *)self isEditing] & 1) != 0
    || ([(CNContactContentDisplayViewController *)self contact],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        [v3 phonemeData],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v4))
  {
    id v19 = [(CNContactContentDisplayViewController *)self contactView];
    [(CNContactViewFooterView *)v19 setTableFooterView:0];
  }
  else
  {
    objc_opt_class();
    uint64_t v5 = [(CNContactContentDisplayViewController *)self contactView];
    id v19 = [v5 tableFooterView];
    if (objc_opt_isKindOfClass()) {
      int64_t v6 = v19;
    }
    else {
      int64_t v6 = 0;
    }
    id v7 = v6;

    if (!v7)
    {
      id v19 = objc_alloc_init(CNContactViewFooterView);
      BOOL v8 = [(CNContactContentDisplayViewController *)self contactView];
      [v8 setTableFooterView:v19];
    }
    int64_t v9 = [(CNContactContentDisplayViewController *)self contact];
    [(CNContactViewFooterView *)v19 setContact:v9];

    BOOL v10 = [(CNContactViewFooterView *)v19 label];
    double v11 = [(CNContactContentDisplayViewController *)self view];
    [v11 bounds];
    double v13 = v12;
    id v14 = [(CNContactContentDisplayViewController *)self view];
    [v14 layoutMargins];
    double v16 = v13 - v15;
    double v17 = [(CNContactContentDisplayViewController *)self view];
    [v17 layoutMargins];
    objc_msgSend(v10, "sizeThatFits:", v16 - v18, 1.79769313e308);

    [(CNContactViewFooterView *)v19 frame];
    -[CNContactViewFooterView setFrame:](v19, "setFrame:");
  }
}

- (CGSize)setupTableHeaderView
{
  if ([(CNContactContentDisplayViewController *)self shouldDisplayAvatarHeaderView])
  {
    if (objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory"))
    {
      BOOL v3 = [(CNContactContentDisplayViewController *)self contactHeaderView];
      id v4 = [v3 backgroundColor];
      uint64_t v5 = [(CNContactContentDisplayViewController *)self actionsViewController];
      int64_t v6 = [v5 view];
      [v6 setBackgroundColor:v4];

      id v7 = [(CNContactContentDisplayViewController *)self actionsWrapperView];
      goto LABEL_7;
    }
  }
  else
  {
    BOOL v8 = [(CNContactContentDisplayViewController *)self contactView];
    int64_t v9 = [v8 customHeaderView];

    if (v9)
    {
      BOOL v10 = [(CNContactContentDisplayViewController *)self contactView];
      id v7 = [v10 customHeaderView];

      goto LABEL_7;
    }
  }
  id v7 = 0;
LABEL_7:
  double v11 = [(CNContactContentDisplayViewController *)self contactView];
  double v12 = [v11 tableHeaderView];
  char v13 = [v12 needsUpdateConstraints];

  if (v7)
  {
    [v7 frame];
    double v15 = v14;
    double v17 = v16;
  }
  else
  {
    double v15 = *MEMORY[0x1E4F1DB30];
    double v17 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v18 = [(CNContactContentDisplayViewController *)self contactView];
  [v18 setTableHeaderView:v7];

  if ((v13 & 1) == 0)
  {
    id v19 = [(CNContactContentDisplayViewController *)self contactView];
    unint64_t v20 = [v19 tableHeaderView];
    int v21 = [v20 needsUpdateConstraints];

    if (v21)
    {
      int v22 = [(CNContactContentDisplayViewController *)self contactView];
      double v23 = [v22 tableHeaderView];
      [v23 updateConstraints];
    }
  }

  double v24 = v15;
  double v25 = v17;
  result.CGFloat height = v25;
  result.double width = v24;
  return result;
}

- (void)viewDidLayoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)CNContactContentDisplayViewController;
  [(CNContactContentDisplayViewController *)&v12 viewDidLayoutSubviews];
  [(CNContactContentDisplayViewController *)self _updateCachedLabelWidthsIfNeeded];
  [(CNContactContentDisplayViewController *)self setupTableHeaderView];
  double v4 = v3;
  double v6 = v5;
  [(CNContactContentDisplayViewController *)self initializeTableViewsForHeaderHeight];
  [(CNContactContentDisplayViewController *)self adjustPreferredContentSize];
  id v7 = [(CNContactContentDisplayViewController *)self contactView];
  BOOL v8 = [v7 tableHeaderView];

  if (v8)
  {
    [v8 frame];
    if (v4 != v10 || v6 != v9)
    {
      double v11 = [(CNContactContentDisplayViewController *)self contactView];
      [v11 setTableHeaderView:v8];
    }
  }
  [(CNContactContentDisplayViewController *)self setupTableFooterView];
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CNContactContentDisplayViewController;
  [(CNContactContentDisplayViewController *)&v4 viewWillLayoutSubviews];
  double v3 = [(CNContactContentDisplayViewController *)self contactHeaderView];
  [v3 calculateLabelSizesIfNeeded];

  [(CNContactContentDisplayViewController *)self updateOutOfProcessFullscreenPresentationIfNeeded];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CNContactContentDisplayViewController;
  [(CNContactContentDisplayViewController *)&v6 viewWillDisappear:a3];
  objc_super v4 = [(CNContactContentDisplayViewController *)self siriContextProvider];
  [v4 setEnabled:0];

  [(CNContactContentDisplayViewController *)self updateWindowTitleForAppearing:0];
  double v5 = [(CNContactContentDisplayViewController *)self shareLocationController];
  [v5 stopUpdatingFriends];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CNContactContentDisplayViewController;
  [(CNContactContentDisplayViewController *)&v6 viewDidAppear:a3];
  if (self->_needsRefetch)
  {
    [(CNContactContentDisplayViewController *)self _refetchContact];
    self->_needsRefetch = 0;
  }
  objc_super v4 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  char v5 = [v4 alwaysEditing];

  if ((v5 & 1) == 0) {
    [(CNContactContentDisplayViewController *)self becomeFirstResponder];
  }
  [(CNContactContentDisplayViewController *)self updateWindowTitleForAppearing:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CNContactContentDisplayViewController *)self forcesTransparentBackground])
  {
    uint64_t v5 = +[CNUIColorRepository transparentBackgroundColor];
  }
  else if ([(UIViewController *)self ab_shouldUseTransparentBackgroundInPopovers])
  {
    uint64_t v5 = +[CNUIColorRepository popoverBackgroundColor];
  }
  else
  {
    objc_super v6 = [(CNContactContentDisplayViewController *)self environment];
    int v7 = [v6 runningInContactsAppOniPad];

    if (!v7) {
      goto LABEL_8;
    }
    uint64_t v5 = +[CNUIColorRepository contactCardBackgroundiPadOverwriteColor];
  }
  BOOL v8 = (void *)v5;
  double v9 = [(CNContactContentDisplayViewController *)self contactView];
  [v9 setBackgroundColor:v8];

LABEL_8:
  v18.receiver = self;
  v18.super_class = (Class)CNContactContentDisplayViewController;
  [(CNContactContentDisplayViewController *)&v18 viewWillAppear:v3];
  double v10 = +[CNContactStyle currentStyle];
  double v11 = [v10 backgroundColor];

  if (v11)
  {
    objc_super v12 = +[CNContactStyle currentStyle];
    char v13 = [v12 backgroundColor];
    double v14 = [(CNContactContentDisplayViewController *)self view];
    [v14 setBackgroundColor:v13];
  }
  double v15 = [(CNContactContentDisplayViewController *)self contactView];
  objc_msgSend(v15, "_cnui_applyContactStyle");

  if (![(CNContactContentDisplayViewController *)self reloadDataIfNeeded]) {
    [(CNContactContentDisplayViewController *)self _setNeedsUpdateCachedLabelWidths];
  }
  [(CNContactContentDisplayViewController *)self updateEditNavigationItemsAnimated:0];
  double v16 = [(CNContactContentDisplayViewController *)self siriContextProvider];
  [v16 setEnabled:1];

  double v17 = [(CNContactContentDisplayViewController *)self shareLocationController];
  [v17 startUpdatingFriends];
}

- (void)updateViewConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)CNContactContentDisplayViewController;
  [(CNContactContentDisplayViewController *)&v3 updateViewConstraints];
  [(CNContactContentDisplayViewController *)self setupConstraints];
}

- (void)setupConstraints
{
  BOOL v3 = [(CNContactContentDisplayViewController *)self shouldDisplayAvatarHeaderView];
  [(CNContactContentDisplayViewController *)self setupViewHierarchyIncludingAvatarHeader:v3];
  [(CNContactContentDisplayViewController *)self setupTableHeaderView];
  [(CNContactContentDisplayViewController *)self setupTableFooterView];
  objc_super v4 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v5 = [(CNContactContentDisplayViewController *)self activatedConstraints];
  [v4 deactivateConstraints:v5];

  id v101 = [MEMORY[0x1E4F1CA48] array];
  if (v3)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F28DC8];
    int v7 = [(CNContactContentDisplayViewController *)self contactHeaderView];
    BOOL v8 = [(CNContactContentDisplayViewController *)self contactHeaderView];
    [v8 maxHeight];
    double v10 = [v6 constraintWithItem:v7 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v9];
    [(CNContactContentDisplayViewController *)self setHeaderHeightConstraint:v10];

    double v11 = [(CNContactContentDisplayViewController *)self headerHeightConstraint];
    [v101 addObject:v11];

    objc_super v12 = [(CNContactContentDisplayViewController *)self contactHeaderView];
    char v13 = [v12 topAnchor];
    double v14 = [(CNContactContentDisplayViewController *)self view];
    double v15 = [v14 topAnchor];
    double v16 = [v13 constraintEqualToAnchor:v15];
    [v101 addObject:v16];

    double v17 = [(CNContactContentDisplayViewController *)self contactHeaderView];
    objc_super v18 = [v17 leftAnchor];
    id v19 = [(CNContactContentDisplayViewController *)self view];
    unint64_t v20 = [v19 leftAnchor];
    int v21 = [v18 constraintEqualToAnchor:v20];
    [v101 addObject:v21];

    int v22 = [(CNContactContentDisplayViewController *)self contactHeaderView];
    double v23 = [v22 rightAnchor];
    double v24 = [(CNContactContentDisplayViewController *)self view];
    double v25 = [v24 rightAnchor];
    double v26 = [v23 constraintEqualToAnchor:v25];
    [v101 addObject:v26];

    double v27 = [(CNContactContentDisplayViewController *)self contactView];
    double v28 = [v27 topAnchor];
    long long v29 = [(CNContactContentDisplayViewController *)self view];
    long long v30 = [v29 topAnchor];
    long long v31 = [v28 constraintEqualToAnchor:v30];
    [v101 addObject:v31];

    id v32 = [(CNContactContentDisplayViewController *)self contactView];
    uint64_t v33 = [v32 bottomAnchor];
    uint64_t v34 = [(CNContactContentDisplayViewController *)self view];
    uint64_t v35 = [v34 bottomAnchor];
    id v36 = [v33 constraintEqualToAnchor:v35];
    [v101 addObject:v36];

    id v37 = [(CNContactContentDisplayViewController *)self headerDropShadowView];
    CGRect v38 = [v37 superview];

    if (v38)
    {
      id v39 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v39 scale];
      double v41 = v40;

      id v42 = [(CNContactContentDisplayViewController *)self headerDropShadowView];
      id v43 = [v42 heightAnchor];
      dispatch_time_t v44 = [v43 constraintEqualToConstant:1.0 / v41];
      [v101 addObject:v44];

      uint64_t v45 = [(CNContactContentDisplayViewController *)self headerDropShadowView];
      id v46 = [v45 bottomAnchor];
      int v47 = [(CNContactContentDisplayViewController *)self headerDropShadowView];
      double v48 = [v47 superview];
      int v49 = [v48 bottomAnchor];
      char v50 = [v46 constraintEqualToAnchor:v49];
      [v101 addObject:v50];

      double v51 = [(CNContactContentDisplayViewController *)self headerDropShadowView];
      id v52 = [v51 leftAnchor];
      uint64_t v53 = [(CNContactContentDisplayViewController *)self headerDropShadowView];
      uint64_t v54 = [v53 superview];
      int v55 = [v54 leftAnchor];
      v56 = [v52 constraintEqualToAnchor:v55];
      [v101 addObject:v56];

      id v57 = [(CNContactContentDisplayViewController *)self headerDropShadowView];
      id v58 = [v57 rightAnchor];
      id v59 = [(CNContactContentDisplayViewController *)self headerDropShadowView];
      uint64_t v60 = [v59 superview];
      uint64_t v61 = [v60 rightAnchor];
      id v62 = [v58 constraintEqualToAnchor:v61];
      [v101 addObject:v62];
    }
    v63 = +[CNContactStyle currentStyle];
    if ([v63 usesInsetPlatterStyle]) {
      double v64 = 20.0;
    }
    else {
      double v64 = 10.0;
    }

    char v65 = +[CNContactStyle currentStyle];
    if ([v65 usesInsetPlatterStyle]) {
      double v66 = 16.0;
    }
    else {
      double v66 = 15.0;
    }

    v67 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
    int v68 = [v67 allowsActionsModel];

    if (v68)
    {
      uint64_t v69 = [(CNContactContentDisplayViewController *)self view];
      v70 = [v69 leadingAnchor];
      v71 = [(CNContactContentDisplayViewController *)self actionsWrapperView];
      id v72 = [v71 leadingAnchor];
      uint64_t v73 = [v70 constraintEqualToAnchor:v72];
      [v101 addObject:v73];

      long long v74 = [(CNContactContentDisplayViewController *)self view];
      long long v75 = [v74 trailingAnchor];
      long long v76 = [(CNContactContentDisplayViewController *)self actionsWrapperView];
      long long v77 = [v76 trailingAnchor];
      long long v78 = [v75 constraintEqualToAnchor:v77];
      [v101 addObject:v78];

      if ((objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory") & 1) == 0)
      {
        long long v79 = [(CNContactContentDisplayViewController *)self actionsWrapperView];
        long long v80 = [v79 topAnchor];
        v81 = [(CNContactContentDisplayViewController *)self contactHeaderView];
        v82 = [v81 bottomAnchor];
        uint64_t v83 = [v80 constraintEqualToAnchor:v82];
        [v101 addObject:v83];
      }
      v84 = [(CNContactContentDisplayViewController *)self actionsWrapperView];
      objc_msgSend(v84, "setLayoutMargins:", v64, 8.0, v66, 8.0);

      v85 = [(CNContactContentDisplayViewController *)self view];
      v86 = objc_msgSend(v85, "_cnui_contactStyle");
      [v86 sectionMaximumPlatterWidth];
      double v88 = v87;
      double v89 = *MEMORY[0x1E4F4BEC8];
      v90 = [(CNContactInlineActionsViewController *)self->_actionsViewController view];
      objc_msgSend(v90, "setMinimumLayoutSize:", v88, v89);
    }
  }
  v91 = [(CNContactContentDisplayViewController *)self contactView];
  v92 = [v91 leftAnchor];
  v93 = [(CNContactContentDisplayViewController *)self view];
  v94 = [v93 leftAnchor];
  v95 = [v92 constraintEqualToAnchor:v94];
  [v101 addObject:v95];

  v96 = [(CNContactContentDisplayViewController *)self contactView];
  v97 = [v96 rightAnchor];
  v98 = [(CNContactContentDisplayViewController *)self view];
  v99 = [v98 rightAnchor];
  v100 = [v97 constraintEqualToAnchor:v99];
  [v101 addObject:v100];

  [(CNContactContentDisplayViewController *)self setActivatedConstraints:v101];
  [MEMORY[0x1E4F28DC8] activateConstraints:v101];
}

- (BOOL)shouldDisplayAvatarHeaderView
{
  id v2 = [(CNContactContentDisplayViewController *)self contactHeaderView];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)CNContactContentDisplayViewController;
  [(CNContactContentDisplayViewController *)&v10 viewDidLoad];
  uint64_t v3 = *MEMORY[0x1E4F5A298];
  objc_super v4 = [(CNContactContentDisplayViewController *)self initialPrompt];
  LOBYTE(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  if ((v3 & 1) == 0)
  {
    uint64_t v5 = [(CNContactContentDisplayViewController *)self initialPrompt];
    objc_super v6 = [(CNContactContentDisplayViewController *)self navigationItem];
    [v6 setPrompt:v5];
  }
  if ([(CNContactContentDisplayViewController *)self shouldDrawNavigationBar])
  {
    int v7 = [(CNContactContentDisplayViewController *)self navigationItem];
    [v7 _setBackgroundHidden:0];
  }
  [(CNContactContentDisplayViewController *)self reloadDataIfNeeded];
  BOOL v8 = objc_alloc_init(CNContactContentNavigationItemUpdater);
  [(CNContactContentDisplayViewController *)self setContactNavigationItemUpdater:v8];

  double v9 = [(CNContactContentDisplayViewController *)self view];
  [v9 setNeedsUpdateConstraints];
}

- (void)setupViewHierarchyIncludingAvatarHeader:(BOOL)a3
{
  BOOL v3 = a3;
  v42[1] = *MEMORY[0x1E4F143B8];
  if ([(CNContactContentDisplayViewController *)self isViewLoaded])
  {
    uint64_t v5 = [(CNContactContentDisplayViewController *)self view];
    objc_super v6 = [MEMORY[0x1E4F1CA48] array];
    int v7 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v8 = [(CNContactContentDisplayViewController *)self contactHeaderView];
    double v9 = (void *)v8;
    if (v3)
    {
      v42[0] = v8;
      objc_super v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
      double v11 = v7;
    }
    else
    {
      uint64_t v41 = v8;
      objc_super v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
      double v11 = v6;
    }
    [v11 addObjectsFromArray:v10];

    if ((objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory") & 1) == 0)
    {
      objc_super v12 = [(CNContactContentDisplayViewController *)self actionsWrapperView];
      [v7 addObject:v12];

      char v13 = [(CNContactContentDisplayViewController *)self view];
      double v14 = objc_msgSend(v13, "_cnui_contactStyle");
      int v15 = [v14 usesOpaqueBackground];

      if (v15)
      {
        double v16 = [(CNContactContentDisplayViewController *)self actionsWrapperView];
        double v17 = [(CNContactContentDisplayViewController *)self headerDropShadowView];
        [v16 addSubview:v17];
      }
    }
    objc_super v18 = [(CNContactContentDisplayViewController *)self contactView];
    [v7 addObject:v18];

    id v19 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
    char v20 = [v19 allowsActionsModel];

    if ((v20 & 1) == 0)
    {
      int v21 = [(CNContactContentDisplayViewController *)self actionsViewController];
      int v22 = [v21 view];
      [v22 removeFromSuperview];
    }
    double v23 = [(CNContactContentDisplayViewController *)self contactView];
    double v24 = [v23 panGestureRecognizer];
    double v25 = [v24 view];
    double v26 = [(CNContactContentDisplayViewController *)self view];

    if (v25 != v26)
    {
      double v27 = [(CNContactContentDisplayViewController *)self contactView];
      double v28 = [v27 panGestureRecognizer];
      long long v29 = [v28 view];
      long long v30 = [(CNContactContentDisplayViewController *)self contactView];
      long long v31 = [v30 panGestureRecognizer];
      [v29 removeGestureRecognizer:v31];

      id v32 = [(CNContactContentDisplayViewController *)self view];
      uint64_t v33 = [(CNContactContentDisplayViewController *)self contactView];
      uint64_t v34 = [v33 panGestureRecognizer];
      [v32 addGestureRecognizer:v34];
    }
    uint64_t v36 = MEMORY[0x1E4F143A8];
    uint64_t v37 = 3221225472;
    CGRect v38 = __81__CNContactContentDisplayViewController_setupViewHierarchyIncludingAvatarHeader___block_invoke;
    id v39 = &unk_1E549B5B8;
    id v40 = v5;
    id v35 = v5;
    [v7 enumerateObjectsUsingBlock:&v36];
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", &__block_literal_global_356, v36, v37, v38, v39);
  }
}

uint64_t __81__CNContactContentDisplayViewController_setupViewHierarchyIncludingAvatarHeader___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) insertSubview:a2 atIndex:0];
}

uint64_t __81__CNContactContentDisplayViewController_setupViewHierarchyIncludingAvatarHeader___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperview];
}

- (void)loadContactViewControllerViews
{
  BOOL v3 = [(CNContactContentDisplayViewController *)self contactView];
  objc_super v4 = [(CNContactContentDisplayViewController *)self contactView];
  uint64_t v5 = objc_opt_class();
  objc_super v6 = [v5 cellIdentifierForClass:objc_opt_class()];
  int v7 = [v3 dequeueReusableCellWithIdentifier:v6];
  [(CNContactContentDisplayViewController *)self setNoteCell:v7];

  id v9 = [(CNContactContentDisplayViewController *)self view];
  uint64_t v8 = [(CNContactContentDisplayViewController *)self contactView];
  [v9 addSubview:v8];
}

- (void)loadView
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(CNContactContentDisplayViewController *)self setView:v3];

  [(CNContactContentDisplayViewController *)self loadContactViewControllerViews];
}

- (void)toggleEditing:(id)a3
{
  objc_super v4 = [(CNContactContentDisplayViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CNContactContentDisplayViewController *)self delegate];
    [v6 contactDisplayViewController:self didChangeToEditMode:1];
  }
}

- (BOOL)saveWasAuthorized
{
  id v2 = [(CNContactContentDisplayViewController *)self editAuthorizationManager];
  char v3 = [v2 saveWasAuthorized];

  return v3;
}

- (void)cancelAsyncLookups
{
  char v3 = [(CNContactContentDisplayViewController *)self faceTimeIDSLookupToken];
  [v3 cancel];

  [(CNContactContentDisplayViewController *)self setFaceTimeIDSLookupToken:0];
  objc_super v4 = [(CNContactContentDisplayViewController *)self iMessageIDSLookupToken];
  [v4 cancel];

  [(CNContactContentDisplayViewController *)self setIMessageIDSLookupToken:0];
  char v5 = [(CNContactContentDisplayViewController *)self medicalIDLookupToken];
  [v5 cancel];

  [(CNContactContentDisplayViewController *)self setMedicalIDLookupToken:0];
}

- (void)updateWindowTitleForAppearing:(BOOL)a3
{
  if (a3)
  {
    id v10 = [(CNContactContentDisplayViewController *)self title];
    if (!v10)
    {
      objc_super v4 = [(CNContactContentDisplayViewController *)self navigationController];
      id v10 = [v4 title];

      if (!v10)
      {
        char v5 = [(CNContactContentDisplayViewController *)self contactFormatter];
        id v6 = [(CNContactContentDisplayViewController *)self contact];
        id v10 = [v5 stringFromContact:v6];
      }
    }
    int v7 = [(CNContactContentDisplayViewController *)self view];
    uint64_t v8 = [v7 window];
    id v9 = [v8 windowScene];
    [v9 setTitle:v10];
  }
  else
  {
    id v10 = [(CNContactContentDisplayViewController *)self view];
    int v7 = [v10 window];
    uint64_t v8 = [v7 windowScene];
    [v8 setTitle:0];
  }
}

- (id)currentNavigationController
{
  id v2 = [(CNContactContentDisplayViewController *)self navigationItemController];
  char v3 = [v2 navigationController];

  objc_super v4 = [v3 navigationBar];
  char v5 = [v4 backItem];
  if (v5)
  {

LABEL_3:
    id v6 = v3;
    goto LABEL_6;
  }
  int v7 = [v3 navigationController];
  uint64_t v8 = [v7 navigationBar];
  id v9 = [v8 backItem];

  if (!v9) {
    goto LABEL_3;
  }
  id v6 = [v3 navigationController];
LABEL_6:
  id v10 = v6;

  return v10;
}

- (void)updateEditNavigationItemsAnimated:(BOOL)a3
{
  [(CNContactContentDisplayViewController *)self isOutOfProcess];
  objc_super v4 = [(CNContactContentDisplayViewController *)self currentNavigationController];
  char v5 = [v4 navigationBar];
  id v6 = [v5 backItem];
  BOOL v7 = v6 != 0;

  uint64_t v8 = [(CNContactContentDisplayViewController *)self contactNavigationItemUpdater];
  id v9 = [(CNContactContentDisplayViewController *)self navigationItemController];
  int64_t v10 = [(CNContactContentDisplayViewController *)self mode];
  double v11 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  uint64_t v12 = [v11 allowsEditing];
  char v13 = [(CNContactContentDisplayViewController *)self editAuthorizationManager];
  uint64_t v14 = [v13 shouldPromptForPasscodeAuthorization];
  BOOL v15 = [(UIViewController *)self ab_isInSheet];
  LOBYTE(v21) = a3;
  BYTE2(v20) = 0;
  BYTE1(v20) = v7;
  LOBYTE(v20) = [(CNContactContentDisplayViewController *)self shouldDrawNavigationBar];
  objc_msgSend(v8, "updateDisplayNavigationItemsForController:mode:actionTarget:allowsEditing:editRequiresAuthorization:isInSheet:isShowingNavBar:shouldShowBackButton:shouldUsePlatterStyle:platterBackBarButtonItem:animated:", v9, v10, self, v12, v14, v15, v20, 0, v21);
  id v23 = (id)objc_claimAutoreleasedReturnValue();

  -[CNContactContentDisplayViewController setEditKeyboardShortcutEnabled:](self, "setEditKeyboardShortcutEnabled:", [v23 enableEditShortcut]);
  -[CNContactContentDisplayViewController setCancelKeyboardShortcutEnabled:](self, "setCancelKeyboardShortcutEnabled:", [v23 enableCancelShortcut]);
  double v16 = [(CNContactContentDisplayViewController *)self navigationItemDelegate];
  double v17 = [(CNContactContentDisplayViewController *)self navigationItemController];
  objc_super v18 = [v17 navigationItem];
  id v19 = [(CNContactContentDisplayViewController *)self doneButtonItem];
  [v16 contactNavigationItemProvider:self didUpdateNavigationItem:v18 doneButtonItem:v19];
}

- (UINavigationItem)effectiveNavigationItem
{
  id v2 = [(CNContactContentDisplayViewController *)self navigationItemController];
  char v3 = [v2 navigationItem];

  return (UINavigationItem *)v3;
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  if (a3 == 4)
  {
    char v5 = [(CNContactContentDisplayViewController *)self contactView];
  }
  else
  {
    char v5 = 0;
  }
  return v5;
}

- (id)_policyForContact:(id)a3 mode:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  if (![v7 allowsAddingToAddressBook])
  {
    double v11 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
    if ([v11 allowsEditing])
    {
      int v12 = [v6 hasBeenPersisted];

      if (v12) {
        goto LABEL_3;
      }
    }
    else
    {
    }
LABEL_12:
    char v13 = [MEMORY[0x1E4F1BA68] sharedPermissivePolicy];
    goto LABEL_13;
  }

LABEL_3:
  if ((unint64_t)a4 <= 5 && ((1 << a4) & 0x32) != 0)
  {
    uint64_t v8 = [(CNContactContentDisplayViewController *)self contactViewCache];
    id v9 = v8;
    id v10 = v6;
  }
  else
  {
    uint64_t v8 = [(CNContactContentDisplayViewController *)self contactViewCache];
    id v9 = v8;
    id v10 = 0;
  }
  char v13 = [v8 policyForContact:v10];

  if (!v13) {
    goto LABEL_12;
  }
LABEL_13:

  return v13;
}

- (id)indexPathOfPropertyItem:(id)a3
{
  id v4 = a3;
  char v5 = [v4 group];
  int64_t v6 = [(CNContactContentDisplayViewController *)self sectionOfGroup:v5];
  BOOL v7 = [v5 displayItems];
  uint64_t v8 = [v7 indexOfObject:v4];

  id v9 = 0;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL && v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = [MEMORY[0x1E4F28D58] indexPathForRow:v8 inSection:v6];
  }

  return v9;
}

- (void)adjustPreferredContentSize
{
  [(CNContactContentDisplayViewController *)self requiredSizeForVisibleTableView];
  double v4 = v3;
  double v6 = v5;
  [(CNContactContentDisplayViewController *)self preferredContentSize];
  if (v4 != v8 || v6 != v7)
  {
    -[CNContactContentDisplayViewController setPreferredContentSize:](self, "setPreferredContentSize:", v4, v6);
    id v10 = [(CNContactContentDisplayViewController *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = [(CNContactContentDisplayViewController *)self delegate];
      [(CNContactContentDisplayViewController *)self preferredContentSize];
      objc_msgSend(v12, "contactDisplayViewController:didChangePreferredContentSize:", self);
    }
  }
}

- (void)reloadCardGroup:(id)a3
{
  id v8 = a3;
  double v4 = [(CNContactContentDisplayViewController *)self contactView];
  if ([(CNContactContentDisplayViewController *)self isViewLoaded])
  {
    if (![(CNContactContentDisplayViewController *)self needsReload])
    {
      int64_t v5 = [(CNContactContentDisplayViewController *)self sectionOfGroup:v8];
      if (v5 != 0x7FFFFFFFFFFFFFFFLL)
      {
        int64_t v6 = v5;
        [v4 beginUpdates];
        double v7 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v6];
        [v4 reloadSections:v7 withRowAnimation:0];

        [v4 endUpdates];
        [(CNContactContentDisplayViewController *)self updateHeaderHeightToMatchScrollViewState:v4 scrollDirection:2 animated:0];
        [(CNContactContentDisplayViewController *)self adjustPreferredContentSize];
      }
    }
  }
}

- (void)removeActionWithTarget:(id)a3 selector:(SEL)a4 inGroup:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [v9 removeActionWithTarget:v8 selector:a4];
  id v10 = [(CNContactContentDisplayViewController *)self customActions];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  double v16 = __81__CNContactContentDisplayViewController_removeActionWithTarget_selector_inGroup___block_invoke;
  double v17 = &unk_1E549B520;
  id v18 = v8;
  id v19 = v9;
  uint64_t v20 = self;
  SEL v21 = a4;
  id v11 = v9;
  id v12 = v8;
  char v13 = objc_msgSend(v10, "_cn_filter:", &v14);
  -[CNContactContentDisplayViewController setCustomActions:](self, "setCustomActions:", v13, v14, v15, v16, v17);

  [(CNContactContentDisplayViewController *)self setNeedsReload];
}

uint64_t __81__CNContactContentDisplayViewController_removeActionWithTarget_selector_inGroup___block_invoke(void *a1, void *a2)
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
    int v22 = [(CNContactContentDisplayViewController *)self contact];
    id v23 = [v22 identifier];
    double v24 = [(CNCustomCardAction *)v21 initWithTitle:v14 targetActionWrapper:v18 contactIdentifier:v23 placement:v20 isDestructive:v8 menuProvider:v15];

    double v25 = [(CNContactContentDisplayViewController *)self customActions];
    double v26 = [v25 arrayByAddingObject:v24];
    [(CNContactContentDisplayViewController *)self setCustomActions:v26];
  }
  else
  {
    double v24 = CNUILogContactCard();
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
  [(CNContactContentDisplayViewController *)self setNeedsReload];
}

- (void)addActionWithTitle:(id)a3 menuProvider:(id)a4 inGroup:(id)a5 destructive:(BOOL)a6
{
}

- (int64_t)sectionOfGroup:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CNContactContentDisplayViewController *)self _currentGroups];
  int64_t v6 = v5;
  int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5)
  {
    uint64_t v8 = [v5 indexOfObject:v4];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL) {
      int64_t v7 = [(CNContactContentDisplayViewController *)self tableViewSectionIndexFromGroupIndex:v8];
    }
  }

  return v7;
}

- (id)cardGroupForProperty:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CNContactContentDisplayViewController *)self propertyGroups];
  int64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)reloadDataPreservingChanges:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (![(CNContactContentDisplayViewController *)self isViewLoaded]) {
    return;
  }
  [(CNContactContentDisplayViewController *)self isOutOfProcess];
  self->_needsReload = 0;
  int64_t v5 = [(CNContactContentDisplayViewController *)self contactStore];

  if (!v5)
  {
    int64_t v6 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
    int64_t v7 = [v6 contactStore];

    if (v7)
    {
      uint64_t v8 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
      uint64_t v9 = [v8 contactStore];
    }
    else
    {
      id v11 = [(CNContactContentDisplayViewController *)self originalContacts];
      uint64_t v8 = objc_msgSend(v11, "_cn_filter:", &__block_literal_global_58546);

      if ([v8 count]) {
        uint64_t v12 = 7;
      }
      else {
        uint64_t v12 = 1;
      }
      char v13 = [(CNContactContentDisplayViewController *)self managedConfiguration];

      if (v13)
      {
        id v14 = objc_alloc(MEMORY[0x1E4F1B980]);
        id v10 = [(CNContactContentDisplayViewController *)self environment];
        id v15 = [v10 cnEnvironment];
        id v16 = [(CNContactContentDisplayViewController *)self managedConfiguration];
        id v17 = (void *)[v14 initWithEnvironment:v15 options:v12 managedConfiguration:v16];
        [(CNContactContentDisplayViewController *)self setContactStore:v17];

        goto LABEL_11;
      }
      uint64_t v9 = [MEMORY[0x1E4F1B980] storeWithOptions:v12];
    }
    id v10 = (void *)v9;
    [(CNContactContentDisplayViewController *)self setContactStore:v9];
LABEL_11:
  }
  if (![(CNContactContentDisplayViewController *)self mode])
  {
    id v18 = [(CNContactContentDisplayViewController *)self parentViewController];
    objc_getClass("ABNewPersonViewController");
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      [(CNContactContentDisplayViewController *)self setMode:3];
    }
  }
  if ([MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] != 3)
  {
    int64_t v20 = CNUILogContactCard();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18B625000, v20, OS_LOG_TYPE_ERROR, "CNContactContentViewController does not have authorization to access contacts.", buf, 2u);
    }
  }
  SEL v21 = [(CNContactContentDisplayViewController *)self shadowCopyOfReadonlyContact];

  if (!v21)
  {
    int v22 = [(CNContactContentDisplayViewController *)self contact];
    id v23 = [(CNContactContentDisplayViewController *)self _policyForContact:v22 mode:[(CNContactContentDisplayViewController *)self mode]];
    [(CNContactContentDisplayViewController *)self setPolicy:v23];
  }
  double v24 = [(CNContactContentDisplayViewController *)self contact];
  int v25 = [v24 isUnified];

  if (v25)
  {
    double v26 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v27 = [(CNContactContentDisplayViewController *)self contact];
    id v28 = [v27 linkedContacts];

    uint64_t v29 = [v28 countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v46 != v31) {
            objc_enumerationMutation(v28);
          }
          uint64_t v33 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          uint64_t v34 = [(CNContactContentDisplayViewController *)self _policyForContact:v33 mode:[(CNContactContentDisplayViewController *)self mode]];
          if (v34)
          {
            id v35 = [v33 identifier];
            [v26 setObject:v34 forKey:v35];
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v30);
    }

    uint64_t v36 = (void *)[v26 copy];
    [(CNContactContentDisplayViewController *)self setLinkedPoliciesByContactIdentifier:v36];
  }
  uint64_t v37 = [(CNContactContentDisplayViewController *)self iMessageIDSLookupToken];
  [v37 cancel];

  CGRect v38 = [(CNContactContentDisplayViewController *)self faceTimeIDSLookupToken];
  [v38 cancel];

  if (!self->_propertyGroups)
  {
    id v39 = [(CNContactContentDisplayViewController *)self _loadPropertyGroups];
    propertyGroups = self->_propertyGroups;
    self->_propertyGroups = v39;
  }
  if (([MEMORY[0x1E4F1B8F8] quickActionsEnabled] & 1) == 0) {
    [(CNContactContentDisplayViewController *)self _reloadFaceTimeGroup];
  }
  [(CNContactContentDisplayViewController *)self _reloadGeminiGroupPreservingChanges:v3];
  [(CNContactContentDisplayViewController *)self _reloadPropertyGroupsPreservingChanges:v3];
  [(CNContactContentDisplayViewController *)self _reloadMedicalIDGroup];
  [(CNContactContentDisplayViewController *)self _reloadAlertGroups];
  [(CNContactContentDisplayViewController *)self setupActionsPreservingChanges:v3];
  [(CNContactContentDisplayViewController *)self _reloadLinkedCardsGroup];
  uint64_t v41 = [(CNContactContentDisplayViewController *)self _loadDisplayGroups];
  [(CNContactContentDisplayViewController *)self setDisplayGroups:v41];

  [(CNContactContentDisplayViewController *)self _setNeedsUpdateCachedLabelWidths];
  [(CNContactContentDisplayViewController *)self _updateAvailableTransports];
  id v42 = [(CNContactContentDisplayViewController *)self contactView];
  [v42 reloadData];

  id v43 = [(CNContactContentDisplayViewController *)self contactHeaderView];
  [v43 reloadDataPreservingChanges:v3];

  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __69__CNContactContentDisplayViewController_reloadDataPreservingChanges___block_invoke_341;
  v44[3] = &unk_1E549B488;
  v44[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v44];
  [(CNContactContentDisplayViewController *)self _updateUserActivity];
  [(CNContactContentDisplayViewController *)self adjustPreferredContentSize];
}

uint64_t __69__CNContactContentDisplayViewController_reloadDataPreservingChanges___block_invoke_341(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addFaceTimeGroupAnimated:0];
}

uint64_t __69__CNContactContentDisplayViewController_reloadDataPreservingChanges___block_invoke(uint64_t a1, void *a2)
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
        [(CNContactContentDisplayViewController *)self removeFirstSectionHeaderViewControllerFromHierarchy];
      }
      objc_storeStrong((id *)&self->_personHeaderViewController, a3);
      int v8 = [(CNContactContentDisplayViewController *)self isViewLoaded];
      unint64_t v5 = v10;
      if (v8)
      {
        uint64_t v9 = [(CNContactContentDisplayViewController *)self contactView];
        [v9 reloadData];

        unint64_t v5 = v10;
      }
    }
  }
}

- (NSArray)originalContacts
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
  v31[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CNContactContentDisplayViewController *)self contact];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F5A6D8] unifiedMeContactMonitor];
    unint64_t v5 = [(CNContactContentDisplayViewController *)self contact];
    int v6 = [v4 isMeContact:v5];

    char v7 = CNUILogContactCard();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        uint64_t v9 = [v3 identifier];
        *(_DWORD *)buf = 138543362;
        id v23 = v9;
        _os_log_impl(&dword_18B625000, v7, OS_LOG_TYPE_DEFAULT, "Refetching contact, is it the me card, identifier %{public}@", buf, 0xCu);
      }
      unint64_t v10 = [(CNContactContentDisplayViewController *)self contactStore];
      id v11 = [(id)objc_opt_class() descriptorForRequiredKeysForContact:v3];
      v31[0] = v11;
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
      id v21 = 0;
      char v13 = [v10 _crossPlatformUnifiedMeContactWithKeysToFetch:v12 error:&v21];
      id v14 = v21;
    }
    else
    {
      if (v8)
      {
        id v15 = [v3 identifier];
        *(_DWORD *)buf = 138543362;
        id v23 = v15;
        _os_log_impl(&dword_18B625000, v7, OS_LOG_TYPE_DEFAULT, "Refetching contact, is it not the me card, identifier %{public}@", buf, 0xCu);
      }
      unint64_t v10 = [(CNContactContentDisplayViewController *)self contactStore];
      id v11 = [v3 identifier];
      uint64_t v12 = [(id)objc_opt_class() descriptorForRequiredKeysForContact:v3];
      uint64_t v30 = v12;
      id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
      id v20 = 0;
      char v13 = [v10 unifiedContactWithIdentifier:v11 keysToFetch:v16 error:&v20];
      id v14 = v20;
    }
    if (v14 || !v13)
    {
      id v17 = CNUILogContactCard();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = [v3 identifier];
        int64_t v19 = [(CNContactContentDisplayViewController *)self contactStore];
        *(_DWORD *)buf = 138413058;
        id v23 = v18;
        __int16 v24 = 2112;
        id v25 = v14;
        __int16 v26 = 2112;
        id v27 = v19;
        __int16 v28 = 2112;
        uint64_t v29 = v3;
        _os_log_error_impl(&dword_18B625000, v17, OS_LOG_TYPE_ERROR, "Error refetching contact with identifier %@, %@, store %@, full contact %@", buf, 0x2Au);
      }
    }
    else if (([v13 isEqual:v3] & 1) == 0)
    {
      [(CNContactContentDisplayViewController *)self setContact:v13];
    }
  }
}

- (void)favoritesDidChangeWithNotification:(id)a3
{
}

- (void)contactStoreDidChangeWithNotification:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CNUIContactsEnvironment *)self->_environment defaultSchedulerProvider];
  int v6 = [v5 mainThreadScheduler];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__CNContactContentDisplayViewController_contactStoreDidChangeWithNotification___block_invoke;
  v8[3] = &unk_1E549BF80;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 performBlock:v8];
}

void __79__CNContactContentDisplayViewController_contactStoreDidChangeWithNotification___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) shouldIgnoreContactStoreDidChangeNotification] & 1) == 0)
  {
    id v2 = [*(id *)(a1 + 40) userInfo];
    id v13 = [v2 objectForKey:*MEMORY[0x1E4F1B788]];

    BOOL v3 = [*(id *)(a1 + 40) userInfo];
    id v4 = [v3 objectForKey:*MEMORY[0x1E4F1B790]];

    unint64_t v5 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
    int v6 = (void *)MEMORY[0x1E4F1CAD0];
    id v7 = [*(id *)(a1 + 32) issuedSaveRequestIdentifiers];
    BOOL v8 = [v6 setWithArray:v7];

    if (v13 && ([v13 BOOLValue] & 1) != 0
      || ![v8 count]
      || ![v5 count]
      || ([v5 isSubsetOfSet:v8] & 1) == 0)
    {
      if ([*(id *)(a1 + 32) isViewLoaded]
        && ([*(id *)(a1 + 32) view],
            id v9 = objc_claimAutoreleasedReturnValue(),
            [v9 window],
            unint64_t v10 = objc_claimAutoreleasedReturnValue(),
            v10,
            v9,
            !v10))
      {
        *(unsigned char *)(*(void *)(a1 + 32) + 985) = 1;
      }
      else
      {
        id v11 = *(unsigned char **)(a1 + 32);
        if (!v11[987])
        {
          uint64_t v12 = [v11 contactViewCache];
          [v12 resetCache];

          [*(id *)(a1 + 32) _refetchContact];
        }
      }
    }
  }
}

- (void)adjustInsetsForKeyboardOverlap:(double)a3
{
  [(CNContactContentDisplayViewController *)self setKeyboardVerticalOverlap:a3];

  [(CNContactContentDisplayViewController *)self updateInsetsIfNeeded];
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

  id v31 = [(CNContactContentDisplayViewController *)self view];
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
  [(CNContactContentDisplayViewController *)self adjustInsetsForKeyboardOverlap:CGRectGetHeight(v34)];
}

- (void)setContact:(id)a3
{
  v113[1] = *MEMORY[0x1E4F143B8];
  id v4 = (CNContact *)a3;
  unint64_t v5 = v4;
  self->_needsRefetch = 0;
  p_contact = &self->_contact;
  if (self->_contact == v4) {
    goto LABEL_41;
  }
  double v7 = [(CNContact *)v4 identifier];
  double v8 = [(CNContact *)*p_contact identifier];
  char v9 = [v7 isEqualToString:v8];

  if ((v9 & 1) == 0) {
    [(CNContactContentDisplayViewController *)self setDidSetNewContact:1];
  }
  double v10 = [(CNContactContentDisplayViewController *)self environment];
  double v11 = [v10 defaultSchedulerProvider];

  [v11 suspendBackgroundScheduler];
  double v12 = [v11 afterCACommitScheduler];
  v103[0] = MEMORY[0x1E4F143A8];
  v103[1] = 3221225472;
  v103[2] = __52__CNContactContentDisplayViewController_setContact___block_invoke;
  v103[3] = &unk_1E549B488;
  id v13 = v11;
  id v104 = v13;
  [v12 performBlock:v103];

  id v14 = [(CNContactContentDisplayViewController *)self contactViewCache];
  [v14 resetCache];

  LODWORD(v12) = [(CNContactContentDisplayViewController *)self isOutOfProcess];
  uint64_t v15 = [(id)objc_opt_class() descriptorForRequiredKeys];
  double v16 = (void *)v15;
  if (v12)
  {
    v113[0] = v15;
    double v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v113 count:1];
    uint64_t v18 = [(CNContactContentDisplayViewController *)self _updateContact:v5 withMissingKeysFromRequiredKeys:v17];

    unint64_t v5 = (void *)v18;
  }
  else
  {
    uint64_t v112 = v15;
    double v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v112 count:1];
    [v5 assertKeysAreAvailable:v17];
  }

  double v19 = [(CNContactContentDisplayViewController *)self editAuthorizationManager];
  [v19 updateWithContact:v5];

  double v20 = [(CNContactContentDisplayViewController *)self contactViewCache];
  double v21 = [v20 policyForContact:v5];

  if ([v21 isReadonly])
  {
    id v96 = v13;
    double v22 = [(CNContactContentDisplayViewController *)self contactStore];
    double v23 = [v5 identifier];
    CGFloat v24 = [(id)objc_opt_class() descriptorForRequiredKeysForContact:v5];
    v111 = v24;
    double v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v111 count:1];
    id v102 = 0;
    CGFloat v26 = [v22 unifiedContactWithIdentifier:v23 keysToFetch:v25 error:&v102];
    id v95 = v102;

    if (v26)
    {
      id v27 = v26;

      CGFloat v28 = [(CNContactContentDisplayViewController *)self contactViewCache];
      double v29 = [v28 policyForContact:v27];

      if ([v29 isReadonly])
      {
        v93 = v29;
        v94 = v26;
        id v30 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
        id v31 = [v27 availableKeyDescriptor];
        v110 = v31;
        id v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v110 count:1];
        CGRect v33 = (void *)[v30 copyWithPropertyKeys:v32];
        CGRect v34 = (void *)[v33 mutableCopy];
        [(CNContactContentDisplayViewController *)self setShadowCopyOfReadonlyContact:v34];

        long long v100 = 0u;
        long long v101 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        CGRect v35 = +[CNContactView nameProperties];
        uint64_t v36 = [v35 countByEnumeratingWithState:&v98 objects:v109 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = *(void *)v99;
          do
          {
            for (uint64_t i = 0; i != v37; ++i)
            {
              if (*(void *)v99 != v38) {
                objc_enumerationMutation(v35);
              }
              uint64_t v40 = *(void *)(*((void *)&v98 + 1) + 8 * i);
              if ([v27 isKeyAvailable:v40])
              {
                uint64_t v41 = [(CNContactContentDisplayViewController *)self shadowCopyOfReadonlyContact];
                id v42 = [v27 valueForKey:v40];
                [v41 setValue:v42 forKey:v40];
              }
            }
            uint64_t v37 = [v35 countByEnumeratingWithState:&v98 objects:v109 count:16];
          }
          while (v37);
        }

        id v43 = (void *)MEMORY[0x1E4F1CA48];
        dispatch_time_t v44 = [(CNContactContentDisplayViewController *)self shadowCopyOfReadonlyContact];
        long long v45 = [v43 arrayWithObject:v44];

        long long v46 = v95;
        if ([v27 isUnified])
        {
          long long v47 = [v27 linkedContacts];
          [v45 addObjectsFromArray:v47];
        }
        else
        {
          [v45 addObject:v27];
        }
        double v29 = v93;
        unint64_t v5 = [MEMORY[0x1E4F1B8F8] unifyContacts:v45];

        long long v48 = [(CNContactContentDisplayViewController *)self contactViewCache];
        int v49 = [v48 policyForDefaultContainer];
        [(CNContactContentDisplayViewController *)self setPolicy:v49];

        char v50 = [(CNContactContentDisplayViewController *)self policy];

        if (!v50 || v95)
        {
          uint64_t v51 = [MEMORY[0x1E4F1BA68] sharedPermissivePolicy];
          [(CNContactContentDisplayViewController *)self setPolicy:v51];
        }
        id v13 = v96;
        CGFloat v26 = v94;
        goto LABEL_29;
      }
      unint64_t v5 = v27;
    }
    else
    {
      double v29 = v21;
    }
    long long v46 = v95;
    id v13 = v96;
LABEL_29:

    double v21 = v29;
  }
  objc_storeStrong((id *)&self->_contact, v5);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v53 = v5;
  if ((isKindOfClass & 1) == 0) {
    uint64_t v53 = (void *)[v5 mutableCopy];
  }
  p_mutableContact = &self->_mutableContact;
  objc_storeStrong((id *)&self->_mutableContact, v53);
  if ((isKindOfClass & 1) == 0) {

  }
  int v55 = CNUILogContactCard();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    v56 = [v5 identifier];
    id v57 = *p_mutableContact;
    *(_DWORD *)buf = 138543618;
    v106 = v56;
    __int16 v107 = 2050;
    v108 = v57;
    _os_log_impl(&dword_18B625000, v55, OS_LOG_TYPE_DEFAULT, "[CNContactContentViewController] setting contact with identifier %{public}@, mutable contact %{public}p", buf, 0x16u);
  }
  id v58 = [(CNContactContentDisplayViewController *)self customActions];
  v97[0] = MEMORY[0x1E4F143A8];
  v97[1] = 3221225472;
  v97[2] = __52__CNContactContentDisplayViewController_setContact___block_invoke_329;
  v97[3] = &unk_1E549B4D8;
  v97[4] = self;
  id v59 = objc_msgSend(v58, "_cn_filter:", v97);
  [(CNContactContentDisplayViewController *)self setCustomActions:v59];

  uint64_t v60 = [[CNCardGroup alloc] initWithContact:*p_mutableContact];
  cardTopGroup = self->_cardTopGroup;
  self->_cardTopGroup = v60;

  id v62 = [[CNCardGroup alloc] initWithContact:*p_mutableContact];
  cardBottomGroup = self->_cardBottomGroup;
  self->_cardBottomGroup = v62;

  [(CNCardGroup *)self->_cardBottomGroup setAddSpacerFromPreviousGroup:1];
  double v64 = [[CNCardGroup alloc] initWithContact:*p_mutableContact];
  cardActionsGroup = self->_cardActionsGroup;
  self->_cardActionsGroup = v64;

  double v66 = [(CNCardGroup *)[CNCardNamePickingGroup alloc] initWithContact:*p_contact];
  namePickingGroup = self->_namePickingGroup;
  self->_namePickingGroup = v66;

  int v68 = [[CNCardGroup alloc] initWithContact:*p_mutableContact];
  cardShareLocationGroup = self->_cardShareLocationGroup;
  self->_cardShareLocationGroup = v68;

  v70 = [[CNCardGroup alloc] initWithContact:*p_mutableContact];
  cardBlockContactGroup = self->_cardBlockContactGroup;
  self->_cardBlockContactGroup = v70;

  [(CNCardGroup *)self->_cardBlockContactGroup setAddSpacerFromPreviousGroup:1];
  id v72 = [[CNCardGroup alloc] initWithContact:*p_mutableContact];
  cardFooterGroup = self->_cardFooterGroup;
  self->_cardFooterGroup = v72;

  [(CNCardGroup *)self->_cardFooterGroup setAddSpacerFromPreviousGroup:1];
  propertyGroups = self->_propertyGroups;
  self->_propertyGroups = 0;

  long long v75 = [(CNContactContentDisplayViewController *)self siriContextProvider];
  int v76 = [v75 isEnabled];

  long long v77 = [CNSiriContactContextProvider alloc];
  long long v78 = [(CNContactContentDisplayViewController *)self contactStore];
  long long v79 = [(CNSiriContactContextProvider *)v77 initWithContact:v5 store:v78];
  [(CNContactContentDisplayViewController *)self setSiriContextProvider:v79];

  if (v76)
  {
    long long v80 = [(CNContactContentDisplayViewController *)self siriContextProvider];
    [v80 setEnabled:1];
  }
  [(CNContactContentDisplayViewController *)self setActionProvider:0];
  [(CNContactContentDisplayViewController *)self setCardFaceTimeGroup:0];
  [(CNContactContentDisplayViewController *)self setBlockAction:0];
  [(CNContactContentDisplayViewController *)self setIgnoreContactAction:0];
  [(CNContactContentDisplayViewController *)self setCardMedicalIDGroup:0];
  [(CNContactContentDisplayViewController *)self setMedicalIDAction:0];
  [(CNContactContentDisplayViewController *)self setEmergencyContactAction:0];
  v81 = [(CNContactContentDisplayViewController *)self geminiDataSource];
  [v81 setContact:v5];

  [(CNContactContentDisplayViewController *)self isOutOfProcess];
  v82 = [(CNContactContentDisplayViewController *)self editAuthorizationManager];
  uint64_t v83 = [v82 shouldPromptForPasscodeAuthorization];
  v84 = [(CNContactContentDisplayViewController *)self contactHeaderView];
  [v84 setIsRestrictedContact:v83];

  uint64_t v85 = [MEMORY[0x1E4F1B9C8] isWhitelistedContact:*p_mutableContact];
  v86 = [(CNContactContentDisplayViewController *)self contactHeaderView];
  [v86 setIsDowntimeContact:v85];

  double v87 = [(CNContactContentDisplayViewController *)self contactHeaderView];
  [v87 updateWithNewContact:*p_mutableContact];

  [(CNContactContentDisplayViewController *)self updateEditNavigationItemsAnimated:0];
  [(CNContactContentDisplayViewController *)self setContactSupportsTTYCalls:0];
  double v88 = [(CNContactContentDisplayViewController *)self shareLocationController];
  [v88 setContact:v5];

  double v89 = [(CNContactContentDisplayViewController *)self actionsViewController];
  [v89 setContact:v5];

  [(CNContactContentDisplayViewController *)self reloadDataPreservingChanges:0];
  if ([(CNContactContentDisplayViewController *)self isViewLoaded])
  {
    v90 = [(CNContactContentDisplayViewController *)self contactView];
    [(CNContactContentDisplayViewController *)self scrollScrollViewAllTheWayUp:v90];
  }
  v91 = +[CNUIDataCollector sharedCollector];
  v92 = [(CNContactContentDisplayViewController *)self contact];
  [v91 logContactShown:v92];

  [(CNContactContentDisplayViewController *)self prepareContactDidAppearForPPT];
LABEL_41:
}

uint64_t __52__CNContactContentDisplayViewController_setContact___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resumeBackgroundScheduler];
}

uint64_t __52__CNContactContentDisplayViewController_setContact___block_invoke_329(uint64_t a1, void *a2)
{
  return [a2 isValidForContact:*(void *)(*(void *)(a1 + 32) + 1032)];
}

- (void)prepareCell:(id)a3
{
  id v41 = a3;
  id v4 = [(CNContactContentDisplayViewController *)self contactView];
  [v4 applyCellAppearance:v41];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_29;
  }
  objc_opt_class();
  id v5 = v41;
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
  char v9 = [v4 labelTextAttributes];
  double v10 = [v4 valueTextAttributes];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    uint64_t v12 = [v4 actionTextAttributes];
LABEL_15:

    char v9 = (void *)v12;
    goto LABEL_16;
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

    double v16 = [(CNContactContentDisplayViewController *)self actionsDataSource];
    [v15 setActionsDataSource:v16];

    double v17 = [(CNContactContentDisplayViewController *)self contact];
    [v15 setContact:v17];

    uint64_t v12 = [v4 valueTextAttributes];

    char v9 = v15;
    goto LABEL_15;
  }
LABEL_16:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v18 = [(CNContactContentDisplayViewController *)self view];
    double v19 = [v18 tintColorOverride];
    double v20 = 0;
    goto LABEL_20;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v26 = v5;
    if ([v26 supportsValueColorUsesLabelColor])
    {
      id v27 = +[CNContactStyle currentStyle];
      double v19 = [v27 textColor];
    }
    else
    {
      double v19 = 0;
    }
    CGFloat v28 = [(CNContactContentDisplayViewController *)self highlightedProperties];
    if ([v28 count])
    {
      double v29 = [(CNContactContentDisplayViewController *)self highlightedProperties];
      id v39 = [v26 propertyItem];
      uint64_t v40 = v28;
      [v39 contactProperty];
      v31 = id v30 = v26;
      objc_msgSend(v30, "setHighlightedProperty:", objc_msgSend(v29, "containsObject:", v31));

      id v26 = v30;
      CGFloat v28 = v40;
    }
    else
    {
      [v26 setHighlightedProperty:0];
    }

    if ([v26 isSuggested])
    {
      id v32 = +[CNContactStyle currentStyle];
      double v20 = [v32 suggestedLabelTextColor];

      CGRect v33 = +[CNContactStyle currentStyle];
      uint64_t v34 = [v33 suggestedValueTextColor];
    }
    else
    {
      if ([v26 isHighlightedProperty]
        && [(CNContactContentDisplayViewController *)self highlightedPropertyImportant])
      {
        objc_msgSend(v26, "setImportant:", -[CNContactContentDisplayViewController highlightedPropertyImportant](self, "highlightedPropertyImportant"));
        uint64_t v34 = [MEMORY[0x1E4FB1618] redColor];
        double v20 = 0;
LABEL_49:

        double v19 = (void *)v34;
        goto LABEL_50;
      }
      if (![v26 supportsTintColorValue])
      {
        double v20 = 0;
LABEL_50:
        if ([v26 isHighlightedProperty])
        {
          if (([v26 isImportant] & 1) == 0)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_opt_class();
              id v35 = v26;
              if (objc_opt_isKindOfClass()) {
                uint64_t v36 = v35;
              }
              else {
                uint64_t v36 = 0;
              }
              id v37 = v36;

              [v37 setShouldShowBadge:1];
            }
          }
        }

        if (!v20)
        {
LABEL_21:
          if (v19)
          {
            double v21 = (void *)[v10 mutableCopy];
            [v21 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4FB0700]];

            double v10 = v21;
          }
          if (isKindOfClass) {
            goto LABEL_25;
          }
          goto LABEL_24;
        }
        uint64_t v38 = (void *)[v9 mutableCopy];
        [v38 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4FB0700]];
        uint64_t v18 = v9;
        char v9 = v38;
LABEL_20:

        goto LABEL_21;
      }
      CGRect v33 = [(CNContactContentDisplayViewController *)self view];
      uint64_t v34 = [v33 tintColorOverride];

      double v20 = 0;
    }
    double v19 = v33;
    goto LABEL_49;
  }
  double v20 = 0;
  if (isKindOfClass) {
    goto LABEL_25;
  }
LABEL_24:
  double v22 = [v7 labelTextAttributes];
  char v23 = [v22 isEqual:v9];

  if ((v23 & 1) == 0) {
LABEL_25:
  }
    [v7 setLabelTextAttributes:v9];
  CGFloat v24 = [v7 valueTextAttributes];
  char v25 = [v24 isEqual:v10];

  if ((v25 & 1) == 0) {
    [v7 setValueTextAttributes:v10];
  }

LABEL_29:
}

- (void)localeDidChange:(id)a3
{
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  id v4 = [(CNContactContentDisplayViewController *)self contactView];
  [v4 updateFontSizes];

  id v5 = [(CNContactContentDisplayViewController *)self contactHeaderView];
  [v5 updateFontSizes];

  [(CNContactView *)self->_contactView setTableHeaderView:0];
  [(CNContactInlineActionsViewController *)self->_actionsViewController willMoveToParentViewController:0];
  [(CNContactInlineActionsViewController *)self->_actionsViewController removeFromParentViewController];
  double v6 = [(CNContactInlineActionsViewController *)self->_actionsViewController view];
  [v6 removeFromSuperview];

  id v7 = [(CNContactContentDisplayViewController *)self createActionsController];
  actionsViewController = self->_actionsViewController;
  self->_actionsViewController = v7;

  [(CNContactInlineActionsViewController *)self->_actionsViewController setObjectViewControllerDelegate:self];
  [(CNContactInlineActionsViewController *)self->_actionsViewController setDelegate:self];
  [(CNContactContentDisplayViewController *)self addChildViewController:self->_actionsViewController];
  [(CNContactInlineActionsViewController *)self->_actionsViewController didMoveToParentViewController:self];
  actionsWrapperView = self->_actionsWrapperView;
  double v10 = [(CNContactInlineActionsViewController *)self->_actionsViewController view];
  [(CNContactActionsContainerView *)actionsWrapperView addArrangedSubview:v10];

  [(CNContactContentDisplayViewController *)self viewDidLayoutSubviews];
  [(CNContactContentDisplayViewController *)self reloadDataPreservingChanges:1];
  [(CNContactContentDisplayViewController *)self setupConstraints];
  id v11 = [(CNContactContentDisplayViewController *)self applyContactStyle];
}

- (NSArray)cardActions
{
  id v2 = [(CNContactContentDisplayViewController *)self cardActionsGroup];
  BOOL v3 = [v2 actions];

  return (NSArray *)v3;
}

- (BOOL)isOutOfProcess
{
  id v2 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  char v3 = [v2 isOutOfProcess];

  return v3;
}

- (id)createActionsController
{
  char v3 = [CNContactInlineActionsViewController alloc];
  actionsDataSource = self->_actionsDataSource;
  id v5 = [(CNContactContentDisplayViewController *)self environment];
  double v6 = [(CNContactInlineActionsViewController *)v3 initWithActionListDataSource:actionsDataSource environment:v5];

  [(CNContactInlineActionsViewController *)v6 setDisplaysTitles:1];
  [(CNContactInlineActionsViewController *)v6 setDisplaysUnavailableActionTypes:1];
  id v7 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  LODWORD(actionsDataSource) = [v7 showsInlineActions];

  if (actionsDataSource)
  {
    uint64_t v8 = [MEMORY[0x1E4F5A720] allSupportedActionTypes];
    [(CNContactInlineActionsViewController *)v6 setSupportedActionTypes:v8];
  }
  else
  {
    [(CNContactInlineActionsViewController *)v6 setSupportedActionTypes:MEMORY[0x1E4F1CBF0]];
  }
  char v9 = [(CNContactInlineActionsViewController *)v6 view];
  LODWORD(v10) = 1148846080;
  [v9 setContentCompressionResistancePriority:0 forAxis:v10];

  return v6;
}

- (BOOL)isHeaderViewPhotoProhibited
{
  char v3 = [(CNContactContentDisplayViewController *)self prohibitedPropertyKeys];
  if ([v3 containsObject:*MEMORY[0x1E4F1AE28]])
  {
    char v4 = 1;
  }
  else
  {
    id v5 = [(CNContactContentDisplayViewController *)self prohibitedPropertyKeys];
    char v4 = [v5 containsObject:*MEMORY[0x1E4F1AF98]];
  }
  return v4;
}

- (CNContactView)contactView
{
  contactView = self->_contactView;
  if (!contactView)
  {
    char v4 = [CNContactView alloc];
    uint64_t v5 = [(id)objc_opt_class() tableViewStyle];
    double v6 = [(CNContactContentDisplayViewController *)self contact];
    id v7 = -[CNContactView initWithFrame:style:contact:](v4, "initWithFrame:style:contact:", v5, v6, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v8 = self->_contactView;
    self->_contactView = v7;

    [(CNContactView *)self->_contactView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CNContactView *)self->_contactView setDataSource:self];
    [(CNContactView *)self->_contactView setDelegate:self];
    [(CNContactView *)self->_contactView _setHeaderAndFooterViewsFloat:0];
    contactView = self->_contactView;
  }

  return contactView;
}

- (CNContactHeaderDisplayView)contactHeaderView
{
  contactHeaderView = self->_contactHeaderView;
  if (!contactHeaderView)
  {
    BOOL v4 = [(CNContactContentDisplayViewController *)self isHeaderViewPhotoProhibited];
    uint64_t v5 = [(CNContactContentDisplayViewController *)self mutableContact];
    double v6 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
    +[CNContactHeaderDisplayView contactHeaderViewWithContact:showingNavBar:monogramOnly:delegate:](CNContactHeaderDisplayView, "contactHeaderViewWithContact:showingNavBar:monogramOnly:delegate:", v5, [v6 layoutPositionallyAfterNavBar], v4, self);
    id v7 = (CNContactHeaderDisplayView *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = self->_contactHeaderView;
    self->_contactHeaderView = v7;

    [(CNContactHeaderView *)self->_contactHeaderView setAlwaysShowsMonogram:1];
    char v9 = [(CNContactContentDisplayViewController *)self contactFormatter];
    [(CNContactHeaderDisplayView *)self->_contactHeaderView setContactFormatter:v9];

    double v10 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
    id v11 = [v10 alternateName];
    [(CNContactHeaderDisplayView *)self->_contactHeaderView setAlternateName:v11];

    uint64_t v12 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
    id v13 = [v12 message];
    [(CNContactHeaderDisplayView *)self->_contactHeaderView setMessage:v13];

    id v14 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
    id v15 = [v14 importantMessage];
    [(CNContactHeaderDisplayView *)self->_contactHeaderView setImportantMessage:v15];

    double v16 = [(CNContactContentDisplayViewController *)self presentingDelegate];
    [(CNContactHeaderView *)self->_contactHeaderView setPresenterDelegate:v16];

    [(CNContactHeaderDisplayView *)self->_contactHeaderView setTranslatesAutoresizingMaskIntoConstraints:0];
    double v17 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
    -[CNContactHeaderDisplayView setAllowsPickerActions:](self->_contactHeaderView, "setAllowsPickerActions:", [v17 allowsDisplayModePickerActions]);

    id v18 = [(CNContactContentDisplayViewController *)self applyContactStyle];
    contactHeaderView = self->_contactHeaderView;
  }

  return contactHeaderView;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)contactViewConfigurationDidUpdate
{
  char v3 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  BOOL v4 = [v3 contactStore];

  uint64_t v5 = [(CNContactContentDisplayViewController *)self actionsDataSource];
  [v5 setContactStore:v4];

  double v6 = [(CNContactContentDisplayViewController *)self contactViewCache];
  [v6 setContactStore:v4];

  id v7 = CNUILogContactCard();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v15 = 0;
    _os_log_debug_impl(&dword_18B625000, v7, OS_LOG_TYPE_DEBUG, "display contactViewConfigurationDidUpdate", v15, 2u);
  }

  [(CNContactContentDisplayViewController *)self reloadDataIfNeeded];
  uint64_t v8 = [(CNContactContentDisplayViewController *)self contactHeaderView];
  char v9 = [(CNContactContentDisplayViewController *)self contactViewConfiguration];
  objc_msgSend(v8, "updateForShowingNavBar:", objc_msgSend(v9, "layoutPositionallyAfterNavBar"));

  double v10 = [(CNContactContentDisplayViewController *)self contactHeaderView];
  id v11 = [(CNContactContentDisplayViewController *)self mutableContact];
  [v10 updateWithNewContact:v11];

  BOOL v12 = [(CNContactContentDisplayViewController *)self shouldShowGemini];
  id v13 = [(CNContactContentDisplayViewController *)self contactHeaderView];
  [v13 setShouldShowGemini:v12];

  [(CNContactContentDisplayViewController *)self updateEditNavigationItemsAnimated:0];
  id v14 = [(CNContactContentDisplayViewController *)self applyContactStyle];
}

- (void)dealloc
{
  v13[1] = *MEMORY[0x1E4F143B8];
  [(CNContactView *)self->_contactView setDelegate:0];
  [(CNContactView *)self->_contactView setDataSource:0];
  [(CNContactHeaderView *)self->_contactHeaderView setDelegate:0];
  [(CNContactHeaderDisplayView *)self->_contactHeaderView didFinishUsing];
  char v3 = [(CNContactContentDisplayViewController *)self headerHeightConstraint];

  if (v3)
  {
    BOOL v4 = (void *)MEMORY[0x1E4F28DC8];
    uint64_t v5 = [(CNContactContentDisplayViewController *)self headerHeightConstraint];
    v13[0] = v5;
    double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [v4 deactivateConstraints:v6];
  }
  actionsDataSource = self->_actionsDataSource;
  self->_actionsDataSource = 0;

  actionProvider = self->_actionProvider;
  self->_actionProvider = 0;

  char v9 = [(CNContactContentDisplayViewController *)self iMessageIDSLookupToken];
  [v9 cancel];

  double v10 = [(CNContactContentDisplayViewController *)self faceTimeIDSLookupToken];
  [v10 cancel];

  id v11 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v11 removeObserver:self];

  v12.receiver = self;
  v12.super_class = (Class)CNContactContentDisplayViewController;
  [(CNContactContentDisplayViewController *)&v12 dealloc];
}

- (void)setForcesTransparentBackground:(BOOL)a3
{
  if (self->_forcesTransparentBackground != a3)
  {
    self->_forcesTransparentBackground = a3;
    BOOL v4 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    uint64_t v5 = [v4 schedulerProvider];
    double v6 = [v5 mainThreadScheduler];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __72__CNContactContentDisplayViewController_setForcesTransparentBackground___block_invoke;
    void v7[3] = &unk_1E549B488;
    v7[4] = self;
    [v6 performBlock:v7];
  }
}

id __72__CNContactContentDisplayViewController_setForcesTransparentBackground___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) applyContactStyle];
}

- (void)setTitle:(id)a3
{
  id v5 = a3;
  if (v5
    || ([(CNContactContentDisplayViewController *)self title],
        (char v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v6 = [(CNContactContentDisplayViewController *)self title];
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
      v8.super_class = (Class)CNContactContentDisplayViewController;
      [(CNContactContentDisplayViewController *)&v8 setTitle:v5];
      [(CNContactContentDisplayViewController *)self didChangeToShowTitle:v5 != 0];
    }
  }
LABEL_6:
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
  id v5 = a3;
  double v6 = [(CNContactContentDisplayViewController *)self actionsDataSource];
  [v6 setContactStore:v5];

  id v7 = [(CNContactContentDisplayViewController *)self contactViewCache];
  [v7 setContactStore:v5];
}

- (CNContactContentDisplayViewController)initWithContact:(id)a3 contactViewConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(CNContactContentDisplayViewController *)self initWithNibName:0 bundle:0];
  char v9 = v8;
  if (v8)
  {
    [(CNContactContentDisplayViewController *)v8 setContact:v6];
    [(CNContactContentDisplayViewController *)v9 setContactViewConfiguration:v7];
    [(CNContactContentDisplayViewController *)v9 contactViewConfigurationDidUpdate];
  }

  return v9;
}

- (CNContactContentDisplayViewController)initWithEnvironment:(id)a3
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v53.receiver = self;
  v53.super_class = (Class)CNContactContentDisplayViewController;
  id v6 = [(CNContactContentDisplayViewController *)&v53 initWithNibName:0 bundle:0];
  objc_storeStrong((id *)&v6->_environment, a3);
  id v7 = objc_alloc_init(CNContactViewCache);
  contactViewCache = v6->_contactViewCache;
  v6->_contactViewCache = v7;

  if ([MEMORY[0x1E4F1B9F8] deviceSupportsGemini])
  {
    char v9 = [CNUIGeminiDataSource alloc];
    double v10 = +[CNUIContactsEnvironment currentEnvironment];
    id v11 = [v10 geminiManager];
    uint64_t v12 = [(CNUIGeminiDataSource *)v9 initWithGeminiManager:v11];
    geminiDataSource = v6->_geminiDataSource;
    v6->_geminiDataSource = (CNUIGeminiDataSource *)v12;

    [(CNUIGeminiDataSource *)v6->_geminiDataSource setDelegate:v6];
  }
  objc_storeWeak((id *)&v6->_presentingDelegate, v6);
  uint64_t v14 = [MEMORY[0x1E4F1B910] sharedFullNameFormatter];
  contactFormatter = v6->_contactFormatter;
  v6->_contactFormatter = (CNContactFormatter *)v14;

  uint64_t v16 = +[CNContactView allCardProperties];
  displayedProperties = v6->_displayedProperties;
  v6->_displayedProperties = (NSArray *)v16;

  id v18 = objc_alloc(MEMORY[0x1E4F5A720]);
  double v19 = [v5 actionDiscoveringEnvironment];
  uint64_t v20 = [v18 initWithDiscoveringEnvironment:v19];
  actionsDataSource = v6->_actionsDataSource;
  v6->_actionsDataSource = (CNUIUserActionListDataSource *)v20;

  uint64_t v22 = [(CNContactContentDisplayViewController *)v6 createActionsController];
  actionsViewController = v6->_actionsViewController;
  v6->_actionsViewController = (CNContactInlineActionsViewController *)v22;

  [(CNContactInlineActionsViewController *)v6->_actionsViewController setObjectViewControllerDelegate:v6];
  [(CNContactInlineActionsViewController *)v6->_actionsViewController setDelegate:v6];
  [(CNContactContentDisplayViewController *)v6 addChildViewController:v6->_actionsViewController];
  [(CNContactInlineActionsViewController *)v6->_actionsViewController didMoveToParentViewController:v6];
  CGFloat v24 = [CNContactActionsContainerView alloc];
  char v25 = [(CNContactInlineActionsViewController *)v6->_actionsViewController view];
  v54[0] = v25;
  id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
  uint64_t v27 = [(CNContactActionsContainerView *)v24 initWithArrangedSubviews:v26];
  actionsWrapperView = v6->_actionsWrapperView;
  v6->_actionsWrapperView = (CNContactActionsContainerView *)v27;

  [(CNContactActionsContainerView *)v6->_actionsWrapperView setTranslatesAutoresizingMaskIntoConstraints:0];
  double v29 = *MEMORY[0x1E4F4BEC8];
  id v30 = [(CNContactInlineActionsViewController *)v6->_actionsViewController view];
  objc_msgSend(v30, "setMinimumLayoutSize:", v29, 35.0);

  uint64_t v31 = objc_opt_new();
  headerDropShadowView = v6->_headerDropShadowView;
  v6->_headerDropShadowView = (UIView *)v31;

  [(UIView *)v6->_headerDropShadowView setTranslatesAutoresizingMaskIntoConstraints:0];
  CGRect v33 = [(CNContactContentDisplayViewController *)v6 environment];
  if ([v33 runningInContactsAppOniPad])
  {
    uint64_t v34 = [(UIView *)v6->_headerDropShadowView backgroundColor];
    [(UIView *)v6->_headerDropShadowView setBackgroundColor:v34];
  }
  else
  {
    uint64_t v34 = +[CNContactStyle currentStyle];
    id v35 = [v34 contactHeaderDropShadowColor];
    [(UIView *)v6->_headerDropShadowView setBackgroundColor:v35];
  }
  uint64_t v36 = [v5 inProcessActivityManager];
  activityManager = v6->_activityManager;
  v6->_activityManager = (CNUIUserActivityManager *)v36;

  uint64_t v38 = [MEMORY[0x1E4F1C978] array];
  customActions = v6->_customActions;
  v6->_customActions = (NSArray *)v38;

  uint64_t v40 = objc_alloc_init(CNUIContactStoreLinkedContactSaveExecutor);
  saveLinkedContactsExecutor = v6->_saveLinkedContactsExecutor;
  v6->_saveLinkedContactsExecutor = (CNUIContactSaveExecutor *)v40;

  [(CNContactContentDisplayViewController *)v6 setNeedsReloadLazy];
  id v42 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v42 addObserver:v6 selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];

  id v43 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v43 addObserver:v6 selector:sel_localeDidChange_ name:*MEMORY[0x1E4F1C370] object:0];

  dispatch_time_t v44 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v44 addObserver:v6 selector:sel_contactStoreDidChangeWithNotification_ name:*MEMORY[0x1E4F1AF80] object:0];

  long long v45 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v45 addObserver:v6 selector:sel_contactStoreDidChangeWithNotification_ name:*MEMORY[0x1E4F5A180] object:0 suspensionBehavior:4];

  long long v46 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v46 addObserver:v6 selector:sel_keyboardDidShowNotification_ name:*MEMORY[0x1E4FB2BC8] object:0];

  long long v47 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v47 addObserver:v6 selector:sel_keyboardWillHideNotification_ name:*MEMORY[0x1E4FB2C50] object:0];

  long long v48 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v48 addObserver:v6 selector:sel_favoritesDidChangeWithNotification_ name:*MEMORY[0x1E4F1AFF0] object:0];

  [(CNContactContentDisplayViewController *)v6 setRestorationIdentifier:@"ContactCard"];
  [(CNContactContentDisplayViewController *)v6 setRestorationClass:objc_opt_class()];
  int v49 = [(CNContactContentDisplayViewController *)v6 navigationItem];
  [v49 _setBackgroundHidden:1];

  char v50 = [(CNContactContentDisplayViewController *)v6 navigationItem];
  [v50 setLargeTitleDisplayMode:2];

  id v51 = [(CNContactContentDisplayViewController *)v6 applyContactStyle];
  return v6;
}

- (CNContactContentDisplayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5 = +[CNUIContactsEnvironment currentEnvironment];
  id v6 = [(CNContactContentDisplayViewController *)self initWithEnvironment:v5];

  return v6;
}

+ (CNContactContentDisplayViewController)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  id v7 = (void *)MEMORY[0x1E4F1B8F8];
  objc_super v8 = +[CNContactContentViewController descriptorForRequiredKeys];
  v26[0] = v8;
  char v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  double v10 = [v7 contactWithStateRestorationCoder:v5 store:v6 keys:v9];

  if (v10)
  {
    id v20 = v6;
    id v11 = [[CNContactContentViewController alloc] initWithContact:v10];
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
          id v18 = [v5 decodeObjectOfClass:objc_opt_class() forKey:v17];
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
    id v11 = 0;
  }

  return (CNContactContentDisplayViewController *)v11;
}

+ (id)BOOLStateRestorationProperties
{
  return &unk_1ED915C08;
}

+ (BOOL)shouldShowGeminiForResult:(id)a3 contact:(id)a4
{
  id v7 = a3;
  if (v7)
  {
    objc_super v8 = [a4 phoneNumbers];
    if ([v8 count] && objc_msgSend(MEMORY[0x1E4F1B9F8], "deviceSupportsGemini"))
    {
      BOOL v4 = [v7 availableChannels];
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
    id v11 = [v7 channel];
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
  char v3 = [a3 allActions];
  char v4 = objc_msgSend(v3, "_cn_any:", &__block_literal_global_624);

  return v4;
}

uint64_t __64__CNContactContentDisplayViewController_actionModelIncludesTTY___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = [v2 type];
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

+ (id)descriptorForRequiredKeysWithDescription:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__CNContactContentDisplayViewController_descriptorForRequiredKeysWithDescription___block_invoke;
  block[3] = &unk_1E549B488;
  id v9 = v3;
  uint64_t v4 = descriptorForRequiredKeysWithDescription__cn_once_token_7_58612;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&descriptorForRequiredKeysWithDescription__cn_once_token_7_58612, block);
  }
  id v6 = (id)descriptorForRequiredKeysWithDescription__cn_once_object_7_58613;

  return v6;
}

void __82__CNContactContentDisplayViewController_descriptorForRequiredKeysWithDescription___block_invoke(uint64_t a1)
{
  v13[51] = *MEMORY[0x1E4F143B8];
  objc_msgSend(MEMORY[0x1E4F1B9F8], "descriptorForRequiredKeys", *MEMORY[0x1E4F1AE08], *MEMORY[0x1E4F1AE88], *MEMORY[0x1E4F1AEB0], *MEMORY[0x1E4F1ADF0], *MEMORY[0x1E4F1AEA0], *MEMORY[0x1E4F1ADE0], *MEMORY[0x1E4F1AF30], *MEMORY[0x1E4F1AEB8], *MEMORY[0x1E4F1AEC0], *MEMORY[0x1E4F1AEF8], *MEMORY[0x1E4F1AF00], *MEMORY[0x1E4F1AEF0], *MEMORY[0x1E4F1AED8], *MEMORY[0x1E4F1AF08], *MEMORY[0x1E4F1ADB8], *MEMORY[0x1E4F1AE78], *MEMORY[0x1E4F1AD88],
    *MEMORY[0x1E4F1AD90],
    *MEMORY[0x1E4F1AEC8],
    *MEMORY[0x1E4F1AED0],
    *MEMORY[0x1E4F1AE28],
    *MEMORY[0x1E4F1AF98],
    *MEMORY[0x1E4F1AE20],
    *MEMORY[0x1E4F1AFA8],
    *MEMORY[0x1E4F1AEE0],
    *MEMORY[0x1E4F1ADC8],
    *MEMORY[0x1E4F1AF10],
    *MEMORY[0x1E4F1ADB0],
    *MEMORY[0x1E4F1AFB0],
    *MEMORY[0x1E4F1AF50],
    *MEMORY[0x1E4F1AF78],
    *MEMORY[0x1E4F1AE60],
    *MEMORY[0x1E4F1AE00],
    *MEMORY[0x1E4F1AE88],
    *MEMORY[0x1E4F1ADA0],
    *MEMORY[0x1E4F1AF90],
    *MEMORY[0x1E4F1ADA8],
    *MEMORY[0x1E4F1AE90],
    *MEMORY[0x1E4F1AD98],
    *MEMORY[0x1E4F1AE48],
    *MEMORY[0x1E4F1AE30],
    *MEMORY[0x1E4F5A5E8],
    *MEMORY[0x1E4F1AE98],
    *MEMORY[0x1E4F1AEE8],
    *MEMORY[0x1E4F1ADE8],
    *MEMORY[0x1E4F1AF40],
  id v2 = *MEMORY[0x1E4F1AF38]);
  uint64_t v3 = *MEMORY[0x1E4F1ADC0];
  v13[47] = v2;
  v13[48] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1B910] sharedFullNameFormatter];
  id v5 = [v4 descriptorForRequiredKeys];
  v13[49] = v5;
  id v6 = [MEMORY[0x1E4F1B910] sharedFullNameFormatter];
  id v7 = +[CNContactHeaderDisplayView descriptorForRequiredKeysForContactFormatter:v6];
  v13[50] = v7;
  objc_super v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:51];

  id v9 = +[CNSiriContactContextProvider descriptorForRequiredKeys];
  if (v9)
  {
    uint64_t v10 = [v8 arrayByAddingObject:v9];

    objc_super v8 = (void *)v10;
  }
  uint64_t v11 = [MEMORY[0x1E4F1B8F8] descriptorWithKeyDescriptors:v8 description:*(void *)(a1 + 32)];

  uint64_t v12 = (void *)descriptorForRequiredKeysWithDescription__cn_once_object_7_58613;
  descriptorForRequiredKeysWithDescription__cn_once_object_7_58613 = v11;
}

+ (int64_t)tableViewStyle
{
  return 1;
}

+ (id)descriptorForRequiredKeys
{
  uint64_t v3 = [NSString stringWithUTF8String:"+[CNContactContentDisplayViewController descriptorForRequiredKeys]"];
  uint64_t v4 = [a1 descriptorForRequiredKeysWithDescription:v3];

  return v4;
}

+ (id)descriptorForRequiredKeysForContact:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 descriptorForRequiredKeys];
  id v6 = [v4 availableKeyDescriptor];

  v12[0] = v5;
  v12[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  objc_super v8 = (void *)MEMORY[0x1E4F1B8F8];
  id v9 = [NSString stringWithUTF8String:"+[CNContactContentDisplayViewController descriptorForRequiredKeysForContact:]"];
  uint64_t v10 = [v8 descriptorWithKeyDescriptors:v7 description:v9];

  return v10;
}

@end