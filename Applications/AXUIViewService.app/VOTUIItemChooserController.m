@interface VOTUIItemChooserController
- (BOOL)_canShowWhileLocked;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)hostingWindowShouldMoveForReachability;
- (BOOL)textFieldShouldReturn:(id)a3;
- (NSString)lastSearchTerm;
- (VOTUIItemChooserDelegate)delegate;
- (double)_positionAccountingForKeyboard:(CGRect)a3;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_constraintsToPositionItem:(id)a3 identicallyToItem:(id)a4;
- (id)sectionIndexTitlesForTableView:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)modalPresentationStyle;
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
- (void)hideItemChooser:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setLastSearchTerm:(id)a3;
- (void)showItemChooser:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation VOTUIItemChooserController

- (void)viewDidLoad
{
  v51.receiver = self;
  v51.super_class = (Class)VOTUIItemChooserController;
  [(VOTUIItemChooserController *)&v51 viewDidLoad];
  id v3 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v7 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height];
  [v7 setAutoresizingMask:18];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = [(VOTUIItemChooserController *)self view];
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

  v15 = [objc_allocWithZone((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  headingLabel = self->_headingLabel;
  self->_headingLabel = v15;

  [(UILabel *)self->_headingLabel setTag:1010];
  v17 = +[NSBundle bundleForClass:objc_opt_class()];
  v18 = [v17 localizedStringForKey:@"VoiceOverItemChooser" value:&stru_100024F38 table:@"AXUIViewService"];
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
  v22 = [objc_allocWithZone((Class)UISearchField) initWithFrame:CGRectZero.origin.x, y, width, height];
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
  v24 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, y, width, height];
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
  v34 = [(VOTUIItemChooserController *)self view];
  v35 = [(VOTUIItemChooserController *)self _constraintsToPositionItem:v7 identicallyToItem:v34];
  v50 = v33;
  [v33 addObjectsFromArray:v35];

  +[NSLayoutConstraint activateConstraints:v33];
  v36 = [(UILabel *)self->_headingLabel topAnchor];
  v37 = [v7 safeAreaLayoutGuide];
  v38 = [v37 topAnchor];
  v39 = [v36 constraintEqualToSystemSpacingBelowAnchor:v38 multiplier:1.0];
  [v39 setActive:1];

  v40 = +[NSLayoutConstraint constraintWithItem:self->_headingLabel attribute:7 relatedBy:0 toItem:v7 attribute:7 multiplier:0.9 constant:0.0];
  [v40 setActive:1];

  v41 = +[NSLayoutConstraint constraintWithItem:self->_headingLabel attribute:9 relatedBy:0 toItem:v7 attribute:9 multiplier:1.0 constant:0.0];
  [v41 setActive:1];

  v42 = +[NSLayoutConstraint constraintWithItem:self->_searchField attribute:3 relatedBy:0 toItem:self->_headingLabel attribute:4 multiplier:1.0 constant:5.0];
  [v42 setActive:1];

  v43 = +[NSLayoutConstraint constraintWithItem:self->_searchField attribute:7 relatedBy:0 toItem:v7 attribute:7 multiplier:0.8 constant:0.0];
  [v43 setActive:1];

  v44 = +[NSLayoutConstraint constraintWithItem:self->_searchField attribute:9 relatedBy:0 toItem:v7 attribute:9 multiplier:1.0 constant:0.0];
  [v44 setActive:1];

  v45 = +[NSLayoutConstraint constraintWithItem:self->_table attribute:3 relatedBy:0 toItem:self->_searchField attribute:4 multiplier:1.0 constant:10.0];
  [v45 setActive:1];

  v46 = +[NSLayoutConstraint constraintWithItem:self->_table attribute:7 relatedBy:0 toItem:v7 attribute:7 multiplier:0.9 constant:0.0];
  [v46 setActive:1];

  v47 = +[NSLayoutConstraint constraintWithItem:self->_table attribute:9 relatedBy:0 toItem:v7 attribute:9 multiplier:1.0 constant:0.0];
  [v47 setActive:1];

  v48 = +[NSLayoutConstraint constraintWithItem:self->_table attribute:4 relatedBy:0 toItem:v7 attribute:4 multiplier:1.0 constant:0.0];
  [v48 setActive:1];

  v49 = +[NSLayoutConstraint constraintWithItem:self->_backdropView attribute:3 relatedBy:0 toItem:v7 attribute:4 multiplier:1.0 constant:0.0];
  [v49 setActive:1];
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
  id v8 = [&off_100026048 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(&off_100026048);
        }
        id v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) integerValue];
        v13 = +[NSLayoutConstraint constraintWithItem:v5 attribute:v12 relatedBy:0 toItem:v6 attribute:v12 multiplier:1.0 constant:0.0];
        [v7 addObject:v13];
      }
      id v9 = [&off_100026048 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v7;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)showItemChooser:(id)a3
{
  id v4 = a3;
  [(VOTUIItemChooserController *)self setAccessibilityViewIsModal:1];
  self->_categordouble y = 0x7FFFFFFFFFFFFFFFLL;
  id v5 = [v4 objectForKey:@"items"];
  id v6 = [v4 objectForKey:@"categories"];
  id v7 = [v4 objectForKey:@"mappings"];
  id v8 = [v4 objectForKey:@"regionDescriptions"];
  id v9 = [v4 objectForKey:@"searchTerm"];

  objc_storeStrong((id *)&self->_itemCategoryMappings, v7);
  objc_storeStrong((id *)&self->_originalList, v5);
  objc_storeStrong((id *)&self->_regionDescriptions, v8);
  objc_storeStrong((id *)&self->_categories, v6);
  objc_storeStrong((id *)&self->_lastSearchTerm, v9);
  [(UISearchField *)self->_searchField setText:self->_lastSearchTerm];
  [(VOTUIItemChooserController *)self _handleSearchFieldTextChange:0];
  if (GSEventIsHardwareKeyboardAttached() || [(NSString *)self->_lastSearchTerm length])
  {
    [(UISearchField *)self->_searchField becomeFirstResponder];
    AXPerformBlockOnMainThreadAfterDelay();
  }
  [(VOTUIItemChooserController *)self _guidedAccessItemChooserDidShow];
}

- (void)_guidedAccessItemChooserDidShow
{
  [(VOTUIItemChooserController *)self _loadGuidedAccessBundle];
  id v4 = [(VOTUIItemChooserController *)self view];
  id v3 = [v4 window];
  -[VOTUIItemChooserController _updateGuidedAccessWindowId:](self, "_updateGuidedAccessWindowId:", [v3 _contextId]);
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
  if (_AXSGuidedAccessEnabled() && qword_10002E7B0 != -1)
  {
    dispatch_once(&qword_10002E7B0, &stru_100024C48);
  }
}

- (int64_t)modalPresentationStyle
{
  return 5;
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
    if (qword_10002E7B8)
    {
      if ((v5 & 0x8000000000000000) != 0) {
        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v7 = +[NSBundle bundleWithPath:@"/System/Library/CoreServices/VoiceOverTouch.app"];
      id v8 = (void *)qword_10002E7B8;
      qword_10002E7B8 = v7;

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
        long long v18 = [(id)qword_10002E7B8 localizedStringForKey:*(&off_100024D88 + v17) value:0 table:@"VOTLocalizedStrings"];
        [(UILabel *)self->_headingLabel setText:v18];
      }
      else
      {
        _AXAssert();
        [(UILabel *)self->_headingLabel setText:&stru_100024F38];
      }
      self->_categordouble y = v5;
      v19 = [(NSArray *)self->_categories objectAtIndex:v5];
      v20 = (NSMutableArray *)[(NSArray *)self->_originalList mutableCopyWithZone:0];
      filteredList = self->_filteredList;
      self->_filteredList = v20;

      v22 = self->_filteredList;
      v31 = _NSConcreteStackBlock;
      uint64_t v32 = 3221225472;
      v33 = sub_10000FC0C;
      v34 = &unk_100024C70;
      v35 = self;
      id v36 = v19;
      id v23 = v19;
      v24 = [(NSMutableArray *)v22 indexesOfObjectsPassingTest:&v31];
      -[NSMutableArray removeObjectsAtIndexes:](v22, "removeObjectsAtIndexes:", v24, v31, v32, v33, v34, v35);

      v13 = self->_filteredList;
LABEL_27:
      [(VOTUIItemChooserController *)self _displayWithList:v13 fromRotorSwitch:1];
      v25 = [(UILabel *)self->_headingLabel text];
      if (self->_category == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v26 = [(id)qword_10002E7B8 localizedStringForKey:@"search.rotor.allitems" value:0 table:@"VOTLocalizedStrings"];

        v25 = (void *)v26;
      }
      UIAccessibilityPostNotification(UIAccessibilityPageScrolledNotification, v25);
      UIAccessibilityNotifications v27 = UIAccessibilityLayoutChangedNotification;
      v28 = [(UITableView *)self->_table accessibilityElementAtIndex:0];
      v29 = [v28 _accessibilityFindDescendant:&stru_100024CB0];
      UIAccessibilityPostNotification(v27, v29);

      LOBYTE(v6) = 1;
      return v6;
    }
LABEL_19:
    if (self->_category == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_20;
    }
    v11 = +[NSBundle bundleForClass:objc_opt_class()];
    id v12 = [v11 localizedStringForKey:@"VoiceOverItemChooser" value:&stru_100024F38 table:@"AXUIViewService"];
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
  id v4 = [(VOTUIItemChooserController *)self delegate];

  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000FD44;
    v6[3] = &unk_100024748;
    v6[4] = self;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000FD8C;
    v5[3] = &unk_1000247F8;
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
  id v4 = [(VOTUIItemChooserController *)self view];
  unsigned __int8 v5 = [v4 isHidden];

  if ((v5 & 1) == 0)
  {
    NSUInteger v6 = [(UISearchField *)self->_searchField text];
    uint64_t v7 = [v6 lowercaseString];

    if (([v7 isEqualToString:self->_filter] & 1) == 0)
    {
      id v8 = [(UISearchField *)self->_searchField text];
      lastSearchTerm = self->_lastSearchTerm;
      self->_lastSearchTerm = v8;

      uint64_t v10 = (NSString *)[v7 copyWithZone:0];
      filter = self->_filter;
      self->_filter = v10;

      id v12 = (NSMutableArray *)[(NSArray *)self->_originalList mutableCopyWithZone:0];
      filteredList = self->_filteredList;
      self->_filteredList = v12;

      if ([(NSString *)self->_filter length])
      {
        v14 = self->_filteredList;
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_10000FFD8;
        v16[3] = &unk_100024CD8;
        v16[4] = self;
        long long v15 = [(NSMutableArray *)v14 indexesOfObjectsPassingTest:v16];
        [(NSMutableArray *)v14 removeObjectsAtIndexes:v15];
      }
      [(VOTUIItemChooserController *)self _displayWithList:self->_filteredList fromRotorSwitch:0];
    }
  }
}

- (void)_displayWithList:(id)a3 fromRotorSwitch:(BOOL)a4
{
  id v6 = a3;
  self->_id totalItemCount = (int64_t)[v6 count];
  if (self->_category == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([(NSMutableArray *)self->_filteredList count]) {
      id totalItemCount = [(NSMutableArray *)self->_filteredList count];
    }
    else {
      id totalItemCount = self->_totalItemCount;
    }
    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    NSUInteger v9 = [v8 localizedStringForKey:@"VoiceOverItemChooser.count" value:&stru_100024F38 table:@"AXUIViewService"];
    uint64_t v10 = AXFormatInteger();
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v10);
    [(UILabel *)self->_headingLabel setText:v11];
  }
  else
  {
    id totalItemCount = 0;
  }
  id v12 = [(VOTUIItemChooserController *)self view];
  [v12 layoutIfNeeded];

  self->_selectedRow = 0x7FFFFFFFFFFFFFFFLL;
  self->_activateItem = 0;
  [(NSMutableDictionary *)self->_items removeAllObjects];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100010400;
  v26[3] = &unk_100024D00;
  v26[4] = self;
  [v6 enumerateObjectsUsingBlock:v26];

  v13 = [(NSMutableDictionary *)self->_items allKeys];
  v14 = [v13 sortedArrayUsingComparator:&stru_100024D40];
  sectionHeaders = self->_sectionHeaders;
  self->_sectionHeaders = v14;

  [(UITableView *)self->_table setBackgroundView:0];
  [(UITableView *)self->_table reloadData];
  if (!a4)
  {
    uint64_t v16 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v17 = [v16 localizedStringForKey:@"item.count" value:&stru_100024F38 table:@"AXUIViewService"];
    long long v18 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v17, totalItemCount);

    v19 = [(NSMutableArray *)self->_filteredList firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v23 = v19;
      CFStringRef v24 = @"__AXStringForVariablesSentinel";
      uint64_t v20 = __UIAXStringForVariables();

      long long v18 = (void *)v20;
    }
    UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v18);
  }
  v25 = [(UITableView *)self->_table safeValueForKey:@"_index", v23, v24];
  id v21 = v25;
  AXPerformSafeBlock();
  [v21 bounds];
  [v21 setBounds:0.0, 0.0];
  v22 = [v21 layer];
  [v22 setCornerRadius:5.0];
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
    uint64_t v7 = [(VOTUIItemChooserController *)self view];
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
  double v8 = [(VOTUIItemChooserController *)self view];
  [v8 frame];
  uint64_t v10 = v9;
  double v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;

  if (v12 > 30.0)
  {
    -[VOTUIItemChooserController _positionAccountingForKeyboard:](self, "_positionAccountingForKeyboard:", x, y, width, height);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100010750;
    v18[3] = &unk_100024D68;
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
  id v4 = [(VOTUIItemChooserController *)self view];
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

      -[VOTUIItemChooserController _updatePositionForKeyboard:](self, "_updatePositionForKeyboard:", self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height);
    }
  }
}

- (void)_keyboardWillHide:(id)a3
{
  id v4 = [(VOTUIItemChooserController *)self view];
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
  return 1;
}

- (BOOL)accessibilityPerformEscape
{
  self->_selectedRow = 0x7FFFFFFFFFFFFFFFLL;
  self->_activateItem = 0;
  [(VOTUIItemChooserController *)self hideItemChooser:0];
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
    uint64_t v7 = [v6 objectAtIndex:[v9 row]];
    CGFloat v8 = [v7 objectAtIndex:1];
    self->_selectedRow = (int64_t)[v8 integerValue];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  [(VOTUIItemChooserController *)self _updateSelectedRow:a4];

  [(VOTUIItemChooserController *)self hideItemChooser:1];
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
    double v12 = [v11 objectAtIndex:[v7 row]];
    CGFloat v8 = [v12 objectAtIndex:0];

    id v13 = [v11 objectAtIndex:[v7 row]];
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

  v19 = +[UIColor whiteColor];
  uint64_t v20 = [v16 textLabel];
  [v20 setTextColor:v19];

  id v21 = +[UIColor clearColor];
  v22 = [v16 textLabel];
  [v22 setBackgroundColor:v21];

  id v23 = +[UIColor clearColor];
  [v16 setBackgroundColor:v23];

  CFStringRef v24 = [v16 contentView];
  v25 = [v24 superview];
  uint64_t v26 = +[UIColor clearColor];
  [v25 setBackgroundColor:v26];

  return v16;
}

- (VOTUIItemChooserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VOTUIItemChooserDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)lastSearchTerm
{
  return self->_lastSearchTerm;
}

- (void)setLastSearchTerm:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSearchTerm, 0);
  objc_destroyWeak((id *)&self->_delegate);
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