@interface _UIFontPickerSearchContentViewController
- (BOOL)_canShowWhileLocked;
- (NSString)searchTerm;
- (_UIFontPickerViewControllerHost)delegate;
- (id)contentUnavailableConfigurationState;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_filterResultsForSearchTerm:(id)a3;
- (void)_setConfiguration:(id)a3;
- (void)_setResultFonts:(id)a3;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setSearchTerm:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateContentUnavailableConfigurationUsingState:(id)a3;
@end

@implementation _UIFontPickerSearchContentViewController

- (void)loadView
{
  v19.receiver = self;
  v19.super_class = (Class)_UIFontPickerSearchContentViewController;
  [(_UIFontPickerSearchContentViewController *)&v19 loadView];
  v3 = [(_UIFontPickerSearchContentViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"UIFontPickerCell"];

  v4 = [(_UIFontPickerSearchContentViewController *)self tableView];
  [v4 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"UIFontPickerFooter"];

  v5 = [(_UIFontPickerSearchContentViewController *)self tableView];
  [v5 setSeparatorInsetReference:1];

  v6 = [(_UIFontPickerSearchContentViewController *)self tableView];
  [v6 setKeyboardDismissMode:1];

  v7 = [(_UIFontPickerSearchContentViewController *)self tableView];
  [v7 setSectionFooterHeight:UITableViewAutomaticDimension];

  v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"FONT_PICKER_SETTINGS_LINK_FORMAT" value:@"Manage and find more fonts in Settings. %@" table:@"Localizable"];
  v10 = +[NSBundle bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"FONT_PICKER_SETTINGS_LINK" value:@"Open Fonts…" table:@"Localizable"];
  v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v11);

  v13 = (NSAttributedString *)[objc_alloc((Class)NSMutableAttributedString) initWithString:v12];
  v14 = +[NSBundle bundleForClass:objc_opt_class()];
  v15 = [v14 localizedStringForKey:@"FONT_PICKER_SETTINGS_LINK" value:@"Open Fonts…" table:@"Localizable"];
  id v16 = [v12 rangeOfString:v15];
  [(NSAttributedString *)v13 addAttribute:NSLinkAttributeName, @"settings-navigation://com.apple.Settings.General/FONT_SETTING", v16, v17 value range];

  footerText = self->_footerText;
  self->_footerText = v13;
}

- (void)_setResultFonts:(id)a3
{
  objc_storeStrong((id *)&self->_fonts, a3);
  v4 = [(_UIFontPickerSearchContentViewController *)self tableView];
  [v4 reloadData];

  [(_UIFontPickerSearchContentViewController *)self setNeedsUpdateContentUnavailableConfiguration];
}

- (void)_filterResultsForSearchTerm:(id)a3
{
  id v13 = a3;
  v4 = (NSArray *)objc_opt_new();
  v5 = objc_opt_new();
  if ([(NSArray *)self->_fonts count])
  {
    unint64_t v6 = 0;
    do
    {
      v7 = [(NSArray *)self->_fonts objectAtIndexedSubscript:v6];
      if ([v7 matchesSearchString:v13])
      {
        [(NSArray *)v4 addObject:v7];
      }
      else
      {
        v8 = +[NSIndexPath indexPathForRow:v6 inSection:0];
        [v5 addObject:v8];
      }
      ++v6;
    }
    while (v6 < [(NSArray *)self->_fonts count]);
  }
  fonts = self->_fonts;
  self->_fonts = v4;

  v10 = [(_UIFontPickerSearchContentViewController *)self tableView];
  [v10 beginUpdates];

  v11 = [(_UIFontPickerSearchContentViewController *)self tableView];
  [v11 deleteRowsAtIndexPaths:v5 withRowAnimation:5];

  v12 = [(_UIFontPickerSearchContentViewController *)self tableView];
  [v12 endUpdates];

  [(_UIFontPickerSearchContentViewController *)self setNeedsUpdateContentUnavailableConfiguration];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_fonts count];
}

- (void)_setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
  id v5 = a3;
  [(_UIFontPickerSearchContentViewController *)self _setResultFonts:self->_fonts];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"UIFontPickerCell"];
  if (!v7) {
    v7 = [[_UIFontPickerTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"UIFontPickerCell"];
  }
  v8 = -[NSArray objectAtIndexedSubscript:](self->_fonts, "objectAtIndexedSubscript:", [v6 row]);
  id v9 = sub_100077CB0();
  v10 = [(UIFontPickerViewControllerConfiguration *)self->_configuration _clientFontContextEndpoint];
  v11 = [v9 sharedInstanceForEndpoint:v10];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10007C680;
  v18[3] = &unk_1000A0FC0;
  v12 = v7;
  objc_super v19 = v12;
  id v13 = v8;
  id v20 = v13;
  v21 = self;
  [v11 runBlockInClientFontContext:v18];
  if ([(UIFontPickerViewControllerConfiguration *)self->_configuration includeFaces]
    && ([(UIFontPickerViewControllerConfiguration *)self->_configuration _filterFamilyName],
        v14 = objc_claimAutoreleasedReturnValue(),
        v14,
        !v14))
  {
    uint64_t v15 = [v13 hasMultipleFaces];
  }
  else
  {
    uint64_t v15 = 0;
  }
  [(_UIFontPickerTableViewCell *)v12 setAccessoryType:v15];
  id v16 = v12;

  return v16;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  [self->_fonts objectAtIndexedSubscript:[a4 row]];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = [v7 fontDescriptor];
  [WeakRetained _pickerDidSelectFont:v6];
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v5 = a3;
  id v6 = [v5 dequeueReusableHeaderFooterViewWithIdentifier:@"UIFontPickerFooter"];
  if (!v6) {
    id v6 = [objc_alloc((Class)UITableViewHeaderFooterView) initWithReuseIdentifier:@"UIFontPickerFooter"];
  }
  if (!self->_footerTextView)
  {
    id v7 = [objc_alloc((Class)UITextView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    footerTextView = self->_footerTextView;
    self->_footerTextView = v7;

    [(UITextView *)self->_footerTextView setDelegate:self];
    [(UITextView *)self->_footerTextView setScrollEnabled:0];
    [(UITextView *)self->_footerTextView setEditable:0];
    [(UITextView *)self->_footerTextView setSelectable:1];
    [(UITextView *)self->_footerTextView setDataDetectorTypes:2];
    id v9 = [(UITextView *)self->_footerTextView textContainer];
    [v9 setLineFragmentPadding:0.0];

    [(UITextView *)self->_footerTextView setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = [v6 contentView];
    [v10 addSubview:self->_footerTextView];

    v48 = [v6 contentView];
    v47 = [v48 safeAreaLayoutGuide];
    v46 = [v47 leadingAnchor];
    v45 = [(UITextView *)self->_footerTextView leadingAnchor];
    v44 = [v46 constraintEqualToAnchor:v45];
    v49[0] = v44;
    v43 = [v6 contentView];
    v42 = [v43 safeAreaLayoutGuide];
    v41 = [v42 trailingAnchor];
    v40 = [(UITextView *)self->_footerTextView trailingAnchor];
    v39 = [v41 constraintEqualToAnchor:v40];
    v49[1] = v39;
    v38 = [v6 contentView];
    v37 = [v38 safeAreaLayoutGuide];
    v36 = [v37 topAnchor];
    v35 = [(UITextView *)self->_footerTextView topAnchor];
    v34 = [v36 constraintEqualToAnchor:v35];
    v49[2] = v34;
    v11 = [v6 contentView];
    v12 = [v11 safeAreaLayoutGuide];
    id v13 = [v12 bottomAnchor];
    [(UITextView *)self->_footerTextView bottomAnchor];
    uint64_t v15 = v14 = v5;
    id v16 = [v13 constraintEqualToAnchor:v15];
    v49[3] = v16;
    uint64_t v17 = +[NSArray arrayWithObjects:v49 count:4];
    +[NSLayoutConstraint activateConstraints:v17];

    id v5 = v14;
    v18 = +[UIColor clearColor];
    [(UITextView *)self->_footerTextView setBackgroundColor:v18];
  }
  objc_super v19 = [v6 defaultContentConfiguration];
  id v20 = [(NSAttributedString *)self->_footerText mutableCopy];
  v21 = [v19 textProperties];
  v22 = [v21 font];
  [v20 addAttribute:NSFontAttributeName value:v22 range:0, [v20 length]];

  v23 = [v19 textProperties];
  v24 = [v23 color];
  [v20 addAttribute:NSForegroundColorAttributeName value:v24 range:0, [v20 length]];

  [(UITextView *)self->_footerTextView setAttributedText:v20];
  [v19 directionalLayoutMargins];
  double v26 = v25;
  [v5 layoutMargins];
  double v28 = v27;
  [v19 directionalLayoutMargins];
  double v30 = v29;
  [v5 layoutMargins];
  double v32 = v31;

  -[UITextView setTextContainerInset:](self->_footerTextView, "setTextContainerInset:", v26, v28, v30, v32);

  return v6;
}

- (void)updateContentUnavailableConfigurationUsingState:(id)a3
{
  if ([(NSArray *)self->_fonts count])
  {
    id v4 = 0;
  }
  else
  {
    id v13 = +[UIContentUnavailableConfiguration searchConfiguration];
    id v5 = +[UIButtonConfiguration plainButtonConfiguration];
    id v6 = +[NSBundle bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"FONT_PICKER_SETTINGS_LINK_SHORT" value:@"Manage Fonts" table:@"Localizable"];
    [v5 setTitle:v7];

    [v13 setSecondaryButton:v5];
    v8 = +[UIAction actionWithHandler:&stru_1000A1028];
    id v9 = [v13 secondaryButtonProperties];
    [v9 setPrimaryAction:v8];

    v10 = +[UIBackgroundConfiguration clearConfiguration];
    v11 = [(_UIFontPickerSearchContentViewController *)self tableView];
    v12 = [v11 backgroundColor];
    [v10 setBackgroundColor:v12];

    [v13 setBackground:v10];
    id v4 = v13;
  }
  id v14 = v4;
  [(_UIFontPickerSearchContentViewController *)self setContentUnavailableConfiguration:v4];
}

- (id)contentUnavailableConfigurationState
{
  v6.receiver = self;
  v6.super_class = (Class)_UIFontPickerSearchContentViewController;
  v3 = [(_UIFontPickerSearchContentViewController *)&v6 contentUnavailableConfigurationState];
  id v4 = [(_UIFontPickerSearchContentViewController *)self searchTerm];
  [v3 setSearchText:v4];

  return v3;
}

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  if (!objc_msgSend(a4, "contentType", a3)) {
    sub_100077B44();
  }
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_UIFontPickerViewControllerHost)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_UIFontPickerViewControllerHost *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)searchTerm
{
  return self->_searchTerm;
}

- (void)setSearchTerm:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_footerTextView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_fonts, 0);
}

@end