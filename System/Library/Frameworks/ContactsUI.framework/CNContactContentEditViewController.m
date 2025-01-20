@interface CNContactContentEditViewController
+ (BOOL)enablesTransportButtons;
+ (BOOL)shouldShowGeminiForResult:(id)a3 contact:(id)a4;
+ (CNContactContentEditViewController)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4;
+ (id)BOOLStateRestorationProperties;
+ (id)descriptorForRequiredKeys;
+ (id)descriptorForRequiredKeysForContact:(id)a3;
+ (id)descriptorForRequiredKeysWithDescription:(id)a3;
+ (int64_t)tableViewStyle;
+ (void)_telemetryForContact:(id)a3;
- (BOOL)_indexPathIsActionItem:(id)a3 forTableView:(id)a4;
- (BOOL)_modelHasChanges;
- (BOOL)_modelIsEmpty;
- (BOOL)canBecomeFirstResponder;
- (BOOL)didSetFirstResponder;
- (BOOL)didSetNewContact;
- (BOOL)forcesTransparentBackground;
- (BOOL)hasPendingChanges;
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
- (BOOL)needsReload;
- (BOOL)performSave;
- (BOOL)reloadDataIfNeeded;
- (BOOL)runningPPT;
- (BOOL)saveChanges;
- (BOOL)shouldAllowContainerPicking;
- (BOOL)shouldDisplayAvatarHeaderView;
- (BOOL)shouldDrawNavigationBar;
- (BOOL)shouldIgnoreContactStoreDidChangeNotification;
- (BOOL)shouldReallyShowLinkedContacts;
- (BOOL)shouldShowActionsForAvatarView:(id)a3;
- (BOOL)shouldShowGemini;
- (BOOL)showingMeContact;
- (BOOL)supportsDrafts;
- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6;
- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4;
- (CGSize)requiredSizeForVisibleTableView;
- (CGSize)setupTableHeaderView;
- (CNCancelable)medicalIDLookupToken;
- (CNCardContactContainerGroup)cardEditingContactContainerGroup;
- (CNCardGroup)cardEditingActionsGroup;
- (CNCardGroup)cardEditingDeleteContactGroup;
- (CNCardGroup)cardMedicalIDGroup;
- (CNCardLinkedCardsGroup)cardLinkedCardsGroup;
- (CNCardPropertyGeminiGroup)cardEditingGeminiGroup;
- (CNCardStaticIdentityGroup)cardStaticIdentityGroup;
- (CNContact)contact;
- (CNContactAction)deleteContactAction;
- (CNContactAction)ignoreContactAction;
- (CNContactActionProvider)actionProvider;
- (CNContactAddLinkedCardAction)addLinkedCardAction;
- (CNContactAddNewFieldAction)addNewFieldAction;
- (CNContactAddStaticIdentityAction)addStaticIdentityAction;
- (CNContactContainerPickerViewController)containerPicker;
- (CNContactContentEditViewController)initWithContact:(id)a3 contactViewConfiguration:(id)a4;
- (CNContactContentEditViewController)initWithEnvironment:(id)a3;
- (CNContactContentEditViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CNContactContentEditViewControllerDelegate)delegate;
- (CNContactContentNavigationItemDelegate)navigationItemDelegate;
- (CNContactContentNavigationItemUpdater)navItemUpdater;
- (CNContactContentViewControllerConfiguration)contactViewConfiguration;
- (CNContactFormatter)contactFormatter;
- (CNContactHeaderEditView)contactHeaderView;
- (CNContactRecentsReference)recentsData;
- (CNContactSelectContainersAction)selectContainersAction;
- (CNContactStore)contactStore;
- (CNContactSuggestionAction)suggestedContactAction;
- (CNContactView)contactView;
- (CNContactViewCache)contactViewCache;
- (CNContainer)parentContainer;
- (CNEmergencyContactAction)emergencyContactAction;
- (CNGroup)parentGroup;
- (CNHealthStoreManagerToken)medicalIDRegistrationToken;
- (CNManagedConfiguration)managedConfiguration;
- (CNMedicalIDAction)medicalIDAction;
- (CNMutableContact)mutableContact;
- (CNMutableContact)shadowCopyOfReadonlyContact;
- (CNPolicy)policy;
- (CNPresenterDelegate)presentingDelegate;
- (CNPropertyGroupsDataSource)propertyGroupsDataSource;
- (CNPropertyLinkedCardsAction)linkedCardsAction;
- (CNPropertyNoteCell)noteCell;
- (CNPropertyStaticIdentityAction)staticIdentityAction;
- (CNSiriContactContextProvider)siriContextProvider;
- (CNUIContactSaveExecutor)saveContactExecutor;
- (CNUIContactSaveExecutor)saveLinkedContactsExecutor;
- (CNUIContactsEnvironment)environment;
- (CNUIContainerContext)containerContext;
- (CNUIGeminiDataSource)geminiDataSource;
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
- (NSArray)nameEditingGroups;
- (NSArray)originalContacts;
- (NSArray)preEditLeftBarButtonItems;
- (NSArray)prohibitedPropertyKeys;
- (NSDictionary)linkedPoliciesByContactIdentifier;
- (NSDictionary)propertyGroups;
- (NSDictionary)userActivityUserInfo;
- (NSLayoutConstraint)headerHeightConstraint;
- (NSMapTable)cachedLabelWidths;
- (NSMutableArray)editingGroups;
- (NSMutableArray)editingLinkedContacts;
- (NSMutableArray)issuedSaveRequestIdentifiers;
- (NSMutableDictionary)groupsAfterGroup;
- (NSString)emergencyNumberIdentifier;
- (NSString)initialPrompt;
- (UIEdgeInsets)headerViewSafeAreaInsets;
- (UIEdgeInsets)insetsForContactTableView:(id)a3;
- (UIEdgeInsets)peripheryInsets;
- (UIEdgeInsets)scrollIndicatorInsetsForContactTableView:(id)a3 withContentInsets:(UIEdgeInsets)a4;
- (UIKeyCommand)cancelCommand;
- (UIKeyCommand)saveCommand;
- (UINavigationItem)effectiveNavigationItem;
- (UIView)headerDropShadowView;
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
- (id)_addGroupsInArray:(id)a3 afterGroup:(id)a4;
- (id)_addLinkedCardAction;
- (id)_addNewFieldAction;
- (id)_cardGroupAtTableViewSectionIndex:(int64_t)a3 forTableView:(id)a4;
- (id)_cellForIndexPath:(id)a3 forTableView:(id)a4;
- (id)_cellIdentifierForTableView:(id)a3 indexPath:(id)a4;
- (id)_currentTopVisibleGroupInContactView:(id)a3;
- (id)_itemAtIndexPath:(id)a3 forTableView:(id)a4;
- (id)_labelWidthKeyForGroup:(id)a3;
- (id)_labelWidthKeyForItem:(id)a3;
- (id)_linkedCardsAction;
- (id)_loadEditingGroupsPreservingChanges:(BOOL)a3;
- (id)_loadNameEditingGroups;
- (id)_loadPropertyGroups;
- (id)_phoneticNameForValue:(id)a3 currentPhoneticName:(id)a4 property:(id)a5;
- (id)_policyForContact:(id)a3 mode:(int64_t)a4;
- (id)_propertyGroupsForKeys:(id)a3;
- (id)_removeUnauthorizedKeysFromContact:(id)a3;
- (id)_selectContainersAction;
- (id)_updateContact:(id)a3 withMissingKeysFromRequiredKeys:(id)a4;
- (id)action:(id)a3 cellForPropertyItem:(id)a4 sender:(id)a5;
- (id)alreadyPickedGroups;
- (id)applyContactStyle;
- (id)cardGroupForProperty:(id)a3;
- (id)contentScrollViewForEdge:(unint64_t)a3;
- (id)indexPathOfDisplayedPropertyItem:(id)a3;
- (id)indexPathOfEditingPropertyItem:(id)a3;
- (id)indexPathOfPropertyItem:(id)a3 editing:(BOOL)a4;
- (id)saveDescriptionForCurrentState;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)_modalPresentationStyleForViewController:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)mode;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)sectionOfGroup:(id)a3 inTableView:(id)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)groupIndexFromTableViewSectionIndex:(unint64_t)a3 forTableView:(id)a4;
- (unint64_t)tableViewSectionIndexFromGroupIndex:(unint64_t)a3 forTableView:(id)a4;
- (void)_addGroup:(id)a3 afterGroup:(id)a4 forTableView:(id)a5 animated:(BOOL)a6;
- (void)_addMedicalIDGroupAnimated:(BOOL)a3 forTableView:(id)a4;
- (void)_addedGroupWithName:(id)a3;
- (void)_didCompleteWithContact:(id)a3;
- (void)_refetchContact;
- (void)_reloadContainerContextPreservingChanges:(BOOL)a3;
- (void)_reloadGeminiGroupPreservingChanges:(BOOL)a3;
- (void)_reloadLinkedCardsGroup;
- (void)_reloadMedicalIDGroup;
- (void)_reloadPropertyGroupsPreservingChanges:(BOOL)a3;
- (void)_reloadStaticIdentityGroup;
- (void)_saveChangesForGroups:(id)a3;
- (void)_scrollContactView:(id)a3 toVisibleGroup:(id)a4;
- (void)_setNeedsUpdateCachedLabelWidths;
- (void)_setupEditingCardActions;
- (void)_setupEditingLinkedContactsForKeys:(id)a3;
- (void)_setupSuggestionActions;
- (void)_updateCachedLabelWidths;
- (void)_updateCachedLabelWidthsForGroup:(id)a3;
- (void)_updateCachedLabelWidthsForItem:(id)a3;
- (void)_updateCachedLabelWidthsIfNeeded;
- (void)_updateLabelWidthForCell:(id)a3;
- (void)_updateLabelWidthForCellsInGroup:(id)a3 forTableView:(id)a4 reset:(BOOL)a5;
- (void)_updateLabelWidthsForAllVisibleCells;
- (void)_updateUserActivity;
- (void)_validateGroup:(id)a3;
- (void)action:(id)a3 dismissViewController:(id)a4 sender:(id)a5;
- (void)action:(id)a3 prepareChildContactViewController:(id)a4 sender:(id)a5;
- (void)action:(id)a3 presentViewController:(id)a4 sender:(id)a5;
- (void)action:(id)a3 pushViewController:(id)a4 sender:(id)a5;
- (void)actionDidFinish:(id)a3;
- (void)actionWasCanceled:(id)a3;
- (void)addCardGroup:(id)a3 afterGroup:(id)a4;
- (void)addEditingItemAtIndexPath:(id)a3 forTableView:(id)a4;
- (void)addLinkedContact:(id)a3;
- (void)addStaticIdentity:(id)a3;
- (void)adjustInsetsForKeyboardOverlap:(double)a3;
- (void)cancelAsyncLookups;
- (void)cleanupRecentImageMetadata;
- (void)cleanupRecentMetadata;
- (void)cleanupRecentPosterMetadata;
- (void)clearMapsDataIfEdited;
- (void)contactGroupPickerDidCancel:(id)a3;
- (void)contactGroupPickerDidFinish:(id)a3 withGroup:(id)a4;
- (void)contactStoreDidChangeWithNotification:(id)a3;
- (void)contactViewConfigurationDidUpdate;
- (void)contactViewController:(id)a3 didDeleteContact:(id)a4;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)createCardEditingContactContainerGroupIfNeeded;
- (void)createCardEditingGeminiGroupIfNeeded;
- (void)createdNewContact:(id)a3;
- (void)dealloc;
- (void)didChangeToEditMode:(BOOL)a3;
- (void)didChangeToShowTitle:(BOOL)a3;
- (void)editCancel;
- (void)editCancel:(id)a3;
- (void)encodeRestorableStateWithCoder:(id)a3;
- (void)finishEditing;
- (void)finishEditing:(id)a3;
- (void)focusOnFirstEditingItemIfNeeded;
- (void)focusOnLastEditingItemInGroup:(id)a3;
- (void)geminiDataSourceDidUpdate:(id)a3;
- (void)headerPhotoDidUpdate;
- (void)headerView:(id)a3 didAcceptDropOfImageData:(id)a4;
- (void)headerViewDidChangeHeight:(id)a3;
- (void)initializeTableViewsForHeaderHeight;
- (void)keyboardDidShowNotification:(id)a3;
- (void)keyboardWillHideNotification:(id)a3;
- (void)loadContactViewControllerViews;
- (void)loadView;
- (void)localeDidChange:(id)a3;
- (void)performConfirmedCancel;
- (void)prepareCell:(id)a3;
- (void)prepareContactDidAppearForPPT;
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
- (void)reloadCardGroup:(id)a3 forTableView:(id)a4;
- (void)reloadDataPreservingChanges:(BOOL)a3;
- (void)reloadUnifiedContact;
- (void)removeEditingItem:(id)a3 atIndexPath:(id)a4 forTableView:(id)a5;
- (void)removeLinkedContact:(id)a3;
- (void)saveModelChangesToContact;
- (void)saveNewContactDraft;
- (void)scrollScrollViewAllTheWayUp:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)sender:(id)a3 dismissViewController:(id)a4;
- (void)sender:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (void)sender:(id)a3 presentViewController:(id)a4;
- (void)setActionProvider:(id)a3;
- (void)setActivatedConstraints:(id)a3;
- (void)setAddLinkedCardAction:(id)a3;
- (void)setAddNewFieldAction:(id)a3;
- (void)setAddStaticIdentityAction:(id)a3;
- (void)setBackgroundColorIfNeededForPresentedViewController:(id)a3;
- (void)setCachedLabelWidths:(id)a3;
- (void)setCancelCommand:(id)a3;
- (void)setCancelKeyboardShortcutEnabled:(BOOL)a3;
- (void)setCardEditingActionsGroup:(id)a3;
- (void)setCardEditingContactContainerGroup:(id)a3;
- (void)setCardEditingDeleteContactGroup:(id)a3;
- (void)setCardEditingGeminiGroup:(id)a3;
- (void)setCardLinkedCardsGroup:(id)a3;
- (void)setCardMedicalIDGroup:(id)a3;
- (void)setCardStaticIdentityGroup:(id)a3;
- (void)setContact:(id)a3;
- (void)setContactFormatter:(id)a3;
- (void)setContactHeaderView:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setContactView:(id)a3;
- (void)setContactViewConfiguration:(id)a3;
- (void)setContainerContext:(id)a3;
- (void)setContainerPicker:(id)a3;
- (void)setCustomActions:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeleteContactAction:(id)a3;
- (void)setDidSetFirstResponder:(BOOL)a3;
- (void)setDidSetNewContact:(BOOL)a3;
- (void)setEditingGroups:(id)a3;
- (void)setEditingLinkedContacts:(id)a3;
- (void)setEmergencyContactAction:(id)a3;
- (void)setEmergencyNumberIdentifier:(id)a3;
- (void)setExtraLeftBarButtonItems:(id)a3;
- (void)setExtraRightBarButtonItems:(id)a3;
- (void)setForcesTransparentBackground:(BOOL)a3;
- (void)setGroupsAfterGroup:(id)a3;
- (void)setHeaderDropShadowView:(id)a3;
- (void)setHeaderHeightConstraint:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setHighlightedProperties:(id)a3;
- (void)setHighlightedPropertyImportant:(BOOL)a3;
- (void)setIgnoreContactAction:(id)a3;
- (void)setInitialPrompt:(id)a3;
- (void)setIsPresentingFullscreenForOutOfProcess:(BOOL)a3;
- (void)setIssuedSaveRequestIdentifiers:(id)a3;
- (void)setKeyboardVerticalOverlap:(double)a3;
- (void)setLinkedCardsAction:(id)a3;
- (void)setLinkedPoliciesByContactIdentifier:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setMedicalIDAction:(id)a3;
- (void)setMedicalIDLookupToken:(id)a3;
- (void)setMedicalIDRegistrationToken:(id)a3;
- (void)setMenuProviderForCell:(id)a3 forActionGroupItem:(id)a4;
- (void)setMissingRequiredKeys:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setMutableContact:(id)a3;
- (void)setNameEditingGroups:(id)a3;
- (void)setNavItemUpdater:(id)a3;
- (void)setNavigationItemDelegate:(id)a3;
- (void)setNeedsReload;
- (void)setNeedsReloadLazy;
- (void)setNoteCell:(id)a3;
- (void)setOriginalContacts:(id)a3;
- (void)setParentContainer:(id)a3;
- (void)setParentGroup:(id)a3;
- (void)setPolicy:(id)a3;
- (void)setPreEditLeftBarButtonItems:(id)a3;
- (void)setPresentingDelegate:(id)a3;
- (void)setProhibitedPropertyKeys:(id)a3;
- (void)setPropertyGroupsDataSource:(id)a3;
- (void)setRecentsData:(id)a3;
- (void)setRunningPPT:(BOOL)a3;
- (void)setSaveCommand:(id)a3;
- (void)setSaveContactExecutor:(id)a3;
- (void)setSaveKeyboardShortcutEnabled:(BOOL)a3;
- (void)setSaveLinkedContactsExecutor:(id)a3;
- (void)setSelectContainersAction:(id)a3;
- (void)setShadowCopyOfReadonlyContact:(id)a3;
- (void)setShouldDrawNavigationBar:(BOOL)a3;
- (void)setShouldIgnoreContactStoreDidChangeNotification:(BOOL)a3;
- (void)setShowingMeContact:(BOOL)a3;
- (void)setSiriContextProvider:(id)a3;
- (void)setStaticIdentityAction:(id)a3;
- (void)setSuggestedContactAction:(id)a3;
- (void)setSupportsDrafts:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setUserActivityUserInfo:(id)a3;
- (void)setupConstraints;
- (void)setupContainerContextIfNeededForContact:(id)a3;
- (void)setupViewHierarchyIncludingAvatarHeader:(BOOL)a3;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 performAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)toggleEditing;
- (void)updateContact:(id)a3;
- (void)updateContactsViewWithBlock:(id)a3 completion:(id)a4;
- (void)updateDoneButton;
- (void)updateEditNavigationItemsAnimated:(BOOL)a3;
- (void)updateEditPhotoButtonIfNeeded;
- (void)updateHeaderHeightToMatchScrollViewState:(id)a3 scrollDirection:(int64_t)a4 animated:(BOOL)a5;
- (void)updateInsetsIfNeededForTableView:(id)a3;
- (void)updateOutOfProcessFullscreenPresentationIfNeeded;
- (void)updateTableView:(id)a3 contentInsetsTo:(UIEdgeInsets)a4 withScrollIndicatorInsets:(UIEdgeInsets)a5;
- (void)updateUserActivityState:(id)a3;
- (void)updateViewConstraints;
- (void)updateWindowTitleForAppearing:(BOOL)a3;
- (void)updatedExistingContact:(id)a3;
- (void)viewController:(id)a3 presentationControllerWillDismiss:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CNContactContentEditViewController

- (void).cxx_destruct
{
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
  objc_storeStrong((id *)&self->_cardActions, 0);
  objc_storeStrong((id *)&self->_linkedPoliciesByContactIdentifier, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_navItemUpdater, 0);
  objc_storeStrong((id *)&self->_geminiDataSource, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
  objc_storeStrong((id *)&self->_contactViewCache, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_preEditLeftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_cancelCommand, 0);
  objc_storeStrong((id *)&self->_saveCommand, 0);
  objc_storeStrong((id *)&self->_highlightedProperties, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_userActivityUserInfo, 0);
  objc_storeStrong((id *)&self->_editingLinkedContacts, 0);
  objc_storeStrong((id *)&self->_siriContextProvider, 0);
  objc_storeStrong((id *)&self->_ignoreContactAction, 0);
  objc_storeStrong((id *)&self->_deleteContactAction, 0);
  objc_storeStrong((id *)&self->_cardStaticIdentityGroup, 0);
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
  objc_storeStrong((id *)&self->_headerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_activatedConstraints, 0);
  objc_storeStrong((id *)&self->_actionProvider, 0);
  objc_storeStrong((id *)&self->_selectContainersAction, 0);
  objc_storeStrong((id *)&self->_suggestedContactAction, 0);
  objc_storeStrong((id *)&self->_addNewFieldAction, 0);
  objc_storeStrong((id *)&self->_addLinkedCardAction, 0);
  objc_storeStrong((id *)&self->_linkedCardsAction, 0);
  objc_storeStrong((id *)&self->_addStaticIdentityAction, 0);
  objc_storeStrong((id *)&self->_staticIdentityAction, 0);
  objc_storeStrong((id *)&self->_noteCell, 0);
  objc_storeStrong((id *)&self->_customActions, 0);
  objc_storeStrong((id *)&self->_cardLinkedCardsGroup, 0);
  objc_storeStrong((id *)&self->_cardMedicalIDGroup, 0);
  objc_storeStrong((id *)&self->_extraLeftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_extraRightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_cachedLabelWidths, 0);
  objc_storeStrong((id *)&self->_groupsAfterGroup, 0);
  objc_storeStrong((id *)&self->_nameEditingGroups, 0);
  objc_storeStrong((id *)&self->_editingGroups, 0);
  objc_storeStrong((id *)&self->_containerPicker, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_propertyGroupsDataSource, 0);
  objc_storeStrong((id *)&self->_containerContext, 0);
  objc_storeStrong((id *)&self->_shadowCopyOfReadonlyContact, 0);
  objc_storeStrong((id *)&self->_issuedSaveRequestIdentifiers, 0);
  objc_storeStrong((id *)&self->_mutableContact, 0);
  objc_storeStrong((id *)&self->_contactViewConfiguration, 0);
  objc_destroyWeak((id *)&self->_presentingDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contactHeaderView, 0);
  objc_storeStrong((id *)&self->_contactView, 0);
  objc_storeStrong((id *)&self->_parentContainer, 0);
  objc_storeStrong((id *)&self->_parentGroup, 0);
  objc_storeStrong((id *)&self->_contact, 0);

  objc_destroyWeak((id *)&self->_navigationItemDelegate);
}

- (void)setShowingMeContact:(BOOL)a3
{
  self->_showingMeContact = a3;
}

- (BOOL)showingMeContact
{
  return self->_showingMeContact;
}

- (NSDictionary)propertyGroups
{
  return self->_propertyGroups;
}

- (void)setRecentsData:(id)a3
{
}

- (CNContactRecentsReference)recentsData
{
  return self->_recentsData;
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

- (void)setSaveLinkedContactsExecutor:(id)a3
{
}

- (CNUIContactSaveExecutor)saveLinkedContactsExecutor
{
  return self->_saveLinkedContactsExecutor;
}

- (void)setSaveContactExecutor:(id)a3
{
}

- (CNUIContactSaveExecutor)saveContactExecutor
{
  return self->_saveContactExecutor;
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

- (NSArray)cardActions
{
  return self->_cardActions;
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

- (void)setSupportsDrafts:(BOOL)a3
{
  self->_supportsDrafts = a3;
}

- (BOOL)supportsDrafts
{
  return self->_supportsDrafts;
}

- (void)setNavItemUpdater:(id)a3
{
}

- (CNContactContentNavigationItemUpdater)navItemUpdater
{
  return self->_navItemUpdater;
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

- (void)setSaveCommand:(id)a3
{
}

- (UIKeyCommand)saveCommand
{
  return self->_saveCommand;
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

- (void)setCardStaticIdentityGroup:(id)a3
{
}

- (CNCardStaticIdentityGroup)cardStaticIdentityGroup
{
  return self->_cardStaticIdentityGroup;
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

- (void)setHeaderDropShadowView:(id)a3
{
}

- (UIView)headerDropShadowView
{
  return self->_headerDropShadowView;
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

- (void)setSuggestedContactAction:(id)a3
{
}

- (CNContactSuggestionAction)suggestedContactAction
{
  return self->_suggestedContactAction;
}

- (void)setAddNewFieldAction:(id)a3
{
}

- (CNContactAddNewFieldAction)addNewFieldAction
{
  return self->_addNewFieldAction;
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

- (void)setAddStaticIdentityAction:(id)a3
{
}

- (CNContactAddStaticIdentityAction)addStaticIdentityAction
{
  return self->_addStaticIdentityAction;
}

- (void)setStaticIdentityAction:(id)a3
{
}

- (CNPropertyStaticIdentityAction)staticIdentityAction
{
  return self->_staticIdentityAction;
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

- (void)setCardMedicalIDGroup:(id)a3
{
}

- (CNCardGroup)cardMedicalIDGroup
{
  return self->_cardMedicalIDGroup;
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

- (void)setGroupsAfterGroup:(id)a3
{
}

- (NSMutableDictionary)groupsAfterGroup
{
  return self->_groupsAfterGroup;
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

- (void)setIsPresentingFullscreenForOutOfProcess:(BOOL)a3
{
  self->_isPresentingFullscreenForOutOfProcess = a3;
}

- (BOOL)isPresentingFullscreenForOutOfProcess
{
  return self->_isPresentingFullscreenForOutOfProcess;
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

- (void)setPropertyGroupsDataSource:(id)a3
{
}

- (CNPropertyGroupsDataSource)propertyGroupsDataSource
{
  return self->_propertyGroupsDataSource;
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

- (void)setContactViewConfiguration:(id)a3
{
}

- (CNContactContentViewControllerConfiguration)contactViewConfiguration
{
  return self->_contactViewConfiguration;
}

- (void)setPresentingDelegate:(id)a3
{
}

- (CNPresenterDelegate)presentingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingDelegate);

  return (CNPresenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CNContactContentEditViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNContactContentEditViewControllerDelegate *)WeakRetained;
}

- (void)setContactHeaderView:(id)a3
{
}

- (void)setContactView:(id)a3
{
}

- (void)setParentContainer:(id)a3
{
}

- (CNContainer)parentContainer
{
  return self->_parentContainer;
}

- (void)setParentGroup:(id)a3
{
}

- (CNGroup)parentGroup
{
  return self->_parentGroup;
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

- (void)setHighlightedPropertyImportant:(BOOL)a3
{
  self->_highlightedPropertyImportant = a3;
}

- (BOOL)highlightedPropertyImportant
{
  return self->_highlightedPropertyImportant;
}

- (id)applyContactStyle
{
  v34[2] = *MEMORY[0x1E4F143B8];
  v3 = +[CNContactStyle currentStyle];
  if ([(CNContactContentEditViewController *)self forcesTransparentBackground])
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
  v7 = [(CNContactContentEditViewController *)self contactView];
  [v7 setBackgroundColor:v6];

LABEL_6:
  v8 = [v3 sectionBackgroundColor];
  v9 = [(CNContactContentEditViewController *)self contactView];
  [v9 setSectionBackgroundColor:v8];

  v10 = [v3 separatorColor];
  v11 = [(CNContactContentEditViewController *)self contactView];
  [v11 setSeparatorColor:v10];

  v12 = [v3 selectedCellBackgroundColor];
  v13 = [(CNContactContentEditViewController *)self contactView];
  [v13 setSelectedCellBackgroundColor:v12];

  v14 = (void *)MEMORY[0x1E4F1CA60];
  v15 = [(CNContactContentEditViewController *)self contactView];
  v16 = [v15 valueTextAttributes];
  v17 = [v14 dictionaryWithDictionary:v16];

  uint64_t v18 = *MEMORY[0x1E4FB0700];
  v33[0] = *MEMORY[0x1E4FB0700];
  v19 = [v3 textColor];
  v33[1] = @"ABNotesTextColorAttributeName";
  v34[0] = v19;
  v20 = [v3 notesTextColor];
  v34[1] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
  [v17 addEntriesFromDictionary:v21];

  v22 = [(CNContactContentEditViewController *)self contactView];
  [v22 setValueTextAttributes:v17];

  if ([(CNContactContentEditViewController *)self forcesTransparentBackground])
  {
    uint64_t v23 = +[CNUIColorRepository transparentBackgroundColor];
  }
  else
  {
    v24 = [(CNContactContentEditViewController *)self environment];
    int v25 = [v24 runningInContactsAppOniPad];

    if (v25) {
      +[CNUIColorRepository contactCardBackgroundiPadOverwriteColor];
    }
    else {
    uint64_t v23 = [v3 contactHeaderBackgroundColor];
    }
  }
  v26 = (void *)v23;
  [(CNContactHeaderEditView *)self->_contactHeaderView setBackgroundColor:v23];

  contactHeaderView = self->_contactHeaderView;
  uint64_t v31 = v18;
  v28 = [v3 textColor];
  v32 = v28;
  v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  [contactHeaderView cn_updateDictionaryForKey:@"nameTextAttributes" withChanges:v29];

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
  [(CNContactContentEditViewController *)self keyboardVerticalOverlap];
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
  v5 = [(CNContactContentEditViewController *)self contactHeaderView];
  [v5 minHeight];
  double v7 = v6;

  id v8 = [(CNContactContentEditViewController *)self contactHeaderView];
  [v8 maxHeight];
  double v10 = v9;

  if (v10 == 0.0)
  {
    double v12 = *MEMORY[0x1E4FB2848];
    double v25 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v49 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v27 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    goto LABEL_18;
  }
  [v4 _systemContentInset];
  double v12 = v10 - v11;
  [v4 bounds];
  double v14 = v10 - v7 + v13;
  [v4 _systemContentInset];
  double v16 = v14 - v15 - v12;
  [v4 _systemContentInset];
  double v18 = v17;
  [(CNContactContentEditViewController *)self keyboardVerticalOverlap];
  if (v18 >= v19) {
    double v19 = v18;
  }
  double v20 = v16 - v19;
  [v4 contentSize];
  double v22 = 0.0;
  if (v20 - v21 >= 0.0) {
    double v23 = v20 - v21;
  }
  else {
    double v23 = 0.0;
  }
  [v4 contentInset];
  double v25 = v24;
  double v27 = v26;
  [(CNContactContentEditViewController *)self keyboardVerticalOverlap];
  if (v28 > 0.0)
  {
    v29 = [(CNContactContentEditViewController *)self view];
    uint64_t v30 = [v29 window];
    if (v30)
    {
      uint64_t v31 = (void *)v30;
      v32 = [(CNContactContentEditViewController *)self view];
      v33 = [v32 window];
      [v33 bounds];
      double v35 = v34;
      [v4 bounds];
      double v37 = v36;

      if (v35 <= v37)
      {
LABEL_12:
        [(CNContactContentEditViewController *)self keyboardVerticalOverlap];
        double v46 = v45;
        [v4 _systemContentInset];
        double v48 = v22 + v46 - v47;
        goto LABEL_15;
      }
      v38 = [(CNContactContentEditViewController *)self view];
      v39 = [v38 window];
      [v39 bounds];
      double v41 = v40;
      [v4 bounds];
      double v43 = v41 - v42;

      v29 = [(CNContactContentEditViewController *)self contactHeaderView];
      [v29 minTitleOffset];
      double v22 = v43 - v44;
    }

    goto LABEL_12;
  }
  [v4 _systemContentInset];
  double v48 = -v50;
LABEL_15:
  if (v23 >= v48) {
    double v49 = v23;
  }
  else {
    double v49 = v48;
  }
LABEL_18:

  double v51 = v12;
  double v52 = v25;
  double v53 = v49;
  double v54 = v27;
  result.CGFloat right = v54;
  result.double bottom = v53;
  result.CGFloat left = v52;
  result.double top = v51;
  return result;
}

- (void)initializeTableViewsForHeaderHeight
{
  id v11 = [(CNContactContentEditViewController *)self contactView];
  [v11 layoutIfNeeded];
  v3 = [(CNContactContentEditViewController *)self contactHeaderView];
  [v3 calculateLabelSizesIfNeeded];

  id v4 = [(CNContactContentEditViewController *)self headerHeightConstraint];
  [v4 constant];
  double v6 = v5;
  double v7 = [(CNContactContentEditViewController *)self contactHeaderView];
  [v7 minHeight];
  if (v6 > v8) {
    double v9 = 0.0;
  }
  else {
    double v9 = 1.0;
  }
  double v10 = [(CNContactContentEditViewController *)self headerDropShadowView];
  [v10 setAlpha:v9];

  [(CNContactContentEditViewController *)self updateInsetsIfNeededForTableView:v11];
  [(CNContactContentEditViewController *)self updateHeaderHeightToMatchScrollViewState:v11 scrollDirection:2 animated:0];
}

- (void)updateInsetsIfNeededForTableView:(id)a3
{
  id v40 = a3;
  [(CNContactContentEditViewController *)self keyboardVerticalOverlap];
  if (v4 <= 0.0
    || ([(CNContactContentEditViewController *)self view],
        double v5 = objc_claimAutoreleasedReturnValue(),
        [v5 bounds],
        double v7 = v6,
        v5,
        v7 <= 0.0))
  {
    double v14 = [(CNContactContentEditViewController *)self contactHeaderView];
    double v15 = [(CNContactContentEditViewController *)self contactHeaderView];
    [v15 maxHeight];
    double v18 = v14;
    BOOL v17 = 0;
  }
  else
  {
    double v8 = [(CNContactContentEditViewController *)self view];
    [v8 bounds];
    double v10 = v9;
    [(CNContactContentEditViewController *)self keyboardVerticalOverlap];
    double v12 = v10 - v11 + -64.0;

    double v13 = fmax(v12, 0.0);
    double v14 = [(CNContactContentEditViewController *)self contactHeaderView];
    double v15 = [(CNContactContentEditViewController *)self contactHeaderView];
    [v15 maxHeight];
    BOOL v17 = v13 <= v16;
    double v18 = v14;
    double v19 = v13;
  }
  [v18 setConstrainedMaxHeight:v17 enabled:v19];

  [v40 contentInset];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  [(CNContactContentEditViewController *)self insetsForContactTableView:v40];
  double v32 = v28;
  double v33 = v29;
  double v34 = v30;
  double v35 = v31;
  if (v29 != v23 || v28 != v21 || v31 != v27 || v30 != v25)
  {
    -[CNContactContentEditViewController scrollIndicatorInsetsForContactTableView:withContentInsets:](self, "scrollIndicatorInsetsForContactTableView:withContentInsets:", v40, v28, v29, v30, v31);
    -[CNContactContentEditViewController updateTableView:contentInsetsTo:withScrollIndicatorInsets:](self, "updateTableView:contentInsetsTo:withScrollIndicatorInsets:", v40, v32, v33, v34, v35, v36, v37, v38, v39);
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
  id v5 = [(CNContactContentEditViewController *)self contactView];

  return v5 == v4;
}

- (double)updateHeaderConstraintForGlobalHeaderHeight:(double)a3 direction:(int64_t)a4 animated:(BOOL)a5
{
  id v8 = [(CNContactContentEditViewController *)self headerHeightConstraint];
  [v8 constant];
  double v10 = v9;

  if (v10 != a3 && (a4 || v10 < a3))
  {
    double v11 = [(CNContactContentEditViewController *)self headerHeightConstraint];
    [v11 setConstant:a3];

    return a3;
  }
  return v10;
}

- (void)updateHeaderHeightToMatchScrollViewState:(id)a3 scrollDirection:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  [v8 contentOffset];
  double v10 = v9;
  [v8 contentInset];
  -[CNContactContentEditViewController globalHeaderHeightForContentOffset:contentInset:](self, "globalHeaderHeightForContentOffset:contentInset:", v10, v11, v12, v13, v14);
  -[CNContactContentEditViewController updateHeaderConstraintForGlobalHeaderHeight:direction:animated:](self, "updateHeaderConstraintForGlobalHeaderHeight:direction:animated:", a4, v5);
  double v16 = v15;
  objc_opt_class();
  id v19 = v8;
  if (objc_opt_isKindOfClass()) {
    BOOL v17 = v19;
  }
  else {
    BOOL v17 = 0;
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
  double v7 = [(CNContactContentEditViewController *)self contactView];
  [v7 _systemContentInset];
  double v9 = top + v8;

  if (-v9 <= a3) {
    double v10 = -a3;
  }
  else {
    double v10 = v9;
  }
  double v11 = [(CNContactContentEditViewController *)self contactHeaderView];
  [v11 minHeight];
  double v13 = v12;

  if (v10 >= v13) {
    return v10;
  }
  else {
    return v13;
  }
}

- (void)presentViewController:(id)a3 sourceView:(id)a4
{
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  id v25 = a3;
  double v8 = [(CNContactContentEditViewController *)self contactHeaderView];
  [v8 minHeight];
  double v10 = v9;

  double v11 = [(CNContactContentEditViewController *)self contactHeaderView];
  [v11 maxHeight];
  double v13 = v12;

  if ([(CNContactContentEditViewController *)self isScrollViewControllingHeaderResizeAnimation:v25])
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
  if (-[CNContactContentEditViewController isScrollViewControllingHeaderResizeAnimation:](self, "isScrollViewControllingHeaderResizeAnimation:"))
  {
    [v5 _verticalVelocity];
    [(CNContactContentEditViewController *)self updateHeaderHeightToMatchScrollViewState:v5 scrollDirection:v4 >= 0.0 animated:1];
  }
}

- (void)setCancelKeyboardShortcutEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNContactContentEditViewController *)self cancelCommand];

  if (v3)
  {
    if (!v5)
    {
      double v6 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B08] modifierFlags:0 action:sel_editCancel_];
      [(CNContactContentEditViewController *)self setCancelCommand:v6];

      id v8 = [(CNContactContentEditViewController *)self cancelCommand];
      [(CNContactContentEditViewController *)self addKeyCommand:v8];
    }
  }
  else if (v5)
  {
    double v7 = [(CNContactContentEditViewController *)self cancelCommand];
    [(CNContactContentEditViewController *)self removeKeyCommand:v7];

    [(CNContactContentEditViewController *)self setCancelCommand:0];
  }
}

- (void)setSaveKeyboardShortcutEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNContactContentEditViewController *)self saveCommand];

  if (v3)
  {
    if (!v5)
    {
      double v6 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"s" modifierFlags:0x100000 action:sel_toggleEditing_];
      [(CNContactContentEditViewController *)self setSaveCommand:v6];

      double v7 = CNContactsUIBundle();
      id v8 = [v7 localizedStringForKey:@"SAVE_CONTACT_KEYBOARD_DISCOVERY" value:&stru_1ED8AC728 table:@"Localized"];
      double v9 = [(CNContactContentEditViewController *)self saveCommand];
      [v9 setDiscoverabilityTitle:v8];

      id v11 = [(CNContactContentEditViewController *)self saveCommand];
      [(CNContactContentEditViewController *)self addKeyCommand:v11];
    }
  }
  else if (v5)
  {
    double v10 = [(CNContactContentEditViewController *)self saveCommand];
    [(CNContactContentEditViewController *)self removeKeyCommand:v10];

    [(CNContactContentEditViewController *)self setSaveCommand:0];
  }
}

- (void)updateUserActivityState:(id)a3
{
  id v4 = a3;
  id v6 = [(CNContactContentEditViewController *)self activityManager];
  id v5 = [(CNContactContentEditViewController *)self contact];
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
    id v6 = [(CNContactContentEditViewController *)self activityManager];
    double v7 = [(CNContactContentEditViewController *)self contact];
    id v8 = [v6 makeActivityAdvertisingViewingOfContact:v7];

    double v9 = [(CNContactContentEditViewController *)self userActivity];
    double v10 = v9;
    if (v8)
    {

      if (!v10)
      {
        [(CNContactContentEditViewController *)self setUserActivity:v8];
        id v11 = [(CNContactContentEditViewController *)self userActivity];
        [v11 becomeCurrent];

        double v12 = CNUILogContactCard();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          double v13 = [(CNContactContentEditViewController *)self userActivity];
          int v17 = 138412546;
          double v18 = self;
          __int16 v19 = 2112;
          double v20 = v13;
          _os_log_impl(&dword_18B625000, v12, OS_LOG_TYPE_INFO, "Activity continuity -  %@ created %@", (uint8_t *)&v17, 0x16u);
        }
      }
      double v14 = [(CNContactContentEditViewController *)self userActivity];
      [v14 setNeedsSave:1];
    }
    else
    {
      [v9 resignCurrent];

      double v15 = CNUILogContactCard();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        double v16 = [(CNContactContentEditViewController *)self userActivity];
        int v17 = 138412546;
        double v18 = self;
        __int16 v19 = 2112;
        double v20 = v16;
        _os_log_impl(&dword_18B625000, v15, OS_LOG_TYPE_INFO, "Activity continuity -  %@ removed %@", (uint8_t *)&v17, 0x16u);
      }
      [(CNContactContentEditViewController *)self setUserActivity:0];
    }
  }
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CNContactContentEditViewController;
  [(CNContactContentEditViewController *)&v19 encodeRestorableStateWithCoder:v4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = +[CNContactContentEditViewController BOOLStateRestorationProperties];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
        id v11 = [(CNContactContentEditViewController *)self contactViewConfiguration];
        double v12 = [v11 valueForKey:v10];

        if (v12) {
          [v4 encodeObject:v12 forKey:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v7);
  }

  double v13 = [(CNContactContentEditViewController *)self contact];
  double v14 = [v13 identifier];

  if (v14) {
    [v4 encodeObject:v14 forKey:@"Identifier"];
  }
}

- (void)_addedGroupWithName:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[CNContactView nameProperties];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    uint64_t v7 = [(CNContactContentEditViewController *)self mutableContact];
    uint64_t v8 = [(CNContactContentEditViewController *)self contactStore];
    uint64_t v9 = [(CNContactContentEditViewController *)self policy];
    uint64_t v10 = [(CNContactContentEditViewController *)self linkedPoliciesByContactIdentifier];
    id v11 = +[CNCardPropertyGroup groupForProperty:v4 contact:v7 store:v8 policy:v9 linkedPolicies:v10];

    double v12 = +[CNContactView nameProperties];
    double v41 = v11;
    double v13 = [v11 property];
    unint64_t v14 = [v12 indexOfObject:v13];

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    double v42 = self;
    long long v15 = [(CNContactContentEditViewController *)self editingGroups];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v44 objects:v48 count:16];
    id v43 = v4;
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = 0;
      uint64_t v19 = *(void *)v45;
      while (2)
      {
        uint64_t v20 = 0;
        uint64_t v40 = v18 + v17;
        do
        {
          if (*(void *)v45 != v19) {
            objc_enumerationMutation(v15);
          }
          uint64_t v21 = *(void **)(*((void *)&v44 + 1) + 8 * v20);
          double v22 = +[CNContactView nameProperties];
          double v23 = [v21 property];
          unint64_t v24 = [v22 indexOfObject:v23];

          if (v24 >= v14)
          {
            uint64_t v25 = v18 + v20;
            goto LABEL_13;
          }
          ++v20;
        }
        while (v17 != v20);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v44 objects:v48 count:16];
        uint64_t v25 = v40;
        uint64_t v18 = v40;
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
LABEL_13:

    double v26 = [(CNContactContentEditViewController *)v42 nameEditingGroups];
    double v27 = (void *)[v26 mutableCopy];

    [v27 insertObject:v41 atIndex:v25];
    double v28 = (void *)[v27 copy];
    [(CNContactContentEditViewController *)v42 setNameEditingGroups:v28];

    double v29 = [(CNContactContentEditViewController *)v42 editingGroups];
    double v30 = (void *)[v29 mutableCopy];

    [v30 insertObject:v41 atIndex:v25];
    double v31 = (void *)[v30 copy];
    [(CNContactContentEditViewController *)v42 setEditingGroups:v31];

    double v32 = [(CNContactContentEditViewController *)v42 contactView];
    [v32 reloadData];

    double v33 = [(CNContactContentEditViewController *)v42 contactView];
    uint64_t v34 = [(CNContactContentEditViewController *)v42 sectionOfGroup:v41 inTableView:v33];

    double v35 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:v34];
    double v36 = [(CNContactContentEditViewController *)v42 contactView];
    double v37 = [v36 cellForRowAtIndexPath:v35];

    double v38 = [v37 firstResponderItem];
    [v38 becomeFirstResponder];

    double v39 = [(CNContactContentEditViewController *)v42 contactView];
    [v39 scrollToRowAtIndexPath:v35 atScrollPosition:2 animated:0];

    id v4 = v43;
  }
}

- (BOOL)_indexPathIsActionItem:(id)a3 forTableView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = -[CNContactContentEditViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", [v6 section], v7);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(CNContactContentEditViewController *)self _itemAtIndexPath:v6 forTableView:v7];
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

- (id)_itemAtIndexPath:(id)a3 forTableView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = -[CNContactContentEditViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", [v6 section], v7);
  if ([(CNContactContentEditViewController *)self isStandardGroup:v8])
  {
    uint64_t v9 = [v8 editingItems];
LABEL_5:
    uint64_t v10 = v9;
    id v11 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));

    goto LABEL_7;
  }
  if ([(CNContactContentEditViewController *)self _indexPathIsActionItem:v6 forTableView:v7])
  {
    uint64_t v9 = [v8 actionItems];
    goto LABEL_5;
  }
  id v11 = 0;
LABEL_7:

  return v11;
}

- (id)_cardGroupAtTableViewSectionIndex:(int64_t)a3 forTableView:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(CNContactContentEditViewController *)self groupIndexFromTableViewSectionIndex:a3 forTableView:v6];
  uint64_t v8 = [(CNContactContentEditViewController *)self _currentGroupsForTableView:v6];

  if ([v8 count] <= v7)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = [v8 objectAtIndexedSubscript:v7];
  }

  return v9;
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
        uint64_t v9 = objc_opt_class();
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
          uint64_t v15 = [v11 labeledValue];
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
      uint64_t v18 = [(CNContactContentEditViewController *)v19 contactView];
      [(CNContactContentEditViewController *)v19 reloadCardGroup:v4 forTableView:v18];
    }
  }
}

- (BOOL)_modelIsEmpty
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CA48];
  id v3 = [(CNContactContentEditViewController *)self editingGroups];
  id v4 = [v2 arrayWithArray:v3];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v33;
    char v25 = 1;
    do
    {
      uint64_t v8 = 0;
      uint64_t v26 = v6;
      do
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v32 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          long long v11 = [v10 editingItems];
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          id v12 = v11;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v36 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = v7;
            uint64_t v16 = *(void *)v29;
            while (2)
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v29 != v16) {
                  objc_enumerationMutation(v12);
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

                      char v25 = 0;
                      goto LABEL_21;
                    }
                  }
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v36 count:16];
              if (v14) {
                continue;
              }
              break;
            }
LABEL_21:
            uint64_t v7 = v15;
            uint64_t v6 = v26;
          }
        }
        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v6);
  }
  else
  {
    char v25 = 1;
  }

  if (self->_contactHeaderView)
  {
    long long v20 = [(CNContactContentEditViewController *)self contactHeaderView];
    char v21 = [v20 hasPhoto];

    char v22 = (v21 ^ 1) & v25;
  }
  else
  {
    char v22 = v25;
  }

  return v22 & 1;
}

- (BOOL)_modelHasChanges
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(CNContactContentEditViewController *)self editingGroups];
  uint64_t v5 = [v3 arrayWithArray:v4];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v11, "modified", (void)v28))
        {
          int v12 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  int v12 = 0;
LABEL_12:

  if (self->_contactHeaderView)
  {
    uint64_t v13 = [(CNContactContentEditViewController *)self contactHeaderView];
    v12 |= [v13 photoIsModified];
  }
  uint64_t v14 = [(CNContactContentEditViewController *)self editingLinkedContacts];

  uint64_t v15 = [(CNContactContentEditViewController *)self containerContext];
  uint64_t v16 = [v15 addedContainers];
  uint64_t v17 = [v16 count];

  int64_t v18 = [(CNContactContentEditViewController *)self mode];
  BOOL v19 = [(CNContactContentEditViewController *)self mode] == 4
     || [(CNContactContentEditViewController *)self mode] == 5;
  long long v20 = [(CNContactContentEditViewController *)self contact];
  if ([v20 hasNonPersistedData])
  {
    char v21 = [(CNContactContentEditViewController *)self shadowCopyOfReadonlyContact];
    BOOL v22 = v21 == 0;
  }
  else
  {
    BOOL v22 = 0;
  }
  if (v14) {
    char v23 = 1;
  }
  else {
    char v23 = v12;
  }
  if (v17) {
    char v23 = 1;
  }
  if (v18 == 3) {
    char v24 = 1;
  }
  else {
    char v24 = v23;
  }

  char v25 = [(CNContactContentEditViewController *)self cardStaticIdentityGroup];
  char v26 = [v25 didChange];

  return (v19 || v22) | v26 | v24;
}

- (id)_loadNameEditingGroups
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v31 = [MEMORY[0x1E4F1CA48] array];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v3 = [(CNContactContentEditViewController *)self contact];
  id v4 = +[CNContactView namePropertiesForContact:v3];

  id obj = v4;
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
        id v10 = [(CNContactContentEditViewController *)self prohibitedPropertyKeys];
        char v11 = [v10 containsObject:v9];

        if ((v11 & 1) == 0)
        {
          int v12 = [(CNContactContentEditViewController *)self contact];
          uint64_t v13 = [v12 valueForKey:v9];

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
            BOOL v19 = [(CNContactContentEditViewController *)self mutableContact];
            long long v20 = [(CNContactContentEditViewController *)self contactStore];
            char v21 = [(CNContactContentEditViewController *)self policy];
            BOOL v22 = [(CNContactContentEditViewController *)self linkedPoliciesByContactIdentifier];
            char v23 = +[CNCardPropertyGroup groupForProperty:v9 contact:v19 store:v20 policy:v21 linkedPolicies:v22];

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
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  if (!a3)
  {
    uint64_t v6 = [(CNContactContentEditViewController *)self _loadNameEditingGroups];
    [(CNContactContentEditViewController *)self setNameEditingGroups:v6];
  }
  uint64_t v7 = [(CNContactContentEditViewController *)self nameEditingGroups];
  [v5 addObjectsFromArray:v7];

  BOOL v8 = [(CNContactContentEditViewController *)self shouldShowGemini];
  [(CNContactContentEditViewController *)self createCardEditingGeminiGroupIfNeeded];
  uint64_t v9 = [(CNContactContentEditViewController *)self cardEditingGeminiGroup];
  [v9 setShouldShowGemini:v8];

  if ([(CNContactContentEditViewController *)self shouldShowGemini])
  {
    id v10 = [(CNContactContentEditViewController *)self cardEditingGeminiGroup];
    objc_msgSend(v5, "_cn_addNonNilObject:", v10);
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  char v11 = +[CNContactView allCardProperties];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v17 = [(CNContactContentEditViewController *)self propertyGroups];
        int v18 = [v17 objectForKeyedSubscript:v16];

        if (v18) {
          [v5 addObject:v18];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v13);
  }

  BOOL v19 = [(CNContactContentEditViewController *)self cardStaticIdentityGroup];
  objc_msgSend(v5, "_cn_addNonNilObject:", v19);

  long long v20 = [(CNContactContentEditViewController *)self cardEditingActionsGroup];
  char v21 = [v20 actions];
  uint64_t v22 = [v21 count];

  if (v22)
  {
    char v23 = [(CNContactContentEditViewController *)self cardEditingActionsGroup];
    [v5 addObject:v23];
  }
  char v24 = [(CNContactContentEditViewController *)self cardMedicalIDGroup];
  uint64_t v25 = [v24 actionItems];
  uint64_t v26 = [v25 count];

  if (v26)
  {
    uint64_t v27 = [(CNContactContentEditViewController *)self cardMedicalIDGroup];
    objc_msgSend(v5, "_cn_addNonNilObject:", v27);
  }
  [(CNContactContentEditViewController *)self createCardEditingContactContainerGroupIfNeeded];
  long long v28 = [(CNContactContentEditViewController *)self cardEditingContactContainerGroup];
  objc_msgSend(v5, "_cn_addNonNilObject:", v28);

  long long v29 = [(CNContactContentEditViewController *)self cardLinkedCardsGroup];
  objc_msgSend(v5, "_cn_addNonNilObject:", v29);

  uint64_t v30 = [(CNContactContentEditViewController *)self cardEditingDeleteContactGroup];
  id v31 = [v30 actions];
  uint64_t v32 = [v31 count];

  if (v32)
  {
    uint64_t v33 = [(CNContactContentEditViewController *)self cardEditingDeleteContactGroup];
    [v5 addObject:v33];
  }

  return v5;
}

- (void)createCardEditingContactContainerGroupIfNeeded
{
  id v3 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v4 = [v3 featureFlags];
  int v5 = [v4 isFeatureEnabled:6];

  if (v5)
  {
    if ([(CNContactContentEditViewController *)self shouldAllowContainerPicking])
    {
      uint64_t v6 = [CNCardContactContainerGroup alloc];
      uint64_t v7 = [(CNContactContentEditViewController *)self mutableContact];
      BOOL v8 = [(CNCardGroup *)v6 initWithContact:v7];
      [(CNContactContentEditViewController *)self setCardEditingContactContainerGroup:v8];

      id v11 = [(CNContactContentEditViewController *)self containerContext];
      uint64_t v9 = [v11 selectedContainers];
      id v10 = [(CNContactContentEditViewController *)self cardEditingContactContainerGroup];
      [v10 setContainers:v9];
    }
    else
    {
      [(CNContactContentEditViewController *)self setCardEditingContactContainerGroup:0];
    }
  }
}

- (void)createCardEditingGeminiGroupIfNeeded
{
  id v3 = [(CNContactContentEditViewController *)self cardEditingGeminiGroup];

  if (!v3)
  {
    id v4 = [(CNContactContentEditViewController *)self propertyGroups];
    int v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F1AF18]];
    [(CNContactContentEditViewController *)self setCardEditingGeminiGroup:v5];

    uint64_t v6 = [(CNContactContentEditViewController *)self cardEditingGeminiGroup];
    uint64_t v7 = [v6 propertyItems];
    id v10 = [v7 objectAtIndexedSubscript:0];

    BOOL v8 = [(CNContactContentEditViewController *)self geminiDataSource];
    uint64_t v9 = [v8 geminiResult];
    [v10 setGeminiResult:v9];

    [v10 setDelegate:self];
  }
}

- (void)_reloadGeminiGroupPreservingChanges:(BOOL)a3
{
  if (!a3)
  {
    [(CNContactContentEditViewController *)self setCardEditingGeminiGroup:0];
    id v6 = [(CNContactContentEditViewController *)self geminiDataSource];
    [v6 resetDataSource];
    int v5 = [(CNContactContentEditViewController *)self contact];
    [v6 setContact:v5];
  }
}

- (id)_addGroupsInArray:(id)a3 afterGroup:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(CNContactContentEditViewController *)self groupsAfterGroup];
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
    if ([(CNContactContentEditViewController *)self isEditing])
    {
      id v6 = [(CNContactContentEditViewController *)self cardStaticIdentityGroup];

      if (!v6)
      {
        id v7 = [CNCardStaticIdentityGroup alloc];
        id v9 = [(CNContactContentEditViewController *)self mutableContact];
        BOOL v8 = [(CNCardStaticIdentityGroup *)v7 initWithContact:v9];
        [(CNContactContentEditViewController *)self setCardStaticIdentityGroup:v8];
      }
    }
  }
}

- (void)_reloadLinkedCardsGroup
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!self->_linkedCardsAction)
  {
    uint64_t v3 = [(CNContactContentEditViewController *)self _linkedCardsAction];
    linkedCardsAction = self->_linkedCardsAction;
    self->_linkedCardsAction = v3;
  }
  addLinkedCardAction = self->_addLinkedCardAction;
  if (!addLinkedCardAction)
  {
    id v6 = [(CNContactContentEditViewController *)self _addLinkedCardAction];
    id v7 = self->_addLinkedCardAction;
    self->_addLinkedCardAction = v6;

    addLinkedCardAction = self->_addLinkedCardAction;
  }
  [(CNContactAddLinkedCardAction *)addLinkedCardAction setEditingLinkedContacts:self->_editingLinkedContacts];
  BOOL v8 = [CNCardLinkedCardsGroup alloc];
  id v9 = [(CNContactContentEditViewController *)self mutableContact];
  id v10 = [(CNCardGroup *)v8 initWithContact:v9];
  [(CNContactContentEditViewController *)self setCardLinkedCardsGroup:v10];

  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  editingLinkedContacts = self->_editingLinkedContacts;
  if (editingLinkedContacts)
  {
    uint64_t v13 = editingLinkedContacts;
  }
  else
  {
    uint64_t v14 = [(CNContactContentEditViewController *)self contact];
    uint64_t v13 = [v14 mainStoreLinkedContacts];
  }
  uint64_t v15 = [(CNContactContentEditViewController *)self shadowCopyOfReadonlyContact];

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
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v16);
          }
          objc_msgSend(v11, "addObject:", *(void *)(*((void *)&v22 + 1) + 8 * v20++), (void)v22);
        }
        while (v18 != v20);
        uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v18);
    }
  }
  char v21 = [(CNContactContentEditViewController *)self cardLinkedCardsGroup];
  [v21 setLinkedContacts:v11];
}

- (BOOL)shouldReallyShowLinkedContacts
{
  uint64_t v3 = [(CNContactContentEditViewController *)self contactViewConfiguration];
  if ([v3 shouldShowLinkedContacts])
  {
    id v4 = [(CNContactContentEditViewController *)self contact];
    int v5 = [v4 mainStoreLinkedContacts];
    if ((unint64_t)[v5 count] < 2)
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      id v6 = [(CNContactContentEditViewController *)self shadowCopyOfReadonlyContact];
      if (v6)
      {
        LOBYTE(v7) = 0;
      }
      else
      {
        BOOL v8 = [(CNContactContentEditViewController *)self contact];
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

- (void)_reloadContainerContextPreservingChanges:(BOOL)a3
{
  int v5 = [(CNContactContentEditViewController *)self containerContext];

  if (v5)
  {
    if (!a3)
    {
      id v6 = [(CNContactContentEditViewController *)self containerContext];
      [v6 resetToInitialState];

      int v7 = [(CNContactContentEditViewController *)self parentContainer];

      if (v7)
      {
        id v9 = [(CNContactContentEditViewController *)self containerContext];
        BOOL v8 = [(CNContactContentEditViewController *)self parentContainer];
        [v9 addContainer:v8];
      }
    }
  }
}

- (void)_reloadMedicalIDGroup
{
  uint64_t v3 = [(CNContactContentEditViewController *)self environment];
  id v4 = [v3 healthStoreManager];

  int v5 = [(CNContactContentEditViewController *)self medicalIDLookupToken];
  [v5 cancel];

  [(CNContactContentEditViewController *)self setMedicalIDLookupToken:0];
  [(CNContactContentEditViewController *)self setMedicalIDRegistrationToken:0];
  [(CNContactContentEditViewController *)self setCardMedicalIDGroup:0];
  id v6 = [(CNContactContentEditViewController *)self contactViewConfiguration];
  if (([v6 allowsActions] & 1) == 0)
  {

    goto LABEL_5;
  }
  int v7 = [(CNContactContentEditViewController *)self contactViewConfiguration];
  int v8 = [v7 allowsCardActions];

  if (!v8)
  {
LABEL_5:
    [(CNContactContentEditViewController *)self setCardMedicalIDGroup:0];
    [(CNContactContentEditViewController *)self setMedicalIDAction:0];
    [(CNContactContentEditViewController *)self setEmergencyContactAction:0];
    [(CNContactContentEditViewController *)self setEmergencyNumberIdentifier:0];
    goto LABEL_6;
  }
  objc_initWeak(&location, self);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __59__CNContactContentEditViewController__reloadMedicalIDGroup__block_invoke;
  v21[3] = &unk_1E549BBA8;
  objc_copyWeak(&v23, &location);
  id v9 = v4;
  id v22 = v9;
  id v10 = [v9 registerMedicalIDDataHandler:v21];
  [(CNContactContentEditViewController *)self setMedicalIDRegistrationToken:v10];
  uint64_t v11 = (void *)MEMORY[0x1E4F5A368];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __59__CNContactContentEditViewController__reloadMedicalIDGroup__block_invoke_4;
  uint64_t v17 = &unk_1E549BBD0;
  objc_copyWeak(&v20, &location);
  id v18 = v9;
  id v12 = v10;
  id v19 = v12;
  uint64_t v13 = [v11 tokenWithCancelationBlock:&v14];
  -[CNContactContentEditViewController setMedicalIDLookupToken:](self, "setMedicalIDLookupToken:", v13, v14, v15, v16, v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
LABEL_6:
}

void __59__CNContactContentEditViewController__reloadMedicalIDGroup__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v8 = [WeakRetained environment];
  id v9 = [v8 defaultSchedulerProvider];
  id v10 = [v9 mainThreadScheduler];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__CNContactContentEditViewController__reloadMedicalIDGroup__block_invoke_2;
  v13[3] = &unk_1E549BB80;
  id v14 = v6;
  id v15 = WeakRetained;
  id v16 = *(id *)(a1 + 32);
  id v17 = v5;
  id v11 = v5;
  id v12 = v6;
  [v10 performBlock:v13];
}

void __59__CNContactContentEditViewController__reloadMedicalIDGroup__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setMedicalIDRegistrationToken:0];
  [*(id *)(a1 + 32) unregisterHandlerForToken:*(void *)(a1 + 40)];
}

void __59__CNContactContentEditViewController__reloadMedicalIDGroup__block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) medicalIDRegistrationToken];

  if (v2 == v3 && [*(id *)(a1 + 40) showingMeContact])
  {
    id v4 = [*(id *)(a1 + 40) cardMedicalIDGroup];

    if (v4)
    {
      id v5 = [*(id *)(a1 + 40) cardMedicalIDGroup];
      [v5 removeAllActions];
    }
    else
    {
      id v6 = [CNCardGroup alloc];
      id v5 = [*(id *)(a1 + 40) mutableContact];
      int v7 = [(CNCardGroup *)v6 initWithContact:v5];
      [*(id *)(a1 + 40) setCardMedicalIDGroup:v7];
    }
    int v8 = [*(id *)(a1 + 40) cardMedicalIDGroup];
    [v8 setAddSpacerFromPreviousGroup:0];

    if ([*(id *)(a1 + 40) showingMeContact])
    {
      id v9 = [*(id *)(a1 + 40) medicalIDAction];

      if (!v9)
      {
        id v10 = [CNMedicalIDAction alloc];
        id v11 = [*(id *)(a1 + 40) contact];
        id v12 = [(CNPropertyAction *)v10 initWithContact:v11];
        [*(id *)(a1 + 40) setMedicalIDAction:v12];

        uint64_t v13 = *(void *)(a1 + 48);
        id v14 = [*(id *)(a1 + 40) medicalIDAction];
        [v14 setHealthStoreManager:v13];

        id v15 = *(void **)(a1 + 40);
        id v16 = [v15 medicalIDAction];
        [v16 setDelegate:v15];

        id v17 = [*(id *)(a1 + 40) medicalIDAction];
        [v17 setShowBackgroundPlatter:0];
      }
      id v18 = [*(id *)(a1 + 40) cardMedicalIDGroup];
      [v18 setAddSpacerFromPreviousGroup:1];

      uint64_t v19 = *(void *)(a1 + 56);
      id v20 = CNContactsUIBundle();
      char v21 = v20;
      if (v19) {
        id v22 = @"CARD_ACTION_EDIT_MEDICAL_ID";
      }
      else {
        id v22 = @"CARD_ACTION_CREATE_MEDICAL_ID";
      }
      if (v19) {
        uint64_t v23 = 3;
      }
      else {
        uint64_t v23 = 1;
      }
      long long v24 = [v20 localizedStringForKey:v22 value:&stru_1ED8AC728 table:@"Localized"];

      long long v25 = [*(id *)(a1 + 40) medicalIDAction];
      [v25 setMedicalIDActionType:v23];

      uint64_t v26 = [*(id *)(a1 + 40) cardMedicalIDGroup];
      uint64_t v27 = [*(id *)(a1 + 40) medicalIDAction];
      long long v28 = +[CNUIColorRepository contactListEmergencyContactAddTextColor];
      long long v29 = +[CNUIColorRepository contactListEmergencyContactGlyphColor];
      [v26 addAction:v27 withTitle:v24 color:v28 glyphColor:v29 transportType:6];
    }
    uint64_t v30 = [*(id *)(a1 + 40) contactView];
    id v31 = [*(id *)(a1 + 40) editingGroups];
    uint64_t v32 = (void *)MEMORY[0x1E4FB1EB0];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __59__CNContactContentEditViewController__reloadMedicalIDGroup__block_invoke_3;
    v43[3] = &unk_1E549B800;
    id v33 = v31;
    uint64_t v34 = *(void *)(a1 + 40);
    id v44 = v33;
    uint64_t v45 = v34;
    id v35 = v30;
    id v46 = v35;
    [v32 performWithoutAnimation:v43];
    uint64_t v36 = [*(id *)(a1 + 40) emergencyNumberIdentifier];
    if (v36)
    {
      long long v37 = (void *)v36;
      long long v38 = [*(id *)(a1 + 40) emergencyNumberIdentifier];
      char v39 = [0 isEqualToString:v38];

      if ((v39 & 1) == 0)
      {
        [*(id *)(a1 + 40) setEmergencyNumberIdentifier:0];
        uint64_t v40 = *(void **)(a1 + 40);
        long long v41 = [v40 propertyGroups];
        double v42 = [v41 objectForKeyedSubscript:*MEMORY[0x1E4F1AEE0]];
        [v40 reloadCardGroup:v42 forTableView:v35];
      }
    }
  }
}

void __59__CNContactContentEditViewController__reloadMedicalIDGroup__block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) cardMedicalIDGroup];
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
    int v7 = *(void **)(a1 + 40);
    [v7 _addMedicalIDGroupAnimated:0 forTableView:v6];
  }
}

- (void)_addMedicalIDGroupAnimated:(BOOL)a3 forTableView:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  int v7 = [(CNContactContentEditViewController *)self editingGroups];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__CNContactContentEditViewController__addMedicalIDGroupAnimated_forTableView___block_invoke;
  aBlock[3] = &unk_1E549BB58;
  aBlock[4] = self;
  id v8 = _Block_copy(aBlock);
  uint64_t v9 = [v7 indexOfObjectPassingTest:v8];
  if (v9)
  {
    if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
      [v7 lastObject];
    }
    else {
    id v10 = [v7 objectAtIndexedSubscript:v9 - 1];
    }
  }
  else
  {
    id v10 = 0;
  }
  id v11 = [(CNContactContentEditViewController *)self cardMedicalIDGroup];
  [(CNContactContentEditViewController *)self _addGroup:v11 afterGroup:v10 forTableView:v6 animated:v4];
}

BOOL __78__CNContactContentEditViewController__addMedicalIDGroupAnimated_forTableView___block_invoke(uint64_t a1, void *a2)
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

- (void)_addGroup:(id)a3 afterGroup:(id)a4 forTableView:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v18 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v10)
  {
    [(CNContactContentEditViewController *)self addCardGroup:v18 afterGroup:v10];
    id v12 = [(CNContactContentEditViewController *)self editingGroups];
    uint64_t v13 = [v12 indexOfObject:v10];
    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v14 = v13 + 1;
      goto LABEL_6;
    }
  }
  else
  {
    id v12 = [(CNContactContentEditViewController *)self editingGroups];
  }
  uint64_t v14 = 0;
LABEL_6:
  [v11 beginUpdates];
  [v12 insertObject:v18 atIndex:v14];
  unint64_t v15 = [(CNContactContentEditViewController *)self tableViewSectionIndexFromGroupIndex:v14 forTableView:v11];
  id v16 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v15];
  if (v6) {
    uint64_t v17 = 6;
  }
  else {
    uint64_t v17 = 5;
  }
  [v11 insertSections:v16 withRowAnimation:v17];

  [v11 endUpdates];
}

- (void)_reloadPropertyGroupsPreservingChanges:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(CNContactContentEditViewController *)self propertyGroups];
  id v5 = [v4 allValues];

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
  id v4 = [(CNContactContentEditViewController *)self mutableContact];
  id v5 = [(CNContactContentEditViewController *)self contactStore];
  uint64_t v6 = [(CNContactContentEditViewController *)self policy];
  uint64_t v7 = [(CNContactContentEditViewController *)self linkedPoliciesByContactIdentifier];
  uint64_t v8 = [(CNContactContentEditViewController *)self prohibitedPropertyKeys];
  uint64_t v9 = [(CNPropertyGroupsDataSource *)v3 initWithMutableContact:v4 contactStore:v5 policy:v6 linkedPolicies:v7 prohibitedKeys:v8];
  propertyGroupsDataSource = self->_propertyGroupsDataSource;
  self->_propertyGroupsDataSource = v9;

  long long v11 = [(CNContactContentEditViewController *)self propertyGroupsDataSource];
  [v11 buildPropertyGroups];

  long long v12 = [(CNContactContentEditViewController *)self propertyGroupsDataSource];
  long long v13 = [v12 propertyGroups];

  return v13;
}

- (BOOL)shouldShowGemini
{
  BOOL v3 = [(CNContactContentEditViewController *)self geminiDataSource];
  id v4 = [v3 geminiResult];

  if (v4 && ![(CNContactContentEditViewController *)self showingMeContact])
  {
    uint64_t v6 = [(CNContactContentEditViewController *)self contact];
    if ([v6 isSuggested])
    {
      BOOL v5 = 0;
    }
    else
    {
      uint64_t v7 = [(CNContactContentEditViewController *)self contact];
      BOOL v5 = +[CNContactContentEditViewController shouldShowGeminiForResult:v4 contact:v7];
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
  id v4 = objc_opt_class();

  return (Class)v4;
}

- (id)_addNewFieldAction
{
  id v3 = [CNContactAddNewFieldAction alloc];
  id v4 = [(CNContactContentEditViewController *)self contact];
  BOOL v5 = [(CNContactAction *)v3 initWithContact:v4];

  uint64_t v6 = [(CNContactContentEditViewController *)self prohibitedPropertyKeys];
  [(CNContactAddNewFieldAction *)v5 setProhibitedPropertyKeys:v6];

  [(CNContactAction *)v5 setDelegate:self];
  [(CNContactAddNewFieldAction *)v5 setGroupPickerDelegate:self];

  return v5;
}

- (id)_selectContainersAction
{
  id v3 = objc_alloc_init(CNContactSelectContainersAction);
  [(CNContactAction *)v3 setDelegate:self];

  return v3;
}

- (id)_addLinkedCardAction
{
  id v3 = [CNContactAddLinkedCardAction alloc];
  id v4 = [(CNContactContentEditViewController *)self mutableContact];
  BOOL v5 = [(CNContactAction *)v3 initWithContact:v4];

  [(CNContactAction *)v5 setDelegate:self];

  return v5;
}

- (id)_linkedCardsAction
{
  id v3 = [CNPropertyLinkedCardsAction alloc];
  id v4 = [(CNContactContentEditViewController *)self mutableContact];
  BOOL v5 = [(CNPropertyLinkedCardsAction *)v3 initWithContact:v4];

  [(CNContactAction *)v5 setDelegate:self];
  [(CNPropertyLinkedCardsAction *)v5 setContactDelegate:self];

  return v5;
}

- (id)_propertyGroupsForKeys:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
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
        long long v12 = [(CNContactContentEditViewController *)self propertyGroups];
        long long v13 = [v12 objectForKeyedSubscript:v11];

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

- (void)_setupEditingCardActions
{
  id v3 = [(CNContactContentEditViewController *)self policy];
  char v4 = [v3 isReadonly];

  if (v4) {
    return;
  }
  [(CNContactContentEditViewController *)self _setupSuggestionActions];
  BOOL v5 = [(CNContactContentEditViewController *)self actionProvider];
  id v6 = [v5 stopSharingWithFamilyAction];
  int v7 = [v6 canPerformAction];

  if (v7)
  {
    uint64_t v8 = [(CNContactContentEditViewController *)self cardEditingActionsGroup];
    uint64_t v9 = [(CNContactContentEditViewController *)self actionProvider];
    long long v10 = [v9 stopSharingWithFamilyAction];
    uint64_t v11 = [(CNContactContentEditViewController *)self actionProvider];
    long long v12 = [v11 stopSharingWithFamilyAction];
    long long v13 = [v12 title];
    [v8 addAction:v10 withTitle:v13];
  }
  uint64_t v14 = [CNContactAddStaticIdentityAction alloc];
  long long v15 = [(CNContactContentEditViewController *)self contact];
  long long v16 = [(CNContactAction *)v14 initWithContact:v15];
  [(CNContactContentEditViewController *)self setAddStaticIdentityAction:v16];

  long long v17 = [(CNContactContentEditViewController *)self alreadyPickedGroups];
  long long v18 = [(CNContactContentEditViewController *)self policy];
  uint64_t v19 = [(CNContactContentEditViewController *)self prohibitedPropertyKeys];
  LODWORD(v16) = +[CNContactPropertyGroupPickerViewController propertiesLeftToPickWithPickedGroups:v17 policy:v18 prohibitedPropertyKeys:v19];

  if (v16)
  {
    uint64_t v20 = [(CNContactContentEditViewController *)self _addNewFieldAction];
    [(CNContactContentEditViewController *)self setAddNewFieldAction:v20];

    char v21 = [(CNContactContentEditViewController *)self cardEditingActionsGroup];
    id v22 = [(CNContactContentEditViewController *)self addNewFieldAction];
    uint64_t v23 = CNContactsUIBundle();
    long long v24 = [v23 localizedStringForKey:@"ADD_MORE_PROPERTIES" value:&stru_1ED8AC728 table:@"Localized"];
    [v21 addAction:v22 withTitle:v24];
  }
  long long v25 = [(CNContactContentEditViewController *)self contact];
  int v26 = [v25 isSuggestedMe];

  if (v26)
  {
    uint64_t v27 = [CNContactIgnoreDonatedInformationAction alloc];
    long long v28 = [(CNContactContentEditViewController *)self mutableContact];
    id v29 = objc_alloc_init(MEMORY[0x1E4F5A190]);
    uint64_t v30 = [(CNContactContentEditViewController *)self environment];
    id v31 = [v30 componentsFactory];
    uint64_t v32 = [(CNContactIgnoreDonatedInformationAction *)v27 initWithContact:v28 donationStore:v29 componentsFactory:v31];
    [(CNContactContentEditViewController *)self setIgnoreContactAction:v32];

    id v33 = [(CNContactContentEditViewController *)self ignoreContactAction];
    [v33 setDelegate:self];

    uint64_t v34 = [(CNContactContentEditViewController *)self ignoreContactAction];
    [v34 setDestructive:1];

    id v35 = [(CNContactContentEditViewController *)self cardEditingDeleteContactGroup];
    uint64_t v36 = [(CNContactContentEditViewController *)self ignoreContactAction];
    long long v37 = CNContactsUIBundle();
    long long v38 = v37;
    char v39 = @"CARD_ACTION_IGNORE_CARD";
LABEL_11:
    double v51 = [v37 localizedStringForKey:v39 value:&stru_1ED8AC728 table:@"Localized"];
    [v35 addAction:v36 withTitle:v51];

    goto LABEL_12;
  }
  id v35 = [(CNContactContentEditViewController *)self contact];
  if (([v35 isUnknown] & 1) == 0)
  {
    uint64_t v40 = [(CNContactContentEditViewController *)self contactViewConfiguration];
    char v41 = [v40 editingProposedInformation];

    if (v41) {
      goto LABEL_13;
    }
    double v42 = [CNContactDeleteContactAction alloc];
    id v43 = [(CNContactContentEditViewController *)self mutableContact];
    id v44 = [(CNContactContentEditViewController *)self environment];
    uint64_t v45 = [v44 recentsManager];
    id v46 = [(CNContactContentEditViewController *)self environment];
    long long v47 = [v46 componentsFactory];
    double v48 = [(CNContactDeleteContactAction *)v42 initWithContact:v43 recentsManager:v45 componentsFactory:v47];
    [(CNContactContentEditViewController *)self setDeleteContactAction:v48];

    uint64_t v49 = [(CNContactContentEditViewController *)self deleteContactAction];
    [v49 setDelegate:self];

    double v50 = [(CNContactContentEditViewController *)self deleteContactAction];
    [v50 setDestructive:1];

    id v35 = [(CNContactContentEditViewController *)self cardEditingDeleteContactGroup];
    uint64_t v36 = [(CNContactContentEditViewController *)self deleteContactAction];
    long long v37 = CNContactsUIBundle();
    long long v38 = v37;
    char v39 = @"CARD_ACTION_DELETE_CARD";
    goto LABEL_11;
  }
LABEL_12:

LABEL_13:
  if ([(CNContactContentEditViewController *)self shouldAllowContainerPicking])
  {
    double v52 = objc_alloc_init(CNContactSelectContainersAction);
    [(CNContactContentEditViewController *)self setSelectContainersAction:v52];

    id v53 = [(CNContactContentEditViewController *)self selectContainersAction];
    [v53 setDelegate:self];
  }
}

- (void)_setupSuggestionActions
{
  id v3 = [(CNContactContentEditViewController *)self originalContacts];
  objc_msgSend(v3, "_cn_filter:", &__block_literal_global_582);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if ([v8 count] == 1)
  {
    char v4 = [CNContactSuggestionAction alloc];
    BOOL v5 = [v8 firstObject];
    id v6 = [(CNContactAction *)v4 initWithContact:v5];
    [(CNContactContentEditViewController *)self setSuggestedContactAction:v6];

    int v7 = [(CNContactContentEditViewController *)self suggestedContactAction];
    [v7 setDelegate:self];
  }
  else
  {
    [(CNContactContentEditViewController *)self setSuggestedContactAction:0];
  }
}

uint64_t __61__CNContactContentEditViewController__setupSuggestionActions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSuggested];
}

- (void)updateContactsViewWithBlock:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  ++self->_animating;
  id v8 = [(CNContactContentEditViewController *)self contactView];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__CNContactContentEditViewController_updateContactsViewWithBlock_completion___block_invoke;
  v13[3] = &unk_1E549B8A0;
  id v14 = v6;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__CNContactContentEditViewController_updateContactsViewWithBlock_completion___block_invoke_2;
  v11[3] = &unk_1E549B8C8;
  v11[4] = self;
  id v12 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBatchUpdates:v13 completion:v11];
}

uint64_t __77__CNContactContentEditViewController_updateContactsViewWithBlock_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __77__CNContactContentEditViewController_updateContactsViewWithBlock_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  --*(_DWORD *)(*(void *)(a1 + 32) + 980);
  id v3 = *(void **)(a1 + 32);

  return [v3 reloadDataIfNeeded];
}

- (CGSize)requiredSizeForVisibleTableView
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)desiredHeightForWidth:(double)a3
{
  char v4 = [(CNContactContentEditViewController *)self view];
  [v4 frame];
  objc_msgSend(v4, "setFrame:");
  [(CNContactContentEditViewController *)self reloadDataIfNeeded];
  BOOL v5 = [(CNContactContentEditViewController *)self contactView];
  id v6 = (id)[v5 visibleCells];

  id v7 = [(CNContactContentEditViewController *)self view];
  [v7 layoutIfNeeded];

  id v8 = [(CNContactContentEditViewController *)self contactHeaderView];
  [v8 setNeedsLayout];

  [(CNContactContentEditViewController *)self requiredSizeForVisibleTableView];
  double v10 = v9;
  uint64_t v11 = [v4 superview];
  [v11 frame];
  objc_msgSend(v4, "setFrame:");

  return v10;
}

- (void)cleanupRecentPosterMetadata
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1B968]);
  char v4 = (void *)MEMORY[0x1E4F1B960];
  BOOL v5 = [(CNContactContentEditViewController *)self contact];
  id v6 = [v5 identifier];
  v16[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v8 = [v4 saveRequestToDeletePostersForContactIdentifiers:v7];

  id v13 = 0;
  [v3 performSaveRequest:v8 error:&v13];
  id v9 = v13;
  if (v9)
  {
    double v10 = CNUILogContactCard();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = [(CNContactContentEditViewController *)self contact];
      id v12 = [v11 identifier];
      *(_DWORD *)buf = 138412290;
      long long v15 = v12;
      _os_log_debug_impl(&dword_18B625000, v10, OS_LOG_TYPE_DEBUG, "Failed to delete recent poster metadata for contact: %@", buf, 0xCu);
    }
  }
}

- (void)cleanupRecentImageMetadata
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1B930]);
  char v4 = (void *)MEMORY[0x1E4F1B928];
  BOOL v5 = [(CNContactContentEditViewController *)self contact];
  id v6 = [v5 identifier];
  v16[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v8 = [v4 saveRequestToDeleteImagesForContactIdentifiers:v7];

  id v13 = 0;
  [v3 performSaveRequest:v8 error:&v13];
  id v9 = v13;
  if (v9)
  {
    double v10 = CNUILogContactCard();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = [(CNContactContentEditViewController *)self contact];
      id v12 = [v11 identifier];
      *(_DWORD *)buf = 138412290;
      long long v15 = v12;
      _os_log_debug_impl(&dword_18B625000, v10, OS_LOG_TYPE_DEBUG, "Failed to delete recent image metadata for contact: %@", buf, 0xCu);
    }
  }
}

- (void)cleanupRecentMetadata
{
  [(CNContactContentEditViewController *)self cleanupRecentImageMetadata];

  [(CNContactContentEditViewController *)self cleanupRecentPosterMetadata];
}

- (void)reloadUnifiedContact
{
  id v3 = [(CNContactContentEditViewController *)self contact];
  char v4 = objc_opt_class();

  BOOL v5 = [(CNContactContentEditViewController *)self contact];
  id v8 = [v5 linkedContacts];

  id v6 = v8;
  if (v8)
  {
    id v7 = [v4 unifyContacts:v8];
    [(CNContactContentEditViewController *)self setContact:v7];

    id v6 = v8;
  }
}

- (void)addStaticIdentity:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CNContactContentEditViewController *)self cardStaticIdentityGroup];
  [v5 addIdentity:v4 isNew:1];

  [(CNContactContentEditViewController *)self reloadDataPreservingChanges:1];
}

- (void)removeLinkedContact:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(CNContactContentEditViewController *)self contact];
    id v6 = [v5 mainStoreLinkedContacts];
    char v7 = [v6 containsObject:v4];

    id v8 = [(CNContactContentEditViewController *)self editingLinkedContacts];
    int v9 = [v8 containsObject:v4];

    if ((v7 & 1) != 0 || v9)
    {
      double v10 = [v4 availableKeyDescriptor];
      v14[0] = v10;
      uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
      [(CNContactContentEditViewController *)self _setupEditingLinkedContactsForKeys:v11];

      id v12 = [(CNContactContentEditViewController *)self editingLinkedContacts];
      [v12 removeObject:v4];

      [(CNContactContentEditViewController *)self reloadDataPreservingChanges:1];
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
    uint64_t v5 = [(CNContactContentEditViewController *)self contact];
    if ((id)v5 == v4)
    {
    }
    else
    {
      id v6 = (void *)v5;
      char v7 = [(CNContactContentEditViewController *)self contact];
      id v8 = [v7 mainStoreLinkedContacts];
      char v9 = [v8 containsObject:v4];

      if ((v9 & 1) == 0)
      {
        double v10 = [v4 availableKeyDescriptor];
        v14[0] = v10;
        uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
        [(CNContactContentEditViewController *)self _setupEditingLinkedContactsForKeys:v11];

        id v12 = [(CNContactContentEditViewController *)self editingLinkedContacts];
        [v12 addObject:v4];

        [(CNContactContentEditViewController *)self reloadDataPreservingChanges:1];
        id v13 = +[CNUIDataCollector sharedCollector];
        [v13 logContactActionType:CNUIContactActionTypeLink attributes:0];
      }
    }
  }
}

- (void)_setupEditingLinkedContactsForKeys:(id)a3
{
  id v13 = a3;
  id v4 = [(CNContactContentEditViewController *)self editingLinkedContacts];

  uint64_t v5 = v13;
  if (!v4)
  {
    id v6 = [(CNContactContentEditViewController *)self contact];
    int v7 = [v6 isUnified];

    if (v7)
    {
      id v8 = [(CNContactContentEditViewController *)self contact];
      char v9 = [v8 mainStoreLinkedContacts];
      uint64_t v10 = [v9 mutableCopy];
    }
    else
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F1CA48];
      id v8 = [(CNContactContentEditViewController *)self contact];
      char v9 = (void *)[v8 copyWithPropertyKeys:v13];
      uint64_t v10 = [v11 arrayWithObject:v9];
    }
    id v12 = (void *)v10;
    [(CNContactContentEditViewController *)self setEditingLinkedContacts:v10];

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
    id v5 = [(CNContactContentEditViewController *)self contact];
  }
  id v6 = v5;
  [(CNContactContentEditViewController *)self setContact:v5];
  [(CNContactContentEditViewController *)self _didCompleteWithContact:v6];
}

- (void)createdNewContact:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (v4)
  {
    [(CNContactContentEditViewController *)self setContact:v4];
    [(CNContactContentEditViewController *)self setMode:1];
    id v5 = [(CNContactContentEditViewController *)self contactViewConfiguration];
    [v5 setAllowsAddingToAddressBook:0];

    id v4 = v6;
  }
  [(CNContactContentEditViewController *)self _didCompleteWithContact:v4];
}

- (void)_didCompleteWithContact:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    id v16 = [(CNContactContentEditViewController *)self _removeUnauthorizedKeysFromContact:v4];

    if (self->_contact != &self->_mutableContact->super)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = [v16 copy];

        id v16 = (id)v6;
      }
    }
    id v7 = [(CNContactContentEditViewController *)self suggestedContactAction];
    [v7 confirmSuggestion];
  }
  else
  {
    id v16 = 0;
  }
  if ([(CNContactContentEditViewController *)self mode] == 3)
  {
    id v8 = [(CNContactContentEditViewController *)self originalContacts];
    uint64_t v9 = [v8 count];

    if (v9 == 1)
    {
      if (v16)
      {
        uint64_t v10 = +[CNUIDataCollector sharedCollector];
        uint64_t v11 = [(CNContactContentEditViewController *)self originalContacts];
        id v12 = [v11 objectAtIndexedSubscript:0];
        [v10 logContactCreated:v16 originalContact:v12];
      }
    }
  }
  id v13 = [(CNContactContentEditViewController *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    long long v15 = [(CNContactContentEditViewController *)self delegate];
    [v15 contactEditViewController:self didCompleteWithContact:v16];
  }
}

- (id)_removeUnauthorizedKeysFromContact:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactContentEditViewController *)self missingRequiredKeys];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = (void *)[v4 mutableCopy];
    id v8 = [(CNContactContentEditViewController *)self missingRequiredKeys];
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
    [(CNContactContentEditViewController *)self setMissingRequiredKeys:v12];

    uint64_t v24 = 0;
    long long v25 = &v24;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = __Block_byref_object_copy__22336;
    long long v28 = __Block_byref_object_dispose__22337;
    id v29 = 0;
    id v13 = objc_alloc(MEMORY[0x1E4F1B908]);
    char v14 = [(CNContactContentEditViewController *)self missingRequiredKeys];
    long long v15 = (void *)[v13 initWithKeysToFetch:v14];

    id v16 = (void *)MEMORY[0x1E4F1B8F8];
    long long v17 = [v6 identifier];
    v30[0] = v17;
    long long v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    uint64_t v19 = [v16 predicateForContactsWithIdentifiers:v18];
    [v15 setPredicate:v19];

    objc_msgSend(v15, "setUnifyResults:", objc_msgSend(v6, "isUnified"));
    uint64_t v20 = [(CNContactContentEditViewController *)self contactStore];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __85__CNContactContentEditViewController__updateContact_withMissingKeysFromRequiredKeys___block_invoke;
    v23[3] = &unk_1E549B878;
    v23[4] = &v24;
    [v20 enumerateContactsWithFetchRequest:v15 error:0 usingBlock:v23];

    char v21 = (void *)[v6 mutableCopy];
    [v21 overwriteStateFromContact:v25[5]];
    id v11 = [v21 freeze];

    _Block_object_dispose(&v24, 8);
  }

  return v11;
}

void __85__CNContactContentEditViewController__updateContact_withMissingKeysFromRequiredKeys___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (void)focusOnLastEditingItemInGroup:(id)a3
{
  id v10 = [a3 lastEditingItem];
  id v4 = [(CNContactContentEditViewController *)self indexPathOfEditingPropertyItem:v10];
  objc_opt_class();
  id v5 = [(CNContactContentEditViewController *)self contactView];
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
  if ([(CNContactContentEditViewController *)self mode] == 3
    && ![(CNContactContentEditViewController *)self didSetFirstResponder])
  {
    [(CNContactContentEditViewController *)self setDidSetFirstResponder:1];
    id v3 = [(CNContactContentEditViewController *)self nameEditingGroups];
    id v12 = [v3 firstObject];

    id v4 = [v12 editingItems];
    id v5 = [v4 firstObject];

    id v6 = [(CNContactContentEditViewController *)self indexPathOfEditingPropertyItem:v5];
    objc_opt_class();
    id v7 = [(CNContactContentEditViewController *)self contactView];
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
  id v11 = -[CNContactContentEditViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", [v9 section], v10);
  char v12 = [v11 canAddEditingItem];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __81__CNContactContentEditViewController_removeEditingItem_atIndexPath_forTableView___block_invoke;
  v16[3] = &unk_1E549B850;
  v16[4] = v11;
  id v17 = v8;
  long long v18 = self;
  id v19 = v10;
  id v20 = v9;
  char v21 = v12;
  id v13 = v9;
  id v14 = v10;
  id v15 = v8;
  [(CNContactContentEditViewController *)self updateContactsViewWithBlock:v16 completion:0];
}

void __81__CNContactContentEditViewController_removeEditingItem_atIndexPath_forTableView___block_invoke(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) removeEditingItem:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) _updateLabelWidthForCellsInGroup:*(void *)(a1 + 32) forTableView:*(void *)(a1 + 56) reset:1];
  if (![*(id *)(a1 + 32) isMultiValue])
  {
    id v9 = [*(id *)(a1 + 32) propertyItems];
    unint64_t v10 = [v9 count];

    id v11 = *(void **)(a1 + 56);
    if (v10 < 2)
    {
      uint64_t v12 = *(void *)(a1 + 64);
      id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
      [v11 reloadRowsAtIndexPaths:v6 withRowAnimation:100];
    }
    else
    {
      uint64_t v13 = *(void *)(a1 + 64);
      id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
      [v11 deleteRowsAtIndexPaths:v6 withRowAnimation:2];
    }
    goto LABEL_8;
  }
  double v2 = [*(id *)(a1 + 48) contactView];
  v15[0] = *(void *)(a1 + 64);
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [v2 deleteRowsAtIndexPaths:v3 withRowAnimation:2];

  if (!*(unsigned char *)(a1 + 72) && [*(id *)(a1 + 32) canAddEditingItem])
  {
    id v4 = (void *)MEMORY[0x1E4F28D58];
    id v5 = [*(id *)(a1 + 32) editingItems];
    id v6 = objc_msgSend(v4, "indexPathForRow:inSection:", objc_msgSend(v5, "count") - 1, objc_msgSend(*(id *)(a1 + 64), "section"));

    id v7 = *(void **)(a1 + 56);
    id v14 = v6;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    [v7 insertRowsAtIndexPaths:v8 withRowAnimation:100];

LABEL_8:
  }
}

- (void)addEditingItemAtIndexPath:(id)a3 forTableView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[CNContactContentEditViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", [v6 section], v7);
  if ([v8 addEditingItem])
  {
    [(CNContactContentEditViewController *)self _updateLabelWidthForCellsInGroup:v8 forTableView:v7 reset:0];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __77__CNContactContentEditViewController_addEditingItemAtIndexPath_forTableView___block_invoke;
    v10[3] = &unk_1E549B800;
    v10[4] = v8;
    v10[5] = self;
    id v11 = v6;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __77__CNContactContentEditViewController_addEditingItemAtIndexPath_forTableView___block_invoke_2;
    v9[3] = &unk_1E549B7D8;
    v9[4] = self;
    v9[5] = v8;
    [(CNContactContentEditViewController *)self updateContactsViewWithBlock:v10 completion:v9];
  }
}

void __77__CNContactContentEditViewController_addEditingItemAtIndexPath_forTableView___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (![*(id *)(a1 + 32) isMultiValue])
  {
    id v3 = [*(id *)(a1 + 40) contactView];
    uint64_t v7 = *(void *)(a1 + 48);
    id v5 = (void *)MEMORY[0x1E4F1C978];
    id v6 = &v7;
LABEL_6:
    id v4 = objc_msgSend(v5, "arrayWithObjects:count:", v6, 1, v7, v8);
    [v3 reloadRowsAtIndexPaths:v4 withRowAnimation:100];
    goto LABEL_7;
  }
  int v2 = [*(id *)(a1 + 32) canAddEditingItem];
  id v3 = [*(id *)(a1 + 40) contactView];
  if (!v2)
  {
    uint64_t v8 = *(void *)(a1 + 48);
    id v5 = (void *)MEMORY[0x1E4F1C978];
    id v6 = &v8;
    goto LABEL_6;
  }
  v9[0] = *(void *)(a1 + 48);
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [v3 insertRowsAtIndexPaths:v4 withRowAnimation:6];
LABEL_7:
}

uint64_t __77__CNContactContentEditViewController_addEditingItemAtIndexPath_forTableView___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) focusOnLastEditingItemInGroup:*(void *)(result + 40)];
  }
  return result;
}

- (void)_updateLabelWidthsForAllVisibleCells
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(CNContactContentEditViewController *)self contactView];
  [v3 contentOffset];
  double v5 = v4;
  double v7 = v6;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = objc_msgSend(v3, "visibleCells", 0);
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
        [(CNContactContentEditViewController *)self _updateLabelWidthForCell:*(void *)(*((void *)&v13 + 1) + 8 * v12++)];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  objc_msgSend(v3, "setContentOffset:", v5, v7);
}

- (void)_updateLabelWidthForCellsInGroup:(id)a3 forTableView:(id)a4 reset:(BOOL)a5
{
  BOOL v5 = a5;
  id v16 = a3;
  id v8 = a4;
  if (v5)
  {
    uint64_t v9 = [(CNContactContentEditViewController *)self _labelWidthKeyForGroup:v16];
    uint64_t v10 = [(CNContactContentEditViewController *)self cachedLabelWidths];
    [v10 removeObjectForKey:v9];
  }
  [(CNContactContentEditViewController *)self _updateCachedLabelWidthsForGroup:v16];
  int64_t v11 = [(CNContactContentEditViewController *)self sectionOfGroup:v16 inTableView:v8];
  uint64_t v12 = [v16 editingItems];
  if ([v12 count])
  {
    unint64_t v13 = 0;
    do
    {
      long long v14 = [MEMORY[0x1E4F28D58] indexPathForRow:v13 inSection:v11];
      long long v15 = [v8 cellForRowAtIndexPath:v14];
      [(CNContactContentEditViewController *)self _updateLabelWidthForCell:v15];

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
      uint64_t v10 = [(CNContactContentEditViewController *)self _labelWidthKeyForItem:v8];
    }
    else
    {
      int64_t v11 = [v8 group];
      uint64_t v10 = [(CNContactContentEditViewController *)self _labelWidthKeyForGroup:v11];
    }
    uint64_t v12 = [(CNContactContentEditViewController *)self cachedLabelWidths];
    unint64_t v13 = [v12 objectForKey:v10];
    [v13 floatValue];
    [v6 setLabelWidth:v14];

    BOOL v5 = v15;
  }
}

- (void)_updateCachedLabelWidthsIfNeeded
{
  id v3 = [(CNContactContentEditViewController *)self cachedLabelWidths];

  if (!v3)
  {
    [(CNContactContentEditViewController *)self _updateCachedLabelWidths];
  }
}

- (void)_setNeedsUpdateCachedLabelWidths
{
  [(CNContactContentEditViewController *)self setCachedLabelWidths:0];
  if ([(CNContactContentEditViewController *)self isViewLoaded])
  {
    id v3 = [(CNContactContentEditViewController *)self view];
    [v3 setNeedsLayout];
  }
}

- (void)_updateCachedLabelWidths
{
  id v3 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
  [(CNContactContentEditViewController *)self setCachedLabelWidths:v3];

  double v4 = [(CNContactContentEditViewController *)self editingGroups];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = 0;
    do
    {
      char v7 = [(CNContactContentEditViewController *)self editingGroups];
      id v8 = [v7 objectAtIndexedSubscript:v6];

      [(CNContactContentEditViewController *)self _updateCachedLabelWidthsForGroup:v8];
      ++v6;
      uint64_t v9 = [(CNContactContentEditViewController *)self editingGroups];
      unint64_t v10 = [v9 count];
    }
    while (v6 < v10);
  }

  [(CNContactContentEditViewController *)self _updateLabelWidthsForAllVisibleCells];
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
        [(CNContactContentEditViewController *)self _updateCachedLabelWidthsForItem:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
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
    uint64_t v8 = [(CNContactContentEditViewController *)self contactView];
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
    unint64_t v13 = [(CNContactContentEditViewController *)self contactView];
    [v13 frame];
    double Width = CGRectGetWidth(v39);
    if (v7)
    {
      id v15 = [(CNContactContentEditViewController *)self contactView];
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
    id v20 = [(CNContactContentEditViewController *)self contactView];
    char v21 = [v20 labelTextAttributes];
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
    uint64_t v27 = [(CNContactContentEditViewController *)self _labelWidthKeyForGroup:v26];
    long long v28 = [(CNContactContentEditViewController *)self _labelWidthKeyForItem:v6];
    id v29 = [(CNContactContentEditViewController *)self cachedLabelWidths];
    uint64_t v30 = [v29 objectForKey:v27];
    [v30 floatValue];
    float v32 = v31;

    if (v25 > 0.0)
    {
      id v33 = [(CNContactContentEditViewController *)self cachedLabelWidths];
      uint64_t v34 = [NSNumber numberWithDouble:v25];
      [v33 setObject:v34 forKey:v28];

      if (v25 > v32)
      {
        id v35 = [(CNContactContentEditViewController *)self cachedLabelWidths];
        uint64_t v36 = [NSNumber numberWithDouble:v25];
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

- (unint64_t)tableViewSectionIndexFromGroupIndex:(unint64_t)a3 forTableView:(id)a4
{
  return a3;
}

- (unint64_t)groupIndexFromTableViewSectionIndex:(unint64_t)a3 forTableView:(id)a4
{
  return a3;
}

- (void)geminiDataSourceDidUpdate:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 geminiResult];
  id v6 = [(CNContactContentEditViewController *)self cardEditingGeminiGroup];
  int v7 = [v6 editingItems];
  uint64_t v8 = [v7 firstObject];

  [v8 geminiDataSourceDidUpdate:v4];
  long long v9 = [(CNContactContentEditViewController *)self indexPathOfEditingPropertyItem:v8];
  BOOL v10 = [(CNContactContentEditViewController *)self shouldShowGemini];
  double v11 = [(CNContactContentEditViewController *)self cardEditingGeminiGroup];
  [v11 setGeminiResult:v5];

  double v12 = [(CNContactContentEditViewController *)self cardEditingGeminiGroup];
  [v12 setShouldShowGemini:v10];

  unint64_t v13 = [(CNContactContentEditViewController *)self cardEditingGeminiGroup];

  if (v13)
  {
    if (v9)
    {
      if (v10)
      {
        uint64_t v14 = [(CNContactContentEditViewController *)self contactView];
        v25[0] = v9;
        id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
        [v14 reloadRowsAtIndexPaths:v15 withRowAnimation:100];
      }
      else
      {
        char v21 = [(CNContactContentEditViewController *)self cardEditingGeminiGroup];
        id v22 = [(CNContactContentEditViewController *)self contactView];
        int64_t v23 = [(CNContactContentEditViewController *)self sectionOfGroup:v21 inTableView:v22];

        int v24 = [(CNContactContentEditViewController *)self editingGroups];
        [v24 removeObjectAtIndex:v23];

        uint64_t v14 = [(CNContactContentEditViewController *)self contactView];
        id v15 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(v9, "indexAtPosition:", 0));
        [v14 deleteSections:v15 withRowAnimation:3];
      }
      goto LABEL_9;
    }
    if (v10)
    {
      double v16 = [(CNContactContentEditViewController *)self editingGroups];
      double v17 = [(CNContactContentEditViewController *)self cardEditingGeminiGroup];
      [v16 insertObject:v17 atIndex:0];

      id v18 = [(CNContactContentEditViewController *)self cardEditingGeminiGroup];
      id v19 = [(CNContactContentEditViewController *)self contactView];
      int64_t v20 = [(CNContactContentEditViewController *)self sectionOfGroup:v18 inTableView:v19];

      if (v20 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v14 = [(CNContactContentEditViewController *)self contactView];
        id v15 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v20];
        [v14 insertSections:v15 withRowAnimation:3];
LABEL_9:
      }
    }
  }
}

- (void)setMenuProviderForCell:(id)a3 forActionGroupItem:(id)a4
{
  id v15 = a3;
  uint64_t v5 = [a4 actions];
  id v6 = [v5 firstObject];

  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    id v10 = [v9 menuProvider];

    [v15 setMenuProvider:v10];
  }
  else
  {
    double v11 = [v7 target];
    if ([v11 conformsToProtocol:&unk_1ED94A278]) {
      double v12 = v11;
    }
    else {
      double v12 = 0;
    }
    id v10 = v12;

    if (v10)
    {
      unint64_t v13 = [v15 contextMenuInteraction];
      uint64_t v14 = [v10 menuProviderForContextMenuInteraction:v13];
      [v15 setMenuProvider:v14];
    }
  }
}

- (id)_cellForIndexPath:(id)a3 forTableView:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(CNContactContentEditViewController *)self _itemAtIndexPath:v7 forTableView:v8];
  id v10 = [(CNContactContentEditViewController *)self _cellIdentifierForTableView:v8 indexPath:v7];

  uint64_t v11 = [(CNContactContentEditViewController *)self noteCell];
  if (!v11) {
    goto LABEL_4;
  }
  double v12 = (void *)v11;
  unint64_t v13 = [(CNContactContentEditViewController *)self contactView];
  uint64_t v14 = objc_opt_class();
  id v15 = [v14 cellIdentifierForClass:objc_opt_class()];
  int v16 = [v10 isEqualToString:v15];

  if (v16)
  {
    double v17 = [(CNContactContentEditViewController *)self noteCell];
    [(CNContactContentEditViewController *)self setNoteCell:0];
  }
  else
  {
LABEL_4:
    id v18 = [(CNContactContentEditViewController *)self contactView];
    double v17 = [v18 dequeueReusableCellWithIdentifier:v10];
  }
  if (!v17)
  {
    CGRect v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2, self, @"CNContactContentEditViewController.m", 3076, @"We couldn’t create a cell with identifier: %@ indexPath: %@", v10, v7 object file lineNumber description];
  }
  if ([(CNContactContentEditViewController *)self mode] == 5)
  {
    objc_opt_class();
    id v19 = v9;
    if (objc_opt_isKindOfClass()) {
      int64_t v20 = v19;
    }
    else {
      int64_t v20 = 0;
    }
    id v21 = v20;

    if (v21)
    {
      id v22 = [(CNContactContentEditViewController *)self highlightedProperties];
      if ([v22 count])
      {
        int64_t v23 = [(CNContactContentEditViewController *)self highlightedProperties];
        int v24 = [v21 contactProperty];
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
    uint64_t v26 = [(CNContactContentEditViewController *)self presentingDelegate];
    [v17 setPresentingDelegate:v26];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v27 = [(CNContactContentEditViewController *)self contactViewConfiguration];
    objc_msgSend(v17, "setAllowsActions:", objc_msgSend(v27, "allowsActions"));
  }
  if (objc_opt_respondsToSelector())
  {
    id v28 = v17;
    id v29 = [(CNContactContentEditViewController *)self emergencyNumberIdentifier];
    uint64_t v30 = [v28 propertyItem];
    float v31 = [v30 contactProperty];
    float v32 = [v31 identifier];
    objc_msgSend(v28, "setEmergencyPhoneNumber:", objc_msgSend(v29, "isEqualToString:", v32));
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v33 = v9;
    if (objc_opt_isKindOfClass()) {
      uint64_t v34 = v33;
    }
    else {
      uint64_t v34 = 0;
    }
    id v35 = v34;

    objc_opt_class();
    id v36 = v17;
    if (objc_opt_isKindOfClass()) {
      id v37 = v36;
    }
    else {
      id v37 = 0;
    }
    id v38 = v37;

    [(CNContactContentEditViewController *)self setMenuProviderForCell:v38 forActionGroupItem:v35];
  }

  return v17;
}

- (id)_cellIdentifierForTableView:(id)a3 indexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(CNContactContentEditViewController *)self _itemAtIndexPath:v8 forTableView:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = +[CNContactView cellIdentifierForEditingPropertyItem:v9];
LABEL_23:
    unint64_t v13 = (void *)v10;
    goto LABEL_24;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = +[CNContactView cellIdentifierForPropertyPlaceholder];
    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = -[CNContactContentEditViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", [v8 section], v7);
    if ([v11 useSplitActions])
    {
      uint64_t v12 = +[CNContactView cellIdentifierForSplitActions];
    }
    else
    {
      if ([v11 displaysDropdownMenu]) {
        +[CNContactView cellIdentifierForDropdownMenuActions];
      }
      else {
      uint64_t v12 = +[CNContactView cellIdentifierForActions];
      }
    }
    unint64_t v13 = (void *)v12;

LABEL_24:
    if (v13) {
      goto LABEL_25;
    }
    goto LABEL_28;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = +[CNContactView cellIdentifierForLinkedCardsEditingGroup];
    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = +[CNContactView cellIdentifierForLinkedCardsPlaceholderGroup];
    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = +[CNContactView cellIdentifierForStaticIdentityPlaceholderGroup];
    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = +[CNContactView cellIdentifierForStaticIdentityEditingGroup];
    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = +[CNContactView cellIdentifierForContactContainerEditingGroup];
    goto LABEL_23;
  }
LABEL_28:
  id v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"CNContactContentEditViewController.m", 3056, @"Unknown group item: %@", v9 object file lineNumber description];

  unint64_t v13 = 0;
LABEL_25:

  return v13;
}

- (void)_scrollContactView:(id)a3 toVisibleGroup:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  [v16 _effectiveContentInset];
  objc_msgSend(v16, "setContentOffset:", 0.0, -v7);
  if (v6)
  {
    int64_t v8 = [(CNContactContentEditViewController *)self sectionOfGroup:v6 inTableView:v16];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v9 = v8;
      uint64_t v10 = [v6 displayItems];
      uint64_t v11 = (uint64_t)(double)((unint64_t)[v10 count] >> 1);

      uint64_t v12 = [MEMORY[0x1E4F28D58] indexPathForRow:v11 inSection:v9];
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

          uint64_t v12 = (void *)v15;
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
        double v17 = *(void **)(*((void *)&v23 + 1) + 8 * v16);
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
      int64_t v20 = [v19 propertyItem];
      id v21 = [v20 property];
      id v18 = [(CNContactContentEditViewController *)self cardGroupForProperty:v21];

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
  [(CNContactContentEditViewController *)self reloadDataPreservingChanges:0];
  return 1;
}

- (void)setNeedsReloadLazy
{
  self->_needsReload = 1;
}

- (void)setNeedsReload
{
  self->_needsReload = 1;
  [(CNContactContentEditViewController *)self performSelector:sel_reloadDataIfNeeded withObject:0 afterDelay:0.0];
}

- (BOOL)isSuggestedContact
{
  int v2 = [(CNContactContentEditViewController *)self contact];
  char v3 = [v2 isSuggested];

  return v3;
}

- (void)contactViewController:(id)a3 didDeleteContact:(id)a4
{
  id v15 = a4;
  double v5 = [(CNContactContentEditViewController *)self contact];
  double v6 = [v5 mainStoreLinkedContacts];
  int v7 = [v6 containsObject:v15];

  if (v7)
  {
    [(CNContactContentEditViewController *)self removeLinkedContact:v15];
    double v8 = [(CNContactContentEditViewController *)self saveLinkedContactsExecutor];
    double v9 = [(CNContactContentEditViewController *)self saveDescriptionForCurrentState];
    double v10 = [v8 executeSaveWithConfiguration:v9 saveDelegate:self];

    [(CNContactContentEditViewController *)self setEditingLinkedContacts:0];
    double v11 = [(CNContactContentEditViewController *)self issuedSaveRequestIdentifiers];
    uint64_t v12 = [v10 identifiersOfIssuedSaveRequests];
    [v11 addObjectsFromArray:v12];

    uint64_t v13 = [v10 contact];

    if (v13)
    {
      uint64_t v14 = [v10 contact];
      [(CNContactContentEditViewController *)self setContact:v14];
    }
  }

  MEMORY[0x1F4181820]();
}

- (BOOL)shouldShowActionsForAvatarView:(id)a3
{
  return [(CNContactContentEditViewController *)self isEditing] ^ 1;
}

- (BOOL)headerViewShouldCacheContactBackgroundColor:(id)a3
{
  return 0;
}

- (double)navigationBarHeight
{
  int v2 = [(CNContactContentEditViewController *)self navigationItemController];
  char v3 = [v2 navigationController];

  id v4 = [v3 navigationBar];
  [v4 frame];
  double v6 = v5;

  return v6;
}

- (UIEdgeInsets)headerViewSafeAreaInsets
{
  char v3 = [(CNContactContentEditViewController *)self view];
  [v3 safeAreaInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  [(CNContactContentEditViewController *)self navigationBarHeight];
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
  id v5 = [(CNContactContentEditViewController *)self contactHeaderView];

  if (v5 == v4)
  {
    [(CNContactContentEditViewController *)self viewDidLayoutSubviews];
    [(CNContactContentEditViewController *)self reloadDataPreservingChanges:1];
    [(CNContactContentEditViewController *)self setupConstraints];
  }
}

- (BOOL)isNicknameProhibited
{
  int v2 = [(CNContactContentEditViewController *)self prohibitedPropertyKeys];
  char v3 = [v2 containsObject:*MEMORY[0x1E4F1AEC0]];

  return v3;
}

- (void)headerView:(id)a3 didAcceptDropOfImageData:(id)a4
{
}

- (void)headerPhotoDidUpdate
{
  [(CNContactContentEditViewController *)self updateDoneButton];
  contactHeaderView = self->_contactHeaderView;

  [(CNContactHeaderEditView *)contactHeaderView updateEditButtonTitle];
}

- (void)contactGroupPickerDidFinish:(id)a3 withGroup:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  double v7 = [(CNContactContentEditViewController *)self presentingDelegate];
  [v7 sender:self dismissViewController:v6];

  [(CNContactContentEditViewController *)self _addedGroupWithName:v8];
}

- (void)contactGroupPickerDidCancel:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactContentEditViewController *)self presentingDelegate];
  [v5 sender:self dismissViewController:v4];
}

- (id)alreadyPickedGroups
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(CNContactContentEditViewController *)self editingGroups];
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
        double v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
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
  double v9 = objc_msgSend(v8, "cnui_stringByTransliteratingToPhoneticCharactersForProperty:", a5);
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

  double v9 = v14;
LABEL_10:

  return v9;
}

- (void)propertyItem:(id)a3 willChangeValue:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 contactProperty];
  double v9 = [v8 phoneticProperty];

  if (v9)
  {
    double v10 = [(CNContactContentEditViewController *)self nameEditingGroups];
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __67__CNContactContentEditViewController_propertyItem_willChangeValue___block_invoke;
    v54[3] = &unk_1E549B760;
    id v11 = v9;
    id v55 = v11;
    int v12 = objc_msgSend(v10, "_cn_firstObjectPassingTest:", v54);

    uint64_t v13 = [v12 editingItems];
    long long v14 = [v13 firstObject];
    int v15 = [v14 labeledValue];
    uint64_t v16 = [v15 value];

    uint64_t v17 = [(CNContactContentEditViewController *)self _phoneticNameForValue:v7 currentPhoneticName:v16 property:v11];
    id v44 = v16;
    if (![v7 length])
    {
      id v18 = [v6 labeledValue];
      uint64_t v19 = [v18 value];
      id v20 = v11;
      id v21 = (void *)v19;
      id v22 = v16;
      long long v23 = v20;
      long long v24 = -[CNContactContentEditViewController _phoneticNameForValue:currentPhoneticName:property:](self, "_phoneticNameForValue:currentPhoneticName:property:", v19, v22);

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
      char v41 = v12;

      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      uint64_t v30 = [(CNContactContentEditViewController *)self contactView];
      float v31 = [v30 visibleCells];

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
            id v36 = *(void **)(*((void *)&v46 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v37 = [v36 propertyItem];
              id v38 = [v37 property];
              int v39 = [v38 isEqualToString:v45];

              if (v39)
              {
                CGRect v40 = [v36 textField];
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

uint64_t __67__CNContactContentEditViewController_propertyItem_willChangeValue___block_invoke(uint64_t a1, void *a2)
{
  char v3 = [a2 property];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)propertyCellDidChangeLayout:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(CNContactContentEditViewController *)self contactView];
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
  id obj = (id)objc_claimAutoreleasedReturnValue();
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
        double v9 = [(CNContactContentEditViewController *)self contactView];
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
  uint64_t v17 = [(CNContactContentEditViewController *)self contactView];
  [(CNContactContentEditViewController *)self _updateLabelWidthForCellsInGroup:v21 forTableView:v17 reset:1];

  [(CNContactContentEditViewController *)self updateDoneButton];
}

- (void)propertyCell:(id)a3 performActionForItem:(id)a4 withTransportType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v10 = [(CNContactContentEditViewController *)self linkedCardsAction];
LABEL_7:
    uint64_t v12 = v10;
    [v10 performActionForItem:v9 sender:v8];
LABEL_11:

    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [(CNContactContentEditViewController *)self addLinkedCardAction];
LABEL_10:
    uint64_t v12 = v11;
    [v11 performActionWithSender:v8];
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v10 = [(CNContactContentEditViewController *)self staticIdentityAction];
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [(CNContactContentEditViewController *)self addStaticIdentityAction];
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [(CNContactContentEditViewController *)self selectContainersAction];
    uint64_t v14 = [(CNContactContentEditViewController *)self containerContext];
    [(CNPropertySuggestionAction *)v13 performActionWithContainerContext:v14];
  }
  else if ([v8 isSuggested])
  {
    int v15 = [CNPropertySuggestionAction alloc];
    uint64_t v16 = [(CNContactContentEditViewController *)self contact];
    uint64_t v13 = [(CNPropertyAction *)v15 initWithContact:v16 propertyItem:v9];

    [(CNContactAction *)v13 setDelegate:self];
    [(CNPropertySuggestionAction *)v13 performActionForItem:v9 sender:v8];
  }
  else
  {
    if (a5 != 7)
    {
      +[CNPropertyAction performDefaultActionForItem:v9 sender:v8];
      goto LABEL_12;
    }
    uint64_t v13 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
    uint64_t v17 = (void *)MEMORY[0x1E4FB1410];
    id v18 = CNContactsUIBundle();
    uint64_t v19 = [v18 localizedStringForKey:@"PHONE_ACTION_TTY_CALL" value:&stru_1ED8AC728 table:@"Localized"];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __90__CNContactContentEditViewController_propertyCell_performActionForItem_withTransportType___block_invoke;
    v39[3] = &unk_1E549B738;
    v39[4] = self;
    id v20 = v9;
    id v40 = v20;
    id v21 = v8;
    id v41 = v21;
    uint64_t v22 = [v17 actionWithTitle:v19 style:0 handler:v39];
    [(CNPropertySuggestionAction *)v13 addAction:v22];

    long long v23 = (void *)MEMORY[0x1E4FB1410];
    long long v24 = CNContactsUIBundle();
    long long v25 = [v24 localizedStringForKey:@"PHONE_ACTION_TTY_RELAY_CALL" value:&stru_1ED8AC728 table:@"Localized"];
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    uint64_t v34 = __90__CNContactContentEditViewController_propertyCell_performActionForItem_withTransportType___block_invoke_2;
    id v35 = &unk_1E549B738;
    id v36 = self;
    id v37 = v20;
    id v26 = v21;
    id v38 = v26;
    long long v27 = [v23 actionWithTitle:v25 style:0 handler:&v32];
    -[CNPropertySuggestionAction addAction:](v13, "addAction:", v27, v32, v33, v34, v35, v36);

    long long v28 = (void *)MEMORY[0x1E4FB1410];
    long long v29 = CNContactsUIBundle();
    long long v30 = [v29 localizedStringForKey:@"CANCEL" value:&stru_1ED8AC728 table:@"Localized"];
    float v31 = [v28 actionWithTitle:v30 style:1 handler:0];
    [(CNPropertySuggestionAction *)v13 addAction:v31];

    [(CNContactContentEditViewController *)self sender:v26 presentViewController:v13];
  }

LABEL_12:
}

void __90__CNContactContentEditViewController_propertyCell_performActionForItem_withTransportType___block_invoke(uint64_t a1)
{
  int v2 = [CNPropertyTTYAction alloc];
  char v3 = [*(id *)(a1 + 32) contact];
  uint64_t v4 = [(CNPropertyAction *)v2 initWithContact:v3 propertyItem:*(void *)(a1 + 40)];

  [(CNContactAction *)v4 setDelegate:*(void *)(a1 + 32)];
  [(CNPropertyTTYAction *)v4 performActionForItem:*(void *)(a1 + 40) sender:*(void *)(a1 + 48)];
}

void __90__CNContactContentEditViewController_propertyCell_performActionForItem_withTransportType___block_invoke_2(uint64_t a1)
{
  int v2 = [CNPropertyTTYRelayAction alloc];
  char v3 = [*(id *)(a1 + 32) contact];
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
  double v10 = [(CNContactContentEditViewController *)self contactView];
  [(CNContactContentEditViewController *)self _updateLabelWidthForCellsInGroup:v9 forTableView:v10 reset:1];

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
  uint64_t v16 = [(CNContactContentEditViewController *)self propertyGroups];
  uint64_t v17 = [v16 objectForKeyedSubscript:v12];
  [(CNContactContentEditViewController *)self _validateGroup:v17];

  id v18 = [(CNContactContentEditViewController *)self propertyGroups];
  uint64_t v19 = [v18 objectForKeyedSubscript:v13];
  [(CNContactContentEditViewController *)self _validateGroup:v19];

LABEL_7:
  id v20 = [(CNContactContentEditViewController *)self contactHeaderView];
  [v20 updateContactWithEditedPropertyItem:v8];

  [(CNContactContentEditViewController *)self updateDoneButton];
}

- (void)propertyCell:(id)a3 didUpdateItem:(id)a4 withNewLabel:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  [v8 updateLabeledValueWithLabel:a5];
  [v9 updateWithPropertyItem:v8];

  double v10 = [v8 group];

  uint64_t v11 = [(CNContactContentEditViewController *)self contactView];
  [(CNContactContentEditViewController *)self _updateLabelWidthForCellsInGroup:v10 forTableView:v11 reset:1];

  [(CNContactContentEditViewController *)self updateDoneButton];
}

- (void)actionWasCanceled:(id)a3
{
  id v6 = [(CNContactContentEditViewController *)self contactView];
  uint64_t v4 = [(CNContactContentEditViewController *)self contactView];
  uint64_t v5 = [v4 indexPathForSelectedRow];
  [v6 deselectRowAtIndexPath:v5 animated:1];
}

- (void)actionDidFinish:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNContactContentEditViewController *)self contactView];
  id v6 = [(CNContactContentEditViewController *)self contactView];
  id v7 = [v6 indexPathForSelectedRow];
  [v5 deselectRowAtIndexPath:v7 animated:1];

  uint64_t v8 = [(CNContactContentEditViewController *)self deleteContactAction];
  if ((id)v8 == v4)
  {

    goto LABEL_8;
  }
  id v9 = (void *)v8;
  id v10 = [(CNContactContentEditViewController *)self ignoreContactAction];

  if (v10 == v4)
  {
LABEL_8:
    uint64_t v13 = [(CNContactContentEditViewController *)self delegate];
    char v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) == 0)
    {
LABEL_11:
      id v17 = [(CNContactContentEditViewController *)self navigationController];
      id v18 = (id)[v17 popViewControllerAnimated:1];
LABEL_15:

      goto LABEL_16;
    }
    int v15 = [(CNContactContentEditViewController *)self delegate];
    uint64_t v16 = [(CNContactContentEditViewController *)self contact];
    [v15 contactEditViewController:self didDeleteContact:v16];
LABEL_10:

    goto LABEL_11;
  }
  id v11 = [(CNContactContentEditViewController *)self addLinkedCardAction];

  if (v11 == v4)
  {
    id v17 = [(CNContactContentEditViewController *)self addLinkedCardAction];
    uint64_t v19 = [v17 chosenContact];
    [(CNContactContentEditViewController *)self addLinkedContact:v19];
LABEL_14:

    goto LABEL_15;
  }
  id v12 = [(CNContactContentEditViewController *)self addStaticIdentityAction];

  if (v12 == v4)
  {
    id v17 = [(CNContactContentEditViewController *)self addStaticIdentityAction];
    uint64_t v19 = [v17 chosenIdentity];
    [(CNContactContentEditViewController *)self addStaticIdentity:v19];
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(CNContactContentEditViewController *)self reloadUnifiedContact];
    goto LABEL_16;
  }
  id v20 = [(CNContactContentEditViewController *)self suggestedContactAction];

  if (v20 == v4)
  {
    long long v27 = [(CNContactContentEditViewController *)self delegate];
    char v28 = objc_opt_respondsToSelector();

    if ((v28 & 1) == 0) {
      goto LABEL_11;
    }
    int v15 = [(CNContactContentEditViewController *)self delegate];
    uint64_t v16 = [(CNContactContentEditViewController *)self suggestedContactAction];
    long long v29 = [v16 contact];
    [v15 contactEditViewController:self didDeleteContact:v29];

    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = v4;
    id v21 = [v17 propertyItem];
    uint64_t v19 = [v21 group];

    uint64_t v22 = [v17 selectedChoice];
    if (v22 == 2)
    {
      [v17 reject];
      [v19 reloadDataPreservingChanges:0];
    }
    else if (v22 == 1)
    {
      long long v23 = [v17 propertyItem];
      long long v24 = [(CNContactContentEditViewController *)self indexPathOfDisplayedPropertyItem:v23];

      long long v25 = [(CNContactContentEditViewController *)self contactView];
      [v25 selectRowAtIndexPath:v24 animated:0 scrollPosition:0];

      dispatch_time_t v26 = dispatch_time(0, 500000000);
      uint64_t v31 = MEMORY[0x1E4F143A8];
      uint64_t v32 = 3221225472;
      uint64_t v33 = __54__CNContactContentEditViewController_actionDidFinish___block_invoke;
      uint64_t v34 = &unk_1E549BF80;
      id v35 = v17;
      id v36 = v19;
      dispatch_after(v26, MEMORY[0x1E4F14428], &v31);
    }
    goto LABEL_14;
  }
  id v30 = [(CNContactContentEditViewController *)self selectContainersAction];

  if (v30 == v4) {
    [(CNContactContentEditViewController *)self reloadDataPreservingChanges:1];
  }
LABEL_16:
  -[CNContactContentEditViewController updateEditNavigationItemsAnimated:](self, "updateEditNavigationItemsAnimated:", 1, v31, v32, v33, v34);
}

uint64_t __54__CNContactContentEditViewController_actionDidFinish___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) confirm];
  int v2 = *(void **)(a1 + 40);

  return [v2 reloadDataPreservingChanges:0];
}

- (void)action:(id)a3 pushViewController:(id)a4 sender:(id)a5
{
  id v6 = a4;
  [(CNContactContentEditViewController *)self setBackgroundColorIfNeededForPresentedViewController:v6];
  id v7 = [(CNContactContentEditViewController *)self navigationItem];
  uint64_t v8 = [v7 prompt];
  id v9 = [v6 navigationItem];
  [v9 setPrompt:v8];

  id v10 = [(CNContactContentEditViewController *)self navigationController];
  [v10 pushViewController:v6 animated:1];
}

- (void)action:(id)a3 dismissViewController:(id)a4 sender:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(CNContactContentEditViewController *)self presentingDelegate];
  [v9 sender:v7 dismissViewController:v8];
}

- (void)action:(id)a3 presentViewController:(id)a4 sender:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(CNContactContentEditViewController *)self presentingDelegate];
  [v9 sender:v7 presentViewController:v8];
}

- (id)action:(id)a3 cellForPropertyItem:(id)a4 sender:(id)a5
{
  id v6 = a4;
  id v7 = [v6 property];
  id v8 = +[CNContactView cellIdentifierForProperty:v7];

  id v9 = +[CNContactView classForCellIdentifier:v8];
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 alloc];
    id v12 = NSStringFromClass(v10);
    id v10 = (objc_class *)[v11 initWithStyle:0 reuseIdentifier:v12];

    [(objc_class *)v10 setIgnoreSuggested:1];
    [(objc_class *)v10 setCardGroupItem:v6];
    [(objc_class *)v10 setDelegate:self];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v13 = [(CNContactContentEditViewController *)self contactViewConfiguration];
      -[objc_class setAllowsActions:](v10, "setAllowsActions:", [v13 allowsActions]);
    }
    [(CNContactContentEditViewController *)self prepareCell:v10];
  }

  return v10;
}

- (void)action:(id)a3 prepareChildContactViewController:(id)a4 sender:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v9 = [&unk_1ED915AE8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(&unk_1ED915AE8);
        }
        uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        char v14 = [(CNContactContentEditViewController *)self valueForKey:v13];
        if (v14) {
          [v8 setValue:v14 forKey:v13];
        }
      }
      uint64_t v10 = [&unk_1ED915AE8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }
  [v8 setAllowsSettingLinkedContactsAsPreferred:0];
  [v8 setAllowsAddToFavorites:0];
  [v8 setAllowsAddingToAddressBook:0];
  [v8 setShouldShowLinkedContacts:0];
  int v15 = [(CNContactContentEditViewController *)self parentGroup];
  [v8 setParentGroup:v15];

  id v16 = [(CNContactContentEditViewController *)self linkedCardsAction];

  if (v16 != v7)
  {
    id v17 = [(CNContactContentEditViewController *)self parentContainer];
    [v8 setParentContainer:v17];
  }
  id v18 = [(CNContactContentEditViewController *)self prohibitedPropertyKeys];
  [v8 setProhibitedPropertyKeys:v18];

  uint64_t v19 = [v8 contactView];
  id v20 = [(CNContactContentEditViewController *)self contactView];
  id v21 = [(CNContactContentEditViewController *)self environment];
  objc_msgSend(v19, "setAttributesFromContactView:runningInContactsAppOniPad:", v20, objc_msgSend(v21, "runningInContactsAppOniPad"));
}

- (void)viewController:(id)a3 presentationControllerWillDismiss:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  id v7 = [(CNContactContentEditViewController *)self presentedViewController];

  if (v7 == v6) {
    [(CNContactContentEditViewController *)self presentationControllerWillDismiss:v8];
  }
}

- (BOOL)isPresentingModalViewController
{
  int v2 = [(CNContactContentEditViewController *)self presentedViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)sender:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(CNContactContentEditViewController *)self isOutOfProcess])
  {
    uint64_t v9 = [(CNContactContentEditViewController *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      [(CNContactContentEditViewController *)self setIsPresentingFullscreenForOutOfProcess:0];
      uint64_t v11 = [(CNContactContentEditViewController *)self delegate];
      [v11 contactEditViewControllerWillDismissFullscreen:self];
    }
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __85__CNContactContentEditViewController_sender_dismissViewController_completionHandler___block_invoke;
  v13[3] = &unk_1E549B710;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v7 dismissViewControllerAnimated:1 completion:v13];
}

uint64_t __85__CNContactContentEditViewController_sender_dismissViewController_completionHandler___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned char **)(a1 + 32);
  if (v2[978])
  {
    [v2 _endDisablingInterfaceAutorotation];
    *(unsigned char *)(*(void *)(a1 + 32) + 978) = 0;
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
  uint64_t v5 = [v4 backgroundColor];
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

  uint64_t v11 = [(CNContactContentEditViewController *)self view];
  id v12 = [v11 superview];
  uint64_t v13 = [v12 backgroundColor];
  id v14 = [MEMORY[0x1E4FB1618] clearColor];
  char v15 = [v13 isEqual:v14];

  if ((v10 & 1) == 0 && (v15 & 1) == 0)
  {
    id v16 = [(CNContactContentEditViewController *)self view];
    id v17 = [v16 superview];
    id v18 = [v17 backgroundColor];
    uint64_t v19 = [v20 view];
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
  getSLComposeViewControllerClass_22358();
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
      if ([(CNContactContentEditViewController *)self isOutOfProcess] || CNUIIsDDActionsService())
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
        uint64_t v19 = [MEMORY[0x1E4FB16C8] currentDevice];
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
    uint64_t v11 = [v5 viewControllers];
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
  id v18 = +[CNContactStyle currentStyle];
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

- (void)performConfirmedCancel
{
  [(CNContactContentEditViewController *)self cancelAsyncLookups];
  [(CNContactContentEditViewController *)self _didCompleteWithContact:0];
  if ([(CNContactContentEditViewController *)self mode] == 3)
  {
    BOOL v3 = [(CNContactContentEditViewController *)self contact];
    id v4 = [v3 identifier];

    if (v4) {
      [(CNContactContentEditViewController *)self cleanupRecentMetadata];
    }
  }
  id v5 = [(CNContactContentEditViewController *)self view];
  [v5 endEditing:1];

  [(CNContactContentEditViewController *)self setEditingLinkedContacts:0];
  [(CNContactContentEditViewController *)self reloadDataPreservingChanges:0];
  int64_t v6 = [(CNContactContentEditViewController *)self contactView];
  [v6 reloadData];

  if ([(CNContactContentEditViewController *)self supportsDrafts])
  {
    +[CNUIDraftSupport deleteDrafts];
  }
}

- (void)presentationControllerWillDismiss:(id)a3
{
  if ([(CNContactContentEditViewController *)self isOutOfProcess])
  {
    id v4 = [(CNContactContentEditViewController *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      [(CNContactContentEditViewController *)self setIsPresentingFullscreenForOutOfProcess:0];
      id v6 = [(CNContactContentEditViewController *)self delegate];
      [v6 contactEditViewControllerWillDismissFullscreen:self];
    }
  }
}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  id v14 = a3;
  id v8 = a5;
  if (a4 != 5)
  {
    if ([(CNContactContentEditViewController *)self isOutOfProcess])
    {
      char v9 = [(CNContactContentEditViewController *)self delegate];
      char v10 = objc_opt_respondsToSelector();

      if (v10)
      {
        uint64_t v11 = [v14 presentedViewController];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          [(CNContactContentEditViewController *)self setIsPresentingFullscreenForOutOfProcess:1];
          char v13 = [(CNContactContentEditViewController *)self delegate];
          [v13 contactEditViewControllerWillPresentFullscreen:self];
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
  if ([(CNContactContentEditViewController *)self isOutOfProcess])
  {
    if ([(CNContactContentEditViewController *)self isPresentingModalViewController])
    {
      BOOL v3 = [(CNContactContentEditViewController *)self presentedViewController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        if ([(CNContactContentEditViewController *)self isPresentingFullscreenForOutOfProcess]&& ([(CNContactContentEditViewController *)self delegate], v5 = objc_claimAutoreleasedReturnValue(), char v6 = objc_opt_respondsToSelector(), v5, (v6 & 1) != 0))
        {
          id v9 = [(CNContactContentEditViewController *)self delegate];
          [v9 contactEditViewControllerWillPresentFullscreen:self];
        }
        else
        {
          if ([(CNContactContentEditViewController *)self isPresentingFullscreenForOutOfProcess])
          {
            return;
          }
          id v7 = [(CNContactContentEditViewController *)self delegate];
          char v8 = objc_opt_respondsToSelector();

          if ((v8 & 1) == 0) {
            return;
          }
          id v9 = [(CNContactContentEditViewController *)self delegate];
          [v9 contactEditViewControllerWillDismissFullscreen:self];
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
  v17.super_class = (Class)CNContactContentEditViewController;
  -[CNContactContentEditViewController viewWillTransitionToSize:withTransitionCoordinator:](&v17, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  char v8 = [(CNContactContentEditViewController *)self presentedViewController];
  id v9 = [v8 popoverPresentationController];
  char v10 = [v9 sourceView];

  if (v10)
  {
    uint64_t v11 = [v10 superview];
    id v12 = [(CNContactContentEditViewController *)self contactView];

    if (v11 == v12)
    {
      char v13 = [(CNContactContentEditViewController *)self presentedViewController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        void v15[2] = __89__CNContactContentEditViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
        v15[3] = &unk_1E549ADD0;
        v15[4] = self;
        id v16 = v10;
        [v7 animateAlongsideTransition:0 completion:v15];
      }
    }
  }
}

void __89__CNContactContentEditViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contactView];
  [*(id *)(a1 + 40) frame];
  objc_msgSend(v2, "scrollRectToVisible:animated:", 0);
}

- (void)sender:(id)a3 presentViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_msgSend(v7, "setModalPresentationStyle:", -[CNContactContentEditViewController _modalPresentationStyleForViewController:](self, "_modalPresentationStyleForViewController:", v7));
  char v8 = +[CNContactStyle currentStyle];
  objc_msgSend(v7, "setModalTransitionStyle:", objc_msgSend(v8, "modalTransitionStyle"));

  objc_opt_class();
  id v36 = v6;
  if (objc_opt_isKindOfClass()) {
    id v9 = v36;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  uint64_t v11 = [v7 popoverPresentationController];
  [v11 setSourceView:v10];

  [v10 bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  uint64_t v20 = [(CNContactContentEditViewController *)self contactView];
  -[CNContactContentEditViewController centeredSourceRect:inContactView:](self, "centeredSourceRect:inContactView:", v20, v13, v15, v17, v19);
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  long long v29 = [v7 popoverPresentationController];
  objc_msgSend(v29, "setSourceRect:", v22, v24, v26, v28);

  id v30 = [v7 popoverPresentationController];
  [v30 setPermittedArrowDirections:15];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v31 = [v7 presentationController];
    [v31 setDelegate:self];
  }
  if (!self->_disablingRotation)
  {
    uint64_t v32 = [MEMORY[0x1E4FB16C8] currentDevice];
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
    uint64_t v35 = [(CNContactContentEditViewController *)self supportedInterfaceOrientations];

    if (v34 != v35)
    {
      [(CNContactContentEditViewController *)self _beginDisablingInterfaceAutorotation];
      self->_disablingRotation = 1;
    }
  }
LABEL_12:
  [(CNContactContentEditViewController *)self setBackgroundColorIfNeededForPresentedViewController:v7];
  [(CNContactContentEditViewController *)self presentViewController:v7 animated:1 completion:0];
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v4 = [a3 cellForRowAtIndexPath:a4];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v4 shouldPerformAccessoryAction]) {
    [v4 performAccessoryAction];
  }
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  id v4 = [(CNContactContentEditViewController *)self _itemAtIndexPath:a4 forTableView:a3];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = CNContactsUIBundle();
  id v7 = v6;
  if (isKindOfClass) {
    char v8 = @"UNLINK";
  }
  else {
    char v8 = @"DELETE";
  }
  id v9 = [v6 localizedStringForKey:v8 value:&stru_1ED8AC728 table:@"Localized"];

  return v9;
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
  return 0;
}

- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4
{
  return 0;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v4 = [(CNContactContentEditViewController *)self _itemAtIndexPath:a4 forTableView:a3];
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
        if (objc_opt_isKindOfClass())
        {
          int64_t v6 = 1;
          goto LABEL_15;
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
              int64_t v6 = objc_opt_isKindOfClass() & 1;
              goto LABEL_15;
            }
          }
        }
      }
    }
    int64_t v6 = 2;
    goto LABEL_15;
  }
  id v5 = v4;
  if (([v5 isReadonly] & 1) != 0 || !objc_msgSend(v5, "canRemove"))
  {
    int64_t v6 = 0;
  }
  else
  {
    objc_opt_class();
    int64_t v6 = (objc_opt_isKindOfClass() & 1) == 0;
  }

LABEL_15:
  return v6;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  id v5 = [(CNContactContentEditViewController *)self _cellIdentifierForTableView:a3 indexPath:a4];
  int64_t v6 = [(CNContactContentEditViewController *)self contactView];
  id v7 = (void *)[(id)objc_opt_class() classForCellIdentifier:v5];

  LOBYTE(v6) = [v7 shouldIndentWhileEditing];
  return (char)v6;
}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  id v14 = a4;
  [v14 updateConstraintsIfNeeded];
  int64_t v6 = [v14 backgroundView];
  id v7 = [(CNContactContentEditViewController *)self contactView];
  char v8 = [v7 sectionBackgroundColor];
  if (v8)
  {
    int v9 = 1;
  }
  else
  {
    id v10 = [(CNContactContentEditViewController *)self environment];
    int v9 = [v10 runningInContactsAppOniPad];
  }
  if (v9 && !v6)
  {
    id v11 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    int64_t v6 = objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  double v12 = [(CNContactContentEditViewController *)self contactView];
  double v13 = [v12 sectionBackgroundColor];
  [v6 setBackgroundColor:v13];

  [v14 setBackgroundView:v6];
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v20 = a4;
  id v8 = a3;
  [(CNContactContentEditViewController *)self tableView:v8 willDisplayFooterView:v20 forSection:a5];
  objc_msgSend(v20, "_cnui_applyContactStyle");
  int v9 = [(CNContactContentEditViewController *)self _cardGroupAtTableViewSectionIndex:a5 forTableView:v8];

  id v10 = [(CNContactContentEditViewController *)self cardEditingDeleteContactGroup];
  if (v9 == v10
    && ([(CNContactContentEditViewController *)self ignoreContactAction],
        double v15 = objc_claimAutoreleasedReturnValue(),
        id v10 = v9,
        v15))
  {
    double v16 = [(CNContactContentEditViewController *)self contactView];
    double v17 = [v16 sectionBackgroundColor];

    if (v17)
    {
      double v13 = [(CNContactContentEditViewController *)self contactView];
      uint64_t v14 = [v13 sectionBackgroundColor];
      goto LABEL_9;
    }
  }
  else
  {
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v11 = +[CNContactStyle currentStyle];
    double v12 = [v11 backgroundColor];

    if (v12)
    {
      double v13 = +[CNContactStyle currentStyle];
      uint64_t v14 = [v13 backgroundColor];
LABEL_9:
      double v18 = (void *)v14;
      double v19 = [v20 backgroundView];
      [v19 setBackgroundColor:v18];
    }
  }
}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4
{
  id v5 = [(CNContactContentEditViewController *)self _cardGroupAtTableViewSectionIndex:a4 forTableView:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v6 = [(CNContactContentEditViewController *)self nameEditingGroups];
    uint64_t v7 = [v6 indexOfObject:v5];
    id v8 = [(CNContactContentEditViewController *)self nameEditingGroups];
    BOOL v9 = v7 == [v8 count] - 1;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  id v5 = [(CNContactContentEditViewController *)self _cardGroupAtTableViewSectionIndex:a4 forTableView:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v6 = [(CNContactContentEditViewController *)self nameEditingGroups];
    uint64_t v7 = [v6 firstObject];
    BOOL v8 = v5 == v7;
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v5 = [(CNContactContentEditViewController *)self _cardGroupAtTableViewSectionIndex:a4 forTableView:a3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([(CNContactContentEditViewController *)self nameEditingGroups],
        int64_t v6 = objc_claimAutoreleasedReturnValue(),
        [v6 lastObject],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v5 == v7))
  {
    BOOL v8 = &stru_1ED8AC728;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5 = [(CNContactContentEditViewController *)self _cardGroupAtTableViewSectionIndex:a4 forTableView:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v6 = [v5 title];
  }
  else
  {
    uint64_t v7 = [(CNContactContentEditViewController *)self cardEditingDeleteContactGroup];
    if (v5 == v7)
    {
      BOOL v8 = [(CNContactContentEditViewController *)self ignoreContactAction];

      if (v8) {
        int64_t v6 = &stru_1ED8AC728;
      }
      else {
        int64_t v6 = 0;
      }
    }
    else
    {

      int64_t v6 = 0;
    }
  }

  return v6;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4) {
    goto LABEL_3;
  }
  uint64_t v7 = *MEMORY[0x1E4F5A298];
  BOOL v8 = [(CNContactContentEditViewController *)self contactViewConfiguration];
  BOOL v9 = [v8 warningMessage];
  LOBYTE(v7) = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v9);

  if (v7)
  {
LABEL_3:
    id v10 = 0;
  }
  else
  {
    double v12 = (objc_class *)objc_opt_class();
    double v13 = NSStringFromClass(v12);
    id v10 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:v13];

    uint64_t v14 = *MEMORY[0x1E4F5A258];
    double v15 = [(CNContactContentEditViewController *)self mutableContact];
    double v16 = [v15 phoneNumbers];
    objc_msgSend(v10, "setShouldDisplayWarningIcon:", (*(uint64_t (**)(uint64_t, void *))(v14 + 16))(v14, v16));

    double v17 = [v10 warningText];
    double v18 = [(CNContactContentEditViewController *)self contactViewConfiguration];
    double v19 = [v18 warningMessage];
    char v20 = [v17 isEqual:v19];

    if ((v20 & 1) == 0)
    {
      double v21 = [(CNContactContentEditViewController *)self contactViewConfiguration];
      double v22 = [v21 warningMessage];
      [v10 setWarningText:v22];
    }
  }

  return v10;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v5 = [(CNContactContentEditViewController *)self _cardGroupAtTableViewSectionIndex:a4 forTableView:a3];
  id v6 = [(CNContactContentEditViewController *)self editingGroups];
  uint64_t v7 = [v6 lastObject];

  if (v5 == v7) {
    double v8 = 35.0;
  }
  else {
    double v8 = 0.0;
  }

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = [(CNContactContentEditViewController *)self _cardGroupAtTableViewSectionIndex:a4 forTableView:a3];
  uint64_t v7 = [v6 title];

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v7)
  {
    BOOL v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [v9 _scaledValueForValue:44.0];
    double v11 = v10 + 15.0;
  }
  else if ((isKindOfClass & 1) != 0 {
         && ([(CNContactContentEditViewController *)self nameEditingGroups],
  }
             double v12 = objc_claimAutoreleasedReturnValue(),
             int v13 = [v12 containsObject:v6],
             v12,
             v13))
  {
    double v11 = 0.0;
    if (!a4)
    {
      uint64_t v14 = *MEMORY[0x1E4F5A298];
      double v15 = [(CNContactContentEditViewController *)self contactViewConfiguration];
      double v16 = [v15 warningMessage];
      LODWORD(v14) = (*(uint64_t (**)(uint64_t, void *))(v14 + 16))(v14, v16);

      if (v14) {
        double v11 = 0.0;
      }
      else {
        double v11 = *MEMORY[0x1E4FB2F28];
      }
    }
  }
  else
  {
    double v11 = 44.0;
  }

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  uint64_t v7 = [v14 cellForRowAtIndexPath:v6];
  if ([(CNContactContentEditViewController *)self _indexPathIsActionItem:v6 forTableView:v14])
  {
    double v8 = [(CNContactContentEditViewController *)self _itemAtIndexPath:v6 forTableView:v14];
    BOOL v9 = [v8 actions];
    double v10 = [v9 objectAtIndexedSubscript:0];

    [v10 performActionWithSender:v7];
    double v11 = [v14 indexPathForSelectedRow];
    [v14 deselectRowAtIndexPath:v11 animated:1];
  }
  else if (objc_opt_respondsToSelector())
  {
    if ([v7 isMemberOfClass:objc_opt_class()])
    {
      [v14 deselectRowAtIndexPath:v6 animated:1];
      [(CNContactContentEditViewController *)self addEditingItemAtIndexPath:v6 forTableView:v14];
    }
    else
    {
      if (([v7 shouldPerformDefaultAction] & 1) != 0
        || ([(CNContactContentEditViewController *)self contactViewConfiguration],
            double v12 = objc_claimAutoreleasedReturnValue(),
            int v13 = [v12 allowsPropertyActions],
            v12,
            v13))
      {
        [v7 performDefaultAction];
      }
      [v14 deselectRowAtIndexPath:v6 animated:1];
    }
  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v4 = [a3 cellForRowAtIndexPath:a4];
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

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  id v10 = v8;
  if (objc_opt_isKindOfClass()) {
    double v11 = v10;
  }
  else {
    double v11 = 0;
  }
  id v12 = v11;

  objc_opt_class();
  int v13 = -[CNContactContentEditViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", [v9 section], v19);
  if (objc_opt_isKindOfClass()) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;

  if (v12)
  {
    uint64_t v16 = [v9 row];
    uint64_t v17 = objc_msgSend(v19, "numberOfRowsInSection:", objc_msgSend(v9, "section"));
    if (v15 && v16 < v17 - 1)
    {
      [v12 setShowSeparator:1];
    }
    else
    {
      double v18 = [(CNContactContentEditViewController *)self environment];
      objc_msgSend(v12, "setShowSeparator:", objc_msgSend(v18, "runningInContactsAppOniPad"));
    }
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  [a3 rowHeight];
  return result;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  [a3 estimatedRowHeight];
  return result;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v15 = a3;
  id v8 = a5;
  id v9 = -[CNContactContentEditViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", [v8 section], v15);
  id v10 = [v9 editingItems];
  double v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));

  if (a4 == 2)
  {
    id v12 = [v15 cellForRowAtIndexPath:v8];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v13 = [(CNContactContentEditViewController *)self addLinkedCardAction];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_12;
      }
      int v13 = [(CNContactContentEditViewController *)self addStaticIdentityAction];
    }
    id v14 = v13;
    if (v13)
    {
      [v13 performActionWithSender:v12];

      goto LABEL_13;
    }
LABEL_12:
    [(CNContactContentEditViewController *)self addEditingItemAtIndexPath:v8 forTableView:v15];
    goto LABEL_13;
  }
  if (a4 != 1) {
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [(CNContactContentEditViewController *)self removeEditingItem:v11 atIndexPath:v8 forTableView:v15];
    goto LABEL_14;
  }
  id v12 = [v11 contact];
  [(CNContactContentEditViewController *)self removeLinkedContact:v12];
LABEL_13:

LABEL_14:
  [(CNContactContentEditViewController *)self updateDoneButton];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(CNContactContentEditViewController *)self _indexPathIsActionItem:v8 forTableView:v7])
  {
    id v9 = [(CNContactContentEditViewController *)self _cellForIndexPath:v8 forTableView:v7];
  }
  else
  {
    id v10 = -[CNContactContentEditViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", [v8 section], v7);
    if ([(CNContactContentEditViewController *)self isStandardGroup:v10])
    {
      id v9 = [(CNContactContentEditViewController *)self _cellForIndexPath:v8 forTableView:v7];
    }
    else
    {
      id v9 = 0;
    }
  }
  [(CNContactContentEditViewController *)self _updateLabelWidthForCell:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(CNContactContentEditViewController *)self prepareCell:v9];
  }
  if (!v9)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"CNContactContentEditViewController.m" lineNumber:1889 description:@"We have no cell to return!"];
  }

  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(CNContactContentEditViewController *)self _cardGroupAtTableViewSectionIndex:a4 forTableView:a3];
  if ([(CNContactContentEditViewController *)self isStandardGroup:v5]) {
    [v5 editingItems];
  }
  else {
  id v6 = [v5 actionItems];
  }
  int64_t v7 = [v6 count];

  return v7;
}

- (BOOL)isStandardGroup:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
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
  id v3 = [(CNContactContentEditViewController *)self _currentGroupsForTableView:a3];
  int64_t v4 = [v3 count];

  return v4;
}

- (void)didChangeToShowTitle:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNContactContentEditViewController *)self contactViewConfiguration];
  [v5 setLayoutPositionallyAfterNavBar:v3];

  id v7 = [(CNContactContentEditViewController *)self contactHeaderView];
  id v6 = [(CNContactContentEditViewController *)self contactViewConfiguration];
  objc_msgSend(v7, "updateForShowingNavBar:", objc_msgSend(v6, "layoutPositionallyAfterNavBar"));
}

- (void)editCancel
{
}

- (void)didChangeToEditMode:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CNContactContentEditViewController *)self isEditing] != a3)
  {
    [(CNContactContentEditViewController *)self setEditing:v3 animated:0];
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)updateEditPhotoButtonIfNeeded
{
  if ([(CNContactContentEditViewController *)self isHeaderViewPhotoProhibited])
  {
    BOOL v3 = 0;
  }
  else
  {
    int64_t v4 = [(CNContactContentEditViewController *)self view];
    id v5 = [(CNContactContentEditViewController *)self traitCollection];
    BOOL v3 = +[CNVisualIdentityPickerViewController canShowPhotoPickerForView:v4 withTraitCollection:v5];
  }
  id v6 = [(CNContactContentEditViewController *)self contactHeaderView];
  int v7 = [v6 allowsEditPhoto];

  if (v3 != v7)
  {
    id v8 = [(CNContactContentEditViewController *)self contactHeaderView];
    [v8 setAllowsEditPhoto:v3 preservingChanges:1];
  }
}

- (CGSize)setupTableHeaderView
{
  if ([(CNContactContentEditViewController *)self shouldDisplayAvatarHeaderView]
    || ([(CNContactContentEditViewController *)self contactView],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        [v3 customHeaderView],
        int64_t v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v4))
  {
    id v6 = 0;
  }
  else
  {
    id v5 = [(CNContactContentEditViewController *)self contactView];
    id v6 = [v5 customHeaderView];
  }
  int v7 = [(CNContactContentEditViewController *)self contactView];
  id v8 = [v7 tableHeaderView];
  char v9 = [v8 needsUpdateConstraints];

  if (v6)
  {
    [v6 frame];
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v11 = *MEMORY[0x1E4F1DB30];
    double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  id v14 = [(CNContactContentEditViewController *)self contactView];
  [v14 setTableHeaderView:v6];

  if ((v9 & 1) == 0)
  {
    id v15 = [(CNContactContentEditViewController *)self contactView];
    uint64_t v16 = [v15 tableHeaderView];
    int v17 = [v16 needsUpdateConstraints];

    if (v17)
    {
      double v18 = [(CNContactContentEditViewController *)self contactView];
      id v19 = [v18 tableHeaderView];
      [v19 updateConstraints];
    }
  }

  double v20 = v11;
  double v21 = v13;
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)CNContactContentEditViewController;
  [(CNContactContentEditViewController *)&v13 viewDidLayoutSubviews];
  [(CNContactContentEditViewController *)self _updateCachedLabelWidthsIfNeeded];
  [(CNContactContentEditViewController *)self setupTableHeaderView];
  double v4 = v3;
  double v6 = v5;
  [(CNContactContentEditViewController *)self initializeTableViewsForHeaderHeight];
  int v7 = [(CNContactContentEditViewController *)self contactView];
  id v8 = [v7 tableHeaderView];

  if (v8)
  {
    [v8 frame];
    if (v4 != v10 || v6 != v9)
    {
      double v12 = [(CNContactContentEditViewController *)self contactView];
      [v12 setTableHeaderView:v8];
    }
  }
  [(CNContactContentEditViewController *)self focusOnFirstEditingItemIfNeeded];
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CNContactContentEditViewController;
  [(CNContactContentEditViewController *)&v4 viewWillLayoutSubviews];
  double v3 = [(CNContactContentEditViewController *)self contactHeaderView];
  [v3 calculateLabelSizesIfNeeded];

  [(CNContactContentEditViewController *)self updateEditPhotoButtonIfNeeded];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNContactContentEditViewController;
  [(CNContactContentEditViewController *)&v5 viewWillDisappear:a3];
  objc_super v4 = [(CNContactContentEditViewController *)self siriContextProvider];
  [v4 setEnabled:0];

  [(CNContactContentEditViewController *)self updateWindowTitleForAppearing:0];
}

- (void)prepareContactDidAppearForPPT
{
  if ([(CNContactContentEditViewController *)self runningPPT])
  {
    id v2 = (void *)*MEMORY[0x1E4FB2608];
    [v2 installCACommitCompletionBlock:&__block_literal_global_376];
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v13.receiver = self;
  v13.super_class = (Class)CNContactContentEditViewController;
  [(CNContactContentEditViewController *)&v13 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if (![(CNContactContentEditViewController *)self isOutOfProcess])
  {
    p_peripheryInsets = &self->_peripheryInsets;
    double v6 = [(CNContactContentEditViewController *)self view];
    int v7 = [v6 window];
    id v8 = [v7 screen];
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
  v4.super_class = (Class)CNContactContentEditViewController;
  [(CNContactContentEditViewController *)&v4 viewDidAppear:a3];
  if (self->_needsRefetch)
  {
    [(CNContactContentEditViewController *)self _refetchContact];
    self->_needsRefetch = 0;
  }
  [(CNContactContentEditViewController *)self becomeFirstResponder];
  [(CNContactContentEditViewController *)self updateWindowTitleForAppearing:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CNContactContentEditViewController *)self forcesTransparentBackground])
  {
    uint64_t v5 = +[CNUIColorRepository transparentBackgroundColor];
  }
  else
  {
    if (![(UIViewController *)self ab_shouldUseTransparentBackgroundInPopovers])goto LABEL_6; {
    uint64_t v5 = +[CNUIColorRepository popoverBackgroundColor];
    }
  }
  double v6 = (void *)v5;
  int v7 = [(CNContactContentEditViewController *)self contactView];
  [v7 setBackgroundColor:v6];

LABEL_6:
  v15.receiver = self;
  v15.super_class = (Class)CNContactContentEditViewController;
  [(CNContactContentEditViewController *)&v15 viewWillAppear:v3];
  id v8 = +[CNContactStyle currentStyle];
  CGFloat v9 = [v8 backgroundColor];

  if (v9)
  {
    CGFloat v10 = +[CNContactStyle currentStyle];
    CGFloat v11 = [v10 backgroundColor];
    CGFloat v12 = [(CNContactContentEditViewController *)self view];
    [v12 setBackgroundColor:v11];
  }
  objc_super v13 = [(CNContactContentEditViewController *)self contactView];
  objc_msgSend(v13, "_cnui_applyContactStyle");

  if (![(CNContactContentEditViewController *)self reloadDataIfNeeded]) {
    [(CNContactContentEditViewController *)self _setNeedsUpdateCachedLabelWidths];
  }
  [(CNContactContentEditViewController *)self updateEditNavigationItemsAnimated:0];
  id v14 = [(CNContactContentEditViewController *)self siriContextProvider];
  [v14 setEnabled:1];

  [(id)*MEMORY[0x1E4FB2608] setNetworkActivityIndicatorVisible:0];
}

- (void)updateViewConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)CNContactContentEditViewController;
  [(CNContactContentEditViewController *)&v3 updateViewConstraints];
  [(CNContactContentEditViewController *)self setupConstraints];
}

- (void)setupConstraints
{
  BOOL v3 = [(CNContactContentEditViewController *)self shouldDisplayAvatarHeaderView];
  [(CNContactContentEditViewController *)self setupViewHierarchyIncludingAvatarHeader:v3];
  [(CNContactContentEditViewController *)self setupTableHeaderView];
  objc_super v4 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v5 = [(CNContactContentEditViewController *)self activatedConstraints];
  [v4 deactivateConstraints:v5];

  id v73 = [MEMORY[0x1E4F1CA48] array];
  if (v3)
  {
    double v6 = (void *)MEMORY[0x1E4F28DC8];
    int v7 = [(CNContactContentEditViewController *)self contactHeaderView];
    id v8 = [(CNContactContentEditViewController *)self contactHeaderView];
    [v8 maxHeight];
    CGFloat v10 = [v6 constraintWithItem:v7 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v9];
    [(CNContactContentEditViewController *)self setHeaderHeightConstraint:v10];

    CGFloat v11 = [(CNContactContentEditViewController *)self headerHeightConstraint];
    [v73 addObject:v11];

    CGFloat v12 = [(CNContactContentEditViewController *)self contactHeaderView];
    objc_super v13 = [v12 topAnchor];
    id v14 = [(CNContactContentEditViewController *)self view];
    objc_super v15 = [v14 topAnchor];
    uint64_t v16 = [v13 constraintEqualToAnchor:v15];
    [v73 addObject:v16];

    int v17 = [(CNContactContentEditViewController *)self contactHeaderView];
    double v18 = [v17 leftAnchor];
    id v19 = [(CNContactContentEditViewController *)self view];
    double v20 = [v19 leftAnchor];
    double v21 = [v18 constraintEqualToAnchor:v20];
    [v73 addObject:v21];

    double v22 = [(CNContactContentEditViewController *)self contactHeaderView];
    double v23 = [v22 rightAnchor];
    double v24 = [(CNContactContentEditViewController *)self view];
    double v25 = [v24 rightAnchor];
    double v26 = [v23 constraintEqualToAnchor:v25];
    [v73 addObject:v26];

    double v27 = [(CNContactContentEditViewController *)self contactView];
    double v28 = [v27 topAnchor];
    long long v29 = [(CNContactContentEditViewController *)self view];
    id v30 = [v29 topAnchor];
    uint64_t v31 = [v28 constraintEqualToAnchor:v30];
    [v73 addObject:v31];

    uint64_t v32 = [(CNContactContentEditViewController *)self contactView];
    uint64_t v33 = [v32 bottomAnchor];
    uint64_t v34 = [(CNContactContentEditViewController *)self view];
    uint64_t v35 = [v34 bottomAnchor];
    id v36 = [v33 constraintEqualToAnchor:v35];
    [v73 addObject:v36];

    id v37 = [(CNContactContentEditViewController *)self headerDropShadowView];
    CGRect v38 = [v37 superview];

    if (v38)
    {
      int v39 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v39 scale];
      double v41 = v40;

      id v42 = [(CNContactContentEditViewController *)self headerDropShadowView];
      id v43 = [v42 heightAnchor];
      id v44 = [v43 constraintEqualToConstant:1.0 / v41];
      [v73 addObject:v44];

      id v45 = [(CNContactContentEditViewController *)self headerDropShadowView];
      long long v46 = [v45 bottomAnchor];
      long long v47 = [(CNContactContentEditViewController *)self headerDropShadowView];
      long long v48 = [v47 superview];
      long long v49 = [v48 bottomAnchor];
      long long v50 = [v46 constraintEqualToAnchor:v49];
      [v73 addObject:v50];

      long long v51 = [(CNContactContentEditViewController *)self headerDropShadowView];
      long long v52 = [v51 leftAnchor];
      long long v53 = [(CNContactContentEditViewController *)self headerDropShadowView];
      double v54 = [v53 superview];
      id v55 = [v54 leftAnchor];
      v56 = [v52 constraintEqualToAnchor:v55];
      [v73 addObject:v56];

      v57 = [(CNContactContentEditViewController *)self headerDropShadowView];
      uint64_t v58 = [v57 rightAnchor];
      v59 = [(CNContactContentEditViewController *)self headerDropShadowView];
      v60 = [v59 superview];
      v61 = [v60 rightAnchor];
      v62 = [v58 constraintEqualToAnchor:v61];
      [v73 addObject:v62];
    }
  }
  v63 = [(CNContactContentEditViewController *)self contactView];
  v64 = [v63 leftAnchor];
  v65 = [(CNContactContentEditViewController *)self view];
  v66 = [v65 leftAnchor];
  v67 = [v64 constraintEqualToAnchor:v66];
  [v73 addObject:v67];

  v68 = [(CNContactContentEditViewController *)self contactView];
  v69 = [v68 rightAnchor];
  v70 = [(CNContactContentEditViewController *)self view];
  v71 = [v70 rightAnchor];
  v72 = [v69 constraintEqualToAnchor:v71];
  [v73 addObject:v72];

  [(CNContactContentEditViewController *)self setActivatedConstraints:v73];
  [MEMORY[0x1E4F28DC8] activateConstraints:v73];
}

- (BOOL)shouldDisplayAvatarHeaderView
{
  id v2 = [(CNContactContentEditViewController *)self contactHeaderView];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)CNContactContentEditViewController;
  [(CNContactContentEditViewController *)&v11 viewDidLoad];
  [(CNContactContentEditViewController *)self setEditing:1];
  uint64_t v3 = *MEMORY[0x1E4F5A298];
  objc_super v4 = [(CNContactContentEditViewController *)self initialPrompt];
  LOBYTE(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  if ((v3 & 1) == 0)
  {
    uint64_t v5 = [(CNContactContentEditViewController *)self initialPrompt];
    double v6 = [(CNContactContentEditViewController *)self navigationItem];
    [v6 setPrompt:v5];
  }
  if ([(CNContactContentEditViewController *)self shouldDrawNavigationBar])
  {
    int v7 = [(CNContactContentEditViewController *)self navigationItem];
    [v7 _setBackgroundHidden:0];
  }
  id v8 = [(CNContactContentEditViewController *)self navItemUpdater];

  if (!v8)
  {
    double v9 = objc_alloc_init(CNContactContentNavigationItemUpdater);
    [(CNContactContentEditViewController *)self setNavItemUpdater:v9];
  }
  [(CNContactContentEditViewController *)self reloadDataIfNeeded];
  CGFloat v10 = [(CNContactContentEditViewController *)self view];
  [v10 setNeedsUpdateConstraints];
}

- (void)setupViewHierarchyIncludingAvatarHeader:(BOOL)a3
{
  BOOL v3 = a3;
  v31[1] = *MEMORY[0x1E4F143B8];
  if ([(CNContactContentEditViewController *)self isViewLoaded])
  {
    uint64_t v5 = [(CNContactContentEditViewController *)self view];
    double v6 = [MEMORY[0x1E4F1CA48] array];
    int v7 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v8 = [(CNContactContentEditViewController *)self contactHeaderView];
    double v9 = (void *)v8;
    if (v3)
    {
      v31[0] = v8;
      CGFloat v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
      objc_super v11 = v7;
    }
    else
    {
      uint64_t v30 = v8;
      CGFloat v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
      objc_super v11 = v6;
    }
    [v11 addObjectsFromArray:v10];

    CGFloat v12 = [(CNContactContentEditViewController *)self contactHeaderView];
    objc_super v13 = [(CNContactContentEditViewController *)self headerDropShadowView];
    [v12 addSubview:v13];

    id v14 = [(CNContactContentEditViewController *)self contactView];
    [v7 addObject:v14];

    objc_super v15 = [(CNContactContentEditViewController *)self contactView];
    uint64_t v16 = [(CNContactContentEditViewController *)self contactView];
    int v17 = [v16 panGestureRecognizer];
    double v18 = [v17 view];

    if (v15 != v18)
    {
      id v19 = [(CNContactContentEditViewController *)self contactView];
      double v20 = [v19 panGestureRecognizer];
      double v21 = [v20 view];
      double v22 = [(CNContactContentEditViewController *)self contactView];
      double v23 = [v22 panGestureRecognizer];
      [v21 removeGestureRecognizer:v23];

      double v24 = [(CNContactContentEditViewController *)self view];
      double v25 = [(CNContactContentEditViewController *)self contactView];
      double v26 = [v25 panGestureRecognizer];
      [v24 addGestureRecognizer:v26];
    }
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __78__CNContactContentEditViewController_setupViewHierarchyIncludingAvatarHeader___block_invoke;
    v28[3] = &unk_1E549B5B8;
    id v29 = v5;
    id v27 = v5;
    [v7 enumerateObjectsUsingBlock:v28];
  }
}

uint64_t __78__CNContactContentEditViewController_setupViewHierarchyIncludingAvatarHeader___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) insertSubview:a2 atIndex:0];
}

- (void)loadContactViewControllerViews
{
  BOOL v3 = [(CNContactContentEditViewController *)self contactView];
  objc_super v4 = [(CNContactContentEditViewController *)self contactView];
  uint64_t v5 = objc_opt_class();
  double v6 = [v5 cellIdentifierForClass:objc_opt_class()];
  int v7 = [v3 dequeueReusableCellWithIdentifier:v6];
  [(CNContactContentEditViewController *)self setNoteCell:v7];

  id v9 = [(CNContactContentEditViewController *)self view];
  uint64_t v8 = [(CNContactContentEditViewController *)self contactView];
  [v9 addSubview:v8];
}

- (void)loadView
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(CNContactContentEditViewController *)self setView:v3];

  [(CNContactContentEditViewController *)self loadContactViewControllerViews];
}

- (void)finishEditing:(id)a3
{
  id v4 = a3;
  int v5 = [(CNContactContentEditViewController *)self isEditing];
  [(CNContactContentEditViewController *)self cancelAsyncLookups];
  double v6 = [(CNContactContentEditViewController *)self contactView];
  [v6 endEditing:1];

  if (v5)
  {
    if (![(CNContactContentEditViewController *)self _modelHasChanges])
    {
      [(CNContactContentEditViewController *)self editCancel:v4];
      goto LABEL_10;
    }
    int v7 = CNUILogContactCard();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CGFloat v10 = 0;
      _os_log_impl(&dword_18B625000, v7, OS_LOG_TYPE_DEFAULT, "[CNContactContentViewController] Done editing, will save changes", v10, 2u);
    }

    if ([(CNContactContentEditViewController *)self saveChanges])
    {
      uint64_t v8 = [(CNContactContentEditViewController *)self mutableContact];
      [(CNContactContentEditViewController *)self _didCompleteWithContact:v8];
    }
    else
    {
      [(CNContactContentEditViewController *)self _didCompleteWithContact:0];
    }
  }
  [(CNContactContentEditViewController *)self reloadDataPreservingChanges:0];
  id v9 = [(CNContactContentEditViewController *)self contactView];
  [v9 reloadData];

LABEL_10:
  if (([(CNContactContentEditViewController *)self supportsDrafts] & v5) == 1) {
    +[CNUIDraftSupport deleteDrafts];
  }
}

- (void)finishEditing
{
}

- (void)toggleEditing
{
}

- (void)updateContact:(id)a3
{
  if ([(CNContactContentEditViewController *)self saveChanges])
  {
    id v4 = [(CNContactContentEditViewController *)self mutableContact];
    [(CNContactContentEditViewController *)self _didCompleteWithContact:v4];
  }
  else
  {
    [(CNContactContentEditViewController *)self _didCompleteWithContact:0];
  }

  [(CNContactContentEditViewController *)self reloadDataPreservingChanges:0];
}

- (id)saveDescriptionForCurrentState
{
  uint64_t v16 = [CNUIContactSaveConfiguration alloc];
  objc_super v15 = [(CNContactContentEditViewController *)self contact];
  id v3 = [(CNContactContentEditViewController *)self mutableContact];
  id v4 = [(CNContactContentEditViewController *)self shadowCopyOfReadonlyContact];
  int v5 = [(CNContactContentEditViewController *)self editingLinkedContacts];
  double v6 = [(CNContactContentEditViewController *)self contactViewConfiguration];
  int v7 = [v6 contactStore];
  uint64_t v8 = [(CNContactContentEditViewController *)self parentGroup];
  id v9 = [(CNContactContentEditViewController *)self parentContainer];
  CGFloat v10 = [(CNContactContentEditViewController *)self containerContext];
  objc_super v11 = [(CNContactContentEditViewController *)self contactViewConfiguration];
  BYTE1(v14) = 1;
  LOBYTE(v14) = [v11 ignoresParentalRestrictions];
  CGFloat v12 = -[CNUIContactSaveConfiguration initWithContact:mutableContact:shadowCopyOfReadonlyContact:editingLinkedContacts:contactStore:parentGroup:parentContainer:containerContext:groupContext:ignoresParentalRestrictions:saveWasAuthorized:](v16, "initWithContact:mutableContact:shadowCopyOfReadonlyContact:editingLinkedContacts:contactStore:parentGroup:parentContainer:containerContext:groupContext:ignoresParentalRestrictions:saveWasAuthorized:", v15, v3, v4, v5, v7, v8, v9, v10, 0, v14);

  return v12;
}

- (BOOL)performSave
{
  id v3 = [(CNContactContentEditViewController *)self saveContactExecutor];
  id v4 = [(CNContactContentEditViewController *)self saveDescriptionForCurrentState];
  int v5 = [v3 executeSaveWithConfiguration:v4 saveDelegate:self];

  double v6 = [MEMORY[0x1E4F1CA48] array];
  [(CNContactContentEditViewController *)self setIssuedSaveRequestIdentifiers:v6];

  if ([v5 success])
  {
    [(CNContactContentEditViewController *)self setShadowCopyOfReadonlyContact:0];
    int v7 = _LargeDatabasesSignpostLogQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__CNContactContentEditViewController_performSave__block_invoke;
    block[3] = &unk_1E549B488;
    id v14 = v5;
    dispatch_async(v7, block);
  }
  uint64_t v8 = [(CNContactContentEditViewController *)self issuedSaveRequestIdentifiers];
  id v9 = [v5 identifiersOfIssuedSaveRequests];
  [v8 addObjectsFromArray:v9];

  [(CNContactContentEditViewController *)self setEditingLinkedContacts:0];
  CGFloat v10 = [v5 contact];
  [(CNContactContentEditViewController *)self setContact:v10];

  char v11 = [v5 success];
  return v11;
}

void __49__CNContactContentEditViewController_performSave__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) contact];
  +[CNContactContentEditViewController _telemetryForContact:v1];
}

- (void)saveModelChangesToContact
{
  id v3 = [(CNContactContentEditViewController *)self editingGroups];
  [(CNContactContentEditViewController *)self _saveChangesForGroups:v3];

  id v4 = [(CNContactContentEditViewController *)self contactHeaderView];
  [v4 saveContactPhoto];
}

- (BOOL)saveChanges
{
  if (self->_saving) {
    return 0;
  }
  self->_saving = 1;
  [(CNContactContentEditViewController *)self saveModelChangesToContact];
  id v4 = CNUILogContactCard();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_18B625000, v4, OS_LOG_TYPE_DEFAULT, "[CNContactContentEditViewController] performing save…", v5, 2u);
  }

  BOOL result = [(CNContactContentEditViewController *)self performSave];
  self->_saving = 0;
  return result;
}

- (void)clearMapsDataIfEdited
{
  if ([(CNContactContentEditViewController *)self _modelHasChanges])
  {
    id v3 = [(CNContactContentEditViewController *)self mutableContact];
    [v3 setMapsData:0];
  }
}

- (void)presentConfirmCancelAlertController
{
  id v3 = [(CNContactContentEditViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CNContactContentEditViewController *)self delegate];
    [v5 contactEditViewControllerRequestsCancelConfirmationAlert:self];
  }
}

- (void)editCancel:(id)a3
{
  if ([(CNContactContentEditViewController *)self hasPendingChanges])
  {
    char v4 = [(CNContactContentEditViewController *)self contactView];
    [v4 endEditing:1];

    [(CNContactContentEditViewController *)self presentConfirmCancelAlertController];
  }
  else
  {
    [(CNContactContentEditViewController *)self performConfirmedCancel];
  }
}

- (void)cancelAsyncLookups
{
  id v3 = [(CNContactContentEditViewController *)self medicalIDLookupToken];
  [v3 cancel];

  [(CNContactContentEditViewController *)self setMedicalIDLookupToken:0];
}

- (BOOL)hasPendingChanges
{
  if ([(CNContactContentEditViewController *)self _modelIsEmpty]) {
    return 0;
  }

  return [(CNContactContentEditViewController *)self _modelHasChanges];
}

- (void)updateDoneButton
{
  id v8 = [(CNContactContentEditViewController *)self navigationItemController];
  id v3 = [(CNContactContentEditViewController *)self navItemUpdater];
  char v4 = objc_msgSend(v3, "updateEditDoneButtonForController:isUpdatingContact:hasChanges:", v8, -[CNContactContentEditViewController mode](self, "mode") == 4, -[CNContactContentEditViewController hasPendingChanges](self, "hasPendingChanges"));

  -[CNContactContentEditViewController setSaveKeyboardShortcutEnabled:](self, "setSaveKeyboardShortcutEnabled:", [v4 enableSaveShortcut]);
  id v5 = [(CNContactContentEditViewController *)self navigationItemDelegate];
  double v6 = [v8 navigationItem];
  int v7 = [(CNContactContentEditViewController *)self doneButtonItem];
  [v5 contactNavigationItemProvider:self didUpdateNavigationItem:v6 doneButtonItem:v7];
}

- (void)updateWindowTitleForAppearing:(BOOL)a3
{
  if (a3)
  {
    id v10 = [(CNContactContentEditViewController *)self title];
    if (!v10)
    {
      char v4 = [(CNContactContentEditViewController *)self navigationController];
      id v10 = [v4 title];

      if (!v10)
      {
        id v5 = [(CNContactContentEditViewController *)self contactFormatter];
        double v6 = [(CNContactContentEditViewController *)self contact];
        id v10 = [v5 stringFromContact:v6];
      }
    }
    int v7 = [(CNContactContentEditViewController *)self view];
    id v8 = [v7 window];
    id v9 = [v8 windowScene];
    [v9 setTitle:v10];
  }
  else
  {
    id v10 = [(CNContactContentEditViewController *)self view];
    int v7 = [v10 window];
    id v8 = [v7 windowScene];
    [v8 setTitle:0];
  }
}

- (void)updateEditNavigationItemsAnimated:(BOOL)a3
{
  id v21 = [(CNContactContentEditViewController *)self navigationItemController];
  double v6 = [(CNContactContentEditViewController *)self navItemUpdater];
  BOOL v7 = [(UIViewController *)self ab_isInSheet];
  BOOL v8 = [(CNContactContentEditViewController *)self shouldDrawNavigationBar];
  BOOL v9 = [(CNContactContentEditViewController *)self mode] == 4;
  BYTE1(v20) = a3;
  LOBYTE(v20) = [(CNContactContentEditViewController *)self hasPendingChanges];
  id v10 = objc_msgSend(v6, "updateEditingNavigationItemForController:actionTarget:isInSheet:isShowingNavBar:shouldUsePlatterStyle:isUpdatingContact:hasChanges:animated:", v21, self, v7, v8, 0, v9, v20);

  -[CNContactContentEditViewController setCancelKeyboardShortcutEnabled:](self, "setCancelKeyboardShortcutEnabled:", [v10 enableCancelShortcut]);
  -[CNContactContentEditViewController setSaveKeyboardShortcutEnabled:](self, "setSaveKeyboardShortcutEnabled:", [v10 enableSaveShortcut]);
  char v11 = [v21 navigationItem];
  CGFloat v12 = [(CNContactContentEditViewController *)self navigationItemDelegate];
  objc_super v13 = [(CNContactContentEditViewController *)self doneButtonItem];
  [v12 contactNavigationItemProvider:self didUpdateNavigationItem:v11 doneButtonItem:v13];

  id v14 = [(CNContactContentEditViewController *)self contactViewConfiguration];
  char v15 = [v14 layoutPositionallyAfterNavBar];
  if (v15)
  {
    int v16 = 0;
    uint64_t v17 = 1;
  }
  else
  {
    uint64_t v18 = [v11 title];
    if (v18)
    {
      BOOL v9 = v18;
      int v16 = 0;
      uint64_t v17 = 1;
    }
    else
    {
      id v3 = [v11 titleView];
      BOOL v9 = 0;
      if (v3)
      {
        int v16 = 1;
        uint64_t v17 = 1;
      }
      else
      {
        uint64_t v17 = [v11 _backgroundHidden] ^ 1;
        int v16 = 1;
      }
    }
  }
  id v19 = [(CNContactContentEditViewController *)self contactHeaderView];
  [v19 setShouldShowBelowNavigationTitle:v17];

  if (v16) {
  if ((v15 & 1) == 0)
  }
}

- (UINavigationItem)effectiveNavigationItem
{
  id v2 = [(CNContactContentEditViewController *)self navigationItemController];
  id v3 = [v2 navigationItem];

  return (UINavigationItem *)v3;
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  if (a3 == 4)
  {
    id v5 = [(CNContactContentEditViewController *)self contactView];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)_policyForContact:(id)a3 mode:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = [(CNContactContentEditViewController *)self contactViewConfiguration];
  if ([v7 allowsAddingToAddressBook])
  {
  }
  else
  {
    char v8 = [v6 hasBeenPersisted];

    if ((v8 & 1) == 0)
    {
LABEL_9:
      CGFloat v12 = [MEMORY[0x1E4F1BA68] sharedPermissivePolicy];
      goto LABEL_10;
    }
  }
  if ((unint64_t)a4 <= 5 && ((1 << a4) & 0x32) != 0)
  {
    BOOL v9 = [(CNContactContentEditViewController *)self contactViewCache];
    id v10 = v9;
    id v11 = v6;
  }
  else
  {
    BOOL v9 = [(CNContactContentEditViewController *)self contactViewCache];
    id v10 = v9;
    id v11 = 0;
  }
  CGFloat v12 = [v9 policyForContact:v11];

  if (!v12) {
    goto LABEL_9;
  }
LABEL_10:

  return v12;
}

- (id)indexPathOfPropertyItem:(id)a3 editing:(BOOL)a4
{
  id v5 = a3;
  id v6 = [v5 group];
  BOOL v7 = [(CNContactContentEditViewController *)self contactView];
  int64_t v8 = [(CNContactContentEditViewController *)self sectionOfGroup:v6 inTableView:v7];
  BOOL v9 = [v6 editingItems];
  uint64_t v10 = [v9 indexOfObject:v5];

  id v11 = 0;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL && v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v11 = [MEMORY[0x1E4F28D58] indexPathForRow:v10 inSection:v8];
  }

  return v11;
}

- (id)indexPathOfEditingPropertyItem:(id)a3
{
  return [(CNContactContentEditViewController *)self indexPathOfPropertyItem:a3 editing:1];
}

- (id)indexPathOfDisplayedPropertyItem:(id)a3
{
  return [(CNContactContentEditViewController *)self indexPathOfPropertyItem:a3 editing:0];
}

- (void)reloadCardGroup:(id)a3 forTableView:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if ([(CNContactContentEditViewController *)self isViewLoaded])
  {
    if (![(CNContactContentEditViewController *)self needsReload])
    {
      int64_t v7 = [(CNContactContentEditViewController *)self sectionOfGroup:v10 inTableView:v6];
      if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      {
        int64_t v8 = v7;
        [v6 beginUpdates];
        BOOL v9 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v8];
        [v6 reloadSections:v9 withRowAnimation:0];

        [v6 endUpdates];
        [(CNContactContentEditViewController *)self updateHeaderHeightToMatchScrollViewState:v6 scrollDirection:2 animated:0];
      }
    }
  }
}

- (void)addCardGroup:(id)a3 afterGroup:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  int64_t v7 = [(CNContactContentEditViewController *)self groupsAfterGroup];
  int64_t v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
    BOOL v9 = [(CNContactContentEditViewController *)self groupsAfterGroup];
    id v10 = [v9 objectForKeyedSubscript:v6];
    [v10 addObject:v11];
  }
  else
  {
    BOOL v9 = [MEMORY[0x1E4F1CA48] arrayWithObject:v11];
    id v10 = [(CNContactContentEditViewController *)self groupsAfterGroup];
    [v10 setObject:v9 forKeyedSubscript:v6];
  }
}

- (int64_t)sectionOfGroup:(id)a3 inTableView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(CNContactContentEditViewController *)self _currentGroupsForTableView:v7];
  BOOL v9 = v8;
  int64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8)
  {
    uint64_t v11 = [v8 indexOfObject:v6];
    if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
      int64_t v10 = [(CNContactContentEditViewController *)self tableViewSectionIndexFromGroupIndex:v11 forTableView:v7];
    }
  }

  return v10;
}

- (id)cardGroupForProperty:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactContentEditViewController *)self propertyGroups];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)reloadDataPreservingChanges:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if ([(CNContactContentEditViewController *)self isViewLoaded])
  {
    self->_needsReload = 0;
    id v5 = [(CNContactContentEditViewController *)self contactStore];

    if (!v5)
    {
      id v6 = [(CNContactContentEditViewController *)self originalContacts];
      id v7 = objc_msgSend(v6, "_cn_filter:", &__block_literal_global_338);

      if ([v7 count]) {
        uint64_t v8 = 7;
      }
      else {
        uint64_t v8 = 1;
      }
      BOOL v9 = [(CNContactContentEditViewController *)self managedConfiguration];

      if (v9)
      {
        id v10 = objc_alloc(MEMORY[0x1E4F1B980]);
        uint64_t v11 = [(CNContactContentEditViewController *)self environment];
        CGFloat v12 = [v11 cnEnvironment];
        objc_super v13 = [(CNContactContentEditViewController *)self managedConfiguration];
        id v14 = (void *)[v10 initWithEnvironment:v12 options:v8 managedConfiguration:v13];
        [(CNContactContentEditViewController *)self setContactStore:v14];
      }
      else
      {
        uint64_t v11 = [MEMORY[0x1E4F1B980] storeWithOptions:v8];
        [(CNContactContentEditViewController *)self setContactStore:v11];
      }
    }
    if (![(CNContactContentEditViewController *)self mode])
    {
      char v15 = [(CNContactContentEditViewController *)self parentViewController];
      objc_getClass("ABNewPersonViewController");
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        [(CNContactContentEditViewController *)self setMode:3];
      }
    }
    if ([MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] != 3)
    {
      uint64_t v17 = CNUILogContactCard();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18B625000, v17, OS_LOG_TYPE_ERROR, "CNContactContentViewController does not have authorization to access contacts.", buf, 2u);
      }
    }
    uint64_t v18 = [(CNContactContentEditViewController *)self shadowCopyOfReadonlyContact];

    if (!v18)
    {
      id v19 = [(CNContactContentEditViewController *)self contact];
      uint64_t v20 = [(CNContactContentEditViewController *)self _policyForContact:v19 mode:[(CNContactContentEditViewController *)self mode]];
      [(CNContactContentEditViewController *)self setPolicy:v20];
    }
    id v21 = [(CNContactContentEditViewController *)self contact];
    int v22 = [v21 isUnified];

    if (v22)
    {
      double v23 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      double v24 = [(CNContactContentEditViewController *)self contact];
      double v25 = [v24 linkedContacts];

      uint64_t v26 = [v25 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v40 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            uint64_t v31 = [(CNContactContentEditViewController *)self _policyForContact:v30 mode:[(CNContactContentEditViewController *)self mode]];
            if (v31)
            {
              uint64_t v32 = [v30 identifier];
              [v23 setObject:v31 forKey:v32];
            }
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v39 objects:v44 count:16];
        }
        while (v27);
      }

      uint64_t v33 = (void *)[v23 copy];
      [(CNContactContentEditViewController *)self setLinkedPoliciesByContactIdentifier:v33];
    }
    if (!self->_propertyGroups)
    {
      uint64_t v34 = [(CNContactContentEditViewController *)self _loadPropertyGroups];
      propertyGroups = self->_propertyGroups;
      self->_propertyGroups = v34;
    }
    [(CNContactContentEditViewController *)self _reloadStaticIdentityGroup];
    [(CNContactContentEditViewController *)self _reloadGeminiGroupPreservingChanges:v3];
    [(CNContactContentEditViewController *)self _reloadLinkedCardsGroup];
    [(CNContactContentEditViewController *)self _reloadPropertyGroupsPreservingChanges:v3];
    [(CNContactContentEditViewController *)self _reloadMedicalIDGroup];
    [(CNContactContentEditViewController *)self _reloadContainerContextPreservingChanges:v3];
    [(CNContactContentEditViewController *)self setupActionsPreservingChanges:v3];
    id v36 = [(CNContactContentEditViewController *)self _loadEditingGroupsPreservingChanges:v3];
    [(CNContactContentEditViewController *)self setEditingGroups:v36];

    [(CNContactContentEditViewController *)self _setNeedsUpdateCachedLabelWidths];
    id v37 = [(CNContactContentEditViewController *)self contactView];
    [v37 reloadData];

    CGRect v38 = [(CNContactContentEditViewController *)self contactHeaderView];
    [v38 reloadDataPreservingChanges:v3];

    [(CNContactContentEditViewController *)self _updateUserActivity];
  }
  else
  {
    self->_needsReload = 1;
  }
}

uint64_t __66__CNContactContentEditViewController_reloadDataPreservingChanges___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSuggested];
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
  v36[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CNContactContentEditViewController *)self contact];
  id v4 = [(CNContactContentEditViewController *)self parentContainer];
  if (v3)
  {
    id v5 = [MEMORY[0x1E4F5A6D8] unifiedMeContactMonitor];
    id v6 = [(CNContactContentEditViewController *)self contact];
    int v7 = [v5 isMeContact:v6];

    uint64_t v8 = CNUILogContactCard();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        id v10 = [v3 identifier];
        *(_DWORD *)buf = 138543362;
        uint64_t v28 = v10;
        _os_log_impl(&dword_18B625000, v8, OS_LOG_TYPE_DEFAULT, "Refetching contact, is it the me card, identifier %{public}@", buf, 0xCu);
      }
      uint64_t v11 = [(CNContactContentEditViewController *)self contactStore];
      CGFloat v12 = [(id)objc_opt_class() descriptorForRequiredKeysForContact:v3];
      v36[0] = v12;
      objc_super v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
      id v26 = 0;
      id v14 = [v11 _crossPlatformUnifiedMeContactWithKeysToFetch:v13 error:&v26];
      id v15 = v26;
    }
    else
    {
      if (v9)
      {
        int v16 = [v3 identifier];
        *(_DWORD *)buf = 138543362;
        uint64_t v28 = v16;
        _os_log_impl(&dword_18B625000, v8, OS_LOG_TYPE_DEFAULT, "Refetching contact, is it not the me card, identifier %{public}@", buf, 0xCu);
      }
      uint64_t v11 = [(CNContactContentEditViewController *)self contactStore];
      CGFloat v12 = [v3 identifier];
      objc_super v13 = [(id)objc_opt_class() descriptorForRequiredKeysForContact:v3];
      uint64_t v35 = v13;
      uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
      id v25 = 0;
      id v14 = [v11 unifiedContactWithIdentifier:v12 keysToFetch:v17 error:&v25];
      id v15 = v25;
    }
    uint64_t v18 = [(CNContactContentEditViewController *)self contactViewCache];
    id v19 = [v18 containerForContact:v14];

    if (v15 || !v14)
    {
      int v22 = CNUILogContactCard();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        double v23 = [v3 identifier];
        double v24 = [(CNContactContentEditViewController *)self contactStore];
        *(_DWORD *)buf = 138413058;
        uint64_t v28 = v23;
        __int16 v29 = 2112;
        id v30 = v15;
        __int16 v31 = 2112;
        uint64_t v32 = v24;
        __int16 v33 = 2112;
        uint64_t v34 = v3;
        _os_log_error_impl(&dword_18B625000, v22, OS_LOG_TYPE_ERROR, "Error refetching contact with identifier %@, %@, store %@, full contact %@", buf, 0x2Au);
      }
    }
    else
    {
      int v20 = [v14 isEqual:v3];
      char v21 = [v19 isEqual:v4];
      if (!v20 || (v21 & 1) == 0) {
        [(CNContactContentEditViewController *)self setContact:v14];
      }
    }
  }
}

- (void)saveNewContactDraft
{
  [(CNContactContentEditViewController *)self saveModelChangesToContact];
  BOOL v3 = [(CNContactContentEditViewController *)self mutableContact];
  +[CNUIDraftSupport saveNewContactDraft:v3];

  [(CNContactContentEditViewController *)self _refetchContact];
}

- (void)contactStoreDidChangeWithNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CNUIContactsEnvironment *)self->_environment defaultSchedulerProvider];
  id v6 = [v5 mainThreadScheduler];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__CNContactContentEditViewController_contactStoreDidChangeWithNotification___block_invoke;
  v8[3] = &unk_1E549BF80;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 performBlock:v8];
}

void __76__CNContactContentEditViewController_contactStoreDidChangeWithNotification___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) shouldIgnoreContactStoreDidChangeNotification]) {
    return;
  }
  id v2 = [*(id *)(a1 + 40) userInfo];
  id v15 = [v2 objectForKey:*MEMORY[0x1E4F1B788]];

  BOOL v3 = [*(id *)(a1 + 40) userInfo];
  id v4 = [v3 objectForKey:*MEMORY[0x1E4F1B790]];

  id v5 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = [*(id *)(a1 + 32) issuedSaveRequestIdentifiers];
  uint64_t v8 = [v6 setWithArray:v7];

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
        objc_super v13 = *(unsigned char **)(a1 + 32);
        if (!v13[979])
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
    *(unsigned char *)(*(void *)(a1 + 32) + 977) = 1;
  }
LABEL_14:
}

- (void)adjustInsetsForKeyboardOverlap:(double)a3
{
  [(CNContactContentEditViewController *)self setKeyboardVerticalOverlap:a3];
  id v4 = [(CNContactContentEditViewController *)self contactView];
  [(CNContactContentEditViewController *)self updateInsetsIfNeededForTableView:v4];
}

- (void)keyboardWillHideNotification:(id)a3
{
}

- (void)keyboardDidShowNotification:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FB2BD8]];
  [v5 CGRectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  id v31 = [(CNContactContentEditViewController *)self view];
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
  v35.origin.x = v24;
  v35.origin.double y = v26;
  v35.size.double width = v28;
  v35.size.double height = v30;
  CGRect v34 = CGRectIntersection(v33, v35);
  [(CNContactContentEditViewController *)self adjustInsetsForKeyboardOverlap:CGRectGetHeight(v34)];
}

- (void)setContact:(id)a3
{
  v103[1] = *MEMORY[0x1E4F143B8];
  id v4 = (CNContact *)a3;
  id v5 = v4;
  self->_needsRefetch = 0;
  if (self->_contact == v4) {
    goto LABEL_46;
  }
  double v6 = [(CNContact *)v4 identifier];
  double v7 = [(CNContact *)self->_contact identifier];
  char v8 = [v6 isEqualToString:v7];

  if ((v8 & 1) == 0) {
    [(CNContactContentEditViewController *)self setDidSetNewContact:1];
  }
  double v9 = [(CNContactContentEditViewController *)self environment];
  double v10 = [v9 defaultSchedulerProvider];

  [v10 suspendBackgroundScheduler];
  double v11 = [v10 afterCACommitScheduler];
  v93[0] = MEMORY[0x1E4F143A8];
  v93[1] = 3221225472;
  v93[2] = __49__CNContactContentEditViewController_setContact___block_invoke;
  v93[3] = &unk_1E549B488;
  id v12 = v10;
  id v94 = v12;
  [v11 performBlock:v93];

  double v13 = [(CNContactContentEditViewController *)self contactViewCache];
  [v13 resetCache];

  LODWORD(v11) = [(CNContactContentEditViewController *)self isOutOfProcess];
  uint64_t v14 = [(id)objc_opt_class() descriptorForRequiredKeys];
  double v15 = (void *)v14;
  if (v11)
  {
    v103[0] = v14;
    double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:1];
    uint64_t v17 = [(CNContactContentEditViewController *)self _updateContact:v5 withMissingKeysFromRequiredKeys:v16];

    id v5 = (void *)v17;
  }
  else
  {
    uint64_t v102 = v14;
    double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v102 count:1];
    [v5 assertKeysAreAvailable:v16];
  }

  uint64_t v18 = [(CNContactContentEditViewController *)self parentContainer];
  if (!v18)
  {
LABEL_10:
    double v19 = [(CNContactContentEditViewController *)self contactViewCache];
    double v23 = [v19 containerForContact:v5];
    [(CNContactContentEditViewController *)self setParentContainer:v23];

    goto LABEL_11;
  }
  double v19 = (void *)v18;
  uint64_t v20 = [(CNContactContentEditViewController *)self parentContainer];
  if (v20)
  {
    double v21 = (void *)v20;
    int v22 = [v5 hasBeenPersisted];

    if (!v22) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
LABEL_11:

LABEL_12:
  [(CNContactContentEditViewController *)self setContainerContext:0];
  CGFloat v24 = [(CNContactContentEditViewController *)self contactViewCache];
  double v25 = [v24 policyForContact:v5];

  if ([v25 isReadonly])
  {
    id v86 = v12;
    CGFloat v26 = [(CNContactContentEditViewController *)self contactStore];
    double v27 = [v5 identifier];
    CGFloat v28 = [(id)objc_opt_class() descriptorForRequiredKeysForContact:v5];
    v101 = v28;
    double v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v101 count:1];
    id v92 = 0;
    CGFloat v30 = [v26 unifiedContactWithIdentifier:v27 keysToFetch:v29 error:&v92];
    id v85 = v92;

    if (v30)
    {
      id v31 = v30;

      uint64_t v32 = [(CNContactContentEditViewController *)self contactViewCache];
      CGRect v33 = [v32 policyForContact:v31];

      if ([v33 isReadonly])
      {
        v83 = v33;
        v84 = v30;
        id v34 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
        CGRect v35 = [v31 availableKeyDescriptor];
        v100 = v35;
        id v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v100 count:1];
        id v37 = (void *)[v34 copyWithPropertyKeys:v36];
        CGRect v38 = (void *)[v37 mutableCopy];
        [(CNContactContentEditViewController *)self setShadowCopyOfReadonlyContact:v38];

        long long v90 = 0u;
        long long v91 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        long long v39 = +[CNContactView nameProperties];
        uint64_t v40 = [v39 countByEnumeratingWithState:&v88 objects:v99 count:16];
        if (v40)
        {
          uint64_t v41 = v40;
          uint64_t v42 = *(void *)v89;
          do
          {
            for (uint64_t i = 0; i != v41; ++i)
            {
              if (*(void *)v89 != v42) {
                objc_enumerationMutation(v39);
              }
              uint64_t v44 = *(void *)(*((void *)&v88 + 1) + 8 * i);
              if ([v31 isKeyAvailable:v44])
              {
                uint64_t v45 = [(CNContactContentEditViewController *)self shadowCopyOfReadonlyContact];
                long long v46 = [v31 valueForKey:v44];
                [v45 setValue:v46 forKey:v44];
              }
            }
            uint64_t v41 = [v39 countByEnumeratingWithState:&v88 objects:v99 count:16];
          }
          while (v41);
        }

        long long v47 = (void *)MEMORY[0x1E4F1CA48];
        long long v48 = [(CNContactContentEditViewController *)self shadowCopyOfReadonlyContact];
        long long v49 = [v47 arrayWithObject:v48];

        id v12 = v86;
        if ([v31 isUnified])
        {
          long long v50 = [v31 linkedContacts];
          [v49 addObjectsFromArray:v50];
        }
        else
        {
          [v49 addObject:v31];
        }
        CGRect v33 = v83;
        id v5 = [MEMORY[0x1E4F1B8F8] unifyContacts:v49];

        long long v52 = [(CNContactContentEditViewController *)self contactViewCache];
        long long v53 = [v52 policyForDefaultContainer];
        [(CNContactContentEditViewController *)self setPolicy:v53];

        double v54 = [(CNContactContentEditViewController *)self policy];

        long long v51 = v85;
        if (!v54 || v85)
        {
          id v55 = [MEMORY[0x1E4F1BA68] sharedPermissivePolicy];
          [(CNContactContentEditViewController *)self setPolicy:v55];
        }
        CGFloat v30 = v84;
        goto LABEL_34;
      }
      id v5 = v31;
    }
    else
    {
      CGRect v33 = v25;
    }
    long long v51 = v85;
    id v12 = v86;
LABEL_34:

    double v25 = v33;
  }
  objc_storeStrong((id *)&self->_contact, v5);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v57 = v5;
  if ((isKindOfClass & 1) == 0) {
    v57 = (void *)[v5 mutableCopy];
  }
  p_mutableContact = &self->_mutableContact;
  objc_storeStrong((id *)&self->_mutableContact, v57);
  if ((isKindOfClass & 1) == 0) {

  }
  v59 = CNUILogContactCard();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    v60 = [v5 identifier];
    v61 = *p_mutableContact;
    *(_DWORD *)buf = 138543618;
    v96 = v60;
    __int16 v97 = 2050;
    v98 = v61;
    _os_log_impl(&dword_18B625000, v59, OS_LOG_TYPE_DEFAULT, "[CNContactContentViewController] setting contact with identifier %{public}@, mutable contact %{public}p", buf, 0x16u);
  }
  v62 = [(CNContactContentEditViewController *)self customActions];
  v87[0] = MEMORY[0x1E4F143A8];
  v87[1] = 3221225472;
  v87[2] = __49__CNContactContentEditViewController_setContact___block_invoke_329;
  v87[3] = &unk_1E549B4D8;
  v87[4] = self;
  v63 = objc_msgSend(v62, "_cn_filter:", v87);
  [(CNContactContentEditViewController *)self setCustomActions:v63];

  v64 = [MEMORY[0x1E4F1CA60] dictionary];
  [(CNContactContentEditViewController *)self setGroupsAfterGroup:v64];

  v65 = [[CNCardGroup alloc] initWithContact:*p_mutableContact];
  cardEditingActionsGroup = self->_cardEditingActionsGroup;
  self->_cardEditingActionsGroup = v65;

  v67 = [[CNCardGroup alloc] initWithContact:*p_mutableContact];
  cardEditingDeleteContactGroup = self->_cardEditingDeleteContactGroup;
  self->_cardEditingDeleteContactGroup = v67;

  propertyGroups = self->_propertyGroups;
  self->_propertyGroups = 0;

  v70 = [(CNContactContentEditViewController *)self siriContextProvider];
  LODWORD(v63) = [v70 isEnabled];

  v71 = [CNSiriContactContextProvider alloc];
  v72 = [(CNContactContentEditViewController *)self contactStore];
  id v73 = [(CNSiriContactContextProvider *)v71 initWithContact:v5 store:v72];
  [(CNContactContentEditViewController *)self setSiriContextProvider:v73];

  if (v63)
  {
    v74 = [(CNContactContentEditViewController *)self siriContextProvider];
    [v74 setEnabled:1];
  }
  linkedCardsAction = self->_linkedCardsAction;
  self->_linkedCardsAction = 0;

  addLinkedCardAction = self->_addLinkedCardAction;
  self->_addLinkedCardAction = 0;

  cardStaticIdentityGroup = self->_cardStaticIdentityGroup;
  self->_cardStaticIdentityGroup = 0;

  addStaticIdentityAction = self->_addStaticIdentityAction;
  self->_addStaticIdentityAction = 0;

  [(CNContactContentEditViewController *)self setIgnoreContactAction:0];
  [(CNContactContentEditViewController *)self setCardMedicalIDGroup:0];
  [(CNContactContentEditViewController *)self setMedicalIDAction:0];
  [(CNContactContentEditViewController *)self setEmergencyContactAction:0];
  [(CNContactContentEditViewController *)self setCardEditingGeminiGroup:0];
  v79 = [(CNContactContentEditViewController *)self geminiDataSource];
  [v79 setContact:v5];

  if (self->_contactHeaderView)
  {
    v80 = [(CNContactContentEditViewController *)self contactHeaderView];
    [v80 updateWithNewContact:*p_mutableContact];
  }
  [(CNContactContentEditViewController *)self updateEditNavigationItemsAnimated:0];
  [(CNContactContentEditViewController *)self reloadDataPreservingChanges:0];
  v81 = +[CNUIDataCollector sharedCollector];
  v82 = [(CNContactContentEditViewController *)self contact];
  [v81 logContactShown:v82];

  [(CNContactContentEditViewController *)self prepareContactDidAppearForPPT];
LABEL_46:
}

uint64_t __49__CNContactContentEditViewController_setContact___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resumeBackgroundScheduler];
}

uint64_t __49__CNContactContentEditViewController_setContact___block_invoke_329(uint64_t a1, void *a2)
{
  return [a2 isValidForContact:*(void *)(*(void *)(a1 + 32) + 1016)];
}

- (void)setupContainerContextIfNeededForContact:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CNContactContentEditViewController *)self shouldAllowContainerPicking])
  {
    id v5 = [(CNContactContentEditViewController *)self containerContext];

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
        int v22 = v6;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        char v8 = [v4 mainStoreLinkedContacts];
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
              uint64_t v14 = [(CNContactContentEditViewController *)self contactViewCache];
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
      uint64_t v17 = [(CNContactContentEditViewController *)self parentContainer];

      if (v17 && v6)
      {
        uint64_t v18 = [(CNContactContentEditViewController *)self parentContainer];
        [v7 setObject:v18 forKeyedSubscript:v6];
      }
      double v19 = [[CNUIContainerContext alloc] initWithContainers:v7];
      uint64_t v20 = [(CNContactContentEditViewController *)self parentContainer];

      if (v20 && !v6)
      {
        double v21 = [(CNContactContentEditViewController *)self parentContainer];
        [(CNUIContainerContext *)v19 addContainer:v21];
      }
      [(CNContactContentEditViewController *)self setContainerContext:v19];
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
    double v6 = [(CNContactContentEditViewController *)self parentContainer];
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
  id v37 = a3;
  id v4 = [(CNContactContentEditViewController *)self contactView];
  [v4 applyCellAppearance:v37];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_22;
  }
  objc_opt_class();
  id v5 = v37;
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

    uint64_t v9 = (void *)v12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    double v13 = [(CNContactContentEditViewController *)self view];
    uint64_t v14 = [v13 tintColorOverride];
    double v15 = 0;
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = v5;
    if ([v21 supportsValueColorUsesLabelColor])
    {
      int v22 = +[CNContactStyle currentStyle];
      uint64_t v14 = [v22 textColor];
    }
    else
    {
      uint64_t v14 = 0;
    }
    long long v23 = [(CNContactContentEditViewController *)self highlightedProperties];
    if ([v23 count])
    {
      [(CNContactContentEditViewController *)self highlightedProperties];
      long long v24 = v35 = isKindOfClass;
      [v21 propertyItem];
      long long v25 = v36 = v23;
      [v25 contactProperty];
      v27 = long long v26 = v21;
      objc_msgSend(v26, "setHighlightedProperty:", objc_msgSend(v24, "containsObject:", v27));

      id v21 = v26;
      long long v23 = v36;

      char isKindOfClass = v35;
    }
    else
    {
      [v21 setHighlightedProperty:0];
    }

    if ([v21 isSuggested])
    {
      uint64_t v28 = +[CNContactStyle currentStyle];
      double v15 = [v28 suggestedLabelTextColor];

      double v29 = +[CNContactStyle currentStyle];
      uint64_t v30 = [v29 suggestedValueTextColor];
    }
    else
    {
      if ([v21 isHighlightedProperty]
        && [(CNContactContentEditViewController *)self highlightedPropertyImportant])
      {
        objc_msgSend(v21, "setImportant:", -[CNContactContentEditViewController highlightedPropertyImportant](self, "highlightedPropertyImportant"));
        uint64_t v30 = [MEMORY[0x1E4FB1618] redColor];
        double v15 = 0;
        goto LABEL_37;
      }
      if (([(CNContactContentEditViewController *)self isEditing] & 1) != 0
        || ![v21 supportsTintColorValue])
      {
        double v15 = 0;
LABEL_45:
        if ([v21 isHighlightedProperty])
        {
          if (([v21 isImportant] & 1) == 0)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_opt_class();
              id v31 = v21;
              if (objc_opt_isKindOfClass()) {
                uint64_t v32 = v31;
              }
              else {
                uint64_t v32 = 0;
              }
              id v33 = v32;

              [v33 setShouldShowBadge:1];
            }
          }
        }

        if (!v15)
        {
LABEL_14:
          if (v14)
          {
            double v16 = (void *)[v10 mutableCopy];
            [v16 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4FB0700]];

            uint64_t v10 = v16;
          }
          if (isKindOfClass) {
            goto LABEL_18;
          }
          goto LABEL_17;
        }
        id v34 = (void *)[v9 mutableCopy];
        [v34 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4FB0700]];
        double v13 = v9;
        uint64_t v9 = v34;
LABEL_13:

        goto LABEL_14;
      }
      double v29 = [(CNContactContentEditViewController *)self view];
      uint64_t v30 = [v29 tintColorOverride];

      double v15 = 0;
    }
    uint64_t v14 = v29;
LABEL_37:

    uint64_t v14 = (void *)v30;
    goto LABEL_45;
  }
  double v15 = 0;
  if (isKindOfClass) {
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v17 = [v7 labelTextAttributes];
  char v18 = [v17 isEqual:v9];

  if ((v18 & 1) == 0) {
LABEL_18:
  }
    [v7 setLabelTextAttributes:v9];
  double v19 = [v7 valueTextAttributes];
  char v20 = [v19 isEqual:v10];

  if ((v20 & 1) == 0) {
    [v7 setValueTextAttributes:v10];
  }

LABEL_22:
}

- (void)localeDidChange:(id)a3
{
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  [(CNContactView *)self->_contactView updateFontSizes];
  id v4 = [(CNContactContentEditViewController *)self contactHeaderView];
  [v4 updateFontSizes];

  [(CNContactContentEditViewController *)self viewDidLayoutSubviews];
  [(CNContactContentEditViewController *)self reloadDataPreservingChanges:1];
  [(CNContactContentEditViewController *)self setupConstraints];
  id v5 = [(CNContactContentEditViewController *)self applyContactStyle];
}

- (BOOL)isOutOfProcess
{
  id v2 = [(CNContactContentEditViewController *)self contactViewConfiguration];
  char v3 = [v2 isOutOfProcess];

  return v3;
}

- (CNContactView)contactView
{
  contactView = self->_contactView;
  if (!contactView)
  {
    id v4 = [CNContactView alloc];
    id v5 = [(CNContactContentEditViewController *)self contact];
    double v6 = -[CNContactView initWithFrame:contact:](v4, "initWithFrame:contact:", v5, 0.0, 0.0, 320.0, 200.0);
    id v7 = self->_contactView;
    self->_contactView = v6;

    [(CNContactView *)self->_contactView setEditing:1];
    [(CNContactView *)self->_contactView setDataSource:self];
    [(CNContactView *)self->_contactView setDelegate:self];
    [(CNContactView *)self->_contactView _setHeaderAndFooterViewsFloat:0];
    [(CNContactView *)self->_contactView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CNContactView *)self->_contactView setKeyboardDismissMode:1];
    contactView = self->_contactView;
  }

  return contactView;
}

- (BOOL)isHeaderViewPhotoProhibited
{
  char v3 = [(CNContactContentEditViewController *)self prohibitedPropertyKeys];
  if ([v3 containsObject:*MEMORY[0x1E4F1AE28]])
  {
    char v4 = 1;
  }
  else
  {
    id v5 = [(CNContactContentEditViewController *)self prohibitedPropertyKeys];
    char v4 = [v5 containsObject:*MEMORY[0x1E4F1AF98]];
  }
  return v4;
}

- (CNContactHeaderEditView)contactHeaderView
{
  contactHeaderView = self->_contactHeaderView;
  if (!contactHeaderView)
  {
    BOOL v4 = [(CNContactContentEditViewController *)self isHeaderViewPhotoProhibited];
    if ([(CNContactContentEditViewController *)self shouldDrawNavigationBar])
    {
      uint64_t v5 = 1;
    }
    else
    {
      double v6 = [(CNContactContentEditViewController *)self contactViewConfiguration];
      uint64_t v5 = [v6 layoutPositionallyAfterNavBar];
    }
    id v7 = [(CNContactContentEditViewController *)self mutableContact];
    uint64_t v8 = +[CNContactHeaderEditView contactHeaderViewWithContact:v7 shouldAllowTakePhotoAction:1 showingNavBar:v5 monogramOnly:v4 isOutOfProcess:[(CNContactContentEditViewController *)self isOutOfProcess] delegate:self];
    uint64_t v9 = self->_contactHeaderView;
    self->_contactHeaderView = v8;

    uint64_t v10 = [(CNContactContentEditViewController *)self presentingDelegate];
    [(CNContactHeaderEditView *)self->_contactHeaderView setPresenterDelegate:v10];

    uint64_t v11 = +[CNContactStyle currentStyle];
    uint64_t v12 = [v11 contactHeaderBackgroundColor];
    [(CNContactHeaderEditView *)self->_contactHeaderView setBackgroundColor:v12];

    [(CNContactHeaderEditView *)self->_contactHeaderView setTranslatesAutoresizingMaskIntoConstraints:0];
    double v13 = [(CNContactContentEditViewController *)self contactViewConfiguration];
    -[CNContactHeaderEditView setAllowsEditPhoto:](self->_contactHeaderView, "setAllowsEditPhoto:", [v13 allowsEditPhoto] & !v4);

    id v14 = [(CNContactContentEditViewController *)self applyContactStyle];
    contactHeaderView = self->_contactHeaderView;
  }

  return contactHeaderView;
}

- (void)contactViewConfigurationDidUpdate
{
  [(CNContactContentEditViewController *)self reloadDataIfNeeded];
  char v3 = [(CNContactContentEditViewController *)self contactHeaderView];
  BOOL v4 = [(CNContactContentEditViewController *)self contactViewConfiguration];
  objc_msgSend(v3, "updateForShowingNavBar:", objc_msgSend(v4, "layoutPositionallyAfterNavBar"));

  uint64_t v5 = [(CNContactContentEditViewController *)self contactHeaderView];
  double v6 = [(CNContactContentEditViewController *)self mutableContact];
  [v5 updateWithNewContact:v6];

  [(CNContactContentEditViewController *)self updateEditNavigationItemsAnimated:0];
  id v7 = [(CNContactContentEditViewController *)self applyContactStyle];
  id v9 = [(CNContactContentEditViewController *)self contactHeaderView];
  uint64_t v8 = [(CNContactContentEditViewController *)self contactViewConfiguration];
  objc_msgSend(v9, "setAllowsEditPhoto:preservingChanges:", objc_msgSend(v8, "allowsEditPhoto"), 0);
}

- (void)dealloc
{
  [(CNContactView *)self->_contactView setDelegate:0];
  [(CNContactView *)self->_contactView setDataSource:0];
  [(CNContactHeaderView *)self->_contactHeaderView setDelegate:0];
  [(CNContactHeaderEditView *)self->_contactHeaderView didFinishUsing];
  char v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CNContactContentEditViewController;
  [(CNContactContentEditViewController *)&v4 dealloc];
}

- (void)setForcesTransparentBackground:(BOOL)a3
{
  if (self->_forcesTransparentBackground != a3)
  {
    self->_forcesTransparentBackground = a3;
    objc_super v4 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    uint64_t v5 = [v4 schedulerProvider];
    double v6 = [v5 mainThreadScheduler];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __69__CNContactContentEditViewController_setForcesTransparentBackground___block_invoke;
    v7[3] = &unk_1E549B488;
    v7[4] = self;
    [v6 performBlock:v7];
  }
}

id __69__CNContactContentEditViewController_setForcesTransparentBackground___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) applyContactStyle];
}

- (void)setTitle:(id)a3
{
  id v5 = a3;
  if (v5
    || ([(CNContactContentEditViewController *)self title],
        (char v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v6 = [(CNContactContentEditViewController *)self title];
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
      v8.super_class = (Class)CNContactContentEditViewController;
      [(CNContactContentEditViewController *)&v8 setTitle:v5];
      [(CNContactContentEditViewController *)self didChangeToShowTitle:v5 != 0];
    }
  }
LABEL_6:
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
  id v5 = a3;
  id v6 = [(CNContactContentEditViewController *)self contactViewCache];
  [v6 setContactStore:v5];
}

- (CNContactContentEditViewController)initWithContact:(id)a3 contactViewConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(CNContactContentEditViewController *)self initWithNibName:0 bundle:0];
  id v9 = v8;
  if (v8)
  {
    [(CNContactContentEditViewController *)v8 setContact:v6];
    [(CNContactContentEditViewController *)v9 setContactViewConfiguration:v7];
  }

  return v9;
}

- (CNContactContentEditViewController)initWithEnvironment:(id)a3
{
  id v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)CNContactContentEditViewController;
  id v6 = [(CNContactContentEditViewController *)&v38 initWithNibName:0 bundle:0];
  objc_storeStrong((id *)&v6->_environment, a3);
  id v7 = objc_alloc_init(CNContactViewCache);
  contactViewCache = v6->_contactViewCache;
  v6->_contactViewCache = v7;

  if ([MEMORY[0x1E4F1B9F8] deviceSupportsGemini])
  {
    id v9 = [CNUIGeminiDataSource alloc];
    uint64_t v10 = +[CNUIContactsEnvironment currentEnvironment];
    uint64_t v11 = [v10 geminiManager];
    uint64_t v12 = [(CNUIGeminiDataSource *)v9 initWithGeminiManager:v11];
    geminiDataSource = v6->_geminiDataSource;
    v6->_geminiDataSource = (CNUIGeminiDataSource *)v12;

    [(CNUIGeminiDataSource *)v6->_geminiDataSource setDelegate:v6];
  }
  long long v14 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
  *(_OWORD *)&v6->_peripheryInsets.double top = *MEMORY[0x1E4FB2848];
  *(_OWORD *)&v6->_peripheryInsets.double bottom = v14;
  objc_storeWeak((id *)&v6->_presentingDelegate, v6);
  uint64_t v15 = [MEMORY[0x1E4F1B910] sharedFullNameFormatter];
  contactFormatter = v6->_contactFormatter;
  v6->_contactFormatter = (CNContactFormatter *)v15;

  uint64_t v17 = [v5 inProcessActivityManager];
  activityManager = v6->_activityManager;
  v6->_activityManager = (CNUIUserActivityManager *)v17;

  uint64_t v19 = [MEMORY[0x1E4F1C978] array];
  customActions = v6->_customActions;
  v6->_customActions = (NSArray *)v19;

  id v21 = objc_alloc_init(CNUIContactStoreSaveExecutor);
  saveContactExecutor = v6->_saveContactExecutor;
  v6->_saveContactExecutor = (CNUIContactSaveExecutor *)v21;

  long long v23 = objc_alloc_init(CNUIContactStoreLinkedContactSaveExecutor);
  saveLinkedContactsExecutor = v6->_saveLinkedContactsExecutor;
  v6->_saveLinkedContactsExecutor = (CNUIContactSaveExecutor *)v23;

  long long v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v25 addObserver:v6 selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];

  long long v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v26 addObserver:v6 selector:sel_localeDidChange_ name:*MEMORY[0x1E4F1C370] object:0];

  double v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v27 addObserver:v6 selector:sel_contactStoreDidChangeWithNotification_ name:*MEMORY[0x1E4F1AF80] object:0];

  uint64_t v28 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v28 addObserver:v6 selector:sel_contactStoreDidChangeWithNotification_ name:*MEMORY[0x1E4F5A180] object:0 suspensionBehavior:4];

  double v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v29 addObserver:v6 selector:sel_keyboardDidShowNotification_ name:*MEMORY[0x1E4FB2BC8] object:0];

  uint64_t v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v30 addObserver:v6 selector:sel_keyboardWillHideNotification_ name:*MEMORY[0x1E4FB2C50] object:0];

  id v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v31 addObserver:v6 selector:sel_favoritesDidChangeWithNotification_ name:*MEMORY[0x1E4F1AFF0] object:0];

  uint64_t v32 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v33 = [v32 featureFlags];
  v6->_supportsDrafts = [v33 isFeatureEnabled:18];

  [(CNContactContentEditViewController *)v6 setRestorationIdentifier:@"ContactCard"];
  [(CNContactContentEditViewController *)v6 setRestorationClass:objc_opt_class()];
  id v34 = [(CNContactContentEditViewController *)v6 navigationItem];
  [v34 _setBackgroundHidden:1];

  char v35 = [(CNContactContentEditViewController *)v6 navigationItem];
  [v35 setLargeTitleDisplayMode:2];

  id v36 = [(CNContactContentEditViewController *)v6 applyContactStyle];
  return v6;
}

- (CNContactContentEditViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5 = +[CNUIContactsEnvironment currentEnvironment];
  id v6 = [(CNContactContentEditViewController *)self initWithEnvironment:v5];

  return v6;
}

+ (CNContactContentEditViewController)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  id v7 = (void *)MEMORY[0x1E4F1B8F8];
  objc_super v8 = +[CNContactContentEditViewController descriptorForRequiredKeys];
  v27[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  uint64_t v10 = [v7 contactWithStateRestorationCoder:v5 store:v6 keys:v9];

  if (v10)
  {
    id v21 = v6;
    id v11 = [[CNContactContentViewControllerConfiguration alloc] initForOutOfProcess:0];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v12 = [a1 BOOLStateRestorationProperties];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          char v18 = [v5 decodeObjectOfClass:objc_opt_class() forKey:v17];
          if (v18) {
            [v11 setValue:v18 forKey:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v14);
    }

    uint64_t v19 = [[CNContactContentEditViewController alloc] initWithContact:v10 contactViewConfiguration:v11];
    id v6 = v21;
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

+ (id)BOOLStateRestorationProperties
{
  return &unk_1ED915B00;
}

+ (BOOL)shouldShowGeminiForResult:(id)a3 contact:(id)a4
{
  id v7 = a3;
  if (v7)
  {
    objc_super v8 = [a4 phoneNumbers];
    if ([v8 count] && objc_msgSend(MEMORY[0x1E4F1B9F8], "deviceSupportsGemini"))
    {
      objc_super v4 = [v7 availableChannels];
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

+ (void)_telemetryForContact:(id)a3
{
  v38[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v37[0] = @"PhoneNumbers";
  objc_super v4 = NSNumber;
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
  id v11 = [v3 postalAddresses];
  uint64_t v12 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
  v38[2] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];

  uint64_t v14 = [v3 note];
  unint64_t v15 = [v14 length];

  if (v15 >> 11 >= 5)
  {
    double v16 = _LargeDatabasesLowSeveritySignpostLogHandle();
    if (os_signpost_enabled(v16))
    {
      uint64_t v17 = [v3 note];
      *(_DWORD *)buf = 134349056;
      uint64_t v33 = [v17 length];
      _os_signpost_emit_with_name_impl(&dword_18B625000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LongContactNoteLength", " enableTelemetry=YES %{public, signpost.telemetry:number1, name=NoteLength}lu", buf, 0xCu);
    }
  }
  double v27 = v3;
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
            *(_DWORD *)buf = 138543618;
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
  if (enablesTransportButtons_s_onceToken != -1) {
    dispatch_once(&enablesTransportButtons_s_onceToken, &__block_literal_global_22416);
  }
  return enablesTransportButtons_s_enableTransportButtons;
}

uint64_t __61__CNContactContentEditViewController_enablesTransportButtons__block_invoke()
{
  uint64_t result = CFPreferencesGetAppBooleanValue(@"CNEnableTransportButtons", (CFStringRef)*MEMORY[0x1E4F1D3B8], 0);
  enablesTransportButtons_s_enableTransportButtons = result != 0;
  return result;
}

+ (id)descriptorForRequiredKeysWithDescription:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__CNContactContentEditViewController_descriptorForRequiredKeysWithDescription___block_invoke;
  block[3] = &unk_1E549B488;
  id v9 = v3;
  uint64_t v4 = descriptorForRequiredKeysWithDescription__cn_once_token_7;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&descriptorForRequiredKeysWithDescription__cn_once_token_7, block);
  }
  id v6 = (id)descriptorForRequiredKeysWithDescription__cn_once_object_7;

  return v6;
}

void __79__CNContactContentEditViewController_descriptorForRequiredKeysWithDescription___block_invoke(uint64_t a1)
{
  v13[49] = *MEMORY[0x1E4F143B8];
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
    *MEMORY[0x1E4F1AE98],
    *MEMORY[0x1E4F1ADE8],
    *MEMORY[0x1E4F1AF40],
  id v2 = *MEMORY[0x1E4F1AF38]);
  uint64_t v3 = *MEMORY[0x1E4F1ADC0];
  v13[45] = v2;
  v13[46] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1B910] sharedFullNameFormatter];
  id v5 = [v4 descriptorForRequiredKeys];
  v13[47] = v5;
  id v6 = [MEMORY[0x1E4F1B910] sharedFullNameFormatter];
  id v7 = +[CNContactHeaderDisplayView descriptorForRequiredKeysForContactFormatter:v6];
  v13[48] = v7;
  objc_super v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:49];

  id v9 = +[CNSiriContactContextProvider descriptorForRequiredKeys];
  if (v9)
  {
    uint64_t v10 = [v8 arrayByAddingObject:v9];

    objc_super v8 = (void *)v10;
  }
  uint64_t v11 = [MEMORY[0x1E4F1B8F8] descriptorWithKeyDescriptors:v8 description:*(void *)(a1 + 32)];

  uint64_t v12 = (void *)descriptorForRequiredKeysWithDescription__cn_once_object_7;
  descriptorForRequiredKeysWithDescription__cn_once_object_7 = v11;
}

+ (int64_t)tableViewStyle
{
  return 1;
}

+ (id)descriptorForRequiredKeys
{
  uint64_t v3 = [NSString stringWithUTF8String:"+[CNContactContentEditViewController descriptorForRequiredKeys]"];
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
  id v9 = [NSString stringWithUTF8String:"+[CNContactContentEditViewController descriptorForRequiredKeysForContact:]"];
  uint64_t v10 = [v8 descriptorWithKeyDescriptors:v7 description:v9];

  return v10;
}

@end