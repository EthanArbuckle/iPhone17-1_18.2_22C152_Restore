@interface PLBatteryUISuggestionHeaderCell
- (BOOL)showAll;
- (NSLayoutConstraint)widthConstraint;
- (NSString)suggestionTitle;
- (PLBatteryUISuggestionHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (PLBatteryUISuggestionHeaderCellDelegate)delegate;
- (UILabel)headerShowAllButton;
- (UILabel)headerTitleLabel;
- (void)buttonAction:(id)a3;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHeaderShowAllButton:(id)a3;
- (void)setHeaderTitleLabel:(id)a3;
- (void)setShowAll:(BOOL)a3;
- (void)setSuggestionTitle:(id)a3;
- (void)setWidthConstraint:(id)a3;
- (void)updateButton;
- (void)updateConstraints;
@end

@implementation PLBatteryUISuggestionHeaderCell

- (PLBatteryUISuggestionHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v48.receiver = self;
  v48.super_class = (Class)PLBatteryUISuggestionHeaderCell;
  v9 = [(PLBatteryUISuggestionHeaderCell *)&v48 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  if (v9)
  {
    v10 = +[UIColor clearColor];
    [(PLBatteryUISuggestionHeaderCell *)v9 setBackgroundColor:v10];

    v11 = [(PLBatteryUISuggestionHeaderCell *)v9 contentView];
    id v12 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    id v16 = objc_msgSend(v12, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    [(PLBatteryUISuggestionHeaderCell *)v9 setHeaderTitleLabel:v16];

    v17 = [(PLBatteryUISuggestionHeaderCell *)v9 headerTitleLabel];
    [v17 setAccessibilityIdentifier:@"SuggestionHeader"];

    v18 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
    v19 = [(PLBatteryUISuggestionHeaderCell *)v9 headerTitleLabel];
    [v19 setFont:v18];

    v20 = [(PLBatteryUISuggestionHeaderCell *)v9 headerTitleLabel];
    [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

    v21 = +[UIColor _secondaryLabelColor];
    v22 = [(PLBatteryUISuggestionHeaderCell *)v9 headerTitleLabel];
    [v22 setTextColor:v21];

    int64_t v23 = +[PLBatteryUIUtilities localizedLeftTextAlignment];
    v24 = [(PLBatteryUISuggestionHeaderCell *)v9 headerTitleLabel];
    [v24 setTextAlignment:v23];

    v25 = +[UIColor clearColor];
    v26 = [(PLBatteryUISuggestionHeaderCell *)v9 headerTitleLabel];
    [v26 setBackgroundColor:v25];

    v27 = [(PLBatteryUISuggestionHeaderCell *)v9 headerTitleLabel];
    [v27 setNumberOfLines:0];

    v28 = [(PLBatteryUISuggestionHeaderCell *)v9 headerTitleLabel];
    [v28 setLineBreakMode:0];

    v29 = [(PLBatteryUISuggestionHeaderCell *)v9 headerTitleLabel];
    [v11 addSubview:v29];

    id v30 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    [(PLBatteryUISuggestionHeaderCell *)v9 setHeaderShowAllButton:v30];

    v31 = [(PLBatteryUISuggestionHeaderCell *)v9 headerShowAllButton];
    [v31 setAccessibilityIdentifier:@"ShowAllButton"];

    v32 = [(PLBatteryUISuggestionHeaderCell *)v9 headerShowAllButton];
    [v32 setTranslatesAutoresizingMaskIntoConstraints:0];

    v33 = +[UIColor systemBlueColor];
    v34 = [(PLBatteryUISuggestionHeaderCell *)v9 headerShowAllButton];
    [v34 setTextColor:v33];

    v35 = [(PLBatteryUISuggestionHeaderCell *)v9 headerShowAllButton];
    [v35 setEnabled:1];

    v36 = [(PLBatteryUISuggestionHeaderCell *)v9 headerShowAllButton];
    [v36 setHidden:0];

    v37 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
    v38 = [(PLBatteryUISuggestionHeaderCell *)v9 headerShowAllButton];
    [v38 setFont:v37];

    v39 = [(PLBatteryUISuggestionHeaderCell *)v9 headerShowAllButton];
    [v39 setNumberOfLines:0];

    int64_t v40 = +[PLBatteryUIUtilities localizedRightTextAlignment];
    v41 = [(PLBatteryUISuggestionHeaderCell *)v9 headerShowAllButton];
    [v41 setTextAlignment:v40];

    v42 = [(PLBatteryUISuggestionHeaderCell *)v9 headerShowAllButton];
    [v42 setLineBreakMode:0];

    v43 = [(PLBatteryUISuggestionHeaderCell *)v9 headerShowAllButton];
    [v11 addSubview:v43];

    -[PLBatteryUISuggestionHeaderCell setSeparatorInset:](v9, "setSeparatorInset:", 0.0, 0.0, 0.0, 0.0);
    v44 = [(PLBatteryUISuggestionHeaderCell *)v9 headerShowAllButton];
    [v44 setUserInteractionEnabled:1];

    id v45 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v9 action:"buttonAction:"];
    [v45 setNumberOfTapsRequired:1];
    v46 = [(PLBatteryUISuggestionHeaderCell *)v9 headerShowAllButton];
    [v46 addGestureRecognizer:v45];

    [(PLBatteryUISuggestionHeaderCell *)v9 refreshCellContentsWithSpecifier:v8];
  }

  return v9;
}

- (void)updateConstraints
{
  v3 = [(PLBatteryUISuggestionHeaderCell *)self headerTitleLabel];
  v4 = [v3 text];
  v5 = [(PLBatteryUISuggestionHeaderCell *)self headerTitleLabel];
  v6 = [v5 font];
  +[PLBatteryUIUtilities getOneLineWidthOfText:v4 withFont:v6];
  double v8 = v7;

  v9 = [(PLBatteryUISuggestionHeaderCell *)self headerShowAllButton];
  v10 = [v9 text];
  v11 = [(PLBatteryUISuggestionHeaderCell *)self headerShowAllButton];
  id v12 = [v11 font];
  +[PLBatteryUIUtilities getOneLineWidthOfText:v10 withFont:v12];
  double v14 = v13;

  [(PLBatteryUISuggestionHeaderCell *)self frame];
  if (v8 + v14 + 30.0 + 3.0 <= v15) {
    double v16 = v8 / v14;
  }
  else {
    double v16 = 1.0;
  }
  v17 = [(PLBatteryUISuggestionHeaderCell *)self headerTitleLabel];
  v18 = [(PLBatteryUISuggestionHeaderCell *)self headerShowAllButton];
  v19 = +[NSLayoutConstraint constraintWithItem:v17 attribute:7 relatedBy:0 toItem:v18 attribute:7 multiplier:v16 constant:0.0];

  v20 = [(PLBatteryUISuggestionHeaderCell *)self widthConstraint];

  if (v20)
  {
    v21 = [(PLBatteryUISuggestionHeaderCell *)self contentView];
    v22 = [(PLBatteryUISuggestionHeaderCell *)self widthConstraint];
    [v21 removeConstraint:v22];

    [(PLBatteryUISuggestionHeaderCell *)self setWidthConstraint:v19];
    v35 = v19;
    int64_t v23 = +[NSArray arrayWithObjects:&v35 count:1];
    +[NSLayoutConstraint activateConstraints:v23];

    v34.receiver = self;
    v34.super_class = (Class)PLBatteryUISuggestionHeaderCell;
    [(PLBatteryUISuggestionHeaderCell *)&v34 updateConstraints];
  }
  else
  {
    v24 = +[NSMutableArray array];
    v25 = [(PLBatteryUISuggestionHeaderCell *)self headerTitleLabel];
    [v25 sizeToFit];

    v26 = [(PLBatteryUISuggestionHeaderCell *)self headerShowAllButton];
    [v26 sizeToFit];

    v27 = _NSDictionaryOfVariableBindings(@"_headerTitleLabel, _headerShowAllButton", self->_headerTitleLabel, self->_headerShowAllButton, 0);
    v28 = _NSDictionaryOfVariableBindings(@"labelMargin, bottomMargin", &off_C9488, &off_C94A0, 0);
    v29 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-labelMargin-[_headerTitleLabel]-3-[_headerShowAllButton]-labelMargin-|", 0, v28, v27);
    id v30 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-10-[_headerTitleLabel]-bottomMargin-|", 0, v28, v27);
    v31 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-10-[_headerShowAllButton]-bottomMargin-|", 0, v28, v27);
    v32 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_headerTitleLabel(==_headerShowAllButton)]" options:0 metrics:0 views:v27];
    [(PLBatteryUISuggestionHeaderCell *)self setWidthConstraint:v19];
    [v24 addObjectsFromArray:v29];
    [v24 addObjectsFromArray:v30];
    [v24 addObjectsFromArray:v31];
    [v24 addObjectsFromArray:v32];
    [v24 addObject:v19];
    +[NSLayoutConstraint activateConstraints:v24];
    v33.receiver = self;
    v33.super_class = (Class)PLBatteryUISuggestionHeaderCell;
    [(PLBatteryUISuggestionHeaderCell *)&v33 updateConstraints];
  }
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PLBatteryUISuggestionHeaderCell;
  id v4 = a3;
  [(PLBatteryUISuggestionHeaderCell *)&v11 refreshCellContentsWithSpecifier:v4];
  v5 = objc_msgSend(v4, "propertyForKey:", @"PLBatteryUISuggestionShowAll", v11.receiver, v11.super_class);
  -[PLBatteryUISuggestionHeaderCell setShowAll:](self, "setShowAll:", [v5 BOOLValue]);

  v6 = [v4 propertyForKey:@"PLBatteryUISuggestionTitle"];
  [(PLBatteryUISuggestionHeaderCell *)self setSuggestionTitle:v6];

  double v7 = [(PLBatteryUISuggestionHeaderCell *)self suggestionTitle];
  double v8 = [(PLBatteryUISuggestionHeaderCell *)self headerTitleLabel];
  [v8 setText:v7];

  v9 = [v4 propertyForKey:@"PLBatteryUISuggestionHeaderCellDelegateWrapperKey"];

  v10 = [v9 buiViewController];
  [(PLBatteryUISuggestionHeaderCell *)self setDelegate:v10];

  [(PLBatteryUISuggestionHeaderCell *)self updateButton];
  [(PLBatteryUISuggestionHeaderCell *)self setNeedsUpdateConstraints];
  [(PLBatteryUISuggestionHeaderCell *)self setNeedsDisplay];
  [(PLBatteryUISuggestionHeaderCell *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PLBatteryUISuggestionHeaderCell;
  [(PLBatteryUISuggestionHeaderCell *)&v3 layoutSubviews];
  [(PLBatteryUISuggestionHeaderCell *)self setSeparatorStyle:0];
}

- (void)updateButton
{
  objc_super v3 = [(PLBatteryUISuggestionHeaderCell *)self headerShowAllButton];
  [v3 setHidden:0];

  LODWORD(v3) = [(PLBatteryUISuggestionHeaderCell *)self showAll];
  id v4 = [(PLBatteryUISuggestionHeaderCell *)self specifier];
  v5 = v4;
  if (v3) {
    CFStringRef v6 = @"PLBatteryUISuggestionShowLessText";
  }
  else {
    CFStringRef v6 = @"PLBatteryUISuggestionShowAllText";
  }
  id v12 = [v4 propertyForKey:v6];

  double v7 = [(PLBatteryUISuggestionHeaderCell *)self headerShowAllButton];
  [v7 setText:v12];

  double v8 = [(PLBatteryUISuggestionHeaderCell *)self specifier];
  v9 = [v8 propertyForKey:@"PLBatteryUISuggestionInsightTotalCountKey"];
  signed int v10 = [v9 intValue];

  objc_super v11 = [(PLBatteryUISuggestionHeaderCell *)self headerShowAllButton];
  [v11 setHidden:v10 < 3];
}

- (void)buttonAction:(id)a3
{
  id v4 = +[BatteryUIResourceClass get_log_handle_bui_graph];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Suggestion Header Button triggered", v7, 2u);
  }

  v5 = [(PLBatteryUISuggestionHeaderCell *)self delegate];

  if (v5)
  {
    CFStringRef v6 = [(PLBatteryUISuggestionHeaderCell *)self delegate];
    [v6 didTapShowAllButton];
  }
}

- (PLBatteryUISuggestionHeaderCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PLBatteryUISuggestionHeaderCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)showAll
{
  return self->_showAll;
}

- (void)setShowAll:(BOOL)a3
{
  self->_showAll = a3;
}

- (NSString)suggestionTitle
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSuggestionTitle:(id)a3
{
}

- (UILabel)headerTitleLabel
{
  return (UILabel *)objc_getProperty(self, a2, 144, 1);
}

- (void)setHeaderTitleLabel:(id)a3
{
}

- (UILabel)headerShowAllButton
{
  return (UILabel *)objc_getProperty(self, a2, 152, 1);
}

- (void)setHeaderShowAllButton:(id)a3
{
}

- (NSLayoutConstraint)widthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 160, 1);
}

- (void)setWidthConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_headerShowAllButton, 0);
  objc_storeStrong((id *)&self->_headerTitleLabel, 0);
  objc_storeStrong((id *)&self->_suggestionTitle, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end