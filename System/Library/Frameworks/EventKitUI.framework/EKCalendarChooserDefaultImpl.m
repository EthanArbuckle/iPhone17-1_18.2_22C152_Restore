@interface EKCalendarChooserDefaultImpl
+ (BOOL)groups:(id)a3 differStructurallyFromGroups:(id)a4;
+ (id)_disabledIntegrationLocalizedString;
+ (id)_subscribedLocalizedString;
+ (id)delegatesString;
+ (id)hideAllString;
+ (id)showAllString;
- ($7C92223F3A9F3C85702FE9D2C49D13A2)flags;
- (BOOL)_applySelection;
- (BOOL)_calendarAvailableForEditing:(id)a3;
- (BOOL)_collectionViewHasHeader;
- (BOOL)_isCalendarEnabled:(id)a3;
- (BOOL)_isDeclinedEventsSwitchSection:(int64_t)a3;
- (BOOL)_isDelegateCalendarsButtonSection:(int64_t)a3;
- (BOOL)_isFocusBannerSection:(int64_t)a3;
- (BOOL)_isIdentityChooserSection:(int64_t)a3;
- (BOOL)_sectionHasFooter:(int64_t)a3;
- (BOOL)_sectionHasHeader:(int64_t)a3;
- (BOOL)_shouldDisplayAccountErrorActionCellForGroup:(id)a3;
- (BOOL)_shouldShowAddHolidayCalendarMenuItem;
- (BOOL)_shouldShowDeclinedEventsSection;
- (BOOL)_shouldShowDelegateCalendarsButtonSection;
- (BOOL)_shouldShowFocusBanner;
- (BOOL)_shouldShowIdentityChooser;
- (BOOL)allSelected;
- (BOOL)allowsPullToRefresh;
- (BOOL)canShowDelegateSetupCell;
- (BOOL)canShowIdentityChooser;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)disableCalendarEditing;
- (BOOL)disableCalendarsUnselectedByFocus;
- (BOOL)hasAccountThatCanCreateCalendars;
- (BOOL)onlyShowUnmanagedAccounts;
- (BOOL)shouldOverrideAuthorizationStatus;
- (BOOL)showAccountStatus;
- (BOOL)showDetailAccessories;
- (BOOL)showsCancelButton;
- (BOOL)showsCompletedRemindersSetting;
- (BOOL)showsDeclinedEventsSetting;
- (BOOL)showsDoneButton;
- (CGSize)preferredContentSize;
- (EKAbstractCalendarEditor)presentedEditor;
- (EKCalendar)selectedCalendar;
- (EKCalendarChooserDefaultImpl)initWithSelectionStyle:(int64_t)a3 displayStyle:(int64_t)a4 entityType:(unint64_t)a5 eventStore:(id)a6;
- (EKCalendarChooserDefaultImpl)initWithSelectionStyle:(int64_t)a3 displayStyle:(int64_t)a4 entityType:(unint64_t)a5 forEvent:(id)a6 eventStore:(id)a7 limitedToSource:(id)a8 showIdentityChooser:(BOOL)a9 showDelegateSetupCell:(BOOL)a10 showAccountStatus:(BOOL)a11;
- (EKCalendarChooserDefaultImpl)initWithSelectionStyle:(int64_t)a3 displayStyle:(int64_t)a4 eventStore:(id)a5;
- (EKCalendarChooserDelegate)delegate;
- (EKEvent)event;
- (EKEventStore)eventStore;
- (EKUIViewControllerNavigationDelegate)navigationDelegate;
- (NSArray)allGroups;
- (NSArray)groups;
- (NSIndexPath)checkedRow;
- (NSMutableSet)selectedCalendarSet;
- (NSSet)collapsedSectionIdentifiers;
- (NSSet)selectedCalendars;
- (UIBarButtonItem)showAllButton;
- (UICollectionView)collectionView;
- (UICollectionViewDiffableDataSource)dataSource;
- (UIRefreshControl)refreshControl;
- (_UIAccessDeniedView)accessDeniedView;
- (id)_allCalendars;
- (id)_calendarHeaderRowIdentifierFromSectionIdentifier:(id)a3;
- (id)_calendarInfoForCalendar:(id)a3;
- (id)_calendarSetToCalendarIdSet:(id)a3;
- (id)_calendarsForSelectedSource;
- (id)_collectionViewLayout;
- (id)_contactForSource:(id)a3;
- (id)_currentKnownCalendarIds;
- (id)_filterCalendars:(id)a3;
- (id)_groupForSection:(int64_t)a3;
- (id)_indexPathForCalendar:(id)a3;
- (id)_loadCalendars;
- (id)_preferredAddressFromOwnerAddresses:(id)a3;
- (id)_saveSelection;
- (id)_sectionIdentifierForGroup:(id)a3;
- (id)_statusTextForGroup:(id)a3;
- (id)_viewModeTitle;
- (id)centeredCalendar;
- (id)displayedEditor;
- (id)navigationController;
- (id)navigationItem;
- (id)sourceForSelectedIdentity;
- (id)toolbarItems;
- (int)_numSelectedGroups;
- (int)explanatoryTextMode;
- (int64_t)_accountErrorActionRowIndexForGroup:(id)a3;
- (int64_t)_calendarIndex:(int64_t)a3 toRowIndexInGroup:(id)a4;
- (int64_t)_focusBannerSection;
- (int64_t)_groupsOffset;
- (int64_t)_identityChooserSection;
- (int64_t)_rowIndex:(int64_t)a3 toCalendarIndexInGroup:(id)a4;
- (int64_t)_rowIndexForMeDelegate;
- (int64_t)_rowIndexToDelegateSourceIndex:(int64_t)a3;
- (int64_t)chooserMode;
- (int64_t)lastAuthorizationStatus;
- (int64_t)numCalendarsHiddenByFocus;
- (int64_t)selectionStyle;
- (unint64_t)entityType;
- (unint64_t)supportedInterfaceOrientations;
- (void)_accessoryButtonTappedAtIndexPath:(id)a3;
- (void)_calendarEditorDidCompleteWithAction:(int)a3 createdCalendar:(id)a4;
- (void)_cleanupCollapsedSectionIdentifiers;
- (void)_collectionViewBuildAndApplyNewSnapshotAnimated:(BOOL)a3;
- (void)_collectionViewBuildAndApplyNewSnapshotAnimated:(BOOL)a3 completion:(id)a4;
- (void)_commonAddCalendarButtonPressed:(id)a3;
- (void)_configureAccountErrorCell:(id)a3 indexPath:(id)a4 item:(id)a5;
- (void)_configureCalendarCell:(id)a3 indexPath:(id)a4 item:(id)a5;
- (void)_configureCollectionViewHeaderCell:(id)a3 indexPath:(id)a4;
- (void)_configureCompletedRemindersCell:(id)a3 indexPath:(id)a4 item:(id)a5;
- (void)_configureDeclinedEventsCell:(id)a3 indexPath:(id)a4 item:(id)a5;
- (void)_configureDelegateButtonCell:(id)a3 indexPath:(id)a4 item:(id)a5;
- (void)_configureDelegateNameCell:(id)a3 indexPath:(id)a4 item:(id)a5;
- (void)_configureFocusCell:(id)a3 indexPath:(id)a4 item:(id)a5;
- (void)_configureFooterCell:(id)a3 indexPath:(id)a4;
- (void)_configureHeaderCell:(id)a3 indexPath:(id)a4 item:(id)a5;
- (void)_delegateSelectionDidChange:(BOOL)a3;
- (void)_ensureWritableCalendarExists;
- (void)_eventStoreChanged:(id)a3;
- (void)_eventStoreChangedExternally;
- (void)_finishRefreshing;
- (void)_ignoredErrorsChanged;
- (void)_layoutNavToolbarControls;
- (void)_presentEditor:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_presentEditor:(id)a3 withIndexPath:(id)a4 barButtonItem:(id)a5 permittedArrowDirections:(unint64_t)a6 animated:(BOOL)a7 completion:(id)a8;
- (void)_preventDefaultCellSelectionBehavior:(id)a3;
- (void)_reconfigureCollectionViewAtIndexPath:(id)a3;
- (void)_reconfigureHeaders;
- (void)_reconfigureIdentifierInCollectionView:(id)a3;
- (void)_reloadCalendars;
- (void)_reloadCalendarsForcingCollectionViewReload:(BOOL)a3;
- (void)_reloadCollectionViewSection:(int64_t)a3;
- (void)_reloadCollectionViewSectionWithIdentifier:(id)a3;
- (void)_restoreSelection:(id)a3 calendarsForSelectedSource:(id)a4 allCalendars:(id)a5;
- (void)_selectAllCalendarsAndNotify:(BOOL)a3;
- (void)_selectAllCalendarsAndStores:(BOOL)a3;
- (void)_selectCalendar:(id)a3 selected:(BOOL)a4;
- (void)_selectGroup:(id)a3 selected:(BOOL)a4;
- (void)_sendAnalyticsEvent:(unint64_t)a3 forGroup:(id)a4;
- (void)_setCalendars:(id)a3 changedObjectsHint:(id)a4 forceCollectionViewReload:(BOOL)a5;
- (void)_setSelectedCalendars:(id)a3 notify:(BOOL)a4;
- (void)_showCompletedRemindersChanged:(id)a3;
- (void)_showDeclinedEventsChanged:(id)a3;
- (void)_updateAccessDeniedViewWithNewStatus:(int64_t)a3;
- (void)_updateAppEntityAnnotationIfNeededForCalendarCell:(id)a3 calendarInfo:(id)a4;
- (void)_updateCurrentKnownCalendarIds;
- (void)_updateDelegateSources;
- (void)_updateOrCreateAddCalendarBarButtonItem;
- (void)_updatePossiblyChangedIndexPaths:(id)a3 possiblyChangedSectionIndices:(id)a4 forGroups:(id)a5 withFirstSection:(int64_t)a6 changedObjectIDSet:(id)a7 footersChanged:(BOOL)a8 reloadEverything:(BOOL)a9;
- (void)_updateShowDelegateCalendarsCell;
- (void)_updateViewControllerTitle;
- (void)_userDidSelectCalendar:(id)a3 selected:(BOOL)a4 withIndexPath:(id)a5;
- (void)accountRefreshFinished:(id)a3;
- (void)addCalendarButtonPressed:(id)a3;
- (void)addFamilyCalendarButtonPressed:(id)a3;
- (void)addHolidayCalendarButtonPressed:(id)a3;
- (void)addSubscribedCalendarButtonPressed:(id)a3 prefillURL:(id)a4;
- (void)calendarEditor:(id)a3 didCompleteWithAction:(int)a4;
- (void)cancel:(id)a3;
- (void)centerOnCalendar:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)completedRemindersChanged;
- (void)declinedEventsChanged;
- (void)done:(id)a3;
- (void)focusBannerCollectionViewCellToggled:(id)a3;
- (void)focusModeConfigurationChanged;
- (void)groupShowAllTapped:(id)a3;
- (void)identityChanged:(id)a3;
- (void)loadView;
- (void)openAddRegularCalendarWithTitle:(id)a3;
- (void)presentAccountErrorAlertForGroup:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)redisplayEditor:(id)a3 completion:(id)a4;
- (void)refresh:(id)a3;
- (void)resetBackgroundColor;
- (void)setAccessDeniedView:(id)a3;
- (void)setAllGroups:(id)a3;
- (void)setAllSelected:(BOOL)a3;
- (void)setAllowsPullToRefresh:(BOOL)a3;
- (void)setCanShowDelegateSetupCell:(BOOL)a3;
- (void)setCanShowIdentityChooser:(BOOL)a3;
- (void)setCheckedRow:(id)a3;
- (void)setChooserMode:(int64_t)a3;
- (void)setCollapsedSectionIdentifiers:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableCalendarEditing:(BOOL)a3;
- (void)setDisableCalendarsUnselectedByFocus:(BOOL)a3;
- (void)setEntityType:(unint64_t)a3;
- (void)setEvent:(id)a3;
- (void)setExplanatoryTextMode:(int)a3;
- (void)setFlags:(id)a3;
- (void)setGroups:(id)a3;
- (void)setLastAuthorizationStatus:(int64_t)a3;
- (void)setNavigationDelegate:(id)a3;
- (void)setNumCalendarsHiddenByFocus:(int64_t)a3;
- (void)setOnlyShowUnmanagedAccounts:(BOOL)a3;
- (void)setPresentedEditor:(id)a3;
- (void)setRefreshControl:(id)a3;
- (void)setSelectedCalendar:(id)a3;
- (void)setSelectedCalendarSet:(id)a3;
- (void)setSelectedCalendars:(id)a3;
- (void)setSelectedCalendarsAndNotify:(id)a3;
- (void)setSelectionStyle:(int64_t)a3;
- (void)setShouldOverrideAuthorizationStatus:(BOOL)a3;
- (void)setShouldOverrideAuthorizationStatus:(BOOL)a3 withRemoteUIStatus:(int64_t)a4 displayStyle:(int64_t)a5;
- (void)setShowAccountStatus:(BOOL)a3;
- (void)setShowAllButton:(id)a3;
- (void)setShowDetailAccessories:(BOOL)a3;
- (void)setShowsCancelButton:(BOOL)a3;
- (void)setShowsCompletedRemindersSetting:(BOOL)a3;
- (void)setShowsDeclinedEventsSetting:(BOOL)a3;
- (void)setShowsDoneButton:(BOOL)a3;
- (void)setToolbarItems:(id)a3;
- (void)setToolbarItems:(id)a3 animated:(BOOL)a4;
- (void)showAddSubscribedCalendarWithURL:(id)a3;
- (void)showAllButtonPressed;
- (void)showCalendar:(id)a3 enableDoneInitially:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation EKCalendarChooserDefaultImpl

- (EKCalendarChooserDefaultImpl)initWithSelectionStyle:(int64_t)a3 displayStyle:(int64_t)a4 entityType:(unint64_t)a5 forEvent:(id)a6 eventStore:(id)a7 limitedToSource:(id)a8 showIdentityChooser:(BOOL)a9 showDelegateSetupCell:(BOOL)a10 showAccountStatus:(BOOL)a11
{
  v35[3] = *MEMORY[0x1E4F143B8];
  id v30 = a6;
  id v19 = a7;
  id v20 = a8;
  if (a5 >= 2)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2 object:self file:@"EKCalendarChooserDefaultImpl.m" lineNumber:171 description:@"Invalid entity type passed"];
  }
  v34.receiver = self;
  v34.super_class = (Class)EKCalendarChooserDefaultImpl;
  v21 = [(EKCalendarChooserDefaultImpl *)&v34 initWithNibName:0 bundle:0];
  if (v21)
  {
    EKUILogInitIfNeeded();
    v21->_style = a3;
    v21->_displayStyle = a4;
    *(unsigned char *)&v21->_flags = *(unsigned char *)&v21->_flags & 0xEF | (16 * (a4 == 1));
    v21->_entityType = a5;
    v21->_chooserMode = 0;
    objc_storeStrong((id *)&v21->_event, a6);
    objc_storeStrong((id *)&v21->_eventStore, a7);
    objc_storeStrong((id *)&v21->_limitedToSource, a8);
    *(unsigned char *)&v21->_flags &= ~0x20u;
    v21->_canShowIdentityChooser = a9;
    v21->_canShowDelegateSetupCell = a10;
    v21->_showAccountStatus = a11;
    uint64_t v22 = objc_opt_new();
    selectedCalendars = v21->_selectedCalendars;
    v21->_selectedCalendars = (NSMutableSet *)v22;

    *(unsigned char *)&v21->_flags |= 1u;
    uint64_t v24 = [MEMORY[0x1E4F1CAD0] set];
    collapsedSectionIdentifiers = v21->_collapsedSectionIdentifiers;
    v21->_collapsedSectionIdentifiers = (NSSet *)v24;

    objc_initWeak(&location, v21);
    v35[0] = objc_opt_class();
    v35[1] = objc_opt_class();
    v35[2] = objc_opt_class();
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:3];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __175__EKCalendarChooserDefaultImpl_initWithSelectionStyle_displayStyle_entityType_forEvent_eventStore_limitedToSource_showIdentityChooser_showDelegateSetupCell_showAccountStatus___block_invoke;
    v31[3] = &unk_1E60874F8;
    objc_copyWeak(&v32, &location);
    id v27 = (id)[(EKCalendarChooserDefaultImpl *)v21 registerForTraitChanges:v26 withHandler:v31];
    objc_destroyWeak(&v32);

    objc_destroyWeak(&location);
  }

  return v21;
}

void __175__EKCalendarChooserDefaultImpl_initWithSelectionStyle_displayStyle_entityType_forEvent_eventStore_limitedToSource_showIdentityChooser_showDelegateSetupCell_showAccountStatus___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = [v5 _presentationSemanticContext];
  v8 = [v15 traitCollection];
  uint64_t v9 = [v8 _presentationSemanticContext];

  if (v7 != v9) {
    [WeakRetained resetBackgroundColor];
  }
  uint64_t v10 = [v5 userInterfaceStyle];
  v11 = [v15 traitCollection];
  if (v10 != [v11 userInterfaceStyle])
  {

    goto LABEL_7;
  }
  v12 = [v5 preferredContentSizeCategory];
  v13 = [v15 traitCollection];
  v14 = [v13 preferredContentSizeCategory];

  if (v12 != v14) {
LABEL_7:
  }
    [WeakRetained _collectionViewBuildAndApplyNewSnapshotAnimated:1];
}

- (EKCalendarChooserDefaultImpl)initWithSelectionStyle:(int64_t)a3 displayStyle:(int64_t)a4 entityType:(unint64_t)a5 eventStore:(id)a6
{
  BYTE2(v7) = 0;
  LOWORD(v7) = 0;
  return -[EKCalendarChooserDefaultImpl initWithSelectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:](self, "initWithSelectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:", a3, a4, a5, 0, a6, 0, v7);
}

- (EKCalendarChooserDefaultImpl)initWithSelectionStyle:(int64_t)a3 displayStyle:(int64_t)a4 eventStore:(id)a5
{
  BYTE2(v6) = 0;
  LOWORD(v6) = 0;
  return -[EKCalendarChooserDefaultImpl initWithSelectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:](self, "initWithSelectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:", a3, a4, 0, 0, a5, 0, v6);
}

- (void)setExplanatoryTextMode:(int)a3
{
  if (self->_explanatoryTextMode != a3)
  {
    self->_explanatoryTextMode = a3;
    id v4 = [(EKCalendarChooserDefaultImpl *)self _collectionViewLayout];
    [(UICollectionView *)self->_collectionView setCollectionViewLayout:v4];
  }
}

- (BOOL)_sectionHasHeader:(int64_t)a3
{
  BOOL v5 = -[EKCalendarChooserDefaultImpl _isIdentityChooserSection:](self, "_isIdentityChooserSection:");
  if ([(EKCalendarChooserDefaultImpl *)self _isDeclinedEventsSwitchSection:a3]
    || [(EKCalendarChooserDefaultImpl *)self _isIdentityChooserSection:a3]
    || [(EKCalendarChooserDefaultImpl *)self _isDelegateCalendarsButtonSection:a3])
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    int v6 = ![(EKCalendarChooserDefaultImpl *)self _isFocusBannerSection:a3];
  }
  return v5 | v6;
}

- (BOOL)_sectionHasFooter:(int64_t)a3
{
  if (!self->_showAccountStatus) {
    return 0;
  }
  BOOL v5 = -[UICollectionViewDiffableDataSource sectionIdentifierForIndex:](self->_dataSource, "sectionIdentifierForIndex:");
  int v6 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshotForSection:v5];
  uint64_t v7 = [v6 expandedItems];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    uint64_t v9 = [(EKCalendarChooserDefaultImpl *)self _groupForSection:a3];
    uint64_t v10 = [v9 footer];
    BOOL v11 = v10 != 0;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_collectionViewHasHeader
{
  int v3 = [(EKCalendarChooserDefaultImpl *)self explanatoryTextMode];
  if (v3 != 1) {
    LOBYTE(v3) = [(EKCalendarChooserDefaultImpl *)self explanatoryTextMode] == 2;
  }
  return v3;
}

- (id)_collectionViewLayout
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (self->_displayStyle == 1000) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = 2;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1588]);
  if ([(EKCalendarChooserDefaultImpl *)self _collectionViewHasHeader])
  {
    BOOL v5 = (void *)MEMORY[0x1E4FB1338];
    int v6 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
    uint64_t v7 = [MEMORY[0x1E4FB1308] estimatedDimension:44.0];
    uint64_t v8 = [v5 sizeWithWidthDimension:v6 heightDimension:v7];

    uint64_t v9 = [MEMORY[0x1E4FB12F8] boundarySupplementaryItemWithLayoutSize:v8 elementKind:@"COLLECTION_VIEW_HEADER_ELEMENT_KIND" alignment:1];
    v17[0] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    [v4 setBoundarySupplementaryItems:v10];
  }
  objc_initWeak(&location, self);
  id v11 = objc_alloc(MEMORY[0x1E4FB1580]);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__EKCalendarChooserDefaultImpl__collectionViewLayout__block_invoke;
  v14[3] = &unk_1E6088988;
  objc_copyWeak(v15, &location);
  v15[1] = (id)v3;
  v12 = (void *)[v11 initWithSectionProvider:v14 configuration:v4];
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  return v12;
}

id __53__EKCalendarChooserDefaultImpl__collectionViewLayout__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  int v6 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1558]) initWithAppearance:*(void *)(a1 + 40)];
  if ([WeakRetained _sectionHasHeader:a2]) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 0;
  }
  [v8 setHeaderMode:v9];
  objc_msgSend(v8, "setFooterMode:", objc_msgSend(WeakRetained, "_sectionHasFooter:", a2));
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __53__EKCalendarChooserDefaultImpl__collectionViewLayout__block_invoke_2;
  id v15 = &unk_1E6088960;
  objc_copyWeak(v16, v6);
  v16[1] = a2;
  [v8 setItemSeparatorHandler:&v12];
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4FB1330], "sectionWithListConfiguration:layoutEnvironment:", v8, v5, v12, v13, v14, v15);
  objc_destroyWeak(v16);

  return v10;
}

id __53__EKCalendarChooserDefaultImpl__collectionViewLayout__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained _sectionHasHeader:*(void *)(a1 + 40)] && !objc_msgSend(v5, "row"))
  {
    [v6 setTopSeparatorVisibility:2];
    [v6 setBottomSeparatorVisibility:2];
  }

  return v6;
}

- (id)_sectionIdentifierForGroup:(id)a3
{
  uint64_t v3 = [a3 source];
  id v4 = [v3 sourceIdentifier];
  id v5 = v4;
  if (!v4) {
    id v4 = @"CollectionViewSectionIdentifierOtherCalendarsGroup";
  }
  id v6 = v4;

  return v6;
}

- (void)_reconfigureHeaders
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = objc_msgSend(v3, "sectionIdentifiers", 0);
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
        uint64_t v10 = [v3 itemIdentifiersInSectionWithIdentifier:*(void *)(*((void *)&v12 + 1) + 8 * v9)];
        id v11 = [v10 firstObject];

        if (v11) {
          [v4 addObject:v11];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [v3 reconfigureItemsWithIdentifiers:v4];
  [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshot:v3 animatingDifferences:1];
}

- (void)_reconfigureCollectionViewAtIndexPath:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  dataSource = self->_dataSource;
  id v5 = a3;
  uint64_t v6 = [(UICollectionViewDiffableDataSource *)dataSource snapshot];
  uint64_t v7 = [(UICollectionViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:v5];

  if (v7)
  {
    v9[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [v6 reconfigureItemsWithIdentifiers:v8];

    [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshot:v6 animatingDifferences:1];
  }
}

- (void)_reconfigureIdentifierInCollectionView:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  dataSource = self->_dataSource;
  id v5 = a3;
  uint64_t v6 = [(UICollectionViewDiffableDataSource *)dataSource snapshot];
  v8[0] = v5;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v6 reconfigureItemsWithIdentifiers:v7];

  [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshot:v6 animatingDifferences:1];
}

- (void)_reloadCollectionViewSection:(int64_t)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v5 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
  uint64_t v6 = [(UICollectionViewDiffableDataSource *)self->_dataSource sectionIdentifierForIndex:a3];
  uint64_t v7 = (void *)v6;
  if (v6)
  {
    v9[0] = v6;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [v5 reloadSectionsWithIdentifiers:v8];

    [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshot:v5 animatingDifferences:1];
  }
}

- (void)_reloadCollectionViewSectionWithIdentifier:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  dataSource = self->_dataSource;
  id v5 = a3;
  uint64_t v6 = [(UICollectionViewDiffableDataSource *)dataSource snapshot];
  v8[0] = v5;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v6 reloadSectionsWithIdentifiers:v7];

  [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshot:v6 animatingDifferences:1];
}

- (void)_collectionViewBuildAndApplyNewSnapshotAnimated:(BOOL)a3
{
}

- (void)_collectionViewBuildAndApplyNewSnapshotAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v48 = a3;
  v73[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  if ([(EKCalendarChooserDefaultImpl *)self _shouldShowFocusBanner])
  {
    v73[0] = @"CollectionViewSectionIdentifierFocusBanner";
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:1];
    [v6 appendSectionsWithIdentifiers:v7];

    v72 = @"CollectionViewRowIdentifierFocusBanner";
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
    [v6 appendItemsWithIdentifiers:v8 intoSectionWithIdentifier:@"CollectionViewSectionIdentifierFocusBanner"];
  }
  if ([(EKCalendarChooserDefaultImpl *)self _shouldShowIdentityChooser])
  {
    v71 = @"CollectionViewSectionIdentifierIdentitySwitcher";
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
    [v6 appendSectionsWithIdentifiers:v9];
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v10 = self->_allGroups;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v53 objects:v70 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v54 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = [(EKCalendarChooserDefaultImpl *)self _sectionIdentifierForGroup:*(void *)(*((void *)&v53 + 1) + 8 * i)];
        v69 = v15;
        v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
        [v6 appendSectionsWithIdentifiers:v16];
      }
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v53 objects:v70 count:16];
    }
    while (v12);
  }

  if ([(EKCalendarChooserDefaultImpl *)self _shouldShowDeclinedEventsSection])
  {
    v68 = @"CollectionViewSectionIdentifierDeclinedEvents";
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
    [v6 appendSectionsWithIdentifiers:v17];
  }
  if ([(EKCalendarChooserDefaultImpl *)self showsDeclinedEventsSetting])
  {
    v67 = @"CollectionViewRowIdentifierDeclinedEvents";
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
    [v6 appendItemsWithIdentifiers:v18 intoSectionWithIdentifier:@"CollectionViewSectionIdentifierDeclinedEvents"];
  }
  if ([(EKCalendarChooserDefaultImpl *)self showsCompletedRemindersSetting]
    && !self->_limitedToSource)
  {
    v66 = @"CollectionViewRowIdentifierCompletedReminders";
    id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
    [v6 appendItemsWithIdentifiers:v19 intoSectionWithIdentifier:@"CollectionViewSectionIdentifierDeclinedEvents"];
  }
  if ([(EKCalendarChooserDefaultImpl *)self _shouldShowDelegateCalendarsButtonSection])
  {
    v65 = @"CollectionViewSectionIdentifierDelegateCalendarsButton";
    id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
    [v6 appendSectionsWithIdentifiers:v20];

    v64 = @"CollectionViewRowIdentifierDelegateCalendarsButton";
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
    [v6 appendItemsWithIdentifiers:v21 intoSectionWithIdentifier:@"CollectionViewSectionIdentifierDelegateCalendarsButton"];
  }
  [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshot:v6 animatingDifferences:v48 completion:v5];
  if ([(EKCalendarChooserDefaultImpl *)self _shouldShowIdentityChooser])
  {
    id v22 = objc_alloc_init(MEMORY[0x1E4FB1358]);
    v63 = @"CollectionViewRowIdentifierIdentitySwitcherHeader";
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
    [v22 appendItems:v23];

    uint64_t v24 = [(EKCalendarChooserDefaultImpl *)self collapsedSectionIdentifiers];
    char v25 = [v24 containsObject:@"CollectionViewRowIdentifierIdentitySwitcherHeader"];

    if ((v25 & 1) == 0)
    {
      v62 = @"CollectionViewRowIdentifierIdentitySwitcherHeader";
      v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
      [v22 expandItems:v26];
    }
    v61 = @"CollectionViewRowIdentifierIdentitySwitcherMe";
    id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
    [v22 appendItems:v27 intoParentItem:@"CollectionViewRowIdentifierIdentitySwitcherHeader"];

    v28 = [(NSArray *)self->_delegateSources CalMap:&__block_literal_global_18];
    [v22 appendItems:v28 intoParentItem:@"CollectionViewRowIdentifierIdentitySwitcherHeader"];
    [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshot:v22 toSection:@"CollectionViewSectionIdentifierIdentitySwitcher" animatingDifferences:v48];
  }
  v44 = v6;
  v45 = v5;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  obuint64_t j = self->_allGroups;
  uint64_t v29 = [(NSArray *)obj countByEnumeratingWithState:&v49 objects:v60 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v47 = *(void *)v50;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v50 != v47) {
          objc_enumerationMutation(obj);
        }
        id v32 = *(void **)(*((void *)&v49 + 1) + 8 * j);
        v33 = [(EKCalendarChooserDefaultImpl *)self _sectionIdentifierForGroup:v32];
        objc_super v34 = [v32 calendarInfos];
        v35 = [v34 CalMap:&__block_literal_global_75];

        id v36 = objc_alloc_init(MEMORY[0x1E4FB1358]);
        v37 = [(EKCalendarChooserDefaultImpl *)self _calendarHeaderRowIdentifierFromSectionIdentifier:v33];
        v59 = v37;
        v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
        [v36 appendItems:v38];

        v39 = [(EKCalendarChooserDefaultImpl *)self collapsedSectionIdentifiers];
        char v40 = [v39 containsObject:v37];

        if ((v40 & 1) == 0)
        {
          v58 = v37;
          v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
          [v36 expandItems:v41];
        }
        if ([(EKCalendarChooserDefaultImpl *)self _shouldDisplayAccountErrorActionCellForGroup:v32])
        {
          v42 = [NSString stringWithFormat:@"account_error_%@", v33];
          v57 = v42;
          v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
          [v36 appendItems:v43 intoParentItem:v37];
        }
        [v36 appendItems:v35 intoParentItem:v37];
        [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshot:v36 toSection:v33 animatingDifferences:v48];
      }
      uint64_t v30 = [(NSArray *)obj countByEnumeratingWithState:&v49 objects:v60 count:16];
    }
    while (v30);
  }
}

id __91__EKCalendarChooserDefaultImpl__collectionViewBuildAndApplyNewSnapshotAnimated_completion___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSString;
  uint64_t v3 = [a2 sourceIdentifier];
  id v4 = [v2 stringWithFormat:@"identity_chooser_%@", v3];

  return v4;
}

id __91__EKCalendarChooserDefaultImpl__collectionViewBuildAndApplyNewSnapshotAnimated_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = NSString;
  uint64_t v3 = [a2 calendar];
  id v4 = [v3 calendarIdentifier];
  id v5 = [v2 stringWithFormat:@"calendar_%@", v4];

  return v5;
}

- (void)_configureHeaderCell:(id)a3 indexPath:(id)a4 item:(id)a5
{
  id v7 = a3;
  uint64_t v8 = [a4 section];
  uint64_t v9 = [(EKCalendarChooserDefaultImpl *)self _groupForSection:v8];
  if ([(EKCalendarChooserDefaultImpl *)self _isIdentityChooserSection:v8])
  {
    uint64_t v10 = [(id)objc_opt_class() delegatesString];
  }
  else if ([(EKCalendarChooserDefaultImpl *)self _isDeclinedEventsSwitchSection:v8] {
         || [(EKCalendarChooserDefaultImpl *)self _isIdentityChooserSection:v8]
  }
         || [(EKCalendarChooserDefaultImpl *)self _isDelegateCalendarsButtonSection:v8]|| !self->_limitedToSource)
  {
    uint64_t v10 = [v9 title];
  }
  else
  {
    uint64_t v10 = CUIKDisplayedTitleForSource();
  }
  uint64_t v11 = (void *)v10;
  if (self->_displayStyle == 1000) {
    [v7 defaultContentConfiguration];
  }
  else {
  uint64_t v12 = [MEMORY[0x1E4FB1948] prominentInsetGroupedHeaderConfiguration];
  }
  [v12 setText:v11];
  [v7 setContentConfiguration:v12];
  uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
  if ([(EKCalendarChooserDefaultImpl *)self allowsPullToRefresh])
  {
    long long v14 = [v9 source];
    if ([v14 isSyncing])
    {
      long long v15 = [v9 source];
      v16 = [v15 lastSyncEndDate];

      if (v16) {
        goto LABEL_17;
      }
      long long v14 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:8];
      uint64_t v17 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      [v14 setColor:v17];

      [v14 startAnimating];
      v18 = (void *)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v14 placement:1];
      [v13 addObject:v18];
    }
  }
LABEL_17:
  if ([v9 accountError])
  {
    id v19 = [MEMORY[0x1E4FB1818] systemImageNamed:@"exclamationmark.triangle.fill"];
    id v20 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v19];
    v21 = (void *)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v20 placement:1];
    id v22 = [MEMORY[0x1E4FB1618] systemYellowColor];
    [v21 setTintColor:v22];

    [v13 addObject:v21];
  }
  v23 = [MEMORY[0x1E4F57C00] sharedPreferences];
  int v24 = [v23 perSectionShowAllHideAllButtonSpecifier];

  if (v24 && v9 && [v9 showSelectAllButton] && self->_style == 1)
  {
    char v25 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    objc_msgSend(v25, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
    [v25 setButtonSize:1];
    char v26 = [v9 selected];
    id v27 = objc_opt_class();
    if (v26) {
      [v27 hideAllString];
    }
    else {
    v28 = [v27 showAllString];
    }
    [v25 setTitle:v28];
    uint64_t v29 = (void *)MEMORY[0x1E4FB14D0];
    uint64_t v30 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v36 = MEMORY[0x1E4F143A8];
    uint64_t v37 = 3221225472;
    v38 = __68__EKCalendarChooserDefaultImpl__configureHeaderCell_indexPath_item___block_invoke;
    v39 = &unk_1E6087DD0;
    char v40 = self;
    id v41 = v9;
    v31 = [v30 actionWithHandler:&v36];
    id v32 = objc_msgSend(v29, "buttonWithConfiguration:primaryAction:", v25, v31, v36, v37, v38, v39, v40);

    v33 = (void *)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v32 placement:1];
    [v13 addObject:v33];
  }
  if ([MEMORY[0x1E4F57700] currentProcessIsFirstPartyCalendarApp])
  {
    id v34 = objc_alloc_init(MEMORY[0x1E4FB1538]);
    [v13 addObject:v34];
  }
  v35 = (void *)[v13 copy];
  [v7 setAccessories:v35];
}

uint64_t __68__EKCalendarChooserDefaultImpl__configureHeaderCell_indexPath_item___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) groupShowAllTapped:*(void *)(a1 + 40)];
}

- (void)_configureDelegateButtonCell:(id)a3 indexPath:(id)a4 item:(id)a5
{
  v41[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(EKCalendarChooserDefaultImpl *)self _preventDefaultCellSelectionBehavior:v6];
  id v7 = [v6 contentView];
  uint64_t v8 = [v7 subviews];
  uint64_t v9 = [v8 count];

  if (!v9)
  {
    uint64_t v10 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    [v10 contentInsets];
    objc_msgSend(v10, "setContentInsets:");
    uint64_t v11 = EventKitUIBundle();
    uint64_t v12 = [v11 localizedStringForKey:@"Delegate Calendars…" value:&stru_1F0CC2140 table:0];
    char v40 = v10;
    [v10 setTitle:v12];

    v39 = [MEMORY[0x1E4FB13F0] actionWithHandler:&__block_literal_global_105];
    uint64_t v13 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v10 primaryAction:v39];
    [v13 setContentHorizontalAlignment:4];
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    long long v14 = [v6 contentView];
    [v14 addSubview:v13];

    v28 = (void *)MEMORY[0x1E4F28DC8];
    v38 = [v6 contentView];
    uint64_t v37 = [v38 layoutMarginsGuide];
    uint64_t v36 = [v37 leadingAnchor];
    v35 = [v13 leadingAnchor];
    id v34 = [v36 constraintEqualToAnchor:v35];
    v41[0] = v34;
    v33 = [v6 contentView];
    id v32 = [v33 layoutMarginsGuide];
    v31 = [v32 trailingAnchor];
    uint64_t v30 = [v13 trailingAnchor];
    uint64_t v29 = [v31 constraintEqualToAnchor:v30];
    v41[1] = v29;
    id v27 = [v6 contentView];
    char v26 = [v27 topAnchor];
    char v25 = [v13 topAnchor];
    int v24 = [v26 constraintLessThanOrEqualToAnchor:v25];
    v41[2] = v24;
    v23 = [v6 contentView];
    long long v15 = [v23 bottomAnchor];
    v16 = [v13 bottomAnchor];
    uint64_t v17 = [v15 constraintGreaterThanOrEqualToAnchor:v16];
    v41[3] = v17;
    v18 = [v6 contentView];
    id v19 = [v18 centerYAnchor];
    id v20 = [v13 centerYAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    v41[4] = v21;
    id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:5];
    [v28 activateConstraints:v22];
  }
}

void __76__EKCalendarChooserDefaultImpl__configureDelegateButtonCell_indexPath_item___block_invoke()
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=CALENDAR&path=DELEGATE_CALENDARS"];
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v0 openSensitiveURL:v1 withOptions:0 error:0];
}

- (void)_configureDeclinedEventsCell:(id)a3 indexPath:(id)a4 item:(id)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(EKCalendarChooserDefaultImpl *)self _preventDefaultCellSelectionBehavior:v6];
  id v7 = [v6 defaultContentConfiguration];
  uint64_t v8 = EventKitUIBundle();
  uint64_t v9 = [v8 localizedStringForKey:@"Show Declined Events" value:&stru_1F0CC2140 table:0];
  [v7 setText:v9];

  uint64_t v10 = [v7 textProperties];
  [v10 setNumberOfLines:0];

  [v6 setContentConfiguration:v7];
  [v6 setAccessibilityIdentifier:@"show-declined-events-cell"];
  uint64_t v11 = [v6 accessories];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    uint64_t v13 = [v6 accessories];
    long long v14 = [v13 firstObject];

    id v15 = [v14 customView];
  }
  else
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4FB1CD0]);
    [v15 setAccessibilityIdentifier:@"show-declined-events-switch"];
    [v15 addTarget:self action:sel_declinedEventsChanged forControlEvents:64];
    long long v14 = (void *)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v15 placement:1];
    v20[0] = v14;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    [v6 setAccessories:v16];
  }
  pendingShowDeclinedEvents = self->_pendingShowDeclinedEvents;
  if (pendingShowDeclinedEvents)
  {
    uint64_t v18 = [(NSNumber *)pendingShowDeclinedEvents BOOLValue];
  }
  else
  {
    id v19 = [MEMORY[0x1E4F255C8] shared];
    uint64_t v18 = [v19 showDeclinedEvents];
  }
  [v15 setOn:v18];
}

- (void)_configureCompletedRemindersCell:(id)a3 indexPath:(id)a4 item:(id)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(EKCalendarChooserDefaultImpl *)self _preventDefaultCellSelectionBehavior:v6];
  id v7 = [v6 defaultContentConfiguration];
  uint64_t v8 = EventKitUIBundle();
  uint64_t v9 = [v8 localizedStringForKey:@"Show Completed Reminders" value:&stru_1F0CC2140 table:0];
  [v7 setText:v9];

  uint64_t v10 = [v7 textProperties];
  [v10 setNumberOfLines:0];

  [v6 setContentConfiguration:v7];
  [v6 setAccessibilityIdentifier:@"show-completed-reminders-cell"];
  uint64_t v11 = [v6 accessories];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    uint64_t v13 = [v6 accessories];
    long long v14 = [v13 firstObject];

    id v15 = [v14 customView];
  }
  else
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4FB1CD0]);
    [v15 setAccessibilityIdentifier:@"show-completed-reminders-switch"];
    [v15 addTarget:self action:sel_completedRemindersChanged forControlEvents:64];
    long long v14 = (void *)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v15 placement:1];
    v20[0] = v14;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    [v6 setAccessories:v16];
  }
  pendingShowCompletedReminders = self->_pendingShowCompletedReminders;
  if (pendingShowCompletedReminders)
  {
    uint64_t v18 = [(NSNumber *)pendingShowCompletedReminders BOOLValue];
  }
  else
  {
    id v19 = [MEMORY[0x1E4F255C8] shared];
    uint64_t v18 = [v19 showCompletedReminders];
  }
  [v15 setOn:v18];
}

- (void)_configureCalendarCell:(id)a3 indexPath:(id)a4 item:(id)a5
{
  v64[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v54 = a5;
  [(EKCalendarChooserDefaultImpl *)self _preventDefaultCellSelectionBehavior:v8];
  long long v56 = v9;
  v57 = -[EKCalendarChooserDefaultImpl _groupForSection:](self, "_groupForSection:", [v9 section]);
  uint64_t v10 = [v8 defaultContentConfiguration];
  [v10 setTextToSecondaryTextVerticalPadding:1.0];
  int64_t v11 = -[EKCalendarChooserDefaultImpl _rowIndex:toCalendarIndexInGroup:](self, "_rowIndex:toCalendarIndexInGroup:", [v9 row], v57);
  uint64_t v12 = [v57 calendarInfos];
  uint64_t v13 = [v12 objectAtIndex:v11];

  v58 = [v13 title];
  long long v14 = NSString;
  id v15 = [v13 calendar];
  v16 = [v15 source];
  uint64_t v17 = [v16 title];
  uint64_t v18 = [v14 stringWithFormat:@"calendarlist-cell:%@:%@", v17, v58];
  [v8 setAccessibilityIdentifier:v18];

  if ([v13 isSubscribed] && (objc_msgSend(v57, "isSubscribed") & 1) == 0)
  {
    long long v55 = [(id)objc_opt_class() _subscribedLocalizedString];
  }
  else if (([v13 isShared] & 1) != 0 || objc_msgSend(v13, "isPublished"))
  {
    long long v55 = [v13 stringForSharedCalendar];
  }
  else
  {
    if (![v13 isIntegration] || (objc_msgSend(v13, "isEnabled") & 1) != 0) {
      goto LABEL_11;
    }
    long long v55 = [(id)objc_opt_class() _disabledIntegrationLocalizedString];
  }
  if (v55)
  {
    objc_msgSend(v10, "setSecondaryText:");
    goto LABEL_12;
  }
LABEL_11:
  long long v55 = 0;
LABEL_12:
  if (*(unsigned char *)&self->_flags)
  {
    id v19 = [v13 calendar];
    id v20 = [v19 image];

    if ([v20 type] == 1
      && ([v20 name], (v21 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v22 = [MEMORY[0x1E4F57C18] sharedInstance];
      v23 = [v10 textProperties];
      int v24 = [v23 font];
      char v25 = [v22 symbolImage:v21 forFont:v24];
    }
    else
    {
      char v26 = [v13 calendar];
      uint64_t v27 = [v26 type];

      if (v27 != 4)
      {

        goto LABEL_21;
      }
      v21 = [MEMORY[0x1E4F57C18] sharedInstance];
      id v22 = [v10 textProperties];
      v23 = [v22 font];
      char v25 = [v21 birthdayImageForFont:v23];
    }

    v28 = CalendarAppTintColor();
    uint64_t v29 = [v25 flattenedImageWithColor:v28];

    if (v29)
    {
      id v30 = objc_alloc_init(MEMORY[0x1E4F28E48]);
      v31 = [MEMORY[0x1E4FB0870] textAttachmentWithImage:v29];
      id v32 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v31];
      [v30 appendAttributedString:v32];

      v33 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
      [v30 appendAttributedString:v33];

      id v34 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v58];
      [v30 appendAttributedString:v34];

      [v10 setAttributedText:v30];
      goto LABEL_22;
    }
  }
LABEL_21:
  [v10 setText:v58];
  uint64_t v29 = 0;
LABEL_22:
  if (([v13 isEnabled] & 1) == 0)
  {
    v35 = [MEMORY[0x1E4FB1618] labelColor];
    uint64_t v36 = [v35 colorWithAlphaComponent:0.5];
    uint64_t v37 = [v10 textProperties];
    [v37 setColor:v36];

    v38 = [MEMORY[0x1E4FB1618] labelColor];
    v39 = [v38 colorWithAlphaComponent:0.5];
    char v40 = [v10 secondaryTextProperties];
    [v40 setColor:v39];
  }
  if (!self->_style)
  {
    v42 = @"circlebadge.fill";
    goto LABEL_31;
  }
  int v41 = [v13 selected];
  if (![v13 isIntegration])
  {
    if (!v41) {
      goto LABEL_27;
    }
LABEL_30:
    v42 = @"checkmark.circle.fill";
    goto LABEL_31;
  }
  if ([v13 isEnabled] & v41) {
    goto LABEL_30;
  }
LABEL_27:
  v42 = @"circle";
LABEL_31:
  v43 = [MEMORY[0x1E4FB1818] systemImageNamed:v42];
  [v10 setImage:v43];

  if (*(unsigned char *)&self->_flags)
  {
    v44 = [v13 color];
    v45 = [v10 imageProperties];
    [v45 setTintColor:v44];

    if (([v13 isEnabled] & 1) == 0)
    {
      v46 = [v13 color];
      uint64_t v47 = [v46 colorWithAlphaComponent:0.5];
      BOOL v48 = [v10 imageProperties];
      [v48 setTintColor:v47];
    }
  }
  [v8 setContentConfiguration:v10];
  int64_t style = self->_style;
  if (style)
  {
    if (style == 1)
    {
      if ([(EKCalendarChooserDefaultImpl *)self _calendarAvailableForEditing:v13]
        && [(EKCalendarChooserDefaultImpl *)self showDetailAccessories])
      {
        id v50 = objc_alloc_init(MEMORY[0x1E4FB1510]);
        objc_initWeak(&location, self);
        v59[0] = MEMORY[0x1E4F143A8];
        v59[1] = 3221225472;
        v59[2] = __70__EKCalendarChooserDefaultImpl__configureCalendarCell_indexPath_item___block_invoke;
        v59[3] = &unk_1E60889F0;
        objc_copyWeak(&v61, &location);
        id v60 = v56;
        [v50 setActionHandler:v59];
        v64[0] = v50;
        long long v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:1];
        [v8 setAccessories:v51];

        objc_destroyWeak(&v61);
        objc_destroyWeak(&location);
      }
      else
      {
        [v8 setAccessories:MEMORY[0x1E4F1CBF0]];
      }
    }
  }
  else
  {
    id v52 = objc_alloc_init(MEMORY[0x1E4FB14F8]);
    objc_msgSend(v52, "setHidden:", objc_msgSend(v56, "isEqual:", self->_checkedRow) ^ 1);
    id v63 = v52;
    long long v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
    [v8 setAccessories:v53];
  }
  [(EKCalendarChooserDefaultImpl *)self _updateAppEntityAnnotationIfNeededForCalendarCell:v8 calendarInfo:v13];
}

void __70__EKCalendarChooserDefaultImpl__configureCalendarCell_indexPath_item___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _accessoryButtonTappedAtIndexPath:*(void *)(a1 + 32)];
}

- (void)_configureDelegateNameCell:(id)a3 indexPath:(id)a4 item:(id)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 row];
  if (v9 == [(EKCalendarChooserDefaultImpl *)self _rowIndexForMeDelegate])
  {
    uint64_t v10 = EventKitUIBundle();
    int64_t v11 = [v10 localizedStringForKey:@"My Calendar" value:&stru_1F0CC2140 table:0];

    int v12 = self->_limitedToSource == 0;
  }
  else
  {
    uint64_t v13 = -[NSArray objectAtIndex:](self->_delegateSources, "objectAtIndex:", -[EKCalendarChooserDefaultImpl _rowIndexToDelegateSourceIndex:](self, "_rowIndexToDelegateSourceIndex:", [v8 row]));
    int64_t v11 = CUIKDisplayedTitleForSource();
    int v12 = [v13 isEqual:self->_limitedToSource];
  }
  long long v14 = [v7 defaultContentConfiguration];
  [v14 setText:v11];
  [v7 setContentConfiguration:v14];
  if (v12)
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4FB14F8]);
    v17[0] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    [v7 setAccessories:v16];
  }
  else
  {
    [v7 setAccessories:MEMORY[0x1E4F1CBF0]];
  }
}

- (void)_configureFocusCell:(id)a3 indexPath:(id)a4 item:(id)a5
{
  id v6 = a3;
  [v6 setDelegate:self];
  id v7 = [(EKCalendarChooserDefaultImpl *)self delegate];
  objc_msgSend(v6, "setOn:", objc_msgSend(v7, "focusFilterMode") == 1);
}

- (void)_configureAccountErrorCell:(id)a3 indexPath:(id)a4 item:(id)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  [(EKCalendarChooserDefaultImpl *)self _preventDefaultCellSelectionBehavior:v7];
  uint64_t v9 = [v7 defaultContentConfiguration];
  uint64_t v10 = EventKitUIBundle();
  int64_t v11 = [v10 localizedStringForKey:@"Verify Account Information" value:&stru_1F0CC2140 table:0];
  [v9 setText:v11];

  int v12 = [(UICollectionView *)self->_collectionView tintColor];
  uint64_t v13 = [v9 textProperties];
  [v13 setColor:v12];

  long long v14 = [v9 textProperties];
  [v14 setAlignment:1];

  [v7 setContentConfiguration:v9];
  if (self->_displayStyle == 1000)
  {
    id v15 = [v7 defaultBackgroundConfiguration];
    v16 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_166];
    [v15 setBackgroundColor:v16];

    [v7 setBackgroundConfiguration:v15];
  }
  uint64_t v17 = -[EKCalendarChooserDefaultImpl _groupForSection:](self, "_groupForSection:", [v8 section]);
  if ([v17 showAccountErrorActionButtonSpinner])
  {
    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    [v18 startAnimating];
    id v19 = (void *)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v18 placement:1];
    v21[0] = v19;
    id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    [v7 setAccessories:v20];
  }
  else
  {
    [v7 setAccessories:MEMORY[0x1E4F1CBF0]];
  }
}

uint64_t __74__EKCalendarChooserDefaultImpl__configureAccountErrorCell_indexPath_item___block_invoke()
{
  return [MEMORY[0x1E4FB1618] systemBackgroundColor];
}

- (void)_configureFooterCell:(id)a3 indexPath:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4FB1948];
  id v7 = a4;
  id v8 = a3;
  id v12 = [v6 footerConfiguration];
  uint64_t v9 = [v7 section];

  uint64_t v10 = [(EKCalendarChooserDefaultImpl *)self _groupForSection:v9];
  int64_t v11 = [v10 footer];
  [v12 setText:v11];

  [v8 setContentConfiguration:v12];
}

- (void)_configureCollectionViewHeaderCell:(id)a3 indexPath:(id)a4
{
  id v5 = a3;
  id v12 = [v5 defaultContentConfiguration];
  id v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  id v7 = [v12 textProperties];
  [v7 setFont:v6];

  LODWORD(self) = [(EKCalendarChooserDefaultImpl *)self explanatoryTextMode];
  id v8 = EventKitUIBundle();
  uint64_t v9 = v8;
  if (self == 1) {
    uint64_t v10 = @"New events created outside of a specific calendar will default to this calendar.";
  }
  else {
    uint64_t v10 = @"New events created outside of a specific calendar for this delegate will default to this calendar.";
  }
  int64_t v11 = [v8 localizedStringForKey:v10 value:&stru_1F0CC2140 table:0];
  [v12 setText:v11];

  [v5 setContentConfiguration:v12];
}

- (void)_preventDefaultCellSelectionBehavior:(id)a3
{
}

void __69__EKCalendarChooserDefaultImpl__preventDefaultCellSelectionBehavior___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  [v5 setAutomaticallyUpdatesContentConfiguration:0];
  [v5 setAutomaticallyUpdatesBackgroundConfiguration:0];
  [v4 setSelected:0];
  id v6 = [v5 backgroundConfiguration];
  id v7 = [v6 updatedConfigurationForState:v4];
  [v5 setBackgroundConfiguration:v7];

  id v9 = [v5 contentConfiguration];
  id v8 = [v9 updatedConfigurationForState:v4];

  [v5 setContentConfiguration:v8];
}

- (void)_updateAppEntityAnnotationIfNeededForCalendarCell:(id)a3 calendarInfo:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  if (CalendarLinkLibraryCore())
  {
    id v6 = [v5 calendar];
    objc_msgSend(v7, "Cal_annotateWithCalendar:", v6);

    objc_msgSend(v7, "Cal_updateEntityAnnotationStateIsSelected:isHighlighted:isFocused:isDisabled:isEditing:isPrimary:", objc_msgSend(v5, "selected"), 0, 0, 0, 0, 0);
  }
}

- (void)setCollapsedSectionIdentifiers:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4)
  {
    id v5 = (NSSet *)v4;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CAD0] set];
  }
  collapsedSectionIdentifiers = self->_collapsedSectionIdentifiers;
  self->_collapsedSectionIdentifiers = v5;

  [(EKCalendarChooserDefaultImpl *)self _cleanupCollapsedSectionIdentifiers];
}

- (void)_cleanupCollapsedSectionIdentifiers
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  if ([(EKCalendarChooserDefaultImpl *)self _shouldShowIdentityChooser]) {
    [v3 addObject:@"CollectionViewRowIdentifierIdentitySwitcherHeader"];
  }
  id v4 = [(EKCalendarChooserDefaultImpl *)self _calendarHeaderRowIdentifierFromSectionIdentifier:@"CollectionViewSectionIdentifierOtherCalendarsGroup"];
  [v3 addObject:v4];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [(EKEventStore *)self->_eventStore sources];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v19 + 1) + 8 * v9) sourceIdentifier];
        int64_t v11 = [(EKCalendarChooserDefaultImpl *)self _calendarHeaderRowIdentifierFromSectionIdentifier:v10];

        [v3 addObject:v11];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  id v12 = (void *)[(NSSet *)self->_collapsedSectionIdentifiers mutableCopy];
  [v12 intersectSet:v3];
  if (([v12 isEqualToSet:self->_collapsedSectionIdentifiers] & 1) == 0)
  {
    uint64_t v13 = (NSSet *)[v12 copy];
    collapsedSectionIdentifiers = self->_collapsedSectionIdentifiers;
    self->_collapsedSectionIdentifiers = v13;

    id v15 = [(EKCalendarChooserDefaultImpl *)self delegate];
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      uint64_t v17 = [(EKCalendarChooserDefaultImpl *)self delegate];
      uint64_t v18 = [(EKCalendarChooserDefaultImpl *)self _ekCalendarChooser];
      [v17 calendarChooserCollapsedSectionIdentifiersDidChange:v18];
    }
  }
}

- (id)_calendarHeaderRowIdentifierFromSectionIdentifier:(id)a3
{
  return (id)[NSString stringWithFormat:@"calendar_header_%@", a3];
}

- (void)loadView
{
  uint64_t v3 = [(EKCalendarChooserDefaultImpl *)self _collectionViewLayout];
  id v4 = objc_alloc(MEMORY[0x1E4FB1568]);
  id v5 = (UICollectionView *)objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v3, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  collectionView = self->_collectionView;
  self->_collectionView = v5;

  objc_initWeak(location, self);
  uint64_t v7 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v8 = objc_opt_class();
  v95[0] = MEMORY[0x1E4F143A8];
  v95[1] = 3221225472;
  v95[2] = __40__EKCalendarChooserDefaultImpl_loadView__block_invoke;
  v95[3] = &unk_1E6088A38;
  objc_copyWeak(&v96, location);
  v57 = [v7 registrationWithCellClass:v8 configurationHandler:v95];
  uint64_t v9 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v10 = objc_opt_class();
  v93[0] = MEMORY[0x1E4F143A8];
  v93[1] = 3221225472;
  v93[2] = __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_2;
  v93[3] = &unk_1E6088A60;
  objc_copyWeak(&v94, location);
  long long v55 = [v9 registrationWithCellClass:v10 configurationHandler:v93];
  int64_t v11 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v12 = objc_opt_class();
  v91[0] = MEMORY[0x1E4F143A8];
  v91[1] = 3221225472;
  v91[2] = __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_3;
  v91[3] = &unk_1E6088A60;
  objc_copyWeak(&v92, location);
  long long v53 = [v11 registrationWithCellClass:v12 configurationHandler:v91];
  uint64_t v13 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v14 = objc_opt_class();
  v89[0] = MEMORY[0x1E4F143A8];
  v89[1] = 3221225472;
  v89[2] = __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_4;
  v89[3] = &unk_1E6088A38;
  objc_copyWeak(&v90, location);
  id v15 = [v13 registrationWithCellClass:v14 configurationHandler:v89];
  char v16 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v17 = objc_opt_class();
  v87[0] = MEMORY[0x1E4F143A8];
  v87[1] = 3221225472;
  v87[2] = __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_5;
  v87[3] = &unk_1E6088A38;
  objc_copyWeak(&v88, location);
  long long v51 = [v16 registrationWithCellClass:v17 configurationHandler:v87];
  uint64_t v18 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v19 = objc_opt_class();
  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_6;
  v85[3] = &unk_1E6088A38;
  objc_copyWeak(&v86, location);
  long long v49 = [v18 registrationWithCellClass:v19 configurationHandler:v85];
  BOOL v48 = (void *)v3;
  long long v20 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v21 = objc_opt_class();
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_7;
  v83[3] = &unk_1E6088A88;
  objc_copyWeak(&v84, location);
  long long v22 = [v20 registrationWithCellClass:v21 configurationHandler:v83];
  v23 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v24 = objc_opt_class();
  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_8;
  v81[3] = &unk_1E6088A38;
  objc_copyWeak(&v82, location);
  char v25 = [v23 registrationWithCellClass:v24 configurationHandler:v81];
  char v26 = (void *)MEMORY[0x1E4FB15F8];
  uint64_t v27 = objc_opt_class();
  uint64_t v28 = *MEMORY[0x1E4FB2760];
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_9;
  v79[3] = &unk_1E6088AB0;
  objc_copyWeak(&v80, location);
  uint64_t v29 = [v26 registrationWithSupplementaryClass:v27 elementKind:v28 configurationHandler:v79];
  id v30 = (void *)MEMORY[0x1E4FB15F8];
  uint64_t v31 = objc_opt_class();
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_10;
  v77[3] = &unk_1E6088AB0;
  objc_copyWeak(&v78, location);
  id v32 = [v30 registrationWithSupplementaryClass:v31 elementKind:@"COLLECTION_VIEW_HEADER_ELEMENT_KIND" configurationHandler:v77];
  id v33 = objc_alloc(MEMORY[0x1E4FB1598]);
  id v34 = self->_collectionView;
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_11;
  v66[3] = &unk_1E6088AD8;
  objc_copyWeak(&v76, location);
  id v58 = v57;
  id v67 = v58;
  id v56 = v55;
  id v68 = v56;
  id v47 = v22;
  id v69 = v47;
  v70 = self;
  id v35 = v15;
  id v71 = v35;
  id v52 = v51;
  id v72 = v52;
  id v36 = v49;
  id v73 = v36;
  id v37 = v25;
  id v74 = v37;
  id v54 = v53;
  id v75 = v54;
  v38 = (UICollectionViewDiffableDataSource *)[v33 initWithCollectionView:v34 cellProvider:v66];
  id v50 = v35;
  dataSource = self->_dataSource;
  self->_dataSource = v38;

  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_12;
  v63[3] = &unk_1E6088B00;
  id v40 = v29;
  id v64 = v40;
  id v41 = v32;
  id v65 = v41;
  [(UICollectionViewDiffableDataSource *)self->_dataSource setSupplementaryViewProvider:v63];
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_13;
  v61[3] = &unk_1E6088B28;
  objc_copyWeak(&v62, location);
  v42 = [(UICollectionViewDiffableDataSource *)self->_dataSource sectionSnapshotHandlers];
  [v42 setWillCollapseItemHandler:v61];

  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_14;
  v59[3] = &unk_1E6088B28;
  objc_copyWeak(&v60, location);
  v43 = [(UICollectionViewDiffableDataSource *)self->_dataSource sectionSnapshotHandlers];
  [v43 setWillExpandItemHandler:v59];

  [(EKCalendarChooserDefaultImpl *)self _updateDelegateSources];
  [(EKCalendarChooserDefaultImpl *)self _updateShowDelegateCalendarsCell];
  [(EKCalendarChooserDefaultImpl *)self _reloadCalendars];
  [(EKCalendarChooserDefaultImpl *)self _collectionViewBuildAndApplyNewSnapshotAnimated:1];
  [(UICollectionView *)self->_collectionView setDelegate:self];
  [(UICollectionView *)self->_collectionView setAutoresizingMask:18];
  [(UICollectionView *)self->_collectionView setAllowsFocus:self->_displayStyle != 1000];
  if (self->_shouldOverrideAuthorizationStatus)
  {
    uint64_t lastAuthorizationStatus = self->_lastAuthorizationStatus;
  }
  else
  {
    uint64_t lastAuthorizationStatus = [MEMORY[0x1E4F25550] realAuthorizationStatusForEntityType:self->_entityType];
    self->_uint64_t lastAuthorizationStatus = lastAuthorizationStatus;
  }
  if (lastAuthorizationStatus > 2)
  {
    [(EKCalendarChooserDefaultImpl *)self setView:self->_collectionView];
  }
  else
  {
    v45 = [(EKCalendarChooserDefaultImpl *)self accessDeniedView];
    [(EKCalendarChooserDefaultImpl *)self setView:v45];

    if (self->_lastAuthorizationStatus == 1)
    {
      v46 = [(EKCalendarChooserDefaultImpl *)self accessDeniedView];
      [v46 setMessage:@" "];
    }
  }
  objc_destroyWeak(&v60);
  objc_destroyWeak(&v62);

  objc_destroyWeak(&v76);
  objc_destroyWeak(&v78);

  objc_destroyWeak(&v80);
  objc_destroyWeak(&v82);

  objc_destroyWeak(&v84);
  objc_destroyWeak(&v86);

  objc_destroyWeak(&v88);
  objc_destroyWeak(&v90);

  objc_destroyWeak(&v92);
  objc_destroyWeak(&v94);

  objc_destroyWeak(&v96);
  objc_destroyWeak(location);
}

void __40__EKCalendarChooserDefaultImpl_loadView__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _configureHeaderCell:v9 indexPath:v8 item:v7];
}

void __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _configureDelegateNameCell:v9 indexPath:v8 item:v7];
}

void __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _configureCalendarCell:v9 indexPath:v8 item:v7];
}

void __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _configureDeclinedEventsCell:v9 indexPath:v8 item:v7];
}

void __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _configureCompletedRemindersCell:v9 indexPath:v8 item:v7];
}

void __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_6(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _configureDelegateButtonCell:v9 indexPath:v8 item:v7];
}

void __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _configureFocusCell:v9 indexPath:v8 item:v7];
}

void __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_8(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _configureAccountErrorCell:v9 indexPath:v8 item:v7];
}

void __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_9(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _configureFooterCell:v7 indexPath:v6];
}

void __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_10(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _configureCollectionViewHeaderCell:v7 indexPath:v6];
}

id __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_11(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  if (![v8 row]
    && objc_msgSend(WeakRetained, "_sectionHasHeader:", objc_msgSend(v8, "section")))
  {
    uint64_t v11 = *(void *)(a1 + 32);
LABEL_16:
    uint64_t v12 = [v7 dequeueConfiguredReusableCellWithRegistration:v11 forIndexPath:v8 item:v9];
    goto LABEL_17;
  }
  if (objc_msgSend(WeakRetained, "_isIdentityChooserSection:", objc_msgSend(v8, "section")))
  {
    uint64_t v11 = *(void *)(a1 + 40);
    goto LABEL_16;
  }
  if (objc_msgSend(WeakRetained, "_isFocusBannerSection:", objc_msgSend(v8, "section")))
  {
    uint64_t v11 = *(void *)(a1 + 48);
    goto LABEL_16;
  }
  if (objc_msgSend(WeakRetained, "_isDeclinedEventsSwitchSection:", objc_msgSend(v8, "section"))
    && ![v8 row]
    && [*(id *)(a1 + 56) showsDeclinedEventsSetting])
  {
    uint64_t v11 = *(void *)(a1 + 64);
    goto LABEL_16;
  }
  if (objc_msgSend(WeakRetained, "_isDeclinedEventsSwitchSection:", objc_msgSend(v8, "section")))
  {
    uint64_t v11 = *(void *)(a1 + 72);
    goto LABEL_16;
  }
  if (objc_msgSend(WeakRetained, "_isDelegateCalendarsButtonSection:", objc_msgSend(v8, "section")))
  {
    uint64_t v11 = *(void *)(a1 + 80);
    goto LABEL_16;
  }
  uint64_t v14 = objc_msgSend(WeakRetained, "_groupForSection:", objc_msgSend(v8, "section"));
  uint64_t v15 = [WeakRetained _accountErrorActionRowIndexForGroup:v14];
  uint64_t v16 = [v8 row];
  uint64_t v17 = 96;
  if (v15 == v16) {
    uint64_t v17 = 88;
  }
  uint64_t v12 = [v7 dequeueConfiguredReusableCellWithRegistration:*(void *)(a1 + v17) forIndexPath:v8 item:v9];

LABEL_17:

  return v12;
}

id __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_12(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = *MEMORY[0x1E4FB2760];
  id v8 = a4;
  id v9 = a2;
  int v10 = [a3 isEqualToString:v7];
  uint64_t v11 = 40;
  if (v10) {
    uint64_t v11 = 32;
  }
  uint64_t v12 = [v9 dequeueConfiguredReusableSupplementaryViewWithRegistration:*(void *)(a1 + v11) forIndexPath:v8];

  return v12;
}

void __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_13(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [WeakRetained collapsedSectionIdentifiers];
  id v5 = [v4 setByAddingObject:v3];

  [WeakRetained setCollapsedSectionIdentifiers:v5];
  id v6 = [WeakRetained delegate];
  LOBYTE(v3) = objc_opt_respondsToSelector();

  if (v3)
  {
    uint64_t v7 = [WeakRetained delegate];
    id v8 = [WeakRetained _ekCalendarChooser];
    [v7 calendarChooserCollapsedSectionIdentifiersDidChange:v8];
  }
}

void __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_14(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = [WeakRetained collapsedSectionIdentifiers];
  id v5 = (void *)[(id)v4 mutableCopy];

  [v5 removeObject:v3];
  id v6 = (void *)[v5 copy];
  [WeakRetained setCollapsedSectionIdentifiers:v6];

  uint64_t v7 = [WeakRetained delegate];
  LOBYTE(v4) = objc_opt_respondsToSelector();

  if (v4)
  {
    id v8 = [WeakRetained delegate];
    id v9 = [WeakRetained _ekCalendarChooser];
    [v8 calendarChooserCollapsedSectionIdentifiersDidChange:v9];
  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)EKCalendarChooserDefaultImpl;
  [(EKCalendarChooserDefaultImpl *)&v5 viewIsAppearing:a3];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__EKCalendarChooserDefaultImpl_viewIsAppearing___block_invoke;
  v4[3] = &unk_1E6088B50;
  v4[4] = self;
  [MEMORY[0x1E4F25568] requestFamilyShareesWithCompletion:v4];
}

uint64_t __48__EKCalendarChooserDefaultImpl_viewIsAppearing___block_invoke(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1040) = [a2 count] != 0;
  id v3 = *(void **)(a1 + 32);

  return [v3 _updateOrCreateAddCalendarBarButtonItem];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)EKCalendarChooserDefaultImpl;
  [(EKCalendarChooserDefaultImpl *)&v8 viewWillAppear:a3];
  if (self->_eventStore)
  {
    [(EKCalendarChooserDefaultImpl *)self _updateCurrentKnownCalendarIds];
    uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:self selector:sel__eventStoreChanged_ name:*MEMORY[0x1E4F25460] object:self->_eventStore];

    objc_super v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:self selector:sel__ignoredErrorsChanged name:*MEMORY[0x1E4F57A70] object:0];

    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:self selector:sel__showDeclinedEventsChanged_ name:@"com.apple.mobilecal.showdeclinedchanged" object:0];

    uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:self selector:sel__showCompletedRemindersChanged_ name:@"com.apple.mobilecal.showCompletedRemindersChanged" object:0];

    [MEMORY[0x1E4F576F8] addObserver:self selector:sel__eventStoreChangedExternally name:@"com.apple.suggestions.settingsChanged"];
  }
  [(EKCalendarChooserDefaultImpl *)self _layoutNavToolbarControls];
  [(EKCalendarChooserDefaultImpl *)self _collectionViewBuildAndApplyNewSnapshotAnimated:1];
  [(EKCalendarChooserDefaultImpl *)self _updateViewControllerTitle];
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)EKCalendarChooserDefaultImpl;
  [(EKCalendarChooserDefaultImpl *)&v31 viewDidAppear:a3];
  uint64_t v4 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
  {
    objc_super v5 = v4;
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138543362;
    id v33 = v7;
    _os_log_impl(&dword_1B3F4C000, v5, OS_LOG_TYPE_INFO, "[UserStateLog] State -> %{public}@ viewDidAppear", buf, 0xCu);
  }
  objc_super v8 = [MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = [(EKCalendarChooserDefaultImpl *)self _allCalendars];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [*(id *)(*((void *)&v27 + 1) + 8 * v13) calendarIdentifier];
        [v8 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v37 count:16];
    }
    while (v11);
  }

  uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v16 = [(EKCalendarChooserDefaultImpl *)self selectedCalendars];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v36 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = [*(id *)(*((void *)&v23 + 1) + 8 * v20) calendarIdentifier];
        [v15 addObject:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v36 count:16];
    }
    while (v18);
  }

  long long v22 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v33 = v8;
    __int16 v34 = 2114;
    id v35 = v15;
    _os_log_impl(&dword_1B3F4C000, v22, OS_LOG_TYPE_INFO, "[UserStateLog] State -> allVisibleCalendars = %{public}@, selectedCalendars = %{public}@", buf, 0x16u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x1E4F25460] object:0];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x1E4F57A70] object:0];

  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 removeObserver:self name:@"com.apple.mobilecal.showdeclinedchanged" object:0];

  [MEMORY[0x1E4F576F8] removeObserver:self name:@"com.apple.suggestions.settingsChanged"];
  v8.receiver = self;
  v8.super_class = (Class)EKCalendarChooserDefaultImpl;
  [(EKCalendarChooserDefaultImpl *)&v8 viewWillDisappear:v3];
}

- (void)resetBackgroundColor
{
  BOOL v3 = [(UIViewController *)self isPresentedInsidePopover];
  collectionView = self->_collectionView;
  if (v3) {
    [MEMORY[0x1E4FB1618] clearColor];
  }
  else {
  id v5 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  }
  [(UICollectionView *)collectionView setBackgroundColor:v5];
}

- (BOOL)hasAccountThatCanCreateCalendars
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  limitedToSource = self->_limitedToSource;
  if (limitedToSource && ![(EKSource *)limitedToSource isWritable])
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v4 = [(EKEventStore *)self->_eventStore sources];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v4);
          }
          objc_super v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          if ([v8 supportsCalendarCreation] && objc_msgSend(v8, "sourceType") != 4)
          {
            LOBYTE(v5) = 1;
            goto LABEL_14;
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  return v5;
}

+ (id)showAllString
{
  v2 = EventKitUIBundle();
  BOOL v3 = [v2 localizedStringForKey:@"Show All" value:&stru_1F0CC2140 table:0];

  return v3;
}

+ (id)hideAllString
{
  v2 = EventKitUIBundle();
  BOOL v3 = [v2 localizedStringForKey:@"Hide All" value:&stru_1F0CC2140 table:0];

  return v3;
}

+ (id)delegatesString
{
  v2 = EventKitUIBundle();
  BOOL v3 = [v2 localizedStringForKey:@"View Calendar:" value:&stru_1F0CC2140 table:0];

  return v3;
}

- (void)showAllButtonPressed
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = @"show";
  BOOL v3 = [NSNumber numberWithInt:(*(unsigned char *)&self->_flags & 2) == 0];
  v6[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  CalAnalyticsSendEvent();

  [(EKCalendarChooserDefaultImpl *)self _selectAllCalendarsAndNotify:1];
}

- (void)_selectAllCalendarsAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  [(EKCalendarChooserDefaultImpl *)self _selectAllCalendarsAndStores:(*(unsigned char *)&self->_flags & 2) == 0];
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_super v8 = [(EKCalendarChooserDefaultImpl *)self _ekCalendarChooser];
      [v7 calendarChooserSelectionDidChange:v8];
    }
  }

  [(EKCalendarChooserDefaultImpl *)self _collectionViewBuildAndApplyNewSnapshotAnimated:1 completion:0];
}

- (void)setAllSelected:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    char v5 = 2;
  }
  else {
    char v5 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v5;
  char v6 = objc_opt_class();
  if (v3) {
    [v6 hideAllString];
  }
  else {
  id v7 = [v6 showAllString];
  }
  objc_super v8 = [(EKCalendarChooserDefaultImpl *)self showAllButton];
  [v8 setTitle:v7];

  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    id v9 = @"hide-all-button";
  }
  else {
    id v9 = @"show-all-button";
  }
  id v10 = [(EKCalendarChooserDefaultImpl *)self showAllButton];
  [v10 setAccessibilityIdentifier:v9];
}

- (BOOL)allSelected
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)openAddRegularCalendarWithTitle:(id)a3
{
  if (!self->_presentedEditor)
  {
    id v4 = a3;
    char v5 = [[EKCalendarEditor alloc] initWithCalendar:0 eventStore:self->_eventStore entityType:self->_entityType limitedToSource:self->_limitedToSource];
    [(EKCalendarEditor *)v5 setPrefillCalendarTitle:v4];

    [(EKAbstractCalendarEditor *)v5 setDelegate:self];
    presentedEditor = self->_presentedEditor;
    self->_presentedEditor = &v5->super;
    id v7 = v5;

    [(EKCalendarChooserDefaultImpl *)self _commonAddCalendarButtonPressed:self->_addCalendarButton];
  }
}

- (void)showCalendar:(id)a3 enableDoneInitially:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 isSubscribed])
  {
    id v7 = [EKSubscribedCalendarEditor alloc];
    eventStore = self->_eventStore;
    limitedToSource = self->_limitedToSource;
    id v10 = v6;
    unint64_t entityType = 0;
  }
  else
  {
    id v7 = [EKCalendarEditor alloc];
    eventStore = self->_eventStore;
    unint64_t entityType = self->_entityType;
    limitedToSource = self->_limitedToSource;
    id v10 = v6;
  }
  long long v12 = [(EKAbstractCalendarEditor *)v7 initWithCalendar:v10 eventStore:eventStore entityType:entityType limitedToSource:limitedToSource enableDoneInitially:v4];

  [(EKCalendarChooserDefaultImpl *)self _presentEditor:v12 animated:1 completion:0];
}

- (void)addCalendarButtonPressed:(id)a3
{
  id v6 = a3;
  BOOL v4 = [[EKCalendarEditor alloc] initWithCalendar:0 eventStore:self->_eventStore entityType:self->_entityType limitedToSource:self->_limitedToSource];
  [(EKAbstractCalendarEditor *)v4 setDelegate:self];
  presentedEditor = self->_presentedEditor;
  self->_presentedEditor = &v4->super;

  [(EKCalendarChooserDefaultImpl *)self _commonAddCalendarButtonPressed:v6];
}

- (void)addFamilyCalendarButtonPressed:(id)a3
{
  eventStore = self->_eventStore;
  id v7 = a3;
  char v5 = +[EKCalendarEditor newFamilyCalendarEditorWithEventStore:eventStore];
  [(EKAbstractCalendarEditor *)v5 setDelegate:self];
  presentedEditor = self->_presentedEditor;
  self->_presentedEditor = v5;

  [(EKCalendarChooserDefaultImpl *)self _commonAddCalendarButtonPressed:v7];
}

- (void)showAddSubscribedCalendarWithURL:(id)a3
{
}

- (void)addSubscribedCalendarButtonPressed:(id)a3 prefillURL:(id)a4
{
  id v6 = a4;
  id v9 = a3;
  id v7 = [[EKSubscribedCalendarEditor alloc] initWithCalendar:0 eventStore:self->_eventStore entityType:0 limitedToSource:self->_limitedToSource];
  [(EKSubscribedCalendarEditor *)v7 setPrefillURL:v6];

  [(EKAbstractCalendarEditor *)v7 setDelegate:self];
  presentedEditor = self->_presentedEditor;
  self->_presentedEditor = &v7->super;

  [(EKCalendarChooserDefaultImpl *)self _commonAddCalendarButtonPressed:v9];
}

- (void)addHolidayCalendarButtonPressed:(id)a3
{
  id v6 = a3;
  CalAnalyticsSendEvent();
  BOOL v4 = [[EKAddHolidayCalendarEditor alloc] initWithCalendar:0 eventStore:self->_eventStore entityType:0 limitedToSource:self->_limitedToSource];
  [(EKAbstractCalendarEditor *)v4 setDelegate:self];
  presentedEditor = self->_presentedEditor;
  self->_presentedEditor = &v4->super;

  [(EKCalendarChooserDefaultImpl *)self _commonAddCalendarButtonPressed:v6];
}

- (void)_commonAddCalendarButtonPressed:(id)a3
{
  id v12 = a3;
  BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:self->_presentedEditor];
  char v5 = v4;
  if (self->_displayStyle == 1000)
  {
    [v4 setModalPresentationStyle:7];
    [v5 _setClipUnderlapWhileTransitioning:1];
    id v6 = [v5 popoverPresentationController];
    [v6 setBarButtonItem:v12];
  }
  else
  {
    id v6 = [(EKCalendarChooserDefaultImpl *)self view];
    if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v6))
    {
      id v7 = [(EKCalendarChooserDefaultImpl *)self view];
      BOOL IsRegular = EKUICurrentHeightSizeClassIsRegular(v7);

      if (!IsRegular) {
        goto LABEL_7;
      }
      [v5 setModalPresentationStyle:6];
      id v6 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
      id v9 = [v5 view];
      [v9 setBackgroundColor:v6];
    }
  }

LABEL_7:
  id v10 = [v5 presentationController];
  [v10 setDelegate:self];

  long long v11 = [(EKCalendarChooserDefaultImpl *)self navigationController];
  [v11 presentViewController:v5 animated:1 completion:0];
}

- (void)_updateViewControllerTitle
{
  if ([(EKCalendarChooserDefaultImpl *)self _shouldShowIdentityChooser])
  {
    if (self->_limitedToSource)
    {
      BOOL v3 = -[EKCalendarChooserDefaultImpl _contactForSource:](self, "_contactForSource:");
      BOOL v4 = EventKitUIBundle();
      char v5 = [v4 localizedStringForKey:@"%@’s Calendar" value:&stru_1F0CC2140 table:0];

      id v6 = [MEMORY[0x1E4F1B910] stringFromContact:v3 style:1000];
      if (v6) {
        objc_msgSend(NSString, "localizedStringWithFormat:", v5, v6);
      }
      else {
        CUIKDisplayedTitleForSource();
      }
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v3 = EventKitUIBundle();
      id v12 = [v3 localizedStringForKey:@"My Calendar" value:&stru_1F0CC2140 table:0];
    }
  }
  else
  {
    BOOL v3 = [(EKCalendarChooserDefaultImpl *)self view];
    BOOL IsCompactInViewHierarchy = EKUICurrentWidthSizeClassIsCompactInViewHierarchy(v3);
    objc_super v8 = EventKitUIBundle();
    id v9 = v8;
    if (IsCompactInViewHierarchy) {
      id v10 = @"Calendars";
    }
    else {
      id v10 = @"Show Calendars";
    }
    id v12 = [v8 localizedStringForKey:v10 value:&stru_1F0CC2140 table:0];
  }
  [(EKCalendarChooserDefaultImpl *)self setTitle:v12];
  long long v11 = [(EKCalendarChooserDefaultImpl *)self _ekCalendarChooser];
  [v11 setTitle:v12];
}

- (id)_contactForSource:(id)a3
{
  id v4 = a3;
  char v5 = [v4 ownerAddresses];
  id v6 = [(EKCalendarChooserDefaultImpl *)self _preferredAddressFromOwnerAddresses:v5];

  id v7 = CUIKDisplayedTitleForSource();

  objc_super v8 = +[ContactsUtils defaultContactKeysToFetch];
  id v9 = +[ContactsUtils contactForAddress:v6 fullName:v7 firstName:0 lastName:0 keysToFetch:v8];

  return v9;
}

- (id)_preferredAddressFromOwnerAddresses:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v4)
  {
    id v9 = 0;
    goto LABEL_15;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v13;
  while (2)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v13 != v6) {
        objc_enumerationMutation(v3);
      }
      objc_super v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
      if (objc_msgSend(v8, "hasMailto", (void)v12))
      {
        uint64_t v10 = [v8 stringRemovingMailto];
LABEL_14:
        id v9 = (void *)v10;
        goto LABEL_15;
      }
      if ([v8 hasTel])
      {
        uint64_t v10 = [v8 stringRemovingTel];
        goto LABEL_14;
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    id v9 = 0;
    if (v5) {
      continue;
    }
    break;
  }
LABEL_15:

  return v9;
}

- (BOOL)_shouldShowAddHolidayCalendarMenuItem
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [(EKEventStore *)self->_eventStore sources];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (([v9 isDelegate] & 1) == 0 && objc_msgSend(v9, "sourceType")) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [MEMORY[0x1E4F57B18] sharedInstance];
  char v11 = [v10 haveiCloudCalendarAccountInSources:v3];

  return v11;
}

- (void)_layoutNavToolbarControls
{
  id v33 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
  char flags = (char)self->_flags;
  if ((flags & 0x20) != 0 && !self->_refreshControl)
  {
    uint64_t v4 = (UIRefreshControl *)objc_alloc_init(MEMORY[0x1E4FB1B58]);
    [(UIRefreshControl *)v4 addTarget:self action:sel__pulledToRefresh_ forControlEvents:4096];
    [(UICollectionView *)self->_collectionView setRefreshControl:v4];
    refreshControl = self->_refreshControl;
    self->_refreshControl = v4;

    char flags = (char)self->_flags;
  }
  if ((flags & 8) != 0)
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancel_];
    [v6 setAccessibilityIdentifier:@"cancel-button"];
    [v33 addObject:v6];

    char flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_done_];
    [v7 setAccessibilityIdentifier:@"done-button"];
    [v33 addObject:v7];
  }
  if ([v33 count])
  {
    objc_super v8 = [v33 lastObject];
    id v9 = [(EKCalendarChooserDefaultImpl *)self navigationItem];
    [v9 setRightBarButtonItem:v8];

    [v33 removeLastObject];
  }
  if ([v33 count])
  {
    uint64_t v10 = [v33 lastObject];
    char v11 = [(EKCalendarChooserDefaultImpl *)self navigationItem];
    [v11 setLeftBarButtonItem:v10];

    [v33 removeLastObject];
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v33 count])
  {
    long long v13 = [v33 lastObject];
    [v12 addObject:v13];

    [v33 removeLastObject];
    long long v14 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    [v12 addObject:v14];
  }
  if (![(EKCalendarChooserDefaultImpl *)self disableCalendarEditing]
    && [(EKCalendarChooserDefaultImpl *)self hasAccountThatCanCreateCalendars])
  {
    [(EKCalendarChooserDefaultImpl *)self _updateOrCreateAddCalendarBarButtonItem];
    [v12 addObject:self->_addCalendarButton];
    long long v15 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    [v12 addObject:v15];
  }
  [(EKCalendarChooserDefaultImpl *)self _applySelection];
  if (self->_style == 1)
  {
    if (![v12 count])
    {
      long long v16 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
      [v12 addObject:v16];
    }
    char v17 = (char)self->_flags;
    uint64_t v18 = objc_opt_class();
    if ((v17 & 2) != 0) {
      [v18 hideAllString];
    }
    else {
    uint64_t v19 = [v18 showAllString];
    }
    uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v19 style:0 target:self action:sel_showAllButtonPressed];
    [(EKCalendarChooserDefaultImpl *)self setShowAllButton:v20];

    uint64_t v21 = [(EKCalendarChooserDefaultImpl *)self showAllButton];
    [v12 addObject:v21];

    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      long long v22 = @"hide-all-button";
    }
    else {
      long long v22 = @"show-all-button";
    }
    long long v23 = [(EKCalendarChooserDefaultImpl *)self showAllButton];
    [v23 setAccessibilityIdentifier:v22];

    long long v24 = (void *)MEMORY[0x1E4F1CAD0];
    long long v25 = [(id)objc_opt_class() showAllString];
    long long v26 = [(id)objc_opt_class() hideAllString];
    long long v27 = objc_msgSend(v24, "setWithObjects:", v25, v26, 0);
    long long v28 = [(EKCalendarChooserDefaultImpl *)self showAllButton];
    [v28 setPossibleTitles:v27];
  }
  if ([v12 count])
  {
    long long v29 = [(EKCalendarChooserDefaultImpl *)self navigationController];
    [v29 setToolbarHidden:0];

    [(EKCalendarChooserDefaultImpl *)self setToolbarItems:v12 animated:1];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int v31 = [WeakRetained conformsToProtocol:&unk_1F0DA0E68];

    if (v31)
    {
      id v32 = objc_loadWeakRetained((id *)&self->_delegate);
      [v32 calendarChooserUpdatedToolbarItems];
    }
  }
  -[UICollectionView sizeThatFits:](self->_collectionView, "sizeThatFits:", EKUIContainedControllerIdealWidth(), 600.0);
  -[EKCalendarChooserDefaultImpl setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)_updateOrCreateAddCalendarBarButtonItem
{
  v56[1] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F57700] currentProcessIsFirstPartyCalendarApp])
  {
    objc_initWeak(&location, self);
    v45 = [MEMORY[0x1E4F1CA48] array];
    if ([(EKCalendarChooserDefaultImpl *)self _shouldShowAddHolidayCalendarMenuItem])
    {
      id v3 = (void *)MEMORY[0x1E4FB13F0];
      uint64_t v4 = EventKitUIBundle();
      uint64_t v5 = [v4 localizedStringForKey:@"Add Holiday Calendar - menu action" value:@"Add Holiday Calendar" table:0];
      uint64_t v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"calendar.badge.plus"];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __71__EKCalendarChooserDefaultImpl__updateOrCreateAddCalendarBarButtonItem__block_invoke;
      v52[3] = &unk_1E6088B78;
      objc_copyWeak(&v53, &location);
      uint64_t v7 = [v3 actionWithTitle:v5 image:v6 identifier:0 handler:v52];

      [v7 setAccessibilityIdentifier:@"add-holiday-calendar-menubutton"];
      [v45 addObject:v7];

      objc_destroyWeak(&v53);
    }
    objc_super v8 = (void *)MEMORY[0x1E4FB13F0];
    id v9 = EventKitUIBundle();
    uint64_t v10 = [v9 localizedStringForKey:@"Add Subscription Calendar" value:&stru_1F0CC2140 table:0];
    char v11 = [MEMORY[0x1E4FB1818] systemImageNamed:@"badge.plus.radiowaves.forward"];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __71__EKCalendarChooserDefaultImpl__updateOrCreateAddCalendarBarButtonItem__block_invoke_2;
    v50[3] = &unk_1E6088B78;
    objc_copyWeak(&v51, &location);
    v44 = [v8 actionWithTitle:v10 image:v11 identifier:0 handler:v50];

    [v44 setAccessibilityIdentifier:@"add-subscription-calendar-menubutton"];
    [v45 addObject:v44];
    id v12 = [(EKEventStore *)self->_eventStore primaryAppleAccountSource];
    BOOL v13 = v12 == 0;

    if (!v13 && self->_hasIcloudFamilyMembers)
    {
      long long v14 = (void *)MEMORY[0x1E4FB13F0];
      long long v15 = EventKitUIBundle();
      long long v16 = [v15 localizedStringForKey:@"Add Family Calendar Menu Button" value:@"Add Family Calendar" table:0];
      char v17 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.icloud"];
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __71__EKCalendarChooserDefaultImpl__updateOrCreateAddCalendarBarButtonItem__block_invoke_3;
      v48[3] = &unk_1E6088B78;
      objc_copyWeak(&v49, &location);
      uint64_t v18 = [v14 actionWithTitle:v16 image:v17 identifier:0 handler:v48];

      [v45 addObject:v18];
      objc_destroyWeak(&v49);
    }
    uint64_t v19 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v20 = EventKitUIBundle();
    uint64_t v21 = [v20 localizedStringForKey:@"Add Calendar Menu Button" value:@"Add Calendar" table:0];
    long long v22 = [MEMORY[0x1E4FB1818] systemImageNamed:@"calendar.badge.plus"];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __71__EKCalendarChooserDefaultImpl__updateOrCreateAddCalendarBarButtonItem__block_invoke_4;
    v46[3] = &unk_1E6088B78;
    objc_copyWeak(&v47, &location);
    long long v23 = [v19 actionWithTitle:v21 image:v22 identifier:0 handler:v46];

    [v23 setAccessibilityIdentifier:@"add-calendar-menubutton"];
    long long v24 = (void *)MEMORY[0x1E4FB1970];
    v56[0] = v23;
    long long v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:1];
    long long v26 = [v24 menuWithTitle:&stru_1F0CC2140 image:0 identifier:0 options:1 children:v25];

    long long v27 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F0CC2140 image:0 identifier:0 options:1 children:v45];
    long long v28 = (void *)MEMORY[0x1E4FB1970];
    v55[0] = v27;
    v55[1] = v26;
    long long v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
    long long v30 = [v28 menuWithChildren:v29];

    addCalendarButton = self->_addCalendarButton;
    if (addCalendarButton)
    {
      [(UIBarButtonItem *)addCalendarButton setMenu:v30];
    }
    else
    {
      id v38 = objc_alloc(MEMORY[0x1E4FB14A8]);
      v39 = EventKitUIBundle();
      id v40 = [v39 localizedStringForKey:@"Add Calendar" value:&stru_1F0CC2140 table:0];
      uint64_t v41 = [v38 initWithTitle:v40 menu:v30];
      p_addCalendarButton = (id *)&self->_addCalendarButton;
      id v43 = *p_addCalendarButton;
      id *p_addCalendarButton = (id)v41;

      [*p_addCalendarButton setAccessibilityIdentifier:@"add-calendar-button"];
    }

    objc_destroyWeak(&v47);
    objc_destroyWeak(&v51);

    objc_destroyWeak(&location);
  }
  else if (!self->_addCalendarButton)
  {
    id v32 = objc_alloc(MEMORY[0x1E4FB14A8]);
    id v33 = EventKitUIBundle();
    __int16 v34 = [v33 localizedStringForKey:@"Add Calendar" value:&stru_1F0CC2140 table:0];
    id v35 = (UIBarButtonItem *)[v32 initWithTitle:v34 style:0 target:self action:sel_addCalendarButtonPressed_];
    id v36 = self->_addCalendarButton;
    self->_addCalendarButton = v35;

    id v37 = self->_addCalendarButton;
    [(UIBarButtonItem *)v37 setAccessibilityIdentifier:@"add-calendar-button"];
  }
}

void __71__EKCalendarChooserDefaultImpl__updateOrCreateAddCalendarBarButtonItem__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained addHolidayCalendarButtonPressed:WeakRetained[128]];
    id WeakRetained = v2;
  }
}

void __71__EKCalendarChooserDefaultImpl__updateOrCreateAddCalendarBarButtonItem__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained addSubscribedCalendarButtonPressed:WeakRetained[128] prefillURL:0];
    id WeakRetained = v2;
  }
}

void __71__EKCalendarChooserDefaultImpl__updateOrCreateAddCalendarBarButtonItem__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained addFamilyCalendarButtonPressed:WeakRetained[128]];
    id WeakRetained = v2;
  }
}

void __71__EKCalendarChooserDefaultImpl__updateOrCreateAddCalendarBarButtonItem__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained addCalendarButtonPressed:WeakRetained[128]];
    id WeakRetained = v2;
  }
}

- (id)_viewModeTitle
{
  v2 = [(EKCalendarChooserDefaultImpl *)self view];
  BOOL IsCompactInViewHierarchy = EKUICurrentWidthSizeClassIsCompactInViewHierarchy(v2);
  uint64_t v4 = EventKitUIBundle();
  uint64_t v5 = v4;
  if (IsCompactInViewHierarchy) {
    uint64_t v6 = @"Calendars";
  }
  else {
    uint64_t v6 = @"Show Calendars";
  }
  uint64_t v7 = [v4 localizedStringForKey:v6 value:&stru_1F0CC2140 table:0];

  return v7;
}

- (CGSize)preferredContentSize
{
  collectionView = self->_collectionView;
  double v3 = EKUIContainedControllerIdealWidth();

  -[UICollectionView sizeThatFits:](collectionView, "sizeThatFits:", v3, 1100.0);
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)setChooserMode:(int64_t)a3
{
  if (a3 == 1 && self->_style)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"EKCalendarChooserDefaultImpl.m" lineNumber:1438 description:@"Import mode must use single selection style."];
  }
  self->_chooserMode = a3;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(EKCalendarChooserDefaultImpl *)self view];
  BOOL IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v2);

  if (IsRegularInViewHierarchy) {
    return 30;
  }
  else {
    return 2;
  }
}

- (BOOL)showsDoneButton
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)setShowsDoneButton:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)showsCancelButton
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (void)setShowsCancelButton:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)disableCalendarsUnselectedByFocus
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (void)setDisableCalendarsUnselectedByFocus:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3)
  {
LABEL_5:
    char flags = (char)self->_flags;
    if (((((flags & 0x40) == 0) ^ v3) & 1) == 0)
    {
      if (v3) {
        char v10 = 64;
      }
      else {
        char v10 = 0;
      }
      *(unsigned char *)&self->_char flags = flags & 0xBF | v10;
    }
    return;
  }
  double v5 = [(EKCalendarChooserDefaultImpl *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v6 = [(EKCalendarChooserDefaultImpl *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_11:
    goto LABEL_12;
  }
  uint64_t v7 = [(EKCalendarChooserDefaultImpl *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8) {
    goto LABEL_5;
  }
LABEL_12:
  char v11 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl(&dword_1B3F4C000, v11, OS_LOG_TYPE_ERROR, "Attempted to disable calendars unselected by focus, but the delegate does not implement the required methods", v12, 2u);
  }
}

- (void)focusModeConfigurationChanged
{
}

- (void)_showDeclinedEventsChanged:(id)a3
{
  pendingShowDeclinedEvents = self->_pendingShowDeclinedEvents;
  self->_pendingShowDeclinedEvents = 0;

  [(EKCalendarChooserDefaultImpl *)self _reconfigureIdentifierInCollectionView:@"CollectionViewRowIdentifierDeclinedEvents"];
}

- (void)_showCompletedRemindersChanged:(id)a3
{
  pendingShowCompletedReminders = self->_pendingShowCompletedReminders;
  self->_pendingShowCompletedReminders = 0;

  [(EKCalendarChooserDefaultImpl *)self _reconfigureIdentifierInCollectionView:@"CollectionViewRowIdentifierCompletedReminders"];
}

- (BOOL)allowsPullToRefresh
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (void)setAllowsPullToRefresh:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_eventStore)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"EKCalendarChooserDefaultImpl.m" lineNumber:1508 description:@"The event store must be set before enabling pull-to-refresh"];
  }
  if (v3) {
    char v5 = 32;
  }
  else {
    char v5 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xDF | v5;
}

- (void)cancel:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained;
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v10 = objc_loadWeakRetained((id *)p_delegate);
      id v9 = [(EKCalendarChooserDefaultImpl *)self _ekCalendarChooser];
      [v10 calendarChooserDidCancel:v9];
    }
  }
}

- (void)done:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained;
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v10 = objc_loadWeakRetained((id *)p_delegate);
      id v9 = [(EKCalendarChooserDefaultImpl *)self _ekCalendarChooser];
      [v10 calendarChooserDidFinish:v9];
    }
  }
}

- (void)refresh:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained;
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)p_delegate);
      id v10 = [v9 refreshCalendarsButtonPressed];
      currentAccountRefresher = self->_currentAccountRefresher;
      self->_currentAccountRefresher = v10;

      [(EKAccountRefresher *)self->_currentAccountRefresher setDelegate:self];
      if (([(EKAccountRefresher *)self->_currentAccountRefresher refreshing] & 1) == 0)
      {
        [(EKCalendarChooserDefaultImpl *)self _finishRefreshing];
      }
    }
  }
}

- (void)_finishRefreshing
{
  refreshControl = self->_refreshControl;
  if (refreshControl) {
    [(UIRefreshControl *)refreshControl endRefreshing];
  }
  currentAccountRefresher = self->_currentAccountRefresher;
  self->_currentAccountRefresher = 0;
}

- (void)accountRefreshFinished:(id)a3
{
  id v4 = a3;
  [(EKCalendarChooserDefaultImpl *)self _finishRefreshing];
  int v5 = [v4 allAccountsOffline];

  if (v5)
  {
    +[EKUIAccountErrorDisplayer presentAlertForOfflineErrorUsingViewController:self];
  }
}

- (BOOL)_calendarAvailableForEditing:(id)a3
{
  id v4 = a3;
  if ([(EKCalendarChooserDefaultImpl *)self disableCalendarEditing]) {
    char v5 = 0;
  }
  else {
    char v5 = [v4 isEditable];
  }

  return v5;
}

- (id)_calendarInfoForCalendar:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    BOOL v13 = &v12;
    uint64_t v14 = 0x3032000000;
    long long v15 = __Block_byref_object_copy__7;
    long long v16 = __Block_byref_object_dispose__7;
    id v17 = 0;
    allGroups = self->_allGroups;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __57__EKCalendarChooserDefaultImpl__calendarInfoForCalendar___block_invoke;
    v9[3] = &unk_1E6088BC8;
    id v10 = v4;
    char v11 = &v12;
    [(NSArray *)allGroups enumerateObjectsUsingBlock:v9];
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __57__EKCalendarChooserDefaultImpl__calendarInfoForCalendar___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 calendarInfos];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __57__EKCalendarChooserDefaultImpl__calendarInfoForCalendar___block_invoke_2;
  v9[3] = &unk_1E6088BA0;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v10 = v7;
  uint64_t v11 = v8;
  [v6 enumerateObjectsUsingBlock:v9];

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a4 = 1;
  }
}

void __57__EKCalendarChooserDefaultImpl__calendarInfoForCalendar___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = [v10 calendar];
  if ([v7 isEqual:*(void *)(a1 + 32)])
  {
  }
  else
  {
    uint64_t v8 = [v10 otherCalendars];
    int v9 = [v8 containsObject:*(void *)(a1 + 32)];

    if (!v9) {
      goto LABEL_5;
    }
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  *a4 = 1;
LABEL_5:
}

- (id)_saveSelection
{
  if (self->_style) {
    [(EKCalendarChooserDefaultImpl *)self selectedCalendars];
  }
  else {
  v2 = [(EKCalendarChooserDefaultImpl *)self selectedCalendar];
  }

  return v2;
}

- (void)_restoreSelection:(id)a3 calendarsForSelectedSource:(id)a4 allCalendars:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (self->_style)
  {
    id v23 = v8;
    id v10 = [(EKCalendarChooserDefaultImpl *)self _calendarSetToCalendarIdSet:v8];
    uint64_t v11 = objc_opt_new();
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v22 = v9;
    id v12 = v9;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v18 = objc_msgSend(v17, "calendarIdentifier", v22);
          int v19 = [v10 containsObject:v18];

          if (v19) {
            [v11 addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v14);
    }

    [(EKCalendarChooserDefaultImpl *)self setSelectedCalendarsAndNotify:v11];
    id v9 = v22;
    id v8 = v23;
  }
  else if ([a4 containsObject:v8])
  {
    [(EKCalendarChooserDefaultImpl *)self setSelectedCalendar:v8];
  }
  else if (v8)
  {
    eventStore = self->_eventStore;
    if (self->_entityType) {
      [(EKEventStore *)eventStore defaultCalendarForNewReminders];
    }
    else {
    uint64_t v21 = [(EKEventStore *)eventStore defaultCalendarForNewEvents];
    }
    [(EKCalendarChooserDefaultImpl *)self setSelectedCalendar:v21];
  }
}

- (_UIAccessDeniedView)accessDeniedView
{
  if (!self->_accessDeniedView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1F98]);
    id v4 = (_UIAccessDeniedView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    accessDeniedView = self->_accessDeniedView;
    self->_accessDeniedView = v4;

    [(_UIAccessDeniedView *)self->_accessDeniedView setAutoresizingMask:18];
    unint64_t entityType = self->_entityType;
    id v7 = EventKitUIBundle();
    id v8 = v7;
    if (entityType == 1) {
      id v9 = @"This app does not have access to your reminders.";
    }
    else {
      id v9 = @"This app does not have access to your calendars.";
    }
    id v10 = [v7 localizedStringForKey:v9 value:&stru_1F0CC2140 table:0];
    [(_UIAccessDeniedView *)self->_accessDeniedView setTitle:v10];
  }
  uint64_t v11 = self->_accessDeniedView;

  return v11;
}

- (void)setShouldOverrideAuthorizationStatus:(BOOL)a3 withRemoteUIStatus:(int64_t)a4 displayStyle:(int64_t)a5
{
  self->_shouldOverrideAuthorizationStatus = a3;
  self->_displayStyle = a5;
  [(EKCalendarChooserDefaultImpl *)self _updateAccessDeniedViewWithNewStatus:a4];
}

- (void)_updateDelegateSources
{
  NSUInteger v3 = [(NSArray *)self->_delegateSources count];
  id v4 = (void *)MEMORY[0x1E4F57B48];
  char v5 = [(EKCalendarChooserDefaultImpl *)self eventStore];
  uint64_t v6 = [v4 sortedEnabledDelegateSourcesFromStore:v5];
  delegateSources = self->_delegateSources;
  self->_delegateSources = v6;

  if (v3 != [(NSArray *)self->_delegateSources count]) {
    [(EKCalendarChooserDefaultImpl *)self _collectionViewBuildAndApplyNewSnapshotAnimated:1];
  }
  limitedToSource = self->_limitedToSource;
  if (limitedToSource
    && [(EKSource *)limitedToSource isDelegate]
    && ![(NSArray *)self->_delegateSources containsObject:self->_limitedToSource])
  {
    id v9 = self->_limitedToSource;
    self->_limitedToSource = 0;

    [(EKCalendarChooserDefaultImpl *)self _delegateSelectionDidChange:1];
  }
}

- (void)_updateShowDelegateCalendarsCell
{
  id v6 = [(EKCalendarChooserDefaultImpl *)self eventStore];
  NSUInteger v3 = [v6 sources];
  id v4 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_420];
  char v5 = [v3 filteredArrayUsingPredicate:v4];
  self->_showDelegateCalendarsCell = [v5 count] != 0;
}

uint64_t __64__EKCalendarChooserDefaultImpl__updateShowDelegateCalendarsCell__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSUInteger v3 = [v2 constraints];
  if ([v3 supportsDelegation]) {
    uint64_t v4 = [v2 isDelegate] ^ 1;
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)_eventStoreChangedExternally
{
}

- (void)_eventStoreChanged:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 userInfo];
  char v5 = [v4 objectForKey:*MEMORY[0x1E4F25468]];

  if (![v5 count])
  {
LABEL_20:
    long long v30 = v5;
    uint64_t v14 = [(EKCalendarChooserDefaultImpl *)self _currentKnownCalendarIds];
    uint64_t v15 = [(EKCalendarChooserDefaultImpl *)self _allCalendars];
    long long v28 = [(EKCalendarChooserDefaultImpl *)self _loadCalendars];
    long long v16 = [(EKCalendarChooserDefaultImpl *)self _calendarSetToCalendarIdSet:v15];
    uint64_t v29 = (void *)v14;
    [v16 minusSet:v14];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v17 = v15;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v33 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v23 = [v22 calendarIdentifier];
          int v24 = [v16 containsObject:v23];

          if (v24) {
            [(NSMutableSet *)self->_selectedCalendars addObject:v22];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v19);
    }

    long long v25 = [(EKCalendarChooserDefaultImpl *)self _saveSelection];
    BOOL showDelegateCalendarsCell = self->_showDelegateCalendarsCell;
    [(EKCalendarChooserDefaultImpl *)self _updateDelegateSources];
    [(EKCalendarChooserDefaultImpl *)self _updateShowDelegateCalendarsCell];
    if (showDelegateCalendarsCell != self->_showDelegateCalendarsCell) {
      [(EKCalendarChooserDefaultImpl *)self _collectionViewBuildAndApplyNewSnapshotAnimated:1];
    }
    char v5 = v30;
    [(EKCalendarChooserDefaultImpl *)self _setCalendars:v28 changedObjectsHint:v30 forceCollectionViewReload:0];
    [(EKCalendarChooserDefaultImpl *)self _restoreSelection:v25 calendarsForSelectedSource:v28 allCalendars:v17];
    [(EKCalendarChooserDefaultImpl *)self _updateCurrentKnownCalendarIds];
    if ([(EKCalendarChooserDefaultImpl *)self isViewLoaded])
    {
      if (!self->_shouldOverrideAuthorizationStatus)
      {
        uint64_t v27 = [MEMORY[0x1E4F25550] realAuthorizationStatusForEntityType:self->_entityType];
        if (v27 != self->_lastAuthorizationStatus)
        {
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __51__EKCalendarChooserDefaultImpl__eventStoreChanged___block_invoke;
          block[3] = &unk_1E6087E70;
          block[4] = self;
          block[5] = v27;
          dispatch_sync(MEMORY[0x1E4F14428], block);
        }
      }
    }
    [(EKCalendarChooserDefaultImpl *)self _reconfigureHeaders];

    id v6 = v29;
    goto LABEL_36;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (!v7)
  {
LABEL_36:

    goto LABEL_37;
  }
  uint64_t v8 = v7;
  char v9 = 0;
  char v10 = 0;
  uint64_t v11 = *(void *)v37;
  while (2)
  {
    for (uint64_t j = 0; j != v8; ++j)
    {
      if (*(void *)v37 != v11) {
        objc_enumerationMutation(v6);
      }
      uint64_t v13 = *(void **)(*((void *)&v36 + 1) + 8 * j);
      if ([v13 entityType] == 6)
      {
        char v9 = 1;
        char v10 = 1;
      }
      else
      {
        if ([v13 entityType] == 1)
        {
          char v9 = 1;
          char v10 = 1;
        }
        if ((v10 & 1) == 0) {
          continue;
        }
      }
      if (v9)
      {

LABEL_19:
        [MEMORY[0x1E4F57B18] invalidate];
        [(EKCalendarChooserDefaultImpl *)self _layoutNavToolbarControls];
        goto LABEL_20;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v8) {
      continue;
    }
    break;
  }

  if (v10)
  {
    if ((v9 & 1) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_37:
}

uint64_t __51__EKCalendarChooserDefaultImpl__eventStoreChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAccessDeniedViewWithNewStatus:*(void *)(a1 + 40)];
}

- (void)_updateAccessDeniedViewWithNewStatus:(int64_t)a3
{
  if (self->_lastAuthorizationStatus != a3)
  {
    accessDeniedView = self->_accessDeniedView;
    if (a3 < 3)
    {
      if (!accessDeniedView)
      {
        uint64_t v7 = [(EKCalendarChooserDefaultImpl *)self firstResponder];
        [v7 resignFirstResponder];

        uint64_t v8 = [(EKCalendarChooserDefaultImpl *)self accessDeniedView];
        [(EKCalendarChooserDefaultImpl *)self setView:v8];

        if (a3 == 1)
        {
          char v9 = [(EKCalendarChooserDefaultImpl *)self accessDeniedView];
          [v9 setMessage:@" "];
        }
        [(UICollectionView *)self->_collectionView removeFromSuperview];
      }
    }
    else if (accessDeniedView)
    {
      [(EKCalendarChooserDefaultImpl *)self setView:self->_collectionView];
      [(_UIAccessDeniedView *)self->_accessDeniedView removeFromSuperview];
      id v6 = self->_accessDeniedView;
      self->_accessDeniedView = 0;
    }
    self->_uint64_t lastAuthorizationStatus = a3;
  }
}

- (void)_ignoredErrorsChanged
{
}

- (id)_calendarSetToCalendarIdSet:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA80] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
        char v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "calendarIdentifier", (void)v14);

        if (v11)
        {
          id v12 = [v10 calendarIdentifier];
          [v4 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_currentKnownCalendarIds
{
  id v2 = (void *)[(NSSet *)self->_currentKnownCalendarIds mutableCopy];

  return v2;
}

- (void)_updateCurrentKnownCalendarIds
{
  id v5 = [(EKCalendarChooserDefaultImpl *)self _allCalendars];
  id v3 = [(EKCalendarChooserDefaultImpl *)self _calendarSetToCalendarIdSet:v5];
  currentKnownCalendarIds = self->_currentKnownCalendarIds;
  self->_currentKnownCalendarIds = v3;
}

- (id)_filterCalendars:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
        unint64_t entityType = self->_entityType;
        char v13 = objc_msgSend(v11, "allowedEntityTypes", (void)v17);
        if (entityType)
        {
          if ((v13 & 2) == 0) {
            goto LABEL_9;
          }
LABEL_8:
          [v5 addObject:v11];
          goto LABEL_9;
        }
        if (v13) {
          goto LABEL_8;
        }
LABEL_9:
        ++v10;
      }
      while (v8 != v10);
      uint64_t v14 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v8 = v14;
    }
    while (v14);
  }

  long long v15 = [(EKCalendarChooserDefaultImpl *)self _calendarsForSelectedSource];
  [v5 intersectSet:v15];

  return v5;
}

- (void)_ensureWritableCalendarExists
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = -[EKEventStore readWriteCalendarsForEntityType:](self->_eventStore, "readWriteCalendarsForEntityType:", self->_entityType, 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v12 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
      unint64_t entityType = self->_entityType;
      if (!entityType)
      {
        if ([*(id *)(*((void *)&v11 + 1) + 8 * v7) allowEvents]) {
          break;
        }
        unint64_t entityType = self->_entityType;
      }
      if (entityType == 1 && ([v8 allowReminders] & 1) != 0) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:

    eventStore = self->_eventStore;
    if (self->_entityType) {
      [(EKEventStore *)eventStore defaultCalendarForNewReminders];
    }
    else {
    id v3 = [(EKEventStore *)eventStore defaultCalendarForNewEvents];
    }
  }
}

- (id)_calendarsForSelectedSource
{
  limitedToSource = self->_limitedToSource;
  uint64_t v4 = (void *)MEMORY[0x1E4F57B40];
  unint64_t v5 = ((unint64_t)*(unsigned char *)&self->_flags >> 4) & 1;
  BOOL v6 = [(EKCalendarChooserDefaultImpl *)self onlyShowUnmanagedAccounts];
  uint64_t v7 = [(EKCalendarChooserDefaultImpl *)self event];
  uint64_t v8 = [v4 calendarsLimitedToSource:limitedToSource writability:v5 onlyUnmanagedAccounts:v6 forEvent:v7 entityType:self->_entityType inEventStore:self->_eventStore];

  return v8;
}

- (id)_allCalendars
{
  char flags = (char)self->_flags;
  eventStore = self->_eventStore;
  unint64_t entityType = self->_entityType;
  if ((flags & 0x10) != 0) {
    [(EKEventStore *)eventStore readWriteCalendarsForEntityType:entityType];
  }
  else {
  BOOL v6 = [(EKEventStore *)eventStore calendarsForEntityType:entityType];
  }
  uint64_t v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];

  return v7;
}

- (id)_loadCalendars
{
  [(EKCalendarChooserDefaultImpl *)self _ensureWritableCalendarExists];

  return [(EKCalendarChooserDefaultImpl *)self _calendarsForSelectedSource];
}

- (BOOL)_applySelection
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = self->_allGroups;
  uint64_t v25 = [(NSArray *)obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  char v3 = 0;
  if (v25)
  {
    uint64_t v24 = *(void *)v33;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v33 != v24) {
          objc_enumerationMutation(obj);
        }
        unint64_t v5 = *(void **)(*((void *)&v32 + 1) + 8 * v4);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v26 = v5;
        uint64_t v27 = v4;
        BOOL v6 = [v5 calendarInfos];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v29 != v9) {
                objc_enumerationMutation(v6);
              }
              long long v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              long long v12 = [v11 calendar];

              if (v12)
              {
                selectedCalendars = self->_selectedCalendars;
                long long v14 = [v11 calendar];
                uint64_t v15 = [(NSMutableSet *)selectedCalendars containsObject:v14];

                if (v3) {
                  char v3 = 1;
                }
                else {
                  char v3 = v15 ^ [v11 selected];
                }
                [v11 setSelected:v15];
              }
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v36 count:16];
          }
          while (v8);
        }

        uint64_t v16 = [v26 numSelectedCalendars];
        uint64_t v17 = [v26 numSelectableCalendars];
        uint64_t v18 = v17;
        if (v3) {
          char v3 = 1;
        }
        else {
          char v3 = (v16 == v17) ^ [v26 selected];
        }
        [v26 setSelected:v16 == v18];
        uint64_t v4 = v27 + 1;
      }
      while (v27 + 1 != v25);
      uint64_t v25 = [(NSArray *)obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v25);
  }

  uint64_t v19 = [(EKCalendarChooserDefaultImpl *)self _numSelectedGroups];
  NSUInteger v20 = [(NSArray *)self->_groups count];
  if (v3) {
    LOBYTE(v21) = 1;
  }
  else {
    int v21 = (v20 == v19) ^ ((*(unsigned char *)&self->_flags & 2) >> 1);
  }
  [(EKCalendarChooserDefaultImpl *)self setAllSelected:v20 == v19];
  return v21;
}

- (BOOL)_isCalendarEnabled:(id)a3
{
  return [a3 isEnabled];
}

- (id)_statusTextForGroup:(id)a3
{
  char v3 = 0;
  switch([a3 accountError])
  {
    case 1:
    case 6:
      uint64_t v4 = EventKitUIBundle();
      unint64_t v5 = v4;
      BOOL v6 = @"Unable to update calendars.";
      goto LABEL_6;
    case 2:
      uint64_t v4 = EventKitUIBundle();
      unint64_t v5 = v4;
      BOOL v6 = @"Unable to update account due to missing information.";
      goto LABEL_6;
    case 3:
      uint64_t v4 = EventKitUIBundle();
      unint64_t v5 = v4;
      BOOL v6 = @"Unable to connect to the internet.";
      goto LABEL_6;
    case 4:
    case 5:
    case 8:
      uint64_t v4 = EventKitUIBundle();
      unint64_t v5 = v4;
      BOOL v6 = @"Unable to connect to account.";
LABEL_6:
      char v3 = [v4 localizedStringForKey:v6 value:&stru_1F0CC2140 table:0];

      break;
    default:
      break;
  }

  return v3;
}

- (void)_reloadCalendars
{
}

- (void)_reloadCalendarsForcingCollectionViewReload:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(EKCalendarChooserDefaultImpl *)self _loadCalendars];
  [(EKCalendarChooserDefaultImpl *)self _setCalendars:v5 changedObjectsHint:0 forceCollectionViewReload:v3];
}

- (void)_updatePossiblyChangedIndexPaths:(id)a3 possiblyChangedSectionIndices:(id)a4 forGroups:(id)a5 withFirstSection:(int64_t)a6 changedObjectIDSet:(id)a7 footersChanged:(BOOL)a8 reloadEverything:(BOOL)a9
{
  BOOL v31 = a8;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v29 = a4;
  id v12 = a5;
  id v13 = a7;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = v12;
  uint64_t v33 = [v12 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v33)
  {
    uint64_t v32 = *(void *)v42;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v42 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = v14;
        uint64_t v15 = *(void **)(*((void *)&v41 + 1) + 8 * v14);
        uint64_t v16 = objc_msgSend(v15, "source", v29);
        uint64_t v17 = [v16 objectID];
        int v18 = [v13 containsObject:v17];

        if (a9 || (v31 & v18) != 0) {
          [v29 addIndex:a6];
        }
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        uint64_t v19 = [v15 calendarInfos];
        uint64_t v20 = [v19 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v38;
          uint64_t v23 = 1;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v38 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v25 = [*(id *)(*((void *)&v37 + 1) + 8 * i) calendar];
              long long v26 = [v25 objectID];
              int v27 = [v13 containsObject:v26];

              if (a9 || v27)
              {
                long long v28 = [MEMORY[0x1E4F28D58] indexPathForRow:v23 + i inSection:a6];
                [v35 addObject:v28];
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v37 objects:v45 count:16];
            v23 += i;
          }
          while (v21);
        }

        ++a6;
        uint64_t v14 = v34 + 1;
      }
      while (v34 + 1 != v33);
      uint64_t v33 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v33);
  }
}

- (void)_setCalendars:(id)a3 changedObjectsHint:(id)a4 forceCollectionViewReload:(BOOL)a5
{
  BOOL v77 = a5;
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v79 = a3;
  id v7 = a4;
  v81 = self->_groups;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    uint64_t v10 = [(EKCalendarChooserDefaultImpl *)self delegate];
    id v80 = [v10 unselectedCalendarsForFocusMode];
  }
  else
  {
    id v80 = 0;
  }
  id v78 = v7;
  char v103 = 0;
  BOOL v11 = 0;
  if ([(EKCalendarChooserDefaultImpl *)self disableCalendarsUnselectedByFocus])
  {
    id v12 = [(EKCalendarChooserDefaultImpl *)self delegate];
    BOOL v11 = [v12 focusFilterMode] == 1;
  }
  if (self->_showAccountStatus)
  {
    if (self->_limitedToSource) {
      BOOL v13 = 0;
    }
    else {
      BOOL v13 = !v11;
    }
  }
  else
  {
    BOOL v13 = 0;
  }
  char v102 = 0;
  int64_t v101 = 0;
  uint64_t v14 = (void *)MEMORY[0x1E4F57B40];
  eventStore = self->_eventStore;
  id v86 = self;
  unint64_t entityType = self->_entityType;
  int64_t chooserMode = v86->_chooserMode;
  int v18 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  BOOL v19 = v11 && v80 != 0;
  uint64_t v20 = &v101;
  if (!v19) {
    uint64_t v20 = 0;
  }
  LOBYTE(v73) = v11;
  uint64_t v21 = v14;
  uint64_t v22 = v79;
  uint64_t v23 = eventStore;
  uint64_t v24 = v86;
  uint64_t v25 = [v21 generateGroupsForCalendars:v79 eventStore:v23 entityType:entityType forMode:chooserMode usingBackgroundColor:v18 includingAccountsWithoutCalendars:v13 filterByFocus:v73 usingUnselectedCalendars:v80 foundRefreshableCalendar:&v102 anyGroupsHiddenByFocus:&v103 numberOfCalendarsHiddenByFocus:v20];
  groups = v86->_groups;
  v86->_groups = (NSArray *)v25;

  uint64_t v27 = [(NSArray *)v86->_groups count];
  long long v28 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v27];
  id v29 = v28;
  if (v86->_groups) {
    objc_msgSend(v28, "addObjectsFromArray:");
  }
  uint64_t v30 = [v29 copy];
  allGroups = v86->_allGroups;
  v86->_allGroups = (NSArray *)v30;

  if (v19) {
    v86->_numCalendarsHiddenByFocus = v101;
  }
  char flags = (char)v86->_flags;
  if ((flags & 0x20) != 0 && !v102)
  {
    flags &= ~0x20u;
    *(unsigned char *)&v86->_char flags = flags;
  }
  if (v86->_showAccountStatus)
  {
    id v84 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSArray count](v81, "count"));
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    uint64_t v33 = v81;
    uint64_t v34 = [(NSArray *)v33 countByEnumeratingWithState:&v97 objects:v106 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v98;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v98 != v36) {
            objc_enumerationMutation(v33);
          }
          long long v38 = *(void **)(*((void *)&v97 + 1) + 8 * i);
          long long v39 = [v38 source];
          long long v40 = [v39 sourceIdentifier];

          if (v40) {
            [v84 setObject:v38 forKeyedSubscript:v40];
          }
        }
        uint64_t v35 = [(NSArray *)v33 countByEnumeratingWithState:&v97 objects:v106 count:16];
      }
      while (v35);
    }

    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    uint64_t v24 = v86;
    obuint64_t j = v86->_groups;
    uint64_t v41 = [(NSArray *)obj countByEnumeratingWithState:&v93 objects:v105 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      id v75 = v29;
      char v43 = 0;
      uint64_t v83 = *(void *)v94;
      while (1)
      {
        for (uint64_t j = 0; j != v42; ++j)
        {
          if (*(void *)v94 != v83) {
            objc_enumerationMutation(obj);
          }
          v45 = *(void **)(*((void *)&v93 + 1) + 8 * j);
          v46 = [v45 source];
          objc_msgSend(v45, "setAccountError:", objc_msgSend(MEMORY[0x1E4F57B48], "errorForSource:", v46));
          uint64_t v47 = [(EKCalendarChooserDefaultImpl *)v24 _statusTextForGroup:v45];
          BOOL v48 = [v45 source];
          id v49 = [v48 sourceIdentifier];
          id v50 = [v84 objectForKeyedSubscript:v49];
          id v51 = [v50 footer];

          if (!CalEqualStrings()) {
            char v43 = 1;
          }
          [v45 setFooter:v47];
          if (v46)
          {
            uint64_t v52 = [v45 accountError];
            BOOL v53 = +[EKUIAccountErrorDisplayer errorIsActionable:v52];
            [v45 setShowAccountErrorActionButton:v53];
            if (v53)
            {
              uint64_t v54 = 1;
            }
            else
            {
              if (!v52) {
                goto LABEL_47;
              }
              uint64_t v55 = 8;
              if (v52 == 3) {
                uint64_t v55 = 4;
              }
              if (v52 == 1) {
                uint64_t v54 = 2;
              }
              else {
                uint64_t v54 = v55;
              }
            }
            [(EKCalendarChooserDefaultImpl *)v86 _sendAnalyticsEvent:v54 forGroup:v45];
          }
LABEL_47:

          uint64_t v24 = v86;
        }
        uint64_t v42 = [(NSArray *)obj countByEnumeratingWithState:&v93 objects:v105 count:16];
        if (!v42)
        {
          uint64_t v56 = v43 & 1;
          id v29 = v75;
          goto LABEL_52;
        }
      }
    }
    uint64_t v56 = 0;
LABEL_52:

    char flags = (char)v24->_flags;
    uint64_t v22 = v79;
  }
  else
  {
    uint64_t v56 = 0;
  }
  v57 = v78;
  *(unsigned char *)&v24->_char flags = flags & 0xFE | (v24->_entityType == 0);
  [(EKCalendarChooserDefaultImpl *)v24 _applySelection];
  if ([(EKCalendarChooserDefaultImpl *)v24 isViewLoaded])
  {
    if (([(id)objc_opt_class() groups:v24->_groups differStructurallyFromGroups:v81] & 1) != 0 || v77)
    {
      [(EKCalendarChooserDefaultImpl *)v24 _collectionViewBuildAndApplyNewSnapshotAnimated:1];
    }
    else
    {
      id v76 = v29;
      if (v78)
      {
        id v58 = [MEMORY[0x1E4F1CAD0] setWithArray:v78];
      }
      else
      {
        id v58 = 0;
      }
      id v59 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v60 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      LOBYTE(v74) = v78 == 0;
      [(EKCalendarChooserDefaultImpl *)v24 _updatePossiblyChangedIndexPaths:v59 possiblyChangedSectionIndices:v60 forGroups:v24->_groups withFirstSection:[(EKCalendarChooserDefaultImpl *)v24 _groupsOffset] changedObjectIDSet:v58 footersChanged:v56 reloadEverything:v74];
      id v61 = [(UICollectionViewDiffableDataSource *)v24->_dataSource snapshot];
      if ([v59 count])
      {
        v85 = v58;
        id v62 = [MEMORY[0x1E4F1CA48] array];
        long long v89 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        id v63 = v59;
        uint64_t v64 = [v63 countByEnumeratingWithState:&v89 objects:v104 count:16];
        if (v64)
        {
          uint64_t v65 = v64;
          uint64_t v66 = *(void *)v90;
          do
          {
            for (uint64_t k = 0; k != v65; ++k)
            {
              if (*(void *)v90 != v66) {
                objc_enumerationMutation(v63);
              }
              id v68 = [(UICollectionViewDiffableDataSource *)v86->_dataSource itemIdentifierForIndexPath:*(void *)(*((void *)&v89 + 1) + 8 * k)];
              if (v68) {
                [v62 addObject:v68];
              }
            }
            uint64_t v65 = [v63 countByEnumeratingWithState:&v89 objects:v104 count:16];
          }
          while (v65);
        }

        id v69 = (void *)[v62 copy];
        [v61 reconfigureItemsWithIdentifiers:v69];

        id v58 = v85;
        uint64_t v24 = v86;
      }
      if ([v60 count])
      {
        v70 = [MEMORY[0x1E4F1CA48] array];
        v87[0] = MEMORY[0x1E4F143A8];
        v87[1] = 3221225472;
        v87[2] = __91__EKCalendarChooserDefaultImpl__setCalendars_changedObjectsHint_forceCollectionViewReload___block_invoke;
        v87[3] = &unk_1E6088C10;
        void v87[4] = v24;
        id v88 = v70;
        id v71 = v70;
        [v60 enumerateIndexesUsingBlock:v87];
        id v72 = (void *)[v71 copy];
        [v61 reloadSectionsWithIdentifiers:v72];
      }
      [(UICollectionViewDiffableDataSource *)v24->_dataSource applySnapshot:v61 animatingDifferences:0];

      uint64_t v22 = v79;
      v57 = v78;
      id v29 = v76;
    }
  }
}

void __91__EKCalendarChooserDefaultImpl__setCalendars_changedObjectsHint_forceCollectionViewReload___block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v3 = [*(id *)(*(void *)(a1 + 32) + 1176) sectionIdentifierForIndex:a2];
  if (v3)
  {
    uint64_t v4 = v3;
    [*(id *)(a1 + 40) addObject:v3];
    BOOL v3 = v4;
  }
}

+ (BOOL)groups:(id)a3 differStructurallyFromGroups:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 count];
  if (v7 == [v6 count])
  {
    uint64_t v8 = [v5 count];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      id v29 = v6;
      id v30 = v5;
      uint64_t v31 = v8;
      do
      {
        BOOL v11 = [v5 objectAtIndexedSubscript:v10];
        id v12 = [v6 objectAtIndexedSubscript:v10];
        BOOL v13 = [v11 source];
        uint64_t v14 = [v12 source];
        if ((v13 == v14 || [v13 isEqual:v14])
          && (int v15 = [v11 showAccountErrorActionButton],
              v15 == [v12 showAccountErrorActionButton]))
        {
          uint64_t v32 = v13;
          uint64_t v33 = v11;
          uint64_t v17 = [v11 calendarInfos];
          int v18 = [v12 calendarInfos];
          uint64_t v19 = [v17 count];
          if (v19 == [v18 count])
          {
            uint64_t v20 = [v17 count];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = 0;
              while (1)
              {
                uint64_t v23 = [v17 objectAtIndexedSubscript:v22];
                uint64_t v24 = [v23 calendar];

                uint64_t v25 = [v18 objectAtIndexedSubscript:v22];
                long long v26 = [v25 calendar];

                if (v24 != v26 && ![v24 isEqual:v26]) {
                  break;
                }

                if (v21 == ++v22)
                {
                  int v16 = 0;
                  goto LABEL_18;
                }
              }

              int v16 = 1;
LABEL_18:
              id v6 = v29;
              id v5 = v30;
            }
            else
            {
              int v16 = 0;
            }
            uint64_t v9 = v31;
          }
          else
          {
            int v16 = 1;
          }

          BOOL v13 = v32;
          BOOL v11 = v33;
        }
        else
        {
          int v16 = 1;
        }

        BOOL v27 = v16 != 0;
        if (v16) {
          break;
        }
        ++v10;
      }
      while (v10 != v9);
    }
    else
    {
      BOOL v27 = 0;
    }
  }
  else
  {
    BOOL v27 = 1;
  }

  return v27;
}

- (void)setCheckedRow:(id)a3
{
  id v5 = (NSIndexPath *)a3;
  if (!self->_style)
  {
    p_checkedRow = &self->_checkedRow;
    checkedRow = self->_checkedRow;
    if (checkedRow != v5)
    {
      uint64_t v9 = v5;
      if (checkedRow)
      {
        *p_checkedRow = 0;
        uint64_t v8 = checkedRow;

        [(EKCalendarChooserDefaultImpl *)self _reconfigureCollectionViewAtIndexPath:v8];
      }
      objc_storeStrong((id *)&self->_checkedRow, a3);
      [(EKCalendarChooserDefaultImpl *)self _reconfigureCollectionViewAtIndexPath:*p_checkedRow];
      id v5 = v9;
    }
  }
}

- (void)setSelectedCalendar:(id)a3
{
  if (!self->_style)
  {
    id v4 = [(EKCalendarChooserDefaultImpl *)self _indexPathForCalendar:a3];
    [(EKCalendarChooserDefaultImpl *)self setCheckedRow:v4];
  }
}

- (EKCalendar)selectedCalendar
{
  if (self->_style || (checkedRow = self->_checkedRow) == 0)
  {
    id v2 = 0;
  }
  else
  {
    id v5 = [(EKCalendarChooserDefaultImpl *)self _groupForSection:[(NSIndexPath *)checkedRow section]];
    int64_t v6 = [(EKCalendarChooserDefaultImpl *)self _rowIndex:[(NSIndexPath *)self->_checkedRow row] toCalendarIndexInGroup:v5];
    if (v5
      && (unint64_t v7 = v6,
          [v5 calendarInfos],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          unint64_t v9 = [v8 count],
          v8,
          v7 < v9))
    {
      uint64_t v10 = [v5 calendarInfos];
      BOOL v11 = [v10 objectAtIndex:v7];

      id v2 = [v11 calendar];
    }
    else
    {
      id v2 = 0;
    }
  }

  return (EKCalendar *)v2;
}

- (void)setSelectedCalendars:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F57690];
  id v5 = a3;
  -[EKCalendarChooserDefaultImpl _setSelectedCalendars:notify:](self, "_setSelectedCalendars:notify:", v5, [v4 isProgramSDKAtLeast:0x7E60901FFFFFFFFLL] ^ 1);
}

- (void)setSelectedCalendarsAndNotify:(id)a3
{
}

- (void)_setSelectedCalendars:(id)a3 notify:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v12 = v6;
  if (self->_style == 1)
  {
    unint64_t v7 = [(EKCalendarChooserDefaultImpl *)self _filterCalendars:v6];
    if (([(NSMutableSet *)self->_selectedCalendars isEqualToSet:v7] & 1) == 0)
    {
      objc_storeStrong((id *)&self->_selectedCalendars, v7);
      if ([(EKCalendarChooserDefaultImpl *)self isViewLoaded]
        && [(EKCalendarChooserDefaultImpl *)self _applySelection])
      {
        [(EKCalendarChooserDefaultImpl *)self _collectionViewBuildAndApplyNewSnapshotAnimated:1];
      }
      if (v4)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        char v9 = objc_opt_respondsToSelector();

        if (v9)
        {
          id v10 = objc_loadWeakRetained((id *)&self->_delegate);
          BOOL v11 = [(EKCalendarChooserDefaultImpl *)self _ekCalendarChooser];
          [v10 calendarChooserSelectionDidChange:v11];
        }
      }
    }
    goto LABEL_11;
  }
  if ([v6 count])
  {
    unint64_t v7 = [v12 anyObject];
    [(EKCalendarChooserDefaultImpl *)self setSelectedCalendar:v7];
LABEL_11:

    goto LABEL_12;
  }
  [(EKCalendarChooserDefaultImpl *)self setSelectedCalendar:0];
LABEL_12:
}

- (NSSet)selectedCalendars
{
  BOOL v3 = objc_opt_new();
  int64_t style = self->_style;
  if (!style)
  {
    unint64_t v7 = [(EKCalendarChooserDefaultImpl *)self selectedCalendar];

    if (!v7) {
      goto LABEL_8;
    }
    id v6 = [(EKCalendarChooserDefaultImpl *)self selectedCalendar];
    [v3 addObject:v6];
    goto LABEL_7;
  }
  if (style == 1)
  {
    selectedCalendars = self->_selectedCalendars;
    if (selectedCalendars)
    {
      id v6 = [(NSMutableSet *)selectedCalendars allObjects];
      [v3 addObjectsFromArray:v6];
LABEL_7:
    }
  }
LABEL_8:

  return (NSSet *)v3;
}

- (id)_indexPathForCalendar:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  int v16 = __Block_byref_object_copy__7;
  uint64_t v17 = __Block_byref_object_dispose__7;
  id v18 = 0;
  id v5 = [(EKCalendarChooserDefaultImpl *)self view];

  if (v4 && v5)
  {
    groups = self->_groups;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __54__EKCalendarChooserDefaultImpl__indexPathForCalendar___block_invoke;
    v9[3] = &unk_1E6088C60;
    BOOL v11 = self;
    id v12 = &v13;
    id v10 = v4;
    [(NSArray *)groups enumerateObjectsUsingBlock:v9];
  }
  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __54__EKCalendarChooserDefaultImpl__indexPathForCalendar___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  uint64_t v8 = [v7 calendarInfos];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__EKCalendarChooserDefaultImpl__indexPathForCalendar___block_invoke_2;
  v13[3] = &unk_1E6088C38;
  id v9 = *(id *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  id v14 = v9;
  uint64_t v15 = v11;
  id v16 = v7;
  uint64_t v17 = v10;
  uint64_t v18 = a3;
  uint64_t v19 = a4;
  id v12 = v7;
  [v8 enumerateObjectsUsingBlock:v13];
}

void __54__EKCalendarChooserDefaultImpl__indexPathForCalendar___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  id v7 = [v13 calendar];
  if (([v7 isEqual:*(void *)(a1 + 32)] & 1) != 0
    || ([v13 otherCalendars],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 containsObject:*(void *)(a1 + 32)],
        v8,
        v9))
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(*(id *)(a1 + 40), "_calendarIndex:toRowIndexInGroup:", a3, *(void *)(a1 + 48)), *(void *)(a1 + 64) + objc_msgSend(*(id *)(a1 + 40), "_groupsOffset"));
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *a4 = 1;
    **(unsigned char **)(a1 + 72) = 1;
  }
}

- (id)centeredCalendar
{
  BOOL v3 = [(UICollectionView *)self->_collectionView indexPathsForVisibleItems];
  id v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_441];

  uint64_t v5 = [v4 count];
  if (v5)
  {
    uint64_t v6 = v5;
    if (v5 >= 0) {
      uint64_t v7 = v5;
    }
    else {
      uint64_t v7 = v5 + 1;
    }
    uint64_t v8 = (uint64_t)(double)(v7 >> 1);
    int v9 = [v4 objectAtIndex:v8];
    uint64_t v10 = -[EKCalendarChooserDefaultImpl _groupForSection:](self, "_groupForSection:", [v9 section]);
    uint64_t v11 = v6 - 1;
    BOOL v12 = v10 == 0;
    if (v10) {
      BOOL v13 = 1;
    }
    else {
      BOOL v13 = v11 <= v8;
    }
    if (v13)
    {
      id v14 = (void *)v10;
    }
    else
    {
      uint64_t v16 = v8 + 1;
      do
      {
        uint64_t v17 = v9;
        int v9 = [v4 objectAtIndex:v16];

        id v14 = -[EKCalendarChooserDefaultImpl _groupForSection:](self, "_groupForSection:", [v9 section]);
        BOOL v12 = v14 == 0;
        if (v14) {
          break;
        }
        BOOL v13 = v16++ < v11;
      }
      while (v13);
    }
    if (v12
      || ((uint64_t v18 = [v9 row],
           -[EKCalendarChooserDefaultImpl _accountErrorActionRowIndexForGroup:](self, "_accountErrorActionRowIndexForGroup:", v14) != v18)? (uint64_t v19 = v18): (uint64_t v19 = v18 + 1), v20 = -[EKCalendarChooserDefaultImpl _rowIndex:toCalendarIndexInGroup:](self, "_rowIndex:toCalendarIndexInGroup:", v19, v14), [v14 calendarInfos], v21 = objc_claimAutoreleasedReturnValue(), v22 = objc_msgSend(v21, "count"), v21, v20 >= v22))
    {
      uint64_t v15 = 0;
    }
    else
    {
      uint64_t v23 = [v14 calendarInfos];
      uint64_t v24 = [v23 objectAtIndex:v20];

      uint64_t v15 = [v24 calendar];
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

uint64_t __48__EKCalendarChooserDefaultImpl_centeredCalendar__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)centerOnCalendar:(id)a3
{
  if (a3)
  {
    -[EKCalendarChooserDefaultImpl _indexPathForCalendar:](self, "_indexPathForCalendar:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(UICollectionView *)self->_collectionView scrollToItemAtIndexPath:v4 atScrollPosition:2 animated:0];
  }
}

- (id)displayedEditor
{
  return self->_presentedEditor;
}

- (void)redisplayEditor:(id)a3 completion:(id)a4
{
}

- (void)_presentEditor:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v13 = a3;
  int v9 = (void (**)(void))a5;
  uint64_t v10 = [v13 calendar];
  uint64_t v11 = [(EKCalendarChooserDefaultImpl *)self _indexPathForCalendar:v10];

  if (v11)
  {
    [(UICollectionView *)self->_collectionView scrollToItemAtIndexPath:v11 atScrollPosition:0 animated:0];
    uint64_t v12 = 12;
  }
  else
  {
    uint64_t v12 = 15;
  }
  if (v13)
  {
    objc_storeStrong((id *)&self->_presentedEditor, a3);
    [(EKCalendarChooserDefaultImpl *)self _presentEditor:v13 withIndexPath:v11 barButtonItem:self->_addCalendarButton permittedArrowDirections:v12 animated:v6 completion:v9];
  }
  else if (v9)
  {
    v9[2](v9);
  }
}

- (void)_presentEditor:(id)a3 withIndexPath:(id)a4 barButtonItem:(id)a5 permittedArrowDirections:(unint64_t)a6 animated:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  id v32 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  [v32 setDelegate:self];
  uint64_t v18 = [v32 navigationController];
  uint64_t v19 = v18;
  if (v18) {
    unint64_t v20 = v18;
  }
  else {
    unint64_t v20 = [[EKUIManagedNavigationController alloc] initWithRootViewController:v32];
  }
  uint64_t v21 = v20;

  [(EKUIManagedNavigationController *)v21 _setClipUnderlapWhileTransitioning:1];
  if (self->_displayStyle != 1000)
  {
    BOOL v27 = [(EKCalendarChooserDefaultImpl *)self view];
    if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v27))
    {
      long long v28 = [(EKCalendarChooserDefaultImpl *)self view];
      BOOL IsRegular = EKUICurrentHeightSizeClassIsRegular(v28);

      if (IsRegular) {
        [(EKUIManagedNavigationController *)v21 setModalPresentationStyle:6];
      }
    }
    else
    {
    }
    goto LABEL_16;
  }
  unint64_t v22 = [(EKCalendarChooserDefaultImpl *)self navigationController];
  uint64_t v23 = [v22 presentedViewController];

  if (v23) {
    goto LABEL_17;
  }
  [(EKUIManagedNavigationController *)v21 setModalPresentationStyle:7];
  uint64_t v24 = [(EKUIManagedNavigationController *)v21 popoverPresentationController];
  uint64_t v25 = v24;
  if (!v15)
  {
    if (v16) {
      [v24 setBarButtonItem:v16];
    }
    [v25 setPermittedArrowDirections:a6];

    goto LABEL_16;
  }
  long long v26 = [(UICollectionView *)self->_collectionView cellForItemAtIndexPath:v15];
  [v25 setSourceView:v26];

  [v25 setPermittedArrowDirections:a6];
  if (v26)
  {
LABEL_16:
    objc_storeStrong((id *)&self->_presentedEditor, a3);
    id v30 = [(EKUIManagedNavigationController *)v21 presentationController];
    [v30 setDelegate:self];

    uint64_t v31 = [(EKCalendarChooserDefaultImpl *)self navigationController];
    [v31 presentViewController:v21 animated:v9 completion:v17];
  }
LABEL_17:
}

- (void)presentationControllerDidDismiss:(id)a3
{
  presentedEditor = self->_presentedEditor;
  self->_presentedEditor = 0;
}

- (int64_t)_accountErrorActionRowIndexForGroup:(id)a3
{
  if ([(EKCalendarChooserDefaultImpl *)self _shouldDisplayAccountErrorActionCellForGroup:a3])
  {
    return 1;
  }
  else
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (int64_t)_rowIndexForMeDelegate
{
  return 1;
}

- (int64_t)_rowIndexToDelegateSourceIndex:(int64_t)a3
{
  return a3 - 2;
}

- (int64_t)_rowIndex:(int64_t)a3 toCalendarIndexInGroup:(id)a4
{
  BOOL v5 = [(EKCalendarChooserDefaultImpl *)self _shouldDisplayAccountErrorActionCellForGroup:a4];
  uint64_t v6 = -2;
  if (!v5) {
    uint64_t v6 = -1;
  }
  return v6 + a3;
}

- (int64_t)_calendarIndex:(int64_t)a3 toRowIndexInGroup:(id)a4
{
  BOOL v5 = [(EKCalendarChooserDefaultImpl *)self _shouldDisplayAccountErrorActionCellForGroup:a4];
  uint64_t v6 = 1;
  if (v5) {
    uint64_t v6 = 2;
  }
  return v6 + a3;
}

- (BOOL)_shouldDisplayAccountErrorActionCellForGroup:(id)a3
{
  if (self->_showAccountStatus) {
    return [a3 showAccountErrorActionButton];
  }
  else {
    return 0;
  }
}

- (BOOL)_shouldShowDeclinedEventsSection
{
  if ([(EKCalendarChooserDefaultImpl *)self showsDeclinedEventsSetting])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v3 = [(EKCalendarChooserDefaultImpl *)self showsCompletedRemindersSetting];
    if (v3) {
      LOBYTE(v3) = self->_limitedToSource == 0;
    }
  }
  return v3;
}

- (BOOL)_isDeclinedEventsSwitchSection:(int64_t)a3
{
  BOOL v5 = [(EKCalendarChooserDefaultImpl *)self _shouldShowDeclinedEventsSection];
  if (v5)
  {
    int64_t v6 = [(EKCalendarChooserDefaultImpl *)self _groupsOffset];
    LOBYTE(v5) = [(NSArray *)self->_groups count] + v6 == a3;
  }
  return v5;
}

- (BOOL)_isDelegateCalendarsButtonSection:(int64_t)a3
{
  BOOL v5 = [(EKCalendarChooserDefaultImpl *)self _shouldShowDelegateCalendarsButtonSection];
  if (v5)
  {
    int64_t v6 = [(EKCalendarChooserDefaultImpl *)self _groupsOffset];
    NSUInteger v7 = [(NSArray *)self->_groups count] + v6;
    LOBYTE(v5) = v7
               + [(EKCalendarChooserDefaultImpl *)self _shouldShowDeclinedEventsSection] == a3;
  }
  return v5;
}

- (BOOL)_shouldShowDelegateCalendarsButtonSection
{
  return self->_canShowDelegateSetupCell && self->_showDelegateCalendarsCell;
}

- (BOOL)_shouldShowFocusBanner
{
  if (![(EKCalendarChooserDefaultImpl *)self disableCalendarsUnselectedByFocus]) {
    return 0;
  }
  BOOL v3 = [(EKCalendarChooserDefaultImpl *)self delegate];
  BOOL v4 = [v3 focusFilterMode] != 0;

  return v4;
}

- (int64_t)_focusBannerSection
{
  return 0;
}

- (BOOL)_isFocusBannerSection:(int64_t)a3
{
  BOOL v5 = [(EKCalendarChooserDefaultImpl *)self _shouldShowFocusBanner];
  if (v5) {
    LOBYTE(v5) = [(EKCalendarChooserDefaultImpl *)self _focusBannerSection] == a3;
  }
  return v5;
}

- (BOOL)_shouldShowIdentityChooser
{
  return self->_canShowIdentityChooser && [(NSArray *)self->_delegateSources count] != 0;
}

- (int64_t)_identityChooserSection
{
  return [(EKCalendarChooserDefaultImpl *)self _shouldShowFocusBanner];
}

- (BOOL)_isIdentityChooserSection:(int64_t)a3
{
  BOOL v5 = [(EKCalendarChooserDefaultImpl *)self _shouldShowIdentityChooser];
  if (v5) {
    LOBYTE(v5) = [(EKCalendarChooserDefaultImpl *)self _identityChooserSection] == a3;
  }
  return v5;
}

- (id)sourceForSelectedIdentity
{
  return self->_limitedToSource;
}

- (int64_t)_groupsOffset
{
  BOOL v3 = [(EKCalendarChooserDefaultImpl *)self _shouldShowIdentityChooser];
  BOOL v4 = [(EKCalendarChooserDefaultImpl *)self _shouldShowFocusBanner];
  int64_t v5 = 1;
  if (v3) {
    int64_t v5 = 2;
  }
  if (v4) {
    return v5;
  }
  else {
    return v3;
  }
}

- (id)_groupForSection:(int64_t)a3
{
  int64_t v4 = a3 - [(EKCalendarChooserDefaultImpl *)self _groupsOffset];
  if (v4 < 0 || v4 >= [(NSArray *)self->_groups count])
  {
    int64_t v5 = 0;
  }
  else
  {
    int64_t v5 = [(NSArray *)self->_groups objectAtIndexedSubscript:v4];
  }

  return v5;
}

- (void)declinedEventsChanged
{
  pendingShowDeclinedEvents = self->_pendingShowDeclinedEvents;
  if (pendingShowDeclinedEvents)
  {
    int v4 = [(NSNumber *)pendingShowDeclinedEvents BOOLValue];
  }
  else
  {
    int64_t v5 = [(EKCalendarChooserDefaultImpl *)self eventStore];
    int v4 = [v5 showDeclinedEvents];
  }
  uint64_t v6 = v4 ^ 1u;
  NSUInteger v7 = [NSNumber numberWithBool:v6];
  uint64_t v8 = self->_pendingShowDeclinedEvents;
  self->_pendingShowDeclinedEvents = v7;

  BOOL v9 = dispatch_get_global_queue(0, 0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__EKCalendarChooserDefaultImpl_declinedEventsChanged__block_invoke;
  v10[3] = &unk_1E6088CA8;
  v10[4] = self;
  char v11 = v6;
  dispatch_async(v9, v10);
}

void __53__EKCalendarChooserDefaultImpl_declinedEventsChanged__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) eventStore];
  [v2 setShowDeclinedEvents:*(unsigned __int8 *)(a1 + 40)];
}

- (void)completedRemindersChanged
{
  pendingShowCompletedReminders = self->_pendingShowCompletedReminders;
  if (pendingShowCompletedReminders)
  {
    int v4 = [(NSNumber *)pendingShowCompletedReminders BOOLValue];
  }
  else
  {
    int64_t v5 = [(EKCalendarChooserDefaultImpl *)self eventStore];
    int v4 = [v5 showCompletedReminders];
  }
  uint64_t v6 = v4 ^ 1u;
  NSUInteger v7 = [NSNumber numberWithBool:v6];
  uint64_t v8 = self->_pendingShowCompletedReminders;
  self->_pendingShowCompletedReminders = v7;

  BOOL v9 = dispatch_get_global_queue(0, 0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__EKCalendarChooserDefaultImpl_completedRemindersChanged__block_invoke;
  v10[3] = &unk_1E6088CA8;
  v10[4] = self;
  char v11 = v6;
  dispatch_async(v9, v10);
}

void __57__EKCalendarChooserDefaultImpl_completedRemindersChanged__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) eventStore];
  [v2 setShowCompletedReminders:*(unsigned __int8 *)(a1 + 40)];
}

+ (id)_subscribedLocalizedString
{
  id v2 = EventKitUIBundle();
  BOOL v3 = [v2 localizedStringForKey:@"Name of subscribed group" value:@"Subscribed" table:0];

  return v3;
}

+ (id)_disabledIntegrationLocalizedString
{
  id v2 = EventKitUIBundle();
  BOOL v3 = [v2 localizedStringForKey:@"Subtitle of locked Scheduled Reminder" value:@"Some calendars may not be available when Face ID is required" table:0];

  return v3;
}

- (void)identityChanged:(id)a3
{
  objc_storeStrong((id *)&self->_limitedToSource, a3);

  [(EKCalendarChooserDefaultImpl *)self _delegateSelectionDidChange:0];
}

- (void)groupShowAllTapped:(id)a3
{
  id v9 = a3;
  -[EKCalendarChooserDefaultImpl _selectGroup:selected:](self, "_selectGroup:selected:", v9, [v9 selected] ^ 1);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    NSUInteger v7 = [(EKCalendarChooserDefaultImpl *)self _ekCalendarChooser];
    [v6 calendarChooserSelectionDidChange:v7];
  }
  uint64_t v8 = [(EKCalendarChooserDefaultImpl *)self _sectionIdentifierForGroup:v9];
  [(EKCalendarChooserDefaultImpl *)self _reloadCollectionViewSectionWithIdentifier:v8];
}

- (void)_delegateSelectionDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  [(EKCalendarChooserDefaultImpl *)self _reloadCalendars];
  [(EKCalendarChooserDefaultImpl *)self _updateViewControllerTitle];
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v8 = [(EKCalendarChooserDefaultImpl *)self _ekCalendarChooser];
      [v7 calendarChooserSelectedIdentityDidChange:v8];
    }
  }

  [(EKCalendarChooserDefaultImpl *)self refresh:0];
}

- (int)_numSelectedGroups
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = self->_groups;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "selected", (void)v9);
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (void)_selectGroup:(id)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (self->_style != 1)
  {
    long long v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2 object:self file:@"EKCalendarChooserDefaultImpl.m" lineNumber:2559 description:@"Invalid style"];
  }
  long long v40 = v7;
  if (!v4)
  {
    [v7 selectNone];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v25 = [v7 calendarInfos];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v46 != v28) {
            objc_enumerationMutation(v25);
          }
          id v30 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          uint64_t v31 = [v30 calendar];

          if (v31)
          {
            selectedCalendars = self->_selectedCalendars;
            uint64_t v33 = [v30 calendar];
            [(NSMutableSet *)selectedCalendars removeObject:v33];

            long long v43 = 0u;
            long long v44 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            uint64_t v34 = [v30 otherCalendars];
            uint64_t v35 = [v34 countByEnumeratingWithState:&v41 objects:v53 count:16];
            if (v35)
            {
              uint64_t v36 = v35;
              uint64_t v37 = *(void *)v42;
              do
              {
                for (uint64_t j = 0; j != v36; ++j)
                {
                  if (*(void *)v42 != v37) {
                    objc_enumerationMutation(v34);
                  }
                  [(NSMutableSet *)self->_selectedCalendars removeObject:*(void *)(*((void *)&v41 + 1) + 8 * j)];
                }
                uint64_t v36 = [v34 countByEnumeratingWithState:&v41 objects:v53 count:16];
              }
              while (v36);
            }
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v45 objects:v54 count:16];
      }
      while (v27);
    }

    uint64_t v23 = self;
    uint64_t v24 = 0;
    goto LABEL_34;
  }
  [v7 selectAll];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v8 = [v7 calendarInfos];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v50;
    do
    {
      for (uint64_t k = 0; k != v10; ++k)
      {
        if (*(void *)v50 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v49 + 1) + 8 * k);
        uint64_t v14 = [v13 calendar];
        if (v14)
        {
          id v15 = (void *)v14;
          int v16 = [v13 isEnabled];

          if (v16)
          {
            id v17 = self->_selectedCalendars;
            uint64_t v18 = [v13 calendar];
            [(NSMutableSet *)v17 addObject:v18];

            uint64_t v19 = [v13 otherCalendars];

            if (v19)
            {
              unint64_t v20 = self->_selectedCalendars;
              uint64_t v21 = [v13 otherCalendars];
              [(NSMutableSet *)v20 addObjectsFromArray:v21];
            }
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v10);
  }

  NSUInteger v22 = [(NSArray *)self->_groups count];
  if (v22 == [(EKCalendarChooserDefaultImpl *)self _numSelectedGroups])
  {
    uint64_t v23 = self;
    uint64_t v24 = 1;
LABEL_34:
    [(EKCalendarChooserDefaultImpl *)v23 setAllSelected:v24];
  }
}

- (void)_selectCalendar:(id)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (self->_style != 1)
  {
    uint64_t v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2 object:self file:@"EKCalendarChooserDefaultImpl.m" lineNumber:2593 description:@"Invalid style"];
  }
  uint64_t v8 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = v8;
    uint64_t v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    if (v4) {
      long long v12 = @"selected";
    }
    else {
      long long v12 = @"deselected";
    }
    id v13 = [v7 calendar];
    uint64_t v14 = [v13 calendarIdentifier];
    *(_DWORD *)buf = 138412802;
    long long v43 = v11;
    __int16 v44 = 2112;
    long long v45 = v12;
    __int16 v46 = 2112;
    long long v47 = v14;
    _os_log_impl(&dword_1B3F4C000, v9, OS_LOG_TYPE_INFO, "[UserStateLog] Action -> %@ calendar %@. calendarIdentifier = %@", buf, 0x20u);
  }
  if (!v4)
  {
    [v7 setSelected:0];
    uint64_t v27 = [v7 group];
    [v27 setSelected:0];

    uint64_t v28 = [v7 calendar];

    if (!v28) {
      goto LABEL_26;
    }
    selectedCalendars = self->_selectedCalendars;
    id v30 = [v7 calendar];
    [(NSMutableSet *)selectedCalendars removeObject:v30];

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v31 = objc_msgSend(v7, "otherCalendars", 0);
    uint64_t v32 = [v31 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v38 != v34) {
            objc_enumerationMutation(v31);
          }
          [(NSMutableSet *)self->_selectedCalendars removeObject:*(void *)(*((void *)&v37 + 1) + 8 * i)];
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v33);
    }

LABEL_25:
    [(EKCalendarChooserDefaultImpl *)self setAllSelected:v4];
    goto LABEL_26;
  }
  [v7 setSelected:1];
  id v15 = [v7 calendar];

  if (v15)
  {
    int v16 = self->_selectedCalendars;
    id v17 = [v7 calendar];
    [(NSMutableSet *)v16 addObject:v17];
  }
  uint64_t v18 = [v7 otherCalendars];

  if (v18)
  {
    uint64_t v19 = self->_selectedCalendars;
    unint64_t v20 = [v7 otherCalendars];
    [(NSMutableSet *)v19 addObjectsFromArray:v20];
  }
  uint64_t v21 = [v7 group];
  uint64_t v22 = [v21 numSelectableCalendars];
  uint64_t v23 = [v7 group];
  uint64_t v24 = [v23 numSelectedCalendars];

  if (v22 == v24)
  {
    uint64_t v25 = [v7 group];
    [v25 setSelected:1];

    NSUInteger v26 = [(NSArray *)self->_groups count];
    if (v26 == [(EKCalendarChooserDefaultImpl *)self _numSelectedGroups]) {
      goto LABEL_25;
    }
  }
LABEL_26:
}

- (void)_selectAllCalendarsAndStores:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_style != 1)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"EKCalendarChooserDefaultImpl.m" lineNumber:2632 description:@"Invalid style"];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v5 = self->_groups;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        -[EKCalendarChooserDefaultImpl _selectGroup:selected:](self, "_selectGroup:selected:", *(void *)(*((void *)&v12 + 1) + 8 * v9++), v3, (void)v12);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)_userDidSelectCalendar:(id)a3 selected:(BOOL)a4 withIndexPath:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  [(EKCalendarChooserDefaultImpl *)self _selectCalendar:a3 selected:v5];
  [(EKCalendarChooserDefaultImpl *)self _reconfigureCollectionViewAtIndexPath:v8];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v8) = objc_opt_respondsToSelector();

  if (v8)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v10 = [(EKCalendarChooserDefaultImpl *)self _ekCalendarChooser];
    [v11 calendarChooserSelectionDidChange:v10];
  }
}

- (void)_accessoryButtonTappedAtIndexPath:(id)a3
{
  id v21 = a3;
  BOOL v4 = -[EKCalendarChooserDefaultImpl _groupForSection:](self, "_groupForSection:", [v21 section]);
  unint64_t v5 = -[EKCalendarChooserDefaultImpl _rowIndex:toCalendarIndexInGroup:](self, "_rowIndex:toCalendarIndexInGroup:", [v21 row], v4);
  uint64_t v6 = [v4 calendarInfos];
  unint64_t v7 = [v6 count];

  if (v5 < v7)
  {
    id v8 = [v4 calendarInfos];
    uint64_t v9 = [v8 objectAtIndex:v5];

    uint64_t v10 = [v9 calendar];
    int v11 = [v10 isSubscribed];

    if (v11)
    {
      long long v12 = [EKSubscribedCalendarEditor alloc];
      long long v13 = [v9 calendar];
      eventStore = self->_eventStore;
      limitedToSource = self->_limitedToSource;
      int v16 = v12;
      uint64_t v17 = v13;
      unint64_t entityType = 0;
    }
    else
    {
      uint64_t v19 = [EKCalendarEditor alloc];
      long long v13 = [v9 calendar];
      eventStore = self->_eventStore;
      unint64_t entityType = self->_entityType;
      limitedToSource = self->_limitedToSource;
      int v16 = v19;
      uint64_t v17 = v13;
    }
    unint64_t v20 = (void *)[v16 initWithCalendar:v17 eventStore:eventStore entityType:entityType limitedToSource:limitedToSource];

    [(EKCalendarChooserDefaultImpl *)self _presentEditor:v20 withIndexPath:v21 barButtonItem:0 permittedArrowDirections:12 animated:1 completion:0];
  }
}

- (void)presentAccountErrorAlertForGroup:(id)a3
{
  id v4 = a3;
  [v4 setShowAccountErrorActionButtonSpinner:1];
  unint64_t v5 = [(EKCalendarChooserDefaultImpl *)self _sectionIdentifierForGroup:v4];
  [(EKCalendarChooserDefaultImpl *)self _reloadCollectionViewSectionWithIdentifier:v5];

  [(EKCalendarChooserDefaultImpl *)self _sendAnalyticsEvent:16 forGroup:v4];
  uint64_t v6 = [v4 source];
  uint64_t v7 = [v4 accountError];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __65__EKCalendarChooserDefaultImpl_presentAccountErrorAlertForGroup___block_invoke;
  v9[3] = &unk_1E6087D68;
  id v10 = v4;
  int v11 = self;
  id v8 = v4;
  +[EKUIAccountErrorDisplayer presentAlertForAccount:v6 error:v7 usingViewController:self completion:v9];
}

void __65__EKCalendarChooserDefaultImpl_presentAccountErrorAlertForGroup___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setShowAccountErrorActionButtonSpinner:0];
  id v2 = *(void **)(a1 + 40);
  id v3 = [v2 _sectionIdentifierForGroup:*(void *)(a1 + 32)];
  [v2 _reloadCollectionViewSectionWithIdentifier:v3];
}

- (void)_sendAnalyticsEvent:(unint64_t)a3 forGroup:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a4 source];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = [v6 sourceIdentifier];
    if (v8)
    {
      accountErrorAnalyticsState = self->_accountErrorAnalyticsState;
      if (!accountErrorAnalyticsState)
      {
        id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        int v11 = self->_accountErrorAnalyticsState;
        self->_accountErrorAnalyticsState = v10;

        accountErrorAnalyticsState = self->_accountErrorAnalyticsState;
      }
      long long v12 = [(NSMutableDictionary *)accountErrorAnalyticsState objectForKeyedSubscript:v8];
      uint64_t v13 = [v12 unsignedIntegerValue];

      if ((v13 & a3) == 0)
      {
        switch(a3)
        {
          case 1uLL:
            +[EKUIAccountErrorsAnalyticsTracker trackCalendarListDisplayedActionableError];
            break;
          case 2uLL:
            +[EKUIAccountErrorsAnalyticsTracker trackCalendarListDisplayedUnknownError];
            break;
          case 3uLL:
          case 5uLL:
          case 6uLL:
          case 7uLL:
            goto LABEL_12;
          case 4uLL:
            +[EKUIAccountErrorsAnalyticsTracker trackCalendarListDisplayedOfflineError];
            break;
          case 8uLL:
            +[EKUIAccountErrorsAnalyticsTracker trackCalendarListDisplayedOtherError];
            break;
          default:
            if (a3 == 16)
            {
              +[EKUIAccountErrorsAnalyticsTracker trackCalendarListInteractedWithError];
            }
            else
            {
LABEL_12:
              long long v15 = kEKUILogHandle;
              if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
              {
                int v17 = 134217984;
                uint64_t v18 = v13;
                _os_log_impl(&dword_1B3F4C000, v15, OS_LOG_TYPE_ERROR, "Invalid value passed to _sendAnalyticsEvent:forGroup: %lu", (uint8_t *)&v17, 0xCu);
              }
            }
            break;
        }
        int v16 = [NSNumber numberWithUnsignedInteger:v13 | a3];
        [(NSMutableDictionary *)self->_accountErrorAnalyticsState setObject:v16 forKeyedSubscript:v8];
      }
    }
    else
    {
      long long v14 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
      {
        int v17 = 138412290;
        uint64_t v18 = (uint64_t)v7;
        _os_log_impl(&dword_1B3F4C000, v14, OS_LOG_TYPE_ERROR, "Source has no identifier: %@", (uint8_t *)&v17, 0xCu);
      }
    }
  }
}

- (void)calendarEditor:(id)a3 didCompleteWithAction:(int)a4
{
  if (self->_presentedEditor == a3)
  {
    uint64_t v4 = *(void *)&a4;
    uint64_t v6 = [a3 calendar];
    [(EKCalendarChooserDefaultImpl *)self _calendarEditorDidCompleteWithAction:v4 createdCalendar:v6];

    presentedEditor = self->_presentedEditor;
    self->_presentedEditor = 0;

    id v8 = [(EKCalendarChooserDefaultImpl *)self navigationController];
    [v8 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_calendarEditorDidCompleteWithAction:(int)a3 createdCalendar:(id)a4
{
  id v9 = a4;
  if (a3 != 1)
  {
    if (a3 != 3) {
      goto LABEL_7;
    }
    if ([(EKCalendarChooserDefaultImpl *)self selectionStyle] == 1)
    {
      uint64_t v6 = (void *)MEMORY[0x1E4F1CA80];
      uint64_t v7 = [(EKCalendarChooserDefaultImpl *)self selectedCalendars];
      id v8 = [v6 setWithSet:v7];

      [v8 addObject:v9];
      [(EKCalendarChooserDefaultImpl *)self setSelectedCalendarsAndNotify:v8];
    }
  }
  [(EKCalendarChooserDefaultImpl *)self _eventStoreChanged:0];
  if (self->_chooserMode == 1) {
    [(EKCalendarChooserDefaultImpl *)self setSelectedCalendar:v9];
  }
LABEL_7:
}

- (void)focusBannerCollectionViewCellToggled:(id)a3
{
  if ([a3 on]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2;
  }
  id v5 = [(EKCalendarChooserDefaultImpl *)self delegate];
  [v5 setFocusFilterMode:v4];
}

- (void)setToolbarItems:(id)a3
{
  id v4 = a3;
  id v5 = [(EKCalendarChooserDefaultImpl *)self _ekCalendarChooser];
  [v5 setToolbarItems:v4];
}

- (id)toolbarItems
{
  id v2 = [(EKCalendarChooserDefaultImpl *)self _ekCalendarChooser];
  id v3 = [v2 toolbarItems];

  return v3;
}

- (void)setToolbarItems:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(EKCalendarChooserDefaultImpl *)self _ekCalendarChooser];
  [v7 setToolbarItems:v6 animated:v4];
}

- (id)navigationItem
{
  id v2 = [(EKCalendarChooserDefaultImpl *)self _ekCalendarChooser];
  id v3 = [v2 navigationItem];

  return v3;
}

- (id)navigationController
{
  id v2 = [(EKCalendarChooserDefaultImpl *)self _ekCalendarChooser];
  id v3 = [v2 navigationController];

  return v3;
}

- (EKUIViewControllerNavigationDelegate)navigationDelegate
{
  p_navigationDelegate = &self->_navigationDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_navigationDelegate);
  }
  else
  {
    id v5 = [(EKCalendarChooserDefaultImpl *)self navigationController];
  }

  return (EKUIViewControllerNavigationDelegate *)v5;
}

- (void)setNavigationDelegate:(id)a3
{
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  if (-[EKCalendarChooserDefaultImpl _isFocusBannerSection:](self, "_isFocusBannerSection:", [v5 section])|| -[EKCalendarChooserDefaultImpl _isDeclinedEventsSwitchSection:](self, "_isDeclinedEventsSwitchSection:", objc_msgSend(v5, "section")))
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    BOOL v6 = !-[EKCalendarChooserDefaultImpl _isDelegateCalendarsButtonSection:](self, "_isDelegateCalendarsButtonSection:", [v5 section]);
  }

  return v6;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v22 = a4;
  [a3 deselectItemAtIndexPath:v22 animated:1];
  BOOL v6 = -[EKCalendarChooserDefaultImpl _sectionHasHeader:](self, "_sectionHasHeader:", [v22 section]);
  id v7 = v22;
  if (!v6 || (v8 = [v22 row], id v7 = v22, v8))
  {
    if (-[EKCalendarChooserDefaultImpl _isIdentityChooserSection:](self, "_isIdentityChooserSection:", [v7 section]))
    {
      uint64_t v9 = [v22 row];
      if (v9 == [(EKCalendarChooserDefaultImpl *)self _rowIndexForMeDelegate])
      {
        limitedToSource = self->_limitedToSource;
        self->_limitedToSource = 0;
      }
      else
      {
        -[NSArray objectAtIndex:](self->_delegateSources, "objectAtIndex:", -[EKCalendarChooserDefaultImpl _rowIndexToDelegateSourceIndex:](self, "_rowIndexToDelegateSourceIndex:", [v22 row]));
        uint64_t v13 = (EKSource *)objc_claimAutoreleasedReturnValue();
        limitedToSource = self->_limitedToSource;
        self->_limitedToSource = v13;
      }

      [(EKCalendarChooserDefaultImpl *)self _delegateSelectionDidChange:1];
      -[EKCalendarChooserDefaultImpl _reloadCollectionViewSection:](self, "_reloadCollectionViewSection:", [v22 section]);
    }
    else
    {
      int v11 = -[EKCalendarChooserDefaultImpl _groupForSection:](self, "_groupForSection:", [v22 section]);
      if (v11)
      {
        int64_t v12 = [(EKCalendarChooserDefaultImpl *)self _accountErrorActionRowIndexForGroup:v11];
        if (v12 == [v22 row])
        {
          [(EKCalendarChooserDefaultImpl *)self presentAccountErrorAlertForGroup:v11];
        }
        else
        {
          int64_t v14 = -[EKCalendarChooserDefaultImpl _rowIndex:toCalendarIndexInGroup:](self, "_rowIndex:toCalendarIndexInGroup:", [v22 row], v11);
          long long v15 = [v11 calendarInfos];
          int v16 = [v15 objectAtIndex:v14];

          int64_t style = self->_style;
          if (style)
          {
            if (style == 1
              && v16
              && [(EKCalendarChooserDefaultImpl *)self _isCalendarEnabled:v16])
            {
              -[EKCalendarChooserDefaultImpl _userDidSelectCalendar:selected:withIndexPath:](self, "_userDidSelectCalendar:selected:withIndexPath:", v16, [v16 selected] ^ 1, v22);
            }
          }
          else if (!v16 || [(EKCalendarChooserDefaultImpl *)self _isCalendarEnabled:v16])
          {
            [(EKCalendarChooserDefaultImpl *)self setCheckedRow:v22];
            id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            char v19 = objc_opt_respondsToSelector();

            if (v19)
            {
              id v20 = objc_loadWeakRetained((id *)&self->_delegate);
              id v21 = [(EKCalendarChooserDefaultImpl *)self _ekCalendarChooser];
              [v20 calendarChooserSelectionDidChange:v21];
            }
          }
        }
      }
    }
    id v7 = v22;
  }
}

- (int64_t)selectionStyle
{
  return self->_style;
}

- (void)setSelectionStyle:(int64_t)a3
{
  self->_int64_t style = a3;
}

- (EKCalendarChooserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKCalendarChooserDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableSet)selectedCalendarSet
{
  return self->_selectedCalendars;
}

- (void)setSelectedCalendarSet:(id)a3
{
}

- (BOOL)showDetailAccessories
{
  return self->_showDetailAccessories;
}

- (void)setShowDetailAccessories:(BOOL)a3
{
  self->_showDetailAccessories = a3;
}

- (int64_t)chooserMode
{
  return self->_chooserMode;
}

- (EKEventStore)eventStore
{
  return self->_eventStore;
}

- (BOOL)showAccountStatus
{
  return self->_showAccountStatus;
}

- (void)setShowAccountStatus:(BOOL)a3
{
  self->_showAccountStatus = a3;
}

- (BOOL)disableCalendarEditing
{
  return self->disableCalendarEditing;
}

- (void)setDisableCalendarEditing:(BOOL)a3
{
  self->disableCalendarEditing = a3;
}

- (int)explanatoryTextMode
{
  return self->_explanatoryTextMode;
}

- (BOOL)onlyShowUnmanagedAccounts
{
  return self->onlyShowUnmanagedAccounts;
}

- (void)setOnlyShowUnmanagedAccounts:(BOOL)a3
{
  self->onlyShowUnmanagedAccounts = a3;
}

- (BOOL)showsDeclinedEventsSetting
{
  return self->showsDeclinedEventsSetting;
}

- (void)setShowsDeclinedEventsSetting:(BOOL)a3
{
  self->showsDeclinedEventsSetting = a3;
}

- (BOOL)showsCompletedRemindersSetting
{
  return self->showsCompletedRemindersSetting;
}

- (void)setShowsCompletedRemindersSetting:(BOOL)a3
{
  self->showsCompletedRemindersSetting = a3;
}

- (NSSet)collapsedSectionIdentifiers
{
  return self->_collapsedSectionIdentifiers;
}

- (unint64_t)entityType
{
  return self->_entityType;
}

- (void)setEntityType:(unint64_t)a3
{
  self->_unint64_t entityType = a3;
}

- (int64_t)lastAuthorizationStatus
{
  return self->_lastAuthorizationStatus;
}

- (void)setLastAuthorizationStatus:(int64_t)a3
{
  self->_uint64_t lastAuthorizationStatus = a3;
}

- (BOOL)shouldOverrideAuthorizationStatus
{
  return self->_shouldOverrideAuthorizationStatus;
}

- (void)setShouldOverrideAuthorizationStatus:(BOOL)a3
{
  self->_shouldOverrideAuthorizationStatus = a3;
}

- (EKEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (UIBarButtonItem)showAllButton
{
  return self->_showAllButton;
}

- (void)setShowAllButton:(id)a3
{
}

- (NSArray)groups
{
  return self->_groups;
}

- (void)setGroups:(id)a3
{
}

- (NSArray)allGroups
{
  return self->_allGroups;
}

- (void)setAllGroups:(id)a3
{
}

- (int64_t)numCalendarsHiddenByFocus
{
  return self->_numCalendarsHiddenByFocus;
}

- (void)setNumCalendarsHiddenByFocus:(int64_t)a3
{
  self->_numCalendarsHiddenByFocus = a3;
}

- (NSIndexPath)checkedRow
{
  return self->_checkedRow;
}

- ($7C92223F3A9F3C85702FE9D2C49D13A2)flags
{
  return ($7C92223F3A9F3C85702FE9D2C49D13A2)self->_flags;
}

- (void)setFlags:(id)a3
{
  self->_char flags = ($0B936CC4D07F8D2842192E93A83ADC61)a3;
}

- (void)setAccessDeniedView:(id)a3
{
}

- (EKAbstractCalendarEditor)presentedEditor
{
  return self->_presentedEditor;
}

- (void)setPresentedEditor:(id)a3
{
}

- (BOOL)canShowIdentityChooser
{
  return self->_canShowIdentityChooser;
}

- (void)setCanShowIdentityChooser:(BOOL)a3
{
  self->_canShowIdentityChooser = a3;
}

- (BOOL)canShowDelegateSetupCell
{
  return self->_canShowDelegateSetupCell;
}

- (void)setCanShowDelegateSetupCell:(BOOL)a3
{
  self->_canShowDelegateSetupCell = a3;
}

- (UIRefreshControl)refreshControl
{
  return self->_refreshControl;
}

- (void)setRefreshControl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshControl, 0);
  objc_storeStrong((id *)&self->_presentedEditor, 0);
  objc_storeStrong((id *)&self->_accessDeniedView, 0);
  objc_storeStrong((id *)&self->_checkedRow, 0);
  objc_storeStrong((id *)&self->_allGroups, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_showAllButton, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_collapsedSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_selectedCalendars, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_limitedToSource, 0);
  objc_storeStrong((id *)&self->_pendingShowCompletedReminders, 0);
  objc_storeStrong((id *)&self->_pendingShowDeclinedEvents, 0);
  objc_destroyWeak((id *)&self->_navigationDelegate);
  objc_storeStrong((id *)&self->_addCalendarButton, 0);
  objc_storeStrong((id *)&self->_currentKnownCalendarIds, 0);
  objc_storeStrong((id *)&self->_delegateSources, 0);
  objc_storeStrong((id *)&self->_accountErrorAnalyticsState, 0);

  objc_storeStrong((id *)&self->_currentAccountRefresher, 0);
}

@end