@interface Legacy_VOTUIItemChooserController
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)hostingWindowShouldMoveForReachability;
- (BOOL)textFieldShouldReturn:(id)a3;
- (Legacy_VOTUIItemChooserDelegate)delegate;
- (double)_positionAccountingForKeyboard:(CGRect)a3;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_constraintsToPositionItem:(id)a3 identicallyToItem:(id)a4;
- (id)sectionIndexTitlesForTableView:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_displayWithList:(id)a3 fromRotorSwitch:(BOOL)a4;
- (void)_guidedAccessItemChooserDidShow;
- (void)_handleSearchFieldTextChange:(id)a3;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_loadGuidedAccessBundle;
- (void)_updateGuidedAccessWindowId:(unsigned int)a3;
- (void)_updatePositionForKeyboard:(CGRect)a3;
- (void)_updateSelectedRow:(id)a3;
- (void)consumeSinglePressUpForButtonKind:(int64_t)a3;
- (void)hideItemChooser:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)showItemChooser:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation Legacy_VOTUIItemChooserController

- (void)viewDidLoad
{
  v47.receiver = self;
  v47.super_class = (Class)Legacy_VOTUIItemChooserController;
  [(Legacy_VOTUIItemChooserController *)&v47 viewDidLoad];
  id v3 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v7 = objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [v7 setAutoresizingMask:18];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = [(Legacy_VOTUIItemChooserController *)self view];
  [v8 addSubview:v7];

  v9 = (_UIBackdropView *)[objc_alloc((Class)_UIBackdropView) initWithPrivateStyle:2030];
  backdropView = self->_backdropView;
  self->_backdropView = v9;

  v11 = [(_UIBackdropView *)self->_backdropView layer];
  [v11 setCornerRadius:10.0];

  [v7 addSubview:self->_backdropView];
  v12 = +[NSNotificationCenter defaultCenter];
  [v12 addObserver:self selector:"_handleSearchFieldTextChange:" name:UITextFieldTextDidChangeNotification object:0];

  v13 = +[NSNotificationCenter defaultCenter];
  [v13 addObserver:self selector:"_keyboardWillShow:" name:UIKeyboardWillShowNotification object:0];

  v14 = +[NSNotificationCenter defaultCenter];
  [v14 addObserver:self selector:"_keyboardWillHide:" name:UIKeyboardWillHideNotification object:0];

  v15 = (UILabel *)objc_msgSend(objc_allocWithZone((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  headingLabel = self->_headingLabel;
  self->_headingLabel = v15;

  [(UILabel *)self->_headingLabel setTag:1010];
  v17 = +[NSBundle bundleForClass:objc_opt_class()];
  v18 = [v17 localizedStringForKey:@"VoiceOverItemChooser" value:&stru_3F588 table:@"VoiceOverUIService"];
  [(UILabel *)self->_headingLabel setText:v18];

  v19 = +[UIColor whiteColor];
  [(UILabel *)self->_headingLabel setTextColor:v19];

  [(UILabel *)self->_headingLabel setAdjustsFontForContentSizeCategory:1];
  [(UILabel *)self->_headingLabel setTextAlignment:1];
  v20 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2 compatibleWithTraitCollection:0];
  [(UILabel *)self->_headingLabel setFont:v20];

  [(UILabel *)self->_headingLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_headingLabel setAccessibilityTraits:UIAccessibilityTraitSummaryElement | UIAccessibilityTraitHeader | kAXIgnoreItemChooserTrait];
  v21 = +[UIColor clearColor];
  [(UILabel *)self->_headingLabel setBackgroundColor:v21];

  [v7 addSubview:self->_headingLabel];
  v22 = (UISearchField *)objc_msgSend(objc_allocWithZone((Class)UISearchField), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  searchField = self->_searchField;
  self->_searchField = v22;

  [(UISearchField *)self->_searchField setTag:1011];
  [(UISearchField *)self->_searchField setDelegate:self];
  [(UISearchField *)self->_searchField setAutocorrectionType:1];
  [(UISearchField *)self->_searchField setSpellCheckingType:1];
  [(UISearchField *)self->_searchField setReturnKeyType:6];
  [(UISearchField *)self->_searchField setAutocapitalizationType:0];
  [(UISearchField *)self->_searchField setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UISearchField *)self->_searchField _setAccessibilityServesAsFirstElement:1];
  [v7 addSubview:self->_searchField];
  v24 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 0, CGRectZero.origin.x, y, width, height);
  table = self->_table;
  self->_table = v24;

  [(UITableView *)self->_table setRowHeight:UITableViewAutomaticDimension];
  [(UITableView *)self->_table setEstimatedRowHeight:100.0];
  [(UITableView *)self->_table setDelegate:self];
  [(UITableView *)self->_table setSeparatorStyle:1];
  [(UITableView *)self->_table setDataSource:self];
  v26 = +[UIColor clearColor];
  [(UITableView *)self->_table setBackgroundColor:v26];

  [(UITableView *)self->_table setClipsToBounds:1];
  [(UITableView *)self->_table setTranslatesAutoresizingMaskIntoConstraints:0];
  v27 = self->_table;
  v28 = +[UIColor whiteColor];
  [(UITableView *)v27 _setSectionIndexColor:v28];

  [(UITableView *)self->_table registerClass:objc_opt_class() forCellReuseIdentifier:@"TableViewCell"];
  [v7 addSubview:self->_table];
  v29 = (NSMutableArray *)[objc_allocWithZone((Class)NSMutableArray) init];
  filteredList = self->_filteredList;
  self->_filteredList = v29;

  v31 = +[NSMutableDictionary dictionary];
  items = self->_items;
  self->_items = v31;

  v33 = +[NSMutableArray array];
  v34 = [(Legacy_VOTUIItemChooserController *)self view];
  v35 = [(Legacy_VOTUIItemChooserController *)self _constraintsToPositionItem:v7 identicallyToItem:v34];
  [v33 addObjectsFromArray:v35];

  +[NSLayoutConstraint activateConstraints:v33];
  v36 = +[NSLayoutConstraint constraintWithItem:self->_headingLabel attribute:3 relatedBy:0 toItem:v7 attribute:3 multiplier:1.0 constant:15.0];
  [v36 setActive:1];

  v37 = +[NSLayoutConstraint constraintWithItem:self->_headingLabel attribute:7 relatedBy:0 toItem:v7 attribute:7 multiplier:0.9 constant:0.0];
  [v37 setActive:1];

  v38 = +[NSLayoutConstraint constraintWithItem:self->_headingLabel attribute:9 relatedBy:0 toItem:v7 attribute:9 multiplier:1.0 constant:0.0];
  [v38 setActive:1];

  v39 = +[NSLayoutConstraint constraintWithItem:self->_searchField attribute:3 relatedBy:0 toItem:self->_headingLabel attribute:4 multiplier:1.0 constant:5.0];
  [v39 setActive:1];

  v40 = +[NSLayoutConstraint constraintWithItem:self->_searchField attribute:7 relatedBy:0 toItem:v7 attribute:7 multiplier:0.8 constant:0.0];
  [v40 setActive:1];

  v41 = +[NSLayoutConstraint constraintWithItem:self->_searchField attribute:9 relatedBy:0 toItem:v7 attribute:9 multiplier:1.0 constant:0.0];
  [v41 setActive:1];

  v42 = +[NSLayoutConstraint constraintWithItem:self->_table attribute:3 relatedBy:0 toItem:self->_searchField attribute:4 multiplier:1.0 constant:10.0];
  [v42 setActive:1];

  v43 = +[NSLayoutConstraint constraintWithItem:self->_table attribute:7 relatedBy:0 toItem:v7 attribute:7 multiplier:0.9 constant:0.0];
  [v43 setActive:1];

  v44 = +[NSLayoutConstraint constraintWithItem:self->_table attribute:9 relatedBy:0 toItem:v7 attribute:9 multiplier:1.0 constant:0.0];
  [v44 setActive:1];

  v45 = +[NSLayoutConstraint constraintWithItem:self->_table attribute:4 relatedBy:0 toItem:v7 attribute:4 multiplier:1.0 constant:0.0];
  [v45 setActive:1];

  v46 = +[NSLayoutConstraint constraintWithItem:self->_backdropView attribute:3 relatedBy:0 toItem:v7 attribute:4 multiplier:1.0 constant:0.0];
  [v46 setActive:1];
}

- (id)_constraintsToPositionItem:(id)a3 identicallyToItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = [&off_401F0 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(&off_401F0);
        }
        id v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) integerValue];
        v13 = +[NSLayoutConstraint constraintWithItem:v5 attribute:v12 relatedBy:0 toItem:v6 attribute:v12 multiplier:1.0 constant:0.0];
        [v7 addObject:v13];
      }
      id v9 = [&off_401F0 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v7;
}

- (void)showItemChooser:(id)a3
{
  id v4 = a3;
  [(Legacy_VOTUIItemChooserController *)self setAccessibilityViewIsModal:1];
  self->_categordouble y = 0x7FFFFFFFFFFFFFFFLL;
  id obj = [v4 objectForKey:@"items"];
  id v5 = [v4 objectForKey:@"categories"];
  id v6 = [v4 objectForKey:@"mappings"];
  id v7 = [v4 objectForKey:@"regionDescriptions"];

  objc_storeStrong((id *)&self->_itemCategoryMappings, v6);
  objc_storeStrong((id *)&self->_originalList, obj);
  objc_storeStrong((id *)&self->_regionDescriptions, v7);
  objc_storeStrong((id *)&self->_categories, v5);
  [(Legacy_VOTUIItemChooserController *)self _displayWithList:self->_originalList fromRotorSwitch:0];
  if (GSEventIsHardwareKeyboardAttached()) {
    [(UISearchField *)self->_searchField becomeFirstResponder];
  }
  [(Legacy_VOTUIItemChooserController *)self _guidedAccessItemChooserDidShow];
}

- (void)_guidedAccessItemChooserDidShow
{
  [(Legacy_VOTUIItemChooserController *)self _loadGuidedAccessBundle];
  id v4 = [(Legacy_VOTUIItemChooserController *)self view];
  id v3 = [v4 window];
  -[Legacy_VOTUIItemChooserController _updateGuidedAccessWindowId:](self, "_updateGuidedAccessWindowId:", [v3 _contextId]);
}

- (void)_updateGuidedAccessWindowId:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (_AXSGuidedAccessEnabled())
  {
    id v4 = [(id)AXSafeClassFromString() safeValueForKey:@"sharedInstance"];
    if ([v4 isActive]) {
      [v4 voiceOverItemChooserDidShow:v3];
    }
  }
}

- (void)_loadGuidedAccessBundle
{
  if (_AXSGuidedAccessEnabled() && qword_4BEB8 != -1)
  {
    dispatch_once(&qword_4BEB8, &stru_3D550);
  }
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  categordouble y = self->_category;
  if (a3 == 1)
  {
    if (category == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v5 = [(NSArray *)self->_categories count] - 1;
    }
    else {
      unint64_t v5 = category - 1;
    }
  }
  else
  {
    if (a3 != 2)
    {
LABEL_20:
      LOBYTE(v6) = 0;
      return v6;
    }
    if (category == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v5 = 0;
    }
    else {
      unint64_t v5 = category + 1;
    }
  }
  NSUInteger v6 = [(NSArray *)self->_categories count];
  if (v6)
  {
    if (qword_4BEC0)
    {
      if ((v5 & 0x8000000000000000) != 0) {
        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v7 = +[NSBundle bundleWithPath:@"/System/Library/CoreServices/VoiceOverTouch.app"];
      id v8 = (void *)qword_4BEC0;
      qword_4BEC0 = v7;

      if ((v5 & 0x8000000000000000) != 0) {
        goto LABEL_19;
      }
    }
    NSUInteger v9 = [(NSArray *)self->_categories count];
    if (v5 != 0x7FFFFFFFFFFFFFFFLL && v5 < v9)
    {
      long long v15 = [(NSArray *)self->_categories objectAtIndex:v5];
      uint64_t v16 = (int)[v15 intValue];

      uint64_t v17 = v16 - 1;
      if (unint64_t)(v16 - 1) < 0x18 && ((0xFFF601u >> v17))
      {
        long long v18 = [(id)qword_4BEC0 localizedStringForKey:off_3D690[v17] value:0 table:@"VOTLocalizedStrings"];
        [(UILabel *)self->_headingLabel setText:v18];
      }
      else
      {
        _AXAssert();
        [(UILabel *)self->_headingLabel setText:&stru_3F588];
      }
      self->_categordouble y = v5;
      v19 = [(NSArray *)self->_categories objectAtIndex:v5];
      v20 = (NSMutableArray *)[(NSArray *)self->_originalList mutableCopyWithZone:0];
      filteredList = self->_filteredList;
      self->_filteredList = v20;

      v22 = self->_filteredList;
      v31 = _NSConcreteStackBlock;
      uint64_t v32 = 3221225472;
      v33 = sub_145BC;
      v34 = &unk_3D578;
      v35 = self;
      id v36 = v19;
      id v23 = v19;
      v24 = [(NSMutableArray *)v22 indexesOfObjectsPassingTest:&v31];
      -[NSMutableArray removeObjectsAtIndexes:](v22, "removeObjectsAtIndexes:", v24, v31, v32, v33, v34, v35);

      v13 = self->_filteredList;
LABEL_27:
      [(Legacy_VOTUIItemChooserController *)self _displayWithList:v13 fromRotorSwitch:1];
      v25 = [(UILabel *)self->_headingLabel text];
      if (self->_category == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v26 = [(id)qword_4BEC0 localizedStringForKey:@"search.rotor.allitems" value:0 table:@"VOTLocalizedStrings"];

        v25 = (void *)v26;
      }
      UIAccessibilityPostNotification(UIAccessibilityPageScrolledNotification, v25);
      UIAccessibilityNotifications v27 = UIAccessibilityLayoutChangedNotification;
      v28 = [(UITableView *)self->_table accessibilityElementAtIndex:0];
      v29 = [v28 _accessibilityFindDescendant:&stru_3D5B8];
      UIAccessibilityPostNotification(v27, v29);

      LOBYTE(v6) = 1;
      return v6;
    }
LABEL_19:
    if (self->_category == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_20;
    }
    v11 = +[NSBundle bundleForClass:objc_opt_class()];
    id v12 = [v11 localizedStringForKey:@"VoiceOverItemChooser" value:&stru_3F588 table:@"VoiceOverUIService"];
    [(UILabel *)self->_headingLabel setText:v12];

    self->_categordouble y = 0x7FFFFFFFFFFFFFFFLL;
    v13 = self->_originalList;
    v14 = self->_filteredList;
    self->_filteredList = 0;

    goto LABEL_27;
  }
  return v6;
}

- (void)hideItemChooser:(BOOL)a3
{
  id v4 = [(Legacy_VOTUIItemChooserController *)self delegate];

  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_146F4;
    v6[3] = &unk_3D2B0;
    v6[4] = self;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1473C;
    v5[3] = &unk_3D1C0;
    v5[4] = self;
    +[UIView animateWithDuration:v6 animations:v5 completion:0.2];
  }
}

- (BOOL)hostingWindowShouldMoveForReachability
{
  return 1;
}

- (void)_handleSearchFieldTextChange:(id)a3
{
  id v4 = [(Legacy_VOTUIItemChooserController *)self view];
  unsigned __int8 v5 = [v4 isHidden];

  if ((v5 & 1) == 0)
  {
    NSUInteger v6 = [(UISearchField *)self->_searchField text];
    uint64_t v7 = [v6 lowercaseString];

    if (([v7 isEqualToString:self->_filter] & 1) == 0)
    {
      id v8 = (NSString *)[v7 copyWithZone:0];
      filter = self->_filter;
      self->_filter = v8;

      uint64_t v10 = (NSMutableArray *)[(NSArray *)self->_originalList mutableCopyWithZone:0];
      filteredList = self->_filteredList;
      self->_filteredList = v10;

      if ([(NSString *)self->_filter length])
      {
        id v12 = self->_filteredList;
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_14A3C;
        v14[3] = &unk_3D5E0;
        v14[4] = self;
        v13 = [(NSMutableArray *)v12 indexesOfObjectsPassingTest:v14];
        [(NSMutableArray *)v12 removeObjectsAtIndexes:v13];
      }
      [(Legacy_VOTUIItemChooserController *)self _displayWithList:self->_filteredList fromRotorSwitch:0];
    }
  }
}

- (void)consumeSinglePressUpForButtonKind:(int64_t)a3
{
}

- (void)_displayWithList:(id)a3 fromRotorSwitch:(BOOL)a4
{
  id v6 = a3;
  if (!self->_homeButtonIntercept)
  {
    uint64_t v7 = +[SBSHardwareButtonService sharedInstance];
    id v8 = [v7 beginConsumingPressesForButtonKind:1 eventConsumer:self priority:0];
    homeButtonIntercept = self->_homeButtonIntercept;
    self->_homeButtonIntercept = v8;
  }
  self->_id totalItemCount = (int64_t)[v6 count];
  if (self->_category == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([(NSMutableArray *)self->_filteredList count]) {
      id totalItemCount = [(NSMutableArray *)self->_filteredList count];
    }
    else {
      id totalItemCount = self->_totalItemCount;
    }
    v11 = +[NSBundle bundleForClass:objc_opt_class()];
    id v12 = [v11 localizedStringForKey:@"VoiceOverItemChooser.count" value:&stru_3F588 table:@"VoiceOverUIService"];
    v13 = AXFormatInteger();
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v13);
    [(UILabel *)self->_headingLabel setText:v14];
  }
  else
  {
    id totalItemCount = 0;
  }
  long long v15 = [(Legacy_VOTUIItemChooserController *)self view];
  [v15 layoutIfNeeded];

  self->_selectedRow = 0x7FFFFFFFFFFFFFFFLL;
  self->_activateItem = 0;
  [(NSMutableDictionary *)self->_items removeAllObjects];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_14E6C;
  v25[3] = &unk_3D608;
  v25[4] = self;
  [v6 enumerateObjectsUsingBlock:v25];
  uint64_t v16 = [(NSMutableDictionary *)self->_items allKeys];
  uint64_t v17 = [v16 sortedArrayUsingComparator:&stru_3D648];
  sectionHeaders = self->_sectionHeaders;
  self->_sectionHeaders = v17;

  [(UITableView *)self->_table setBackgroundView:0];
  [(UITableView *)self->_table reloadData];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_14FDC;
  v24[3] = &unk_3D2B0;
  v24[4] = self;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_15024;
  v22[3] = &unk_3D670;
  BOOL v23 = a4;
  v22[4] = self;
  v22[5] = totalItemCount;
  +[UIView animateWithDuration:v24 animations:v22 completion:0.2];
  v21 = [(UITableView *)self->_table safeValueForKey:@"_index"];
  id v19 = v21;
  AXPerformSafeBlock();
  [v19 bounds];
  objc_msgSend(v19, "setBounds:", 0.0, 0.0);
  v20 = [v19 layer];
  [v20 setCornerRadius:5.0];
}

- (double)_positionAccountingForKeyboard:(CGRect)a3
{
  double y = a3.origin.y;
  v10.origin.x = CGRectZero.origin.x;
  v10.origin.double y = CGRectZero.origin.y;
  v10.size.double width = CGRectZero.size.width;
  v10.size.double height = CGRectZero.size.height;
  BOOL v5 = CGRectEqualToRect(a3, v10);
  double result = -1.0;
  if (!v5)
  {
    uint64_t v7 = [(Legacy_VOTUIItemChooserController *)self view];
    [v7 frame];
    double v9 = v8;

    double result = (y - v9) * 0.5;
    if (v9 >= y) {
      return 30.0;
    }
  }
  return result;
}

- (void)_updatePositionForKeyboard:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(Legacy_VOTUIItemChooserController *)self view];
  [v8 frame];
  uint64_t v10 = v9;
  double v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;

  if (v12 > 30.0)
  {
    -[Legacy_VOTUIItemChooserController _positionAccountingForKeyboard:](self, "_positionAccountingForKeyboard:", x, y, width, height);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_15388;
    v18[3] = &unk_3D3A0;
    v18[4] = self;
    v18[5] = v10;
    v18[6] = v17;
    v18[7] = v14;
    v18[8] = v16;
    +[UIView animateWithDuration:v18 animations:0.2];
  }
}

- (void)_keyboardWillShow:(id)a3
{
  id v13 = a3;
  id v4 = [(Legacy_VOTUIItemChooserController *)self view];
  unsigned __int8 v5 = [v4 isHidden];

  if ((v5 & 1) == 0)
  {
    id v6 = [v13 userInfo];
    uint64_t v7 = [v6 objectForKey:UIKeyboardFrameEndUserInfoKey];
    [v7 CGRectValue];
    self->_keyboardFrame.origin.double x = v8;
    self->_keyboardFrame.origin.double y = v9;
    self->_keyboardFrame.size.double width = v10;
    self->_keyboardFrame.size.double height = v11;

    if ([(UISearchField *)self->_searchField isFirstResponder])
    {
      double v12 = [(UISearchField *)self->_searchField window];
      [v12 becomeKeyWindow];

      -[Legacy_VOTUIItemChooserController _updatePositionForKeyboard:](self, "_updatePositionForKeyboard:", self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height);
    }
  }
}

- (void)_keyboardWillHide:(id)a3
{
  id v4 = [(Legacy_VOTUIItemChooserController *)self view];
  unsigned __int8 v5 = [v4 isHidden];

  if ((v5 & 1) == 0)
  {
    [(UISearchField *)self->_searchField resignFirstResponder];
    CGSize size = CGRectZero.size;
    self->_keyboardFrame.origin = CGRectZero.origin;
    self->_keyboardFrame.CGSize size = size;
  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  searchField = self->_searchField;
  id v4 = a3;
  [(UISearchField *)searchField resignFirstResponder];
  [v4 setText:&stru_3F588];

  return 1;
}

- (BOOL)accessibilityPerformEscape
{
  self->_selectedRow = 0x7FFFFFFFFFFFFFFFLL;
  self->_activateItem = 0;
  [(Legacy_VOTUIItemChooserController *)self hideItemChooser:0];
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if ([(NSMutableArray *)self->_filteredList count]) {
    return 1;
  }
  sectionHeaders = self->_sectionHeaders;

  return [(NSArray *)sectionHeaders count];
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 0.0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(NSMutableArray *)self->_filteredList count])
  {
    filteredList = self->_filteredList;
    return (int64_t)[(NSMutableArray *)filteredList count];
  }
  else
  {
    CGFloat v8 = [(NSArray *)self->_sectionHeaders objectAtIndex:a4];
    CGFloat v9 = [(NSMutableDictionary *)self->_items objectForKey:v8];
    id v10 = [v9 count];

    return (int64_t)v10;
  }
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  if ([(NSString *)self->_filter length]) {
    id v4 = 0;
  }
  else {
    id v4 = self->_sectionHeaders;
  }

  return v4;
}

- (void)_updateSelectedRow:(id)a3
{
  id v9 = a3;
  if ([(NSMutableArray *)self->_filteredList count])
  {
    originalList = self->_originalList;
    unsigned __int8 v5 = [(UITableView *)self->_table cellForRowAtIndexPath:v9];
    id v6 = [v5 textLabel];
    uint64_t v7 = [v6 text];
    self->_selectedRow = [(NSArray *)originalList indexOfObject:v7];
  }
  else
  {
    unsigned __int8 v5 = -[NSArray objectAtIndex:](self->_sectionHeaders, "objectAtIndex:", [v9 section]);
    id v6 = [(NSMutableDictionary *)self->_items objectForKey:v5];
    [(UITableView *)self->_table deselectRowAtIndexPath:v9 animated:1];
    uint64_t v7 = objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v9, "row"));
    CGFloat v8 = [v7 objectAtIndex:1];
    self->_selectedRow = (int64_t)[v8 integerValue];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  [(Legacy_VOTUIItemChooserController *)self _updateSelectedRow:a4];

  [(Legacy_VOTUIItemChooserController *)self hideItemChooser:1];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v9 = a4;
  id v5 = [v9 contentView];
  id v6 = +[UIColor clearColor];
  [v5 setBackgroundColor:v6];

  if (v5)
  {
    do
    {
      uint64_t v7 = v5;
      id v5 = [v5 superview];

      CGFloat v8 = +[UIColor clearColor];
      [v5 setBackgroundColor:v8];
    }
    while (v5 != v9 && v5);
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NSMutableArray *)self->_filteredList count])
  {
    CGFloat v8 = -[NSMutableArray objectAtIndex:](self->_filteredList, "objectAtIndex:", [v7 row]);
    id v9 = [(NSArray *)self->_originalList indexOfObject:v8];
  }
  else
  {
    id v10 = -[NSArray objectAtIndex:](self->_sectionHeaders, "objectAtIndex:", [v7 section]);
    CGFloat v11 = [(NSMutableDictionary *)self->_items objectForKey:v10];
    double v12 = objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v7, "row"));
    CGFloat v8 = [v12 objectAtIndex:0];

    id v13 = objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v7, "row"));
    uint64_t v14 = [v13 objectAtIndex:1];
    id v9 = [v14 integerValue];
  }
  if (v9 >= (id)[(NSArray *)self->_regionDescriptions count])
  {
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = [(NSArray *)self->_regionDescriptions objectAtIndex:v9];
  }
  uint64_t v16 = [v6 dequeueReusableCellWithIdentifier:@"TableViewCell"];
  [v16 setAccessibilityTraits:kAXIgnoreItemChooserTrait];
  [v16 setAccessibilityHint:v15];
  uint64_t v17 = [v16 textLabel];
  [v17 setText:v8];

  long long v18 = [v16 textLabel];
  [v18 setNumberOfLines:0];

  id v19 = +[UIColor whiteColor];
  v20 = [v16 textLabel];
  [v20 setTextColor:v19];

  v21 = +[UIColor clearColor];
  v22 = [v16 textLabel];
  [v22 setBackgroundColor:v21];

  BOOL v23 = +[UIColor clearColor];
  [v16 setBackgroundColor:v23];

  v24 = [v16 contentView];
  v25 = [v24 superview];
  uint64_t v26 = +[UIColor clearColor];
  [v25 setBackgroundColor:v26];

  return v16;
}

- (Legacy_VOTUIItemChooserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (Legacy_VOTUIItemChooserDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_homeButtonIntercept, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_sectionHeaders, 0);
  objc_storeStrong((id *)&self->_regionDescriptions, 0);
  objc_storeStrong((id *)&self->_itemCategoryMappings, 0);
  objc_storeStrong((id *)&self->_originalList, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_filteredList, 0);
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_searchField, 0);

  objc_storeStrong((id *)&self->_headingLabel, 0);
}

@end