@interface EKLocationEditItemViewController
+ (id)_boldTitleFont;
+ (id)_sectionNameForSection:(unint64_t)a3;
- (BOOL)_singleSearchBar;
- (BOOL)autoFillSelectedTextField;
- (BOOL)canManagePresentationStyle;
- (BOOL)conferenceTextFieldSelected;
- (BOOL)conferenceViewModelRemoved;
- (BOOL)disableConferenceTextField;
- (BOOL)forceSingleTextField;
- (BOOL)locationViewModelRemoved;
- (BOOL)needsSave;
- (BOOL)pendingVirtualConference;
- (BOOL)presentModally;
- (BOOL)searchIsFirstResponder;
- (BOOL)shouldIncludeConferenceRoom:(id)a3;
- (BOOL)showAvailableConferenceTypesAsRows;
- (BOOL)showingCurrentLocationRow;
- (BOOL)showingTextRow;
- (BOOL)tableView:(id)a3 wantsHeaderForSection:(int64_t)a4;
- (BOOL)wantsManagement;
- (CGSize)preferredContentSize;
- (EKLocationEditItemViewController)initWithFrame:(CGRect)a3 calendarItem:(id)a4 eventStore:(id)a5;
- (EKStructuredLocation)selectedLocation;
- (EKUIConferenceRoom)selectedConferenceRoom;
- (EKUILocationRowModel)conferenceViewModel;
- (EKUILocationRowModel)locationViewModel;
- (EKVirtualConference)selectedVirtualConference;
- (NSError)pendingVirtualConferenceError;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_cellForConferenceRoom:(id)a3 atIndexPath:(id)a4;
- (id)_focusedTextField;
- (id)_rowNameForIndexPath:(id)a3;
- (id)calendarItemForSearchModel:(id)a3;
- (id)conferenceRoomForRecent:(id)a3;
- (id)contactsImage;
- (id)itemAtIndexPath:(id)a3;
- (id)locationArrowImage;
- (id)searchText;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)title;
- (id)viewDidAppearBlock;
- (int64_t)_accessoryTypeForSection:(unint64_t)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)supportedSearchTypes;
- (void)_setupViewsAndConstraints;
- (void)kickoffSearchTextChangedIfNonEmpty;
- (void)locationSearchModel:(id)a3 selectedLocation:(id)a4 withError:(id)a5;
- (void)locationSearchModel:(id)a3 updatedSearchTypes:(unint64_t)a4;
- (void)pendingVideoConferenceUpdated:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBecomeFirstResponder;
- (void)searchDoneTapped;
- (void)searchResignFirstResponder;
- (void)searchTextChanged:(id)a3;
- (void)searchTextChanged:(id)a3 allowClearingCheckedVirtualConference:(BOOL)a4;
- (void)selectedRoomType:(id)a3;
- (void)selectedTextFieldChanged:(id)a3;
- (void)setAutoFillSelectedTextField:(BOOL)a3;
- (void)setConferenceTextFieldSelected:(BOOL)a3;
- (void)setConferenceViewModel:(id)a3;
- (void)setDisableConferenceTextField:(BOOL)a3;
- (void)setForceSingleTextField:(BOOL)a3;
- (void)setLocationViewModel:(id)a3;
- (void)setNeedsSave:(BOOL)a3;
- (void)setPendingVirtualConference:(BOOL)a3;
- (void)setPendingVirtualConferenceError:(id)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)setSearchText:(id)a3;
- (void)setSelectedConferenceRoom:(id)a3;
- (void)setSelectedLocation:(id)a3;
- (void)setSelectedVirtualConference:(id)a3;
- (void)setSupportedSearchTypes:(unint64_t)a3;
- (void)setViewDidAppearBlock:(id)a3;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)textField:(id)a3 didChange:(id)a4;
- (void)useAsString:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation EKLocationEditItemViewController

- (EKLocationEditItemViewController)initWithFrame:(CGRect)a3 calendarItem:(id)a4 eventStore:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  id v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)EKLocationEditItemViewController;
  v14 = -[EKEditItemViewController initWithFrame:](&v21, sel_initWithFrame_, x, y, width, height);
  if (v14)
  {
    v15 = [[EKUILocationSearchModel alloc] initWithEventStore:v13];
    searchModel = v14->_searchModel;
    v14->_searchModel = v15;

    [(EKUILocationSearchModel *)v14->_searchModel setDelegate:v14];
    objc_storeStrong((id *)&v14->_calendarItem, a4);
    v14->_autoFillSelectedTextField = 1;
    v14->_supportedSearchTypes = 2047;
    v14->_shouldShowCheckedVirtualConference = 1;
    v17 = [(EKCalendarItem *)v14->_calendarItem calendar];
    v18 = [v17 source];
    v19 = [v18 constraints];
    v14->_supportsStructuredLocations = [v19 supportsStructuredLocations];

    [(EKLocationEditItemViewController *)v14 setDefinesPresentationContext:1];
  }

  return v14;
}

- (id)title
{
  v2 = EventKitUIBundle();
  v3 = [v2 localizedStringForKey:@"Location" value:&stru_1F0CC2140 table:0];

  return v3;
}

- (void)viewDidLoad
{
  v32.receiver = self;
  v32.super_class = (Class)EKLocationEditItemViewController;
  [(EKEditItemViewController *)&v32 viewDidLoad];
  [(EKLocationEditItemViewController *)self _setupViewsAndConstraints];
  if (self->_supportsStructuredLocations)
  {
    unint64_t supportedSearchTypes = self->_supportedSearchTypes;
    if (supportedSearchTypes)
    {
      [(EKUILocationSearchModel *)self->_searchModel getCurrentLocation];
      unint64_t supportedSearchTypes = self->_supportedSearchTypes;
    }
    if ((supportedSearchTypes & 0x10) != 0) {
      [(EKUILocationSearchModel *)self->_searchModel updateRecents:0];
    }
  }
  if ((self->_supportedSearchTypes & 0x200) != 0) {
    [(EKUILocationSearchModel *)self->_searchModel updateVirtualConferenceRoomOptions:0];
  }
  BOOL v4 = [(EKLocationEditItemViewController *)self _singleSearchBar];
  v5 = [(EKLocationEditItemViewController *)self locationViewModel];
  v6 = [v5 location];

  if (!v4)
  {
    id v13 = [(EKLocationEditItemViewController *)self conferenceViewModel];
    v11 = [v13 conference];

    BOOL v14 = [(EKLocationEditItemViewController *)self autoFillSelectedTextField]
       || [(EKLocationEditItemViewController *)self conferenceTextFieldSelected];
    if ([(EKLocationEditItemViewController *)self autoFillSelectedTextField])
    {
      int v15 = 1;
      if (!v14) {
        goto LABEL_26;
      }
    }
    else
    {
      int v15 = ![(EKLocationEditItemViewController *)self conferenceTextFieldSelected];
      if (!v14) {
        goto LABEL_26;
      }
    }
    v16 = [v6 address];

    if (v16)
    {
      v17 = (void *)MEMORY[0x1E4F57740];
      v18 = [v6 title];
      v19 = [v6 address];
      v20 = [v17 fullDisplayStringWithTitle:v18 address:v19];

      objc_super v21 = [v20 _stringByReplacingCharactersInSet:CFCharacterSetGetPredefined(kCFCharacterSetNewline) withCharacter:32];
      v22 = [(EKLocationVirtualConferenceSearchFieldsView *)self->_searchFieldsView locationTextField];
      [v22 setText:v21];
    }
    else
    {
      v24 = [v6 title];

      if (!v24) {
        goto LABEL_26;
      }
      v20 = [v6 title];
      objc_super v21 = [(EKLocationVirtualConferenceSearchFieldsView *)self->_searchFieldsView locationTextField];
      [v21 setText:v20];
    }

LABEL_26:
    if (!v15) {
      goto LABEL_32;
    }
    if (v11)
    {
      v25 = (void *)MEMORY[0x1E4F57B50];
      v26 = [v11 joinMethods];
      v27 = [v26 firstObject];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __47__EKLocationEditItemViewController_viewDidLoad__block_invoke;
      v31[3] = &unk_1E60877E8;
      v31[4] = self;
      [v25 displayDetailsForJoinMethod:v27 completionHandler:v31];

      return;
    }
    v28 = [(EKLocationEditItemViewController *)self conferenceViewModel];

    if (!v28) {
      goto LABEL_32;
    }
    id v12 = EventKitUIBundle();
    v29 = [v12 localizedStringForKey:@"Pending Video Call" value:&stru_1F0CC2140 table:0];
    v30 = [(EKLocationVirtualConferenceSearchFieldsView *)self->_searchFieldsView virtualConferenceTextField];
    [v30 setText:v29];

    goto LABEL_31;
  }
  if (self->_autoFillSelectedTextField)
  {
    v7 = [v6 address];

    if (v7)
    {
      v8 = (void *)MEMORY[0x1E4F57740];
      v9 = [v6 title];
      v10 = [v6 address];
      v11 = [v8 fullDisplayStringWithTitle:v9 address:v10];

      id v12 = [v11 _stringByReplacingCharactersInSet:CFCharacterSetGetPredefined(kCFCharacterSetNewline) withCharacter:32];
      [(EKLocationEditItemViewController *)self setSearchText:v12];
LABEL_31:

      goto LABEL_32;
    }
    v23 = [v6 title];

    if (v23)
    {
      v11 = [v6 title];
      [(EKLocationEditItemViewController *)self setSearchText:v11];
LABEL_32:
    }
  }

  [(EKLocationEditItemViewController *)self kickoffSearchTextChangedIfNonEmpty];
}

void __47__EKLocationEditItemViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__EKLocationEditItemViewController_viewDidLoad__block_invoke_2;
  v6[3] = &unk_1E6087D68;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __47__EKLocationEditItemViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = [*(id *)(*(void *)(a1 + 32) + 1080) virtualConferenceTextField];
  [v3 setText:v2];

  id v4 = *(void **)(a1 + 32);

  return [v4 kickoffSearchTextChangedIfNonEmpty];
}

- (void)setPreferredContentSize:(CGSize)a3
{
  self->_preferredContentSize = a3;
}

- (CGSize)preferredContentSize
{
  double width = self->_preferredContentSize.width;
  double height = self->_preferredContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__EKLocationEditItemViewController_viewDidAppear___block_invoke;
  block[3] = &unk_1E6087570;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
  v5.receiver = self;
  v5.super_class = (Class)EKLocationEditItemViewController;
  [(EKLocationEditItemViewController *)&v5 viewDidAppear:v3];
}

void __50__EKLocationEditItemViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (!v2[1146] || v2[1147])
  {
    [v2 searchBecomeFirstResponder];
    uint64_t v2 = *(unsigned char **)(a1 + 32);
  }
  v2[1146] = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 1147) = 0;
  BOOL v3 = *(void **)(*(void *)(a1 + 32) + 1056);
  id v4 = [v3 indexPathsForVisibleRows];
  [v3 reloadRowsAtIndexPaths:v4 withRowAnimation:5];

  objc_super v5 = [*(id *)(a1 + 32) viewDidAppearBlock];

  if (v5)
  {
    id v7 = [*(id *)(a1 + 32) viewDidAppearBlock];
    v6 = [*(id *)(a1 + 32) _focusedTextField];
    v7[2](v7, v6);
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)EKLocationEditItemViewController;
  -[EKLocationEditItemViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if (v7) {
    [v7 targetTransform];
  }
  else {
    memset(&v9, 0, sizeof(v9));
  }
  IsIdentitdouble y = CGAffineTransformIsIdentity(&v9);
  self->_rotating = !IsIdentity;
  if (!IsIdentity) {
    self->_wasFirstResponder = [(EKLocationEditItemViewController *)self searchIsFirstResponder];
  }
}

- (void)_setupViewsAndConstraints
{
  v91[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB1D00]);
  id v4 = (UITableView *)objc_msgSend(v3, "initWithFrame:style:", 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  tableView = self->_tableView;
  self->_tableView = v4;

  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setKeyboardDismissMode:1];
  [(UITableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v6 lineHeight];
  -[UITableView setEstimatedRowHeight:](self->_tableView, "setEstimatedRowHeight:");

  [(UITableView *)self->_tableView setRowHeight:*MEMORY[0x1E4FB2F28]];
  id v7 = [(EKLocationEditItemViewController *)self view];
  [v7 addSubview:self->_tableView];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__EKLocationEditItemViewController__setupViewsAndConstraints__block_invoke;
  aBlock[3] = &unk_1E6089AA0;
  aBlock[4] = self;
  v8 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  uint64_t v9 = objc_opt_class();
  v8[2](v8, v9);
  uint64_t v10 = objc_opt_class();
  v8[2](v8, v10);
  uint64_t v11 = objc_opt_class();
  v8[2](v8, v11);
  uint64_t v12 = objc_opt_class();
  v88 = v8;
  v8[2](v8, v12);
  if ([(EKLocationEditItemViewController *)self _singleSearchBar])
  {
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1BF8]) initWithSearchResultsController:0];
    [v13 setObscuresBackgroundDuringPresentation:0];
    [v13 setHidesNavigationBarDuringPresentation:0];
    [v13 setAutomaticallyShowsCancelButton:0];
    BOOL v14 = [(EKLocationEditItemViewController *)self navigationItem];
    [v14 setPreferredSearchBarPlacement:2];

    int v15 = [(EKLocationEditItemViewController *)self navigationItem];
    v86 = v13;
    [v15 setSearchController:v13];

    v16 = [(EKLocationEditItemViewController *)self navigationItem];
    [v16 setHidesSearchBarWhenScrolling:0];

    v17 = [v13 searchBar];
    searchBar = self->_searchBar;
    self->_searchBar = v17;

    [(UISearchBar *)self->_searchBar setAutocorrectionType:0];
    [(UISearchBar *)self->_searchBar setDelegate:self];
    unint64_t supportedSearchTypes = self->_supportedSearchTypes;
    v20 = EventKitUIBundle();
    objc_super v21 = v20;
    if ((supportedSearchTypes & 0x600) != 0) {
      v22 = @"Enter Location or Video Call";
    }
    else {
      v22 = @"Enter Location";
    }
    v85 = [v20 localizedStringForKey:v22 value:&stru_1F0CC2140 table:0];

    [(UISearchBar *)self->_searchBar setPlaceholder:v85];
    [(UISearchBar *)self->_searchBar setReturnKeyType:9];
    [(UISearchBar *)self->_searchBar setEnablesReturnKeyAutomatically:1];
    [(UISearchBar *)self->_searchBar setTextContentType:*MEMORY[0x1E4FB2F80]];
    [(UISearchBar *)self->_searchBar setSearchBarStyle:2];
    v70 = (void *)MEMORY[0x1E4F28DC8];
    v81 = [(UITableView *)self->_tableView topAnchor];
    v83 = [(EKLocationEditItemViewController *)self view];
    v79 = [v83 topAnchor];
    v77 = [v81 constraintEqualToAnchor:v79];
    v91[0] = v77;
    v73 = [(UITableView *)self->_tableView bottomAnchor];
    v75 = [(EKLocationEditItemViewController *)self view];
    v71 = [v75 bottomAnchor];
    v23 = [v73 constraintEqualToAnchor:v71];
    v91[1] = v23;
    v24 = [(UITableView *)self->_tableView leadingAnchor];
    v25 = [(EKLocationEditItemViewController *)self view];
    v26 = [v25 leadingAnchor];
    v27 = [v24 constraintEqualToAnchor:v26];
    v91[2] = v27;
    v28 = [(UITableView *)self->_tableView trailingAnchor];
    v29 = [(EKLocationEditItemViewController *)self view];
    v30 = [v29 trailingAnchor];
    v31 = [v28 constraintEqualToAnchor:v30];
    v91[3] = v31;
    objc_super v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:4];
    [v70 activateConstraints:v32];

    v33 = v86;
  }
  else
  {
    v34 = objc_alloc_init(EKLocationVirtualConferenceSearchFieldsView);
    searchFieldsView = self->_searchFieldsView;
    self->_searchFieldsView = v34;

    [(EKLocationVirtualConferenceSearchFieldsView *)self->_searchFieldsView setDelegate:self];
    [(EKLocationVirtualConferenceSearchFieldsView *)self->_searchFieldsView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(EKLocationVirtualConferenceSearchFieldsView *)self->_searchFieldsView preferredHeight];
    uint64_t v87 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, 0.0, v36 + 15.0);
    v37 = (_UINavigationBarPalette *)[objc_alloc(MEMORY[0x1E4FB21F8]) initWithContentView:v87];
    palette = self->_palette;
    self->_palette = v37;

    [(_UINavigationBarPalette *)self->_palette addSubview:self->_searchFieldsView];
    v63 = (void *)MEMORY[0x1E4F28DC8];
    v82 = [(EKLocationVirtualConferenceSearchFieldsView *)self->_searchFieldsView topAnchor];
    v84 = [(_UINavigationBarPalette *)self->_palette safeAreaLayoutGuide];
    v80 = [v84 topAnchor];
    v78 = [v82 constraintEqualToAnchor:v80];
    v90[0] = v78;
    v74 = [(EKLocationVirtualConferenceSearchFieldsView *)self->_searchFieldsView leadingAnchor];
    v76 = [(_UINavigationBarPalette *)self->_palette safeAreaLayoutGuide];
    v72 = [v76 leadingAnchor];
    v69 = [v74 constraintEqualToAnchor:v72 constant:20.0];
    v90[1] = v69;
    v68 = [(_UINavigationBarPalette *)self->_palette safeAreaLayoutGuide];
    v67 = [v68 trailingAnchor];
    v66 = [(EKLocationVirtualConferenceSearchFieldsView *)self->_searchFieldsView trailingAnchor];
    v65 = [v67 constraintEqualToAnchor:v66 constant:20.0];
    v90[2] = v65;
    v64 = [(_UINavigationBarPalette *)self->_palette safeAreaLayoutGuide];
    v62 = [v64 bottomAnchor];
    v61 = [(EKLocationVirtualConferenceSearchFieldsView *)self->_searchFieldsView bottomAnchor];
    v60 = [v62 constraintEqualToAnchor:v61 constant:15.0];
    v90[3] = v60;
    v58 = [(UITableView *)self->_tableView topAnchor];
    v59 = [(EKLocationEditItemViewController *)self view];
    v57 = [v59 topAnchor];
    v56 = [v58 constraintEqualToAnchor:v57];
    v90[4] = v56;
    v54 = [(UITableView *)self->_tableView bottomAnchor];
    v55 = [(EKLocationEditItemViewController *)self view];
    v53 = [v55 bottomAnchor];
    v52 = [v54 constraintEqualToAnchor:v53];
    v90[5] = v52;
    v39 = [(UITableView *)self->_tableView leadingAnchor];
    v40 = [(EKLocationEditItemViewController *)self view];
    v41 = [v40 leadingAnchor];
    v42 = [v39 constraintEqualToAnchor:v41];
    v90[6] = v42;
    v43 = [(UITableView *)self->_tableView trailingAnchor];
    v44 = [(EKLocationEditItemViewController *)self view];
    v45 = [v44 trailingAnchor];
    v46 = [v43 constraintEqualToAnchor:v45];
    v90[7] = v46;
    v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:8];
    [v63 activateConstraints:v47];

    v48 = self->_palette;
    v49 = [(EKLocationEditItemViewController *)self navigationItem];
    [v49 _setBottomPalette:v48];

    if ([(EKLocationEditItemViewController *)self conferenceTextFieldSelected]
      && ![(EKLocationEditItemViewController *)self disableConferenceTextField])
    {
      uint64_t v50 = [(EKLocationVirtualConferenceSearchFieldsView *)self->_searchFieldsView virtualConferenceTextField];
    }
    else
    {
      uint64_t v50 = [(EKLocationVirtualConferenceSearchFieldsView *)self->_searchFieldsView locationTextField];
    }
    v51 = (void *)v50;
    [(EKLocationVirtualConferenceSearchFieldsView *)self->_searchFieldsView setSelectedTextField:v50];

    [(EKLocationVirtualConferenceSearchFieldsView *)self->_searchFieldsView setDisableConferenceTextField:[(EKLocationEditItemViewController *)self disableConferenceTextField]];
    v33 = (void *)v87;
  }
}

void __61__EKLocationEditItemViewController__setupViewsAndConstraints__block_invoke(uint64_t a1, Class aClass)
{
  NSStringFromClass(aClass);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(a1 + 32) + 1056) registerClass:aClass forCellReuseIdentifier:v4];
}

- (BOOL)presentModally
{
  return 1;
}

- (void)setSupportedSearchTypes:(unint64_t)a3
{
  self->_unint64_t supportedSearchTypes = a3;
  -[EKUILocationSearchModel setSupportedSearchTypes:](self->_searchModel, "setSupportedSearchTypes:");
}

- (BOOL)showingTextRow
{
  id v3 = [(EKLocationEditItemViewController *)self searchText];
  id v4 = v3;
  LOBYTE(v5) = 0;
  if ((self->_supportedSearchTypes & 0x80) != 0 && v3) {
    int v5 = [v3 isEqualToString:&stru_1F0CC2140] ^ 1;
  }

  return v5;
}

- (BOOL)showingCurrentLocationRow
{
  id v3 = EventKitUIBundle();
  id v4 = [v3 localizedStringForKey:@"Current Location" value:&stru_1F0CC2140 table:0];

  int v5 = [(EKLocationEditItemViewController *)self searchText];
  v6 = v5;
  BOOL v7 = v5
    && ([v5 isEqualToString:&stru_1F0CC2140] & 1) == 0
    && [v4 compare:v6 options:9] == 0;
  BOOL v8 = 0;
  if (self->_searchModelCurrentLocation && !v7) {
    BOOL v8 = self->_supportedSearchTypes & 1;
  }

  return v8;
}

- (BOOL)showAvailableConferenceTypesAsRows
{
  if (self->_supportedSearchTypes == 1536) {
    return 1;
  }
  id v4 = [(EKLocationEditItemViewController *)self searchText];
  if ([v4 length])
  {
    BOOL v2 = 1;
  }
  else
  {
    int v5 = [(EKLocationEditItemViewController *)self traitCollection];
    BOOL v2 = EKUIUsesLargeTextLayout(v5);
  }
  return v2;
}

- (void)useAsString:(id)a3
{
  if ((self->_supportedSearchTypes & 0x80) != 0)
  {
    id v7 = [(EKLocationEditItemViewController *)self searchText];
    if ([v7 length])
    {
      id v4 = (void *)MEMORY[0x1E4F25630];
      int v5 = [(EKLocationEditItemViewController *)self searchText];
      v6 = [v4 locationWithTitle:v5];
      [(EKLocationEditItemViewController *)self setSelectedLocation:v6];
    }
    [(EKLocationEditItemViewController *)self searchResignFirstResponder];
  }
}

- (void)setSelectedConferenceRoom:(id)a3
{
  objc_storeStrong((id *)&self->_selectedConferenceRoom, a3);
  id v5 = a3;
  searchModel = self->_searchModel;
  id v8 = [(EKCalendarItem *)self->_calendarItem calendar];
  id v7 = [v8 source];
  [(EKUILocationSearchModel *)searchModel addConferenceRoomToRecents:v5 fromSource:v7];
}

- (id)itemAtIndexPath:(id)a3
{
  id v4 = a3;
  if ([v4 section] == 2)
  {
    id v5 = -[NSArray objectAtIndex:](self->_searchModelRecentsSearchResults, "objectAtIndex:", [v4 row]);
    v6 = [v5 recent];

    uint64_t v7 = [MEMORY[0x1E4F57C10] locationForRecent:v6];
LABEL_3:
    id v8 = (void *)v7;
LABEL_4:

LABEL_20:
    v22 = 0;
    goto LABEL_21;
  }
  if ([v4 section] != 5)
  {
    if ([v4 section] == 4)
    {
      uint64_t v18 = 1176;
    }
    else
    {
      if ([v4 section] != 6)
      {
        if ([v4 section] == 1)
        {
          v6 = -[NSArray objectAtIndex:](self->_searchModelVirtualConferenceRoomSearchResults, "objectAtIndex:", [v4 row]);
          v28 = (void *)MEMORY[0x1E4F25630];
          v29 = [v6 title];
          id v8 = [v28 locationWithTitle:v29];

          goto LABEL_4;
        }
LABEL_34:
        v22 = 0;
        goto LABEL_35;
      }
      uint64_t v18 = 1208;
    }
    v19 = *(NSArray **)((char *)&self->super.super.super.super.isa + v18);
    uint64_t v20 = [v4 row];
    searchModelFrequentsSearchResults = v19;
LABEL_18:
    uint64_t v17 = [(NSArray *)searchModelFrequentsSearchResults objectAtIndex:v20];
    goto LABEL_19;
  }
  uint64_t v9 = [v4 row];
  searchModelLocationFromMapsURL = self->_searchModelLocationFromMapsURL;
  NSUInteger v11 = [(NSArray *)self->_searchModelEventsSearchResults count];
  BOOL v12 = searchModelLocationFromMapsURL == 0;
  uint64_t v13 = searchModelLocationFromMapsURL != 0;
  if (v12) {
    int64_t v14 = v11;
  }
  else {
    int64_t v14 = v11 + 1;
  }
  NSUInteger v15 = [(NSArray *)self->_searchModelFrequentsSearchResults count];
  NSUInteger v16 = [(NSArray *)self->_searchModelMapCompletionSearchResults count];
  if (v9 < v13)
  {
    uint64_t v17 = [(EKStructuredLocationWithImage *)self->_searchModelLocationFromMapsURL location];
LABEL_19:
    id v8 = (void *)v17;
    goto LABEL_20;
  }
  if (v9 < v14)
  {
    v6 = [(NSArray *)self->_searchModelEventsSearchResults objectAtIndex:v9];
    uint64_t v7 = [v6 location];
    goto LABEL_3;
  }
  NSUInteger v26 = v16;
  uint64_t v27 = v15 + v14;
  if ([v4 row] < v27)
  {
    searchModelFrequentsSearchResults = self->_searchModelFrequentsSearchResults;
    uint64_t v20 = v9 - v14;
    goto LABEL_18;
  }
  if ([v4 row] >= (uint64_t)(v26 + v27)) {
    goto LABEL_34;
  }
  int64_t v30 = [(NSArray *)self->_searchModelMapCompletionSearchResults count];
  if ([v4 row] - v27 >= v30) {
    goto LABEL_34;
  }
  v22 = [(NSArray *)self->_searchModelMapCompletionSearchResults objectAtIndex:v9 - v27];
LABEL_35:
  id v8 = 0;
LABEL_21:
  if (v8) {
    v23 = v8;
  }
  else {
    v23 = v22;
  }
  id v24 = v23;

  return v24;
}

- (id)conferenceRoomForRecent:(id)a3
{
  id v4 = a3;
  if (!self->_cachedConferenceRooms)
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
    cachedConferenceRooms = self->_cachedConferenceRooms;
    self->_cachedConferenceRooms = v5;
  }
  uint64_t v7 = [(EKCalendarItem *)self->_calendarItem calendar];
  id v8 = [v7 source];

  uint64_t v9 = [MEMORY[0x1E4F57C10] directoryLocationForRecent:v4 onSource:v8];
  uint64_t v10 = NSString;
  NSUInteger v11 = [v9 preferredAddress];
  BOOL v12 = [v8 externalID];
  uint64_t v13 = [v10 stringWithFormat:@"%@.%@", v11, v12];

  int64_t v14 = [(NSMutableDictionary *)self->_cachedConferenceRooms objectForKey:v13];
  if (!v14)
  {
    int64_t v14 = objc_alloc_init(EKUIConferenceRoom);
    [(EKUIConferenceRoom *)v14 setLocation:v9];
    [(EKUIConferenceRoom *)v14 setAvailability:0];
    NSUInteger v15 = [v8 constraints];
    -[EKUIConferenceRoom setSupportsAvailability:](v14, "setSupportsAvailability:", [v15 supportsAvailabilityRequests]);

    [(NSMutableDictionary *)self->_cachedConferenceRooms setObject:v14 forKey:v13];
  }

  return v14;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  switch(a4)
  {
    case 0:
      LODWORD(v7) = [(EKLocationEditItemViewController *)self showingTextRow];
      BOOL v8 = [(EKLocationEditItemViewController *)self showingCurrentLocationRow];
      uint64_t v9 = 1;
      if (v7) {
        uint64_t v9 = 2;
      }
      if (v8) {
        int64_t v7 = v9;
      }
      else {
        int64_t v7 = v7;
      }
      break;
    case 1:
      BOOL v11 = [(EKLocationEditItemViewController *)self showAvailableConferenceTypesAsRows];
      NSUInteger v12 = [(NSArray *)self->_searchModelVirtualConferenceRoomSearchResults count];
      if (v11) {
        int64_t v7 = [(NSArray *)self->_searchModelVirtualConferenceCustomSearchResults count] + v12;
      }
      else {
        int64_t v7 = v12 != 0;
      }
      break;
    case 2:
      uint64_t v10 = 1184;
      goto LABEL_17;
    case 3:
      uint64_t v10 = 1216;
      goto LABEL_17;
    case 4:
      uint64_t v10 = 1176;
      goto LABEL_17;
    case 5:
      NSUInteger v13 = [(NSArray *)self->_searchModelFrequentsSearchResults count];
      NSUInteger v14 = [(NSArray *)self->_searchModelEventsSearchResults count] + v13;
      NSUInteger v15 = [(NSArray *)self->_searchModelMapCompletionSearchResults count];
      if (self->_searchModelLocationFromMapsURL) {
        int64_t v7 = v14 + v15 + 1;
      }
      else {
        int64_t v7 = v14 + v15;
      }
      break;
    case 6:
      uint64_t v10 = 1208;
LABEL_17:
      int64_t v7 = [*(id *)((char *)&self->super.super.super.super.isa + v10) count];
      break;
    default:
      int64_t v7 = 0;
      break;
  }
  NSUInteger v16 = (void *)kEKUILogEventEditorHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v17 = v16;
    uint64_t v18 = [(id)objc_opt_class() _sectionNameForSection:a4];
    v19 = [NSNumber numberWithUnsignedInteger:v7];
    int v21 = 138412546;
    v22 = v18;
    __int16 v23 = 2112;
    id v24 = v19;
    _os_log_impl(&dword_1B3F4C000, v17, OS_LOG_TYPE_DEBUG, "Number of rows for section [%@]: [%@]", (uint8_t *)&v21, 0x16u);
  }
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v23 = a4;
  if (![(EKLocationEditItemViewController *)self needsSave])
  {
    [(EKLocationEditItemViewController *)self setNeedsSave:1];
    if (![v23 section])
    {
      if ([v23 row] || !-[EKLocationEditItemViewController showingTextRow](self, "showingTextRow"))
      {
        if ([(EKLocationEditItemViewController *)self showingCurrentLocationRow]) {
          [(EKUILocationSearchModel *)self->_searchModel selectCurrentLocation];
        }
        else {
          NSLog(&cfstr_UnknownRowTapp.isa);
        }
      }
      else
      {
        [(EKLocationEditItemViewController *)self useAsString:0];
        [(EKEditItemViewController *)self saveAndDismiss];
      }
      goto LABEL_20;
    }
    if ([v23 section] == 3)
    {
      id v5 = -[NSArray objectAtIndex:](self->_searchModelConferenceRoomSearchResults, "objectAtIndex:", [v23 row]);
      [(EKLocationEditItemViewController *)self setSelectedConferenceRoom:v5];
      id v6 = [v5 location];
      int64_t v7 = [v6 displayName];
      [(EKLocationEditItemViewController *)self setSearchText:v7];

LABEL_5:
      [(EKLocationEditItemViewController *)self searchResignFirstResponder];
      [(EKEditItemViewController *)self saveAndDismiss];
LABEL_6:

      goto LABEL_20;
    }
    if ([v23 section] == 2)
    {
      BOOL v8 = -[NSArray objectAtIndex:](self->_searchModelRecentsSearchResults, "objectAtIndex:", [v23 row]);
      id v5 = [v8 recent];

      if ([MEMORY[0x1E4F57C10] recentIsDirectoryLocation:v5])
      {
        uint64_t v9 = [(EKLocationEditItemViewController *)self conferenceRoomForRecent:v5];
        [(EKLocationEditItemViewController *)self setSelectedConferenceRoom:v9];
        uint64_t v10 = [v9 location];
        BOOL v11 = [v10 displayName];
        [(EKLocationEditItemViewController *)self setSearchText:v11];

        [(EKLocationEditItemViewController *)self searchResignFirstResponder];
        [(EKEditItemViewController *)self saveAndDismiss];

        goto LABEL_6;
      }

      id v13 = v23;
LABEL_24:
      id v5 = [(EKLocationEditItemViewController *)self itemAtIndexPath:v13];
      EKWeakLinkClass();
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = v5;
        if (!v18) {
          goto LABEL_6;
        }
        v19 = v18;
        uint64_t v20 = [v18 address];

        if (v20)
        {
          [(EKUILocationSearchModel *)self->_searchModel selectLocation:v19];
        }
        else
        {
          v22 = [v19 title];
          [(EKLocationEditItemViewController *)self setSearchText:v22];

          [(EKLocationEditItemViewController *)self useAsString:0];
          [(EKEditItemViewController *)self saveAndDismiss];
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_6;
        }
        id v21 = v5;
        if (!v21) {
          goto LABEL_6;
        }
        [(EKUILocationSearchModel *)self->_searchModel selectMapSearchCompletion:v21];
      }

      goto LABEL_6;
    }
    uint64_t v12 = [v23 section];
    id v13 = v23;
    if (v12 != 1) {
      goto LABEL_24;
    }
    if ([(EKLocationEditItemViewController *)self showAvailableConferenceTypesAsRows])
    {
      uint64_t v14 = [v23 row];
      int64_t v15 = [(NSArray *)self->_searchModelVirtualConferenceRoomSearchResults count];
      NSUInteger v16 = [(NSArray *)self->_searchModelVirtualConferenceCustomSearchResults count];
      if (v14 < v15)
      {
        uint64_t v17 = [(NSArray *)self->_searchModelVirtualConferenceRoomSearchResults objectAtIndex:v14];
LABEL_33:
        id v5 = (void *)v17;
        [(EKLocationEditItemViewController *)self selectedRoomType:v17];
        goto LABEL_6;
      }
      if (v14 < (uint64_t)(v16 + v15))
      {
        id v5 = [(NSArray *)self->_searchModelVirtualConferenceCustomSearchResults objectAtIndex:v14 - v15];
        [(EKLocationEditItemViewController *)self setSelectedVirtualConference:v5];
        goto LABEL_5;
      }
    }
    else if ([(NSArray *)self->_searchModelVirtualConferenceRoomSearchResults count] == 1)
    {
      uint64_t v17 = [(NSArray *)self->_searchModelVirtualConferenceRoomSearchResults firstObject];
      goto LABEL_33;
    }
  }
LABEL_20:
}

- (BOOL)tableView:(id)a3 wantsHeaderForSection:(int64_t)a4
{
  return a4
      && -[EKLocationEditItemViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", a3) > 0;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  switch(a4)
  {
    case 1:
      id v6 = EventKitUIBundle();
      int64_t v7 = v6;
      BOOL v8 = @"Video Call";
      goto LABEL_10;
    case 2:
      id v6 = EventKitUIBundle();
      int64_t v7 = v6;
      BOOL v8 = @"Recents";
      goto LABEL_10;
    case 3:
      id v6 = EventKitUIBundle();
      int64_t v7 = v6;
      BOOL v8 = @"Conference Rooms";
      goto LABEL_10;
    case 4:
      id v6 = EventKitUIBundle();
      int64_t v7 = v6;
      BOOL v8 = @"Contacts";
      goto LABEL_10;
    case 5:
      id v6 = EventKitUIBundle();
      int64_t v7 = v6;
      BOOL v8 = @"Map Locations";
      goto LABEL_10;
    case 6:
      id v6 = EventKitUIBundle();
      int64_t v7 = v6;
      BOOL v8 = @"Custom Locations";
LABEL_10:
      BOOL v11 = [v6 localizedStringForKey:v8 value:&stru_1F0CC2140 table:0];

      goto LABEL_15;
    case 7:
      uint64_t v9 = kEKUILogEventEditorHandle;
      if (!os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      int v16 = 134217984;
      int64_t v17 = 7;
      uint64_t v10 = "Invalid section supplied: [%tu]";
      break;
    default:
      uint64_t v9 = kEKUILogEventEditorHandle;
      if (!os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      int v16 = 134217984;
      int64_t v17 = a4;
      uint64_t v10 = "Invalid section supplied: [%ld]";
      break;
  }
  _os_log_impl(&dword_1B3F4C000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v16, 0xCu);
LABEL_14:
  BOOL v11 = 0;
LABEL_15:
  uint64_t v12 = (void *)kEKUILogEventEditorHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
  {
    id v13 = v12;
    uint64_t v14 = [(id)objc_opt_class() _sectionNameForSection:a4];
    int v16 = 138412546;
    int64_t v17 = (int64_t)v11;
    __int16 v18 = 2112;
    v19 = v14;
    _os_log_impl(&dword_1B3F4C000, v13, OS_LOG_TYPE_DEBUG, "Returning header name [%@] for section [%@]", (uint8_t *)&v16, 0x16u);
  }

  return v11;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v93 = [v7 section];
  switch(v93)
  {
    case 0:
      BOOL v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      uint64_t v10 = [v6 dequeueReusableCellWithIdentifier:v9 forIndexPath:v7];
      if (![v7 row] && -[EKLocationEditItemViewController showingTextRow](self, "showingTextRow"))
      {
        BOOL v11 = [v10 defaultContentConfiguration];
        uint64_t v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v13 = [v12 localizedStringForKey:@"“%@”" value:&stru_1F0CC2140 table:0];

        uint64_t v14 = NSString;
        int64_t v15 = [(EKLocationEditItemViewController *)self searchText];
        int v16 = objc_msgSend(v14, "localizedStringWithFormat:", v13, v15);
        [v11 setText:v16];
        goto LABEL_28;
      }
      if (![(EKLocationEditItemViewController *)self showingCurrentLocationRow]) {
        goto LABEL_32;
      }
      BOOL v11 = [v10 defaultContentConfiguration];
      v57 = EventKitUIBundle();
      v58 = [v57 localizedStringForKey:@"Current Location" value:&stru_1F0CC2140 table:0];
      [v11 setText:v58];

      v59 = [(EKLocationEditItemViewController *)self locationArrowImage];
      [v11 setImage:v59];

      [v10 setContentConfiguration:v11];
      goto LABEL_31;
    case 1:
      if ([(EKLocationEditItemViewController *)self showAvailableConferenceTypesAsRows])
      {
        int64_t v17 = (objc_class *)objc_opt_class();
        __int16 v18 = NSStringFromClass(v17);
        uint64_t v10 = [v6 dequeueReusableCellWithIdentifier:v18 forIndexPath:v7];
        [v10 setAccessoryType:0];
        uint64_t v19 = [v7 row];
        int64_t v20 = [(NSArray *)self->_searchModelVirtualConferenceRoomSearchResults count];
        NSUInteger v21 = [(NSArray *)self->_searchModelVirtualConferenceCustomSearchResults count];
        if (v19 >= v20)
        {
          id v23 = self;
          if (v19 >= (uint64_t)(v21 + v20))
          {
LABEL_54:

            self = v23;
            goto LABEL_61;
          }
          v22 = [(NSArray *)self->_searchModelVirtualConferenceCustomSearchResults objectAtIndex:v19 - v20];
          [v10 updateWithCustomVirtualConference:v22];
        }
        else
        {
          v22 = [(NSArray *)self->_searchModelVirtualConferenceRoomSearchResults objectAtIndex:v19];
          id v23 = self;
          [v10 updateWithRoomType:v22];
          if (self->_shouldShowCheckedVirtualConference
            && [v22 isEqual:self->_checkedRoomType])
          {
            [v10 setAccessoryType:3];
          }
        }

        goto LABEL_54;
      }
      v60 = self->_searchModelVirtualConferenceRoomSearchResults;
      if ([(NSArray *)v60 count] == 1)
      {
        v61 = (objc_class *)objc_opt_class();
        v62 = NSStringFromClass(v61);
        uint64_t v10 = [v6 dequeueReusableCellWithIdentifier:v62 forIndexPath:v7];
        [v10 setAccessoryType:0];
        v63 = [(NSArray *)v60 firstObject];
        [v10 updateWithRoomType:v63];
      }
      else
      {
        v80 = (objc_class *)objc_opt_class();
        v62 = NSStringFromClass(v80);
        uint64_t v10 = [v6 dequeueReusableCellWithIdentifier:v62 forIndexPath:v7];
        [v10 setDelegate:self];
        [v10 setRoomTypes:v60];
      }

      goto LABEL_61;
    case 2:
      id v24 = -[NSArray objectAtIndex:](self->_searchModelRecentsSearchResults, "objectAtIndex:", [v7 row]);
      uint64_t v25 = [v24 recent];
      if ([MEMORY[0x1E4F57C10] recentIsDirectoryLocation:v25])
      {
        NSUInteger v26 = [(EKLocationEditItemViewController *)self conferenceRoomForRecent:v25];
        uint64_t v27 = (objc_class *)objc_opt_class();
        v28 = NSStringFromClass(v27);
        uint64_t v10 = [(UITableView *)self->_tableView dequeueReusableCellWithIdentifier:v28 forIndexPath:v7];
        if ([v26 supportsAvailability]
          && ([v26 availabilityRequestInProgress] & 1) == 0
          && ![v26 availability])
        {
          objc_initWeak((id *)location, self);
          searchModel = self->_searchModel;
          calendarItem = self->_calendarItem;
          v94[0] = MEMORY[0x1E4F143A8];
          v94[1] = 3221225472;
          v94[2] = __68__EKLocationEditItemViewController_tableView_cellForRowAtIndexPath___block_invoke;
          v94[3] = &unk_1E6087918;
          objc_copyWeak(&v95, (id *)location);
          [(EKUILocationSearchModel *)searchModel updateConferenceRoomAvailability:v26 duringEvent:calendarItem completionBlock:v94];
          objc_destroyWeak(&v95);
          objc_destroyWeak((id *)location);
        }
        [v10 reloadWithConferenceRoom:v26];
      }
      else
      {
        v64 = [MEMORY[0x1E4F57C10] locationForRecent:v25];
        v65 = (objc_class *)objc_opt_class();
        v92 = NSStringFromClass(v65);
        uint64_t v10 = [v6 dequeueReusableCellWithIdentifier:v92 forIndexPath:v7];
        v66 = [v10 defaultContentConfiguration];
        v67 = [v64 title];
        [v66 setText:v67];

        v68 = [v64 address];
        [v66 setSecondaryText:v68];

        v69 = [v66 secondaryText];
        uint64_t v70 = [v69 length];

        if (v70)
        {
          v71 = [(id)objc_opt_class() _boldTitleFont];
          v72 = [v66 textProperties];
          [v72 setFont:v71];
        }
        v73 = [v64 contactLabel];

        if (v73) {
          [(EKLocationEditItemViewController *)self contactsImage];
        }
        else {
        v84 = [v24 image];
        }
        [v66 setImage:v84];

        [v10 setContentConfiguration:v66];
      }

      goto LABEL_61;
    case 3:
      uint64_t v9 = -[NSArray objectAtIndex:](self->_searchModelConferenceRoomSearchResults, "objectAtIndex:", [v7 row]);
      uint64_t v10 = [(EKLocationEditItemViewController *)self _cellForConferenceRoom:v9 atIndexPath:v7];
      goto LABEL_32;
    case 4:
      int64_t v30 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v30);
      uint64_t v10 = [v6 dequeueReusableCellWithIdentifier:v9 forIndexPath:v7];
      BOOL v11 = [v10 defaultContentConfiguration];
      id v13 = -[NSArray objectAtIndex:](self->_searchModelContactsSearchResults, "objectAtIndex:", [v7 row]);
      v31 = [v13 contactLabel];
      [v11 setText:v31];

      objc_super v32 = [v13 title];
      v33 = [v32 _stringByReplacingCharactersInSet:CFCharacterSetGetPredefined(kCFCharacterSetNewline) withCharacter:32];
      [v11 setSecondaryText:v33];

      v34 = [v11 secondaryText];
      uint64_t v35 = [v34 length];

      if (v35)
      {
        double v36 = [(id)objc_opt_class() _boldTitleFont];
        v37 = [v11 textProperties];
        [v37 setFont:v36];
      }
      int64_t v15 = [(EKLocationEditItemViewController *)self contactsImage];
      [v11 setImage:v15];
      goto LABEL_29;
    case 5:
      v38 = (objc_class *)objc_opt_class();
      uint64_t v39 = NSStringFromClass(v38);
      uint64_t v10 = [v6 dequeueReusableCellWithIdentifier:v39 forIndexPath:v7];
      uint64_t v89 = [v10 defaultContentConfiguration];
      uint64_t v87 = (void *)v39;
      id v88 = v7;
      uint64_t v40 = [v7 row];
      searchModelLocationFromMapsURL = self->_searchModelLocationFromMapsURL;
      NSUInteger v42 = [(NSArray *)self->_searchModelEventsSearchResults count];
      if (searchModelLocationFromMapsURL) {
        int64_t v43 = v42 + 1;
      }
      else {
        int64_t v43 = v42;
      }
      NSUInteger v44 = [(NSArray *)self->_searchModelFrequentsSearchResults count];
      NSUInteger v45 = [(NSArray *)self->_searchModelMapCompletionSearchResults count];
      if (v40 < (searchModelLocationFromMapsURL != 0))
      {
        v46 = self->_searchModelLocationFromMapsURL;
        [(EKStructuredLocationWithImage *)v46 location];
        id v7 = v88;
        v47 = v87;
        v49 = v48 = (void *)v89;
        v91 = [v49 title];
        uint64_t v50 = [v49 address];
        uint64_t v51 = [(EKStructuredLocationWithImage *)v46 image];
LABEL_44:
        v75 = (void *)v51;

LABEL_45:
        goto LABEL_46;
      }
      uint64_t v74 = v40 - v43;
      v48 = (void *)v89;
      if (v40 < v43)
      {
        [(NSArray *)self->_searchModelEventsSearchResults objectAtIndex:v40];
        id v7 = v88;
        v49 = v47 = v87;
        v46 = [v49 location];
        v91 = [(EKStructuredLocationWithImage *)v46 title];
        uint64_t v50 = [(EKStructuredLocationWithImage *)v46 address];
        uint64_t v51 = [v49 image];
        goto LABEL_44;
      }
      NSUInteger v81 = v44 + v43;
      BOOL v82 = __OFSUB__(v40, v44 + v43);
      uint64_t v83 = v40 - (v44 + v43);
      if (v83 < 0 != v82)
      {
        [(NSArray *)self->_searchModelFrequentsSearchResults objectAtIndex:v74];
        id v7 = v88;
        v49 = v47 = v87;
        v91 = [v49 title];
        uint64_t v50 = [v49 address];
        v75 = MapPinImage();
        goto LABEL_45;
      }
      if (v40 >= (uint64_t)(v45 + v81))
      {
        v75 = 0;
        uint64_t v50 = 0;
        v91 = 0;
        id v7 = v88;
      }
      else
      {
        id v7 = v88;
        if (v83 < (int64_t)[(NSArray *)self->_searchModelMapCompletionSearchResults count])
        {
          [(NSArray *)self->_searchModelMapCompletionSearchResults objectAtIndex:v83];
          v49 = v47 = v87;
          v91 = [v49 title];
          uint64_t v50 = [v49 subtitle];
          v46 = [v49 mapItem];
          uint64_t v51 = ImageForMapItem(v46);
          goto LABEL_44;
        }
        v75 = 0;
        uint64_t v50 = 0;
        v91 = 0;
      }
      v47 = v87;
LABEL_46:
      [v48 setText:v91];
      [v48 setSecondaryText:v50];
      [v48 setImage:v75];
      v76 = [v48 secondaryText];
      uint64_t v77 = [v76 length];

      if (v77)
      {
        v78 = [(id)objc_opt_class() _boldTitleFont];
        v79 = [v48 textProperties];
        [v79 setFont:v78];
      }
      [v10 setContentConfiguration:v48];

LABEL_61:
      if (![v10 accessoryType]) {
        objc_msgSend(v10, "setAccessoryType:", -[EKLocationEditItemViewController _accessoryTypeForSection:](self, "_accessoryTypeForSection:", v93));
      }
      v85 = kEKUILogEventEditorHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)location = 138412546;
        *(void *)&location[4] = v7;
        __int16 v97 = 2112;
        v98 = v10;
        _os_log_impl(&dword_1B3F4C000, v85, OS_LOG_TYPE_DEBUG, "Returning cell for index path [%@]: [%@]", location, 0x16u);
      }

      return v10;
    case 6:
      v52 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v52);
      uint64_t v10 = [v6 dequeueReusableCellWithIdentifier:v9 forIndexPath:v7];
      BOOL v11 = [v10 defaultContentConfiguration];
      id v13 = -[NSArray objectAtIndex:](self->_searchModelTextualSearchResults, "objectAtIndex:", [v7 row]);
      v53 = [v13 title];
      [v11 setText:v53];

      v54 = [v13 address];
      [v11 setSecondaryText:v54];

      v55 = [v11 secondaryText];
      uint64_t v56 = [v55 length];

      if (!v56) {
        goto LABEL_30;
      }
      int64_t v15 = [(id)objc_opt_class() _boldTitleFont];
      int v16 = [v11 textProperties];
      [v16 setFont:v15];
LABEL_28:

LABEL_29:
LABEL_30:
      [v10 setContentConfiguration:v11];

LABEL_31:
LABEL_32:

      goto LABEL_61;
    case 7:
      uint64_t v10 = objc_opt_new();
      goto LABEL_61;
    default:
      uint64_t v10 = 0;
      goto LABEL_61;
  }
}

void __68__EKLocationEditItemViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__EKLocationEditItemViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
  block[3] = &unk_1E6087918;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __68__EKLocationEditItemViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained[132] reloadData];
    WeakRetained = v2;
  }
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  v37[4] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  double v36 = [(EKLocationEditItemViewController *)self itemAtIndexPath:v5];
  uint64_t v35 = [(EKLocationEditItemViewController *)self _rowNameForIndexPath:v5];

  v33 = [NSString stringWithFormat:@"Row name: %@\n\nData description:\n%@", v35, v36];
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 setNumberOfLines:0];
  [v6 setText:v33];
  id v7 = objc_alloc_init(MEMORY[0x1E4FB1EC0]);
  BOOL v8 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  uint64_t v9 = [v7 view];
  [v9 setBackgroundColor:v8];

  uint64_t v10 = [v7 view];
  [v10 addSubview:v6];

  id v23 = (void *)MEMORY[0x1E4F28DC8];
  objc_super v32 = [v7 view];
  v31 = [v32 layoutMarginsGuide];
  int64_t v30 = [v31 leadingAnchor];
  v29 = [v6 leadingAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v37[0] = v28;
  uint64_t v27 = [v7 view];
  NSUInteger v26 = [v27 layoutMarginsGuide];
  uint64_t v25 = [v26 trailingAnchor];
  id v24 = [v6 trailingAnchor];
  v22 = [v25 constraintEqualToAnchor:v24];
  v37[1] = v22;
  NSUInteger v21 = [v7 view];
  int64_t v20 = [v21 layoutMarginsGuide];
  uint64_t v19 = [v20 topAnchor];
  BOOL v11 = [v6 topAnchor];
  uint64_t v12 = [v19 constraintEqualToAnchor:v11];
  v37[2] = v12;
  id v13 = [v7 view];
  uint64_t v14 = [v13 layoutMarginsGuide];
  int64_t v15 = [v14 bottomAnchor];
  int v16 = [v6 bottomAnchor];
  int64_t v17 = [v15 constraintEqualToAnchor:v16];
  v37[3] = v17;
  __int16 v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
  [v23 activateConstraints:v18];

  [(EKLocationEditItemViewController *)self presentViewController:v7 animated:1 completion:0];
}

- (int64_t)_accessoryTypeForSection:(unint64_t)a3
{
  if (_accessoryTypeForSection__onceToken != -1) {
    dispatch_once(&_accessoryTypeForSection__onceToken, &__block_literal_global_36);
  }
  BOOL v4 = a3 == 2 || a3 == 5;
  int64_t v5 = 4;
  if (!v4) {
    int64_t v5 = 0;
  }
  if (_accessoryTypeForSection__showsAccessoryButtons) {
    return v5;
  }
  else {
    return 0;
  }
}

void __61__EKLocationEditItemViewController__accessoryTypeForSection___block_invoke()
{
  id v0 = [MEMORY[0x1E4F57C00] sharedPreferences];
  _accessoryTypeForSection__showsAccessoryButtons = [v0 debugLocationSearchResults];
}

+ (id)_boldTitleFont
{
  id v2 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8] addingSymbolicTraits:2 options:0];
  id v3 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v2 size:0.0];

  return v3;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return objc_msgSend(a4, "section", a3) == 2;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a5;
  if ([v8 section] == 2)
  {
    id v6 = -[NSArray objectAtIndex:](self->_searchModelRecentsSearchResults, "objectAtIndex:", [v8 row]);
    id v7 = [v6 recent];

    [(EKUILocationSearchModel *)self->_searchModel removeRecentLocation:v7];
  }
}

- (id)locationArrowImage
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4FB1830];
  id v3 = [MEMORY[0x1E4FB1618] systemBlueColor];
  v12[0] = v3;
  BOOL v4 = [MEMORY[0x1E4FB1618] systemGray4Color];
  v12[1] = v4;
  int64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  id v6 = [v2 _configurationWithHierarchicalColors:v5];

  id v7 = (void *)MEMORY[0x1E4FB1830];
  [MEMORY[0x1E4F25510] conferenceImageSize];
  id v8 = objc_msgSend(v7, "configurationWithPointSize:");
  uint64_t v9 = [v8 configurationByApplyingConfiguration:v6];
  uint64_t v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"location.circle.fill" withConfiguration:v9];

  return v10;
}

- (id)contactsImage
{
  id v2 = (void *)MEMORY[0x1E4FB1830];
  [MEMORY[0x1E4F25510] conferenceImageSize];
  id v3 = objc_msgSend(v2, "configurationWithPointSize:");
  BOOL v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.crop.circle.fill" withConfiguration:v3];
  int64_t v5 = [MEMORY[0x1E4FB1618] systemGrayColor];
  id v6 = [v4 imageWithTintColor:v5 renderingMode:1];

  return v6;
}

- (void)locationSearchModel:(id)a3 selectedLocation:(id)a4 withError:(id)a5
{
  id v7 = a4;
  id v8 = v7;
  if (!v7 || a5)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4FB1418];
    id v13 = EventKitUIBundle();
    uint64_t v14 = [v13 localizedStringForKey:@"Address Not Recognized" value:&stru_1F0CC2140 table:0];
    int64_t v15 = EventKitUIBundle();
    int v16 = [v15 localizedStringForKey:@"The address could not be located. If you use this address you won’t be able to get maps, travel time, or time to leave alerts.", &stru_1F0CC2140, 0 value table];
    int64_t v17 = [v12 alertControllerWithTitle:v14 message:v16 preferredStyle:1];

    __int16 v18 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v19 = EventKitUIBundle();
    int64_t v20 = [v19 localizedStringForKey:@"Use Anyway" value:&stru_1F0CC2140 table:0];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __83__EKLocationEditItemViewController_locationSearchModel_selectedLocation_withError___block_invoke;
    v27[3] = &unk_1E60874A8;
    v27[4] = self;
    NSUInteger v21 = [v18 actionWithTitle:v20 style:0 handler:v27];
    [v17 addAction:v21];

    v22 = (void *)MEMORY[0x1E4FB1410];
    id v23 = EventKitUIBundle();
    id v24 = [v23 localizedStringForKey:@"Cancel - location search model - selected location" value:@"Cancel" table:0];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __83__EKLocationEditItemViewController_locationSearchModel_selectedLocation_withError___block_invoke_2;
    v26[3] = &unk_1E60874A8;
    v26[4] = self;
    uint64_t v25 = [v22 actionWithTitle:v24 style:0 handler:v26];
    [v17 addAction:v25];

    [(EKLocationEditItemViewController *)self presentViewController:v17 animated:1 completion:0];
  }
  else
  {
    uint64_t v9 = [v7 title];

    if (!v9)
    {
      uint64_t v10 = [v8 address];
      [v8 setTitle:v10];
    }
    [(EKLocationEditItemViewController *)self setSelectedLocation:v8];
    BOOL v11 = [v8 title];
    [(EKLocationEditItemViewController *)self setSearchText:v11];

    [(EKLocationEditItemViewController *)self searchResignFirstResponder];
    [(EKEditItemViewController *)self saveAndDismiss];
  }
}

void __83__EKLocationEditItemViewController_locationSearchModel_selectedLocation_withError___block_invoke(uint64_t a1)
{
  id v2 = *(id **)(a1 + 32);
  id v3 = [v2[132] indexPathForSelectedRow];
  id v14 = [v2 itemAtIndexPath:v3];

  BOOL v4 = v14;
  if (v14)
  {
    EKWeakLinkClass();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v14;
      id v6 = 0;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v5 = 0;
        id v6 = 0;
        goto LABEL_10;
      }
      id v6 = v14;
      id v7 = (void *)MEMORY[0x1E4F25630];
      id v8 = [v6 displayLines];
      uint64_t v9 = [v8 objectAtIndex:0];
      id v5 = [v7 locationWithTitle:v9];

      uint64_t v10 = [v6 displayLines];
      unint64_t v11 = [v10 count];

      if (v11 >= 2)
      {
        uint64_t v12 = [v6 displayLines];
        id v13 = [v12 objectAtIndex:1];
        [v5 setAddress:v13];
      }
      if (!v5) {
        goto LABEL_10;
      }
    }
    [*(id *)(a1 + 32) setSelectedLocation:v5];
    [*(id *)(a1 + 32) searchResignFirstResponder];
    [*(id *)(a1 + 32) saveAndDismiss];
LABEL_10:

    BOOL v4 = v14;
  }
}

void __83__EKLocationEditItemViewController_locationSearchModel_selectedLocation_withError___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 1056);
  id v2 = [v1 indexPathForSelectedRow];
  [v1 deselectRowAtIndexPath:v2 animated:1];
}

- (id)calendarItemForSearchModel:(id)a3
{
  return self->_calendarItem;
}

- (BOOL)shouldIncludeConferenceRoom:(id)a3
{
  id v4 = a3;
  id v5 = [v4 location];
  id v6 = [v5 displayName];
  id v7 = [(EKUILocationRowModel *)self->_locationViewModel location];
  id v8 = [v7 title];
  char v9 = [v6 isEqualToString:v8];

  BOOL v10 = 1;
  if ((v9 & 1) == 0)
  {
    uint64_t v17 = 0;
    __int16 v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 1;
    unint64_t v11 = [(EKCalendarItem *)self->_calendarItem attendees];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __64__EKLocationEditItemViewController_shouldIncludeConferenceRoom___block_invoke;
    v13[3] = &unk_1E6089AC8;
    id v14 = v4;
    int64_t v15 = self;
    int v16 = &v17;
    [v11 enumerateObjectsUsingBlock:v13];

    BOOL v10 = *((unsigned char *)v18 + 24) != 0;
    _Block_object_dispose(&v17, 8);
  }

  return v10;
}

void __64__EKLocationEditItemViewController_shouldIncludeConferenceRoom___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v15 = a2;
  BOOL v6 = [v15 participantType] == 2;
  id v7 = v15;
  if (v6)
  {
    id v8 = [v15 name];
    char v9 = [*(id *)(a1 + 32) location];
    BOOL v10 = [v9 displayName];
    if ([v8 isEqualToString:v10])
    {
      unint64_t v11 = [v15 name];
      uint64_t v12 = [*(id *)(*(void *)(a1 + 40) + 1256) location];
      id v13 = [v12 title];
      char v14 = [v11 isEqualToString:v13];

      id v7 = v15;
      if ((v14 & 1) == 0)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
        *a4 = 1;
      }
    }
    else
    {

      id v7 = v15;
    }
  }
}

- (void)locationSearchModel:(id)a3 updatedSearchTypes:(unint64_t)a4
{
  __int16 v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v4)
  {
    id v8 = [v6 currentLocation];
    char v9 = (EKStructuredLocation *)[v8 copy];
    searchModelCurrentLocation = self->_searchModelCurrentLocation;
    self->_searchModelCurrentLocation = v9;

    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((v4 & 4) == 0)
  {
    goto LABEL_3;
  }
  unint64_t v11 = [v7 mapCompletionSearchResults];
  uint64_t v12 = (NSArray *)[v11 copy];
  searchModelMapCompletionSearchResults = self->_searchModelMapCompletionSearchResults;
  self->_searchModelMapCompletionSearchResults = v12;

  if ((v4 & 2) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  char v14 = [v7 locationFromMapsURL];
  searchModelLocationFromMapsURL = self->_searchModelLocationFromMapsURL;
  self->_searchModelLocationFromMapsURL = v14;

  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  int v16 = [v7 contactsSearchResults];
  uint64_t v17 = (NSArray *)[v16 copy];
  searchModelContactsSearchResults = self->_searchModelContactsSearchResults;
  self->_searchModelContactsSearchResults = v17;

  if ((v4 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v19 = [v7 recentsSearchResults];
  char v20 = (NSArray *)[v19 copy];
  searchModelRecentsSearchResults = self->_searchModelRecentsSearchResults;
  self->_searchModelRecentsSearchResults = v20;

  if ((v4 & 0x20) == 0)
  {
LABEL_7:
    if ((v4 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  v22 = [v7 frequentsSearchResults];
  id v23 = (NSArray *)[v22 copy];
  searchModelFrequentsSearchResults = self->_searchModelFrequentsSearchResults;
  self->_searchModelFrequentsSearchResults = v23;

  if ((v4 & 0x40) == 0)
  {
LABEL_8:
    if ((v4 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v25 = [v7 eventsSearchResults];
  NSUInteger v26 = (NSArray *)[v25 copy];
  searchModelEventsSearchResults = self->_searchModelEventsSearchResults;
  self->_searchModelEventsSearchResults = v26;

  if ((v4 & 0x80) == 0)
  {
LABEL_9:
    if ((v4 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  v28 = [v7 textualSearchResults];
  v29 = (NSArray *)[v28 copy];
  searchModelTextualSearchResults = self->_searchModelTextualSearchResults;
  self->_searchModelTextualSearchResults = v29;

  if ((v4 & 0x100) == 0)
  {
LABEL_10:
    if ((v4 & 0x200) == 0) {
      goto LABEL_24;
    }
    goto LABEL_21;
  }
LABEL_20:
  v31 = [v7 conferenceRoomSearchResults];
  objc_super v32 = (NSArray *)[v31 copy];
  searchModelConferenceRoomSearchResults = self->_searchModelConferenceRoomSearchResults;
  self->_searchModelConferenceRoomSearchResults = v32;

  if ((v4 & 0x200) == 0) {
    goto LABEL_24;
  }
LABEL_21:
  v34 = [v7 virtualConferenceRoomSearchResults];
  uint64_t v35 = (NSArray *)[v34 copy];
  searchModelVirtualConferenceRoomSearchResults = self->_searchModelVirtualConferenceRoomSearchResults;
  self->_searchModelVirtualConferenceRoomSearchResults = v35;

  v37 = [(EKUILocationRowModel *)self->_conferenceViewModel conference];
  if (v37)
  {
    BOOL shouldShowCheckedVirtualConference = self->_shouldShowCheckedVirtualConference;

    if (shouldShowCheckedVirtualConference)
    {
      uint64_t v39 = (void *)MEMORY[0x1E4F25510];
      uint64_t v40 = [(EKUILocationRowModel *)self->_conferenceViewModel conference];
      v41 = self->_searchModelVirtualConferenceRoomSearchResults;
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __75__EKLocationEditItemViewController_locationSearchModel_updatedSearchTypes___block_invoke;
      v45[3] = &unk_1E6089AF0;
      v45[4] = self;
      [v39 virtualConference:v40 likelyCameFromRoomTypes:v41 completionHandler:v45];
    }
  }
LABEL_24:
  if ((v4 & 0x400) != 0)
  {
    NSUInteger v42 = [v7 virtualConferenceCustomSearchResults];
    int64_t v43 = (NSArray *)[v42 copy];
    searchModelVirtualConferenceCustomSearchResults = self->_searchModelVirtualConferenceCustomSearchResults;
    self->_searchModelVirtualConferenceCustomSearchResults = v43;
  }
  [(UITableView *)self->_tableView reloadData];
}

void __75__EKLocationEditItemViewController_locationSearchModel_updatedSearchTypes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__EKLocationEditItemViewController_locationSearchModel_updatedSearchTypes___block_invoke_2;
  v5[3] = &unk_1E6087D68;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __75__EKLocationEditItemViewController_locationSearchModel_updatedSearchTypes___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1104), *(id *)(a1 + 40));
  id v2 = *(void **)(*(void *)(a1 + 32) + 1056);

  return [v2 reloadData];
}

+ (id)_sectionNameForSection:(unint64_t)a3
{
  if (a3 > 7) {
    return @"Unknown";
  }
  else {
    return off_1E6089B38[a3];
  }
}

- (id)_rowNameForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_opt_class(), "_sectionNameForSection:", objc_msgSend(v4, "section"));
  if ([v4 section] == 5)
  {
    uint64_t v6 = [v4 row];
    searchModelLocationFromMapsURL = self->_searchModelLocationFromMapsURL;
    NSUInteger v8 = [(NSArray *)self->_searchModelEventsSearchResults count];
    uint64_t v9 = searchModelLocationFromMapsURL != 0;
    if (searchModelLocationFromMapsURL) {
      int64_t v10 = v8 + 1;
    }
    else {
      int64_t v10 = v8;
    }
    NSUInteger v11 = [(NSArray *)self->_searchModelFrequentsSearchResults count];
    NSUInteger v12 = [(NSArray *)self->_searchModelMapCompletionSearchResults count];
    if (v6 < v9)
    {
      id v13 = @"Maps URL";
LABEL_13:
      id v15 = [NSString stringWithFormat:@"%@ - %@", v5, v13];
      goto LABEL_15;
    }
    if (v6 < v10)
    {
      id v13 = @"Events Search Results";
      goto LABEL_13;
    }
    NSUInteger v14 = v12;
    if ([v4 row] < (uint64_t)(v11 + v10))
    {
      id v13 = @"Frequents Search Results";
      goto LABEL_13;
    }
    if ([v4 row] < (uint64_t)(v14 + v11 + v10))
    {
      id v13 = @"Map Search Results";
      goto LABEL_13;
    }
  }
  id v15 = v5;
LABEL_15:
  int v16 = v15;

  return v16;
}

- (id)_cellForConferenceRoom:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  NSUInteger v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = NSStringFromClass(v8);
  int64_t v10 = [(UITableView *)self->_tableView dequeueReusableCellWithIdentifier:v9 forIndexPath:v6];

  [v10 reloadWithConferenceRoom:v7];

  return v10;
}

- (BOOL)wantsManagement
{
  return 1;
}

- (BOOL)canManagePresentationStyle
{
  return 1;
}

- (BOOL)locationViewModelRemoved
{
  searchFieldsView = self->_searchFieldsView;
  if (!searchFieldsView) {
    return 0;
  }
  id v4 = [(EKLocationVirtualConferenceSearchFieldsView *)searchFieldsView locationTextField];
  id v5 = [v4 text];
  BOOL v6 = ![v5 length] && !self->_selectedConferenceRoom && self->_selectedLocation == 0;

  return v6;
}

- (BOOL)conferenceViewModelRemoved
{
  searchFieldsView = self->_searchFieldsView;
  if (!searchFieldsView) {
    return 0;
  }
  id v4 = [(EKLocationVirtualConferenceSearchFieldsView *)searchFieldsView virtualConferenceTextField];
  id v5 = [v4 text];
  if ([v5 length]) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = self->_selectedVirtualConference == 0;
  }

  return v6;
}

- (BOOL)_singleSearchBar
{
  return self->_supportedSearchTypes == 2047 || self->_forceSingleTextField;
}

- (id)_focusedTextField
{
  if (self->_searchFieldsView) {
    [(EKLocationVirtualConferenceSearchFieldsView *)self->_searchFieldsView selectedTextField];
  }
  else {
  id v2 = [(UISearchBar *)self->_searchBar searchTextField];
  }

  return v2;
}

- (void)setSearchText:(id)a3
{
  searchFieldsView = self->_searchFieldsView;
  if (searchFieldsView)
  {
    id v4 = a3;
    id v6 = [(EKLocationVirtualConferenceSearchFieldsView *)searchFieldsView selectedTextField];
    [v6 setText:v4];
  }
  else
  {
    searchBar = self->_searchBar;
    id v6 = a3;
    -[UISearchBar setText:](searchBar, "setText:");
  }
}

- (id)searchText
{
  if (self->_searchFieldsView)
  {
    id v2 = [(EKLocationVirtualConferenceSearchFieldsView *)self->_searchFieldsView selectedTextField];
    id v3 = [v2 text];
  }
  else
  {
    id v3 = [(UISearchBar *)self->_searchBar text];
  }

  return v3;
}

- (BOOL)searchIsFirstResponder
{
  if (self->_searchFieldsView)
  {
    id v2 = [(EKLocationVirtualConferenceSearchFieldsView *)self->_searchFieldsView selectedTextField];
    char v3 = [v2 isFirstResponder];

    return v3;
  }
  else
  {
    searchBar = self->_searchBar;
    return [(UISearchBar *)searchBar isFirstResponder];
  }
}

- (void)searchResignFirstResponder
{
  if (self->_searchFieldsView)
  {
    id v3 = [(EKLocationVirtualConferenceSearchFieldsView *)self->_searchFieldsView selectedTextField];
    [v3 resignFirstResponder];
  }
  else
  {
    searchBar = self->_searchBar;
    [(UISearchBar *)searchBar resignFirstResponder];
  }
}

- (void)searchBecomeFirstResponder
{
  if (self->_searchFieldsView)
  {
    id v3 = [(EKLocationVirtualConferenceSearchFieldsView *)self->_searchFieldsView selectedTextField];
    [v3 becomeFirstResponder];
  }
  else
  {
    searchBar = self->_searchBar;
    [(UISearchBar *)searchBar becomeFirstResponder];
  }
}

- (void)kickoffSearchTextChangedIfNonEmpty
{
  id v3 = [(EKLocationEditItemViewController *)self searchText];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    id v5 = [(EKLocationEditItemViewController *)self searchText];
    [(EKLocationEditItemViewController *)self searchTextChanged:v5 allowClearingCheckedVirtualConference:0];
  }
}

- (void)searchTextChanged:(id)a3
{
}

- (void)searchTextChanged:(id)a3 allowClearingCheckedVirtualConference:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v4)
  {
    id v7 = [(EKLocationEditItemViewController *)self _focusedTextField];
    NSUInteger v8 = [(EKLocationVirtualConferenceSearchFieldsView *)self->_searchFieldsView virtualConferenceTextField];

    if (v7 == v8) {
      self->_BOOL shouldShowCheckedVirtualConference = 0;
    }
  }
  if (![(EKLocationEditItemViewController *)self needsSave])
  {
    if (self->_supportsStructuredLocations)
    {
      if (!v6 || [v6 isEqualToString:&stru_1F0CC2140])
      {
        [(EKUILocationSearchModel *)self->_searchModel cancelSearch];
        [(EKLocationEditItemViewController *)self setSelectedLocation:0];
        [(EKUILocationSearchModel *)self->_searchModel updateRecents:0];
        searchModel = self->_searchModel;
        id v10 = 0;
LABEL_14:
        [(EKUILocationSearchModel *)searchModel updateVirtualConferenceRoomOptions:v10];
        goto LABEL_18;
      }
      NSUInteger v12 = [(EKLocationEditItemViewController *)self searchText];
      id v13 = kEKUILogEventEditorHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
      {
        int v14 = 138412290;
        id v15 = v12;
        _os_log_impl(&dword_1B3F4C000, v13, OS_LOG_TYPE_DEBUG, "Beginning search for term: [%@]", (uint8_t *)&v14, 0xCu);
      }
      [(EKUILocationSearchModel *)self->_searchModel beginSearchForTerm:v12];
    }
    else
    {
      [(UITableView *)self->_tableView reloadData];
      if ((self->_supportedSearchTypes & 0x200) != 0)
      {
        NSUInteger v11 = self->_searchModel;
        if ([v6 length]) {
          id v10 = v6;
        }
        else {
          id v10 = 0;
        }
        searchModel = v11;
        goto LABEL_14;
      }
    }
  }
LABEL_18:
}

- (void)searchDoneTapped
{
  id v2 = self;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  [(EKLocationEditItemViewController *)self setNeedsSave:1];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v3 = v2->_searchModelVirtualConferenceCustomSearchResults;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v4)
  {

    id v6 = 0;
LABEL_14:
    [(EKLocationEditItemViewController *)v2 useAsString:0];
    goto LABEL_15;
  }
  uint64_t v5 = v4;
  id v6 = 0;
  char v22 = 0;
  uint64_t v7 = *(void *)v25;
  obj = v3;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v25 != v7) {
        objc_enumerationMutation(obj);
      }
      uint64_t v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
      id v10 = [v9 joinMethods];
      NSUInteger v11 = [v10 firstObject];
      NSUInteger v12 = [v11 URL];

      id v13 = [v12 absoluteString];
      int v14 = v2;
      id v15 = [(EKLocationEditItemViewController *)v2 searchText];
      uint64_t v16 = [v13 rangeOfString:v15];

      if (v16 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v17 = v9;

        char v22 = 1;
        id v6 = v17;
      }

      id v2 = v14;
    }
    uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  }
  while (v5);

  if ((v22 & 1) == 0) {
    goto LABEL_14;
  }
  __int16 v18 = (void *)MEMORY[0x1E4F576A0];
  uint64_t v19 = [v6 joinMethods];
  char v20 = [v19 firstObject];
  NSUInteger v21 = [v20 URL];
  LODWORD(v18) = [v18 isPreferredURL:v21];

  if (!v18) {
    goto LABEL_14;
  }
  [(EKLocationEditItemViewController *)v14 setSelectedVirtualConference:v6];
  [(EKLocationEditItemViewController *)v14 searchResignFirstResponder];
LABEL_15:
  [(EKEditItemViewController *)v2 saveAndDismiss];
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
}

- (void)textField:(id)a3 didChange:(id)a4
{
}

- (void)selectedTextFieldChanged:(id)a3
{
  searchModel = self->_searchModel;
  id v5 = a3;
  [(EKUILocationSearchModel *)searchModel cancelSearch];
  id v6 = [(EKLocationVirtualConferenceSearchFieldsView *)self->_searchFieldsView locationTextField];

  if (v6 == v5) {
    uint64_t v7 = 511;
  }
  else {
    uint64_t v7 = 1536;
  }
  [(EKLocationEditItemViewController *)self setSupportedSearchTypes:v7];
  if (self->_supportsStructuredLocations)
  {
    unint64_t supportedSearchTypes = self->_supportedSearchTypes;
    if (supportedSearchTypes)
    {
      [(EKUILocationSearchModel *)self->_searchModel getCurrentLocation];
      unint64_t supportedSearchTypes = self->_supportedSearchTypes;
    }
    if ((supportedSearchTypes & 0x10) != 0) {
      [(EKUILocationSearchModel *)self->_searchModel updateRecents:0];
    }
  }
  if ((self->_supportedSearchTypes & 0x200) != 0) {
    [(EKUILocationSearchModel *)self->_searchModel updateVirtualConferenceRoomOptions:0];
  }
  [(EKLocationEditItemViewController *)self locationSearchModel:self->_searchModel updatedSearchTypes:2047];

  [(EKLocationEditItemViewController *)self kickoffSearchTextChangedIfNonEmpty];
}

- (void)selectedRoomType:(id)a3
{
  id v4 = a3;
  [(EKLocationEditItemViewController *)self setNeedsSave:1];
  [(EKUILocationSearchModel *)self->_searchModel selectVirtualConferenceRoomType:v4];
  id v5 = (void *)MEMORY[0x1E4F25668];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__EKLocationEditItemViewController_selectedRoomType___block_invoke;
  v7[3] = &unk_1E6089B18;
  v7[4] = self;
  id v6 = dispatch_get_global_queue(2, 0);
  [v5 virtualConferenceForRoomType:v4 completion:v7 queue:v6];

  [(EKLocationEditItemViewController *)self setPendingVirtualConference:1];
  [(EKEditItemViewController *)self saveAndDismiss];
  [(EKLocationEditItemViewController *)self searchResignFirstResponder];
}

void __53__EKLocationEditItemViewController_selectedRoomType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__EKLocationEditItemViewController_selectedRoomType___block_invoke_2;
  block[3] = &unk_1E6087548;
  void block[4] = *(void *)(a1 + 32);
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __53__EKLocationEditItemViewController_selectedRoomType___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setPendingVirtualConference:0];
  [*(id *)(a1 + 32) setSelectedVirtualConference:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setPendingVirtualConferenceError:*(void *)(a1 + 48)];
  id v2 = [*(id *)(a1 + 32) editDelegate];
  [v2 editItemPendingVideoConferenceCompleted:*(void *)(a1 + 32)];
}

- (void)pendingVideoConferenceUpdated:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(EKLocationEditItemViewController *)self setSelectedVirtualConference:v4];
    id v5 = (void *)MEMORY[0x1E4F57B50];
    id v6 = [v4 joinMethods];
    id v7 = [v6 firstObject];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__EKLocationEditItemViewController_pendingVideoConferenceUpdated___block_invoke;
    v9[3] = &unk_1E60877E8;
    v9[4] = self;
    [v5 displayDetailsForJoinMethod:v7 completionHandler:v9];
  }
  else
  {
    id v8 = [(EKLocationVirtualConferenceSearchFieldsView *)self->_searchFieldsView virtualConferenceTextField];
    [v8 setText:&stru_1F0CC2140];

    [(EKLocationEditItemViewController *)self setDisableConferenceTextField:0];
    [(EKLocationVirtualConferenceSearchFieldsView *)self->_searchFieldsView setDisableConferenceTextField:0];
  }
}

void __66__EKLocationEditItemViewController_pendingVideoConferenceUpdated___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__EKLocationEditItemViewController_pendingVideoConferenceUpdated___block_invoke_2;
  v6[3] = &unk_1E6087D68;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __66__EKLocationEditItemViewController_pendingVideoConferenceUpdated___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(*(void *)(a1 + 32) + 1080) virtualConferenceTextField];
  [v3 setText:v2];

  [*(id *)(a1 + 32) setDisableConferenceTextField:0];
  id v4 = *(void **)(*(void *)(a1 + 32) + 1080);

  return [v4 setDisableConferenceTextField:0];
}

- (BOOL)needsSave
{
  return self->_needsSave;
}

- (void)setNeedsSave:(BOOL)a3
{
  self->_needsSave = a3;
}

- (unint64_t)supportedSearchTypes
{
  return self->_supportedSearchTypes;
}

- (BOOL)autoFillSelectedTextField
{
  return self->_autoFillSelectedTextField;
}

- (void)setAutoFillSelectedTextField:(BOOL)a3
{
  self->_autoFillSelectedTextField = a3;
}

- (BOOL)forceSingleTextField
{
  return self->_forceSingleTextField;
}

- (void)setForceSingleTextField:(BOOL)a3
{
  self->_forceSingleTextField = a3;
}

- (BOOL)conferenceTextFieldSelected
{
  return self->_conferenceTextFieldSelected;
}

- (void)setConferenceTextFieldSelected:(BOOL)a3
{
  self->_conferenceTextFieldSelected = a3;
}

- (BOOL)disableConferenceTextField
{
  return self->_disableConferenceTextField;
}

- (void)setDisableConferenceTextField:(BOOL)a3
{
  self->_disableConferenceTextField = a3;
}

- (EKUILocationRowModel)locationViewModel
{
  return self->_locationViewModel;
}

- (void)setLocationViewModel:(id)a3
{
}

- (EKUILocationRowModel)conferenceViewModel
{
  return self->_conferenceViewModel;
}

- (void)setConferenceViewModel:(id)a3
{
}

- (EKStructuredLocation)selectedLocation
{
  return self->_selectedLocation;
}

- (void)setSelectedLocation:(id)a3
{
}

- (EKUIConferenceRoom)selectedConferenceRoom
{
  return self->_selectedConferenceRoom;
}

- (EKVirtualConference)selectedVirtualConference
{
  return self->_selectedVirtualConference;
}

- (void)setSelectedVirtualConference:(id)a3
{
}

- (BOOL)pendingVirtualConference
{
  return self->_pendingVirtualConference;
}

- (void)setPendingVirtualConference:(BOOL)a3
{
  self->_pendingVirtualConference = a3;
}

- (NSError)pendingVirtualConferenceError
{
  return self->_pendingVirtualConferenceError;
}

- (void)setPendingVirtualConferenceError:(id)a3
{
}

- (id)viewDidAppearBlock
{
  return self->_viewDidAppearBlock;
}

- (void)setViewDidAppearBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_viewDidAppearBlock, 0);
  objc_storeStrong((id *)&self->_pendingVirtualConferenceError, 0);
  objc_storeStrong((id *)&self->_selectedVirtualConference, 0);
  objc_storeStrong((id *)&self->_selectedConferenceRoom, 0);
  objc_storeStrong((id *)&self->_selectedLocation, 0);
  objc_storeStrong((id *)&self->_conferenceViewModel, 0);
  objc_storeStrong((id *)&self->_locationViewModel, 0);
  objc_storeStrong((id *)&self->_searchModelVirtualConferenceCustomSearchResults, 0);
  objc_storeStrong((id *)&self->_searchModelVirtualConferenceRoomSearchResults, 0);
  objc_storeStrong((id *)&self->_searchModelConferenceRoomSearchResults, 0);
  objc_storeStrong((id *)&self->_searchModelTextualSearchResults, 0);
  objc_storeStrong((id *)&self->_searchModelEventsSearchResults, 0);
  objc_storeStrong((id *)&self->_searchModelFrequentsSearchResults, 0);
  objc_storeStrong((id *)&self->_searchModelRecentsSearchResults, 0);
  objc_storeStrong((id *)&self->_searchModelContactsSearchResults, 0);
  objc_storeStrong((id *)&self->_searchModelMapCompletionSearchResults, 0);
  objc_storeStrong((id *)&self->_searchModelLocationFromMapsURL, 0);
  objc_storeStrong((id *)&self->_searchModelCurrentLocation, 0);
  objc_storeStrong((id *)&self->_cachedConferenceRooms, 0);
  objc_storeStrong((id *)&self->_checkedRoomType, 0);
  objc_storeStrong((id *)&self->_calendarItem, 0);
  objc_storeStrong((id *)&self->_searchModel, 0);
  objc_storeStrong((id *)&self->_searchFieldsView, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_palette, 0);

  objc_storeStrong((id *)&self->_tableView, 0);
}

@end