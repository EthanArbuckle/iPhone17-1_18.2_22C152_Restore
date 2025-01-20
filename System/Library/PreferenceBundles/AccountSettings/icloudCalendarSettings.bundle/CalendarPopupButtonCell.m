@interface CalendarPopupButtonCell
+ (int64_t)cellStyle;
- (CalendarPopupButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (UIButton)popupButton;
- (UILabel)rowLabel;
- (UIMenu)popupMenu;
- (void)_configureConstraints;
- (void)_configureViews:(id)a3;
- (void)_setupViews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setPopupButton:(id)a3;
- (void)setPopupMenu:(id)a3;
- (void)setRowLabel:(id)a3;
@end

@implementation CalendarPopupButtonCell

- (CalendarPopupButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CalendarPopupButtonCell;
  v10 = [(CalendarPopupButtonCell *)&v18 initWithStyle:a3 reuseIdentifier:a4];
  v11 = v10;
  if (v10)
  {
    [(CalendarPopupButtonCell *)v10 _setupViews];
    objc_storeStrong((id *)&_callingSpecifier, a5);
    v12 = [v9 target];
    v13 = [(CalendarPopupButtonCell *)v11 popupButton];
    objc_msgSend(v13, "addTarget:action:forControlEvents:", v12, objc_msgSend(v9, "buttonAction"), 64);

    v14 = [(id)_callingSpecifier identifier];
    LODWORD(v13) = [v14 isEqualToString:@"SEND_FROM_SPECIFIER_ID"];

    if (v13)
    {
      v15 = +[NSBundle bundleForClass:objc_opt_class()];
      v16 = [v15 localizedStringForKey:@"CALENDAR_SEND_FROM_LABEL" value:&stru_10750 table:@"calendarSettings"];
      [(CalendarPopupButtonCell *)v11 _configureViews:v16];
    }
    else
    {
      v15 = [v9 identifier];
      [(CalendarPopupButtonCell *)v11 _configureViews:v15];
    }

    [(CalendarPopupButtonCell *)v11 _configureConstraints];
  }

  return v11;
}

- (void)_setupViews
{
  id v3 = objc_alloc_init((Class)UIView);
  v4 = (void *)_containerView;
  _containerView = (uint64_t)v3;

  id v5 = objc_alloc_init((Class)UILabel);
  [(CalendarPopupButtonCell *)self setRowLabel:v5];

  v6 = +[UIScreen mainScreen];
  v7 = [v6 traitCollection];
  v8 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody compatibleWithTraitCollection:v7];
  id v9 = [(CalendarPopupButtonCell *)self rowLabel];
  [v9 setFont:v8];

  v10 = [(id)_callingSpecifier identifier];
  LODWORD(v9) = [v10 isEqualToString:@"SEND_FROM_SPECIFIER_ID"];

  v11 = [(CalendarPopupButtonCell *)self rowLabel];
  v13 = v11;
  if (v9)
  {
    LODWORD(v12) = 1148846080;
    [v11 setContentCompressionResistancePriority:0 forAxis:v12];
  }
  else
  {
    LODWORD(v12) = 1132068864;
    [v11 setContentCompressionResistancePriority:0 forAxis:v12];

    v13 = [(CalendarPopupButtonCell *)self popupButton];
    LODWORD(v14) = 1148846080;
    [v13 setContentHuggingPriority:0 forAxis:v14];
  }

  v15 = [(CalendarPopupButtonCell *)self rowLabel];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  v16 = [(CalendarPopupButtonCell *)self rowLabel];
  v17 = +[UIColor labelColor];
  [v16 setTextColor:v17];

  objc_super v18 = [(CalendarPopupButtonCell *)self rowLabel];
  [v18 setNumberOfLines:1];

  v19 = [(CalendarPopupButtonCell *)self rowLabel];
  [v19 setLineBreakMode:4];

  v20 = [(CalendarPopupButtonCell *)self rowLabel];
  [(id)_containerView bounds];
  [v20 setPreferredMaxLayoutWidth:v21];

  v22 = (void *)_containerView;
  v23 = [(CalendarPopupButtonCell *)self rowLabel];
  [v22 addSubview:v23];

  id v24 = objc_alloc_init((Class)UILayoutGuide);
  v25 = (void *)_layOutGuide;
  _layOutGuide = (uint64_t)v24;

  [(id)_layOutGuide setIdentifier:@"LAYOUT_IDENTIFIER"];
  [(id)_containerView addLayoutGuide:_layOutGuide];
  v26 = +[UIButtonConfiguration plainButtonConfiguration];
  v27 = +[UIColor secondaryLabelColor];
  [v26 setBaseForegroundColor:v27];

  [v26 setTitleLineBreakMode:4];
  v28 = +[UIButton buttonWithConfiguration:v26 primaryAction:0];
  [(CalendarPopupButtonCell *)self setPopupButton:v28];

  v29 = [(CalendarPopupButtonCell *)self popupButton];
  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];

  v30 = [(CalendarPopupButtonCell *)self popupButton];
  [v30 setShowsMenuAsPrimaryAction:1];

  v31 = [(CalendarPopupButtonCell *)self popupButton];
  [v31 setChangesSelectionAsPrimaryAction:1];

  v32 = [(CalendarPopupButtonCell *)self popupButton];
  [v32 setShowsMenuAsPrimaryAction:1];

  v33 = +[UIAction actionWithTitle:@"test" image:0 identifier:0 handler:&stru_10550];
  v34 = +[UIAction actionWithTitle:@"test1" image:0 identifier:0 handler:&stru_10570];
  v42[0] = v33;
  v42[1] = v34;
  v35 = +[NSArray arrayWithObjects:v42 count:2];
  v36 = +[UIMenu menuWithChildren:v35];
  v37 = [(CalendarPopupButtonCell *)self popupButton];
  [v37 setMenu:v36];

  v38 = [(CalendarPopupButtonCell *)self popupButton];
  [v38 sizeToFit];

  [(id)_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
  v39 = [(CalendarPopupButtonCell *)self contentView];
  [v39 addSubview:_containerView];

  v40 = [(CalendarPopupButtonCell *)self contentView];
  v41 = [(CalendarPopupButtonCell *)self popupButton];
  [v40 addSubview:v41];
}

- (void)_configureConstraints
{
  v46 = [(id)_containerView leadingAnchor];
  v45 = [(CalendarPopupButtonCell *)self leadingAnchor];
  v44 = [v46 constraintEqualToAnchor:v45];
  v47[0] = v44;
  v42 = [(id)_containerView trailingAnchor];
  v43 = [(CalendarPopupButtonCell *)self popupButton];
  v41 = [v43 leadingAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v47[1] = v40;
  v39 = [(id)_containerView bottomAnchor];
  v38 = [(CalendarPopupButtonCell *)self bottomAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v47[2] = v37;
  v36 = [(id)_containerView topAnchor];
  v35 = [(CalendarPopupButtonCell *)self topAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v47[3] = v34;
  v33 = [(id)_layOutGuide widthAnchor];
  v32 = [v33 constraintEqualToConstant:10.0];
  v47[4] = v32;
  v31 = [(id)_layOutGuide centerYAnchor];
  v30 = [(id)_containerView centerYAnchor];
  v29 = [v31 constraintEqualToAnchor:v30];
  v47[5] = v29;
  v28 = [(id)_layOutGuide trailingAnchor];
  v27 = [(id)_containerView trailingAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v47[6] = v26;
  v25 = [(CalendarPopupButtonCell *)self rowLabel];
  id v24 = [v25 leadingAnchor];
  v23 = [(id)_containerView leadingAnchor];
  v22 = [v24 constraintEqualToAnchor:v23 constant:16.0];
  v47[7] = v22;
  double v21 = [(CalendarPopupButtonCell *)self rowLabel];
  v20 = [v21 centerYAnchor];
  v19 = [(id)_containerView centerYAnchor];
  objc_super v18 = [v20 constraintEqualToAnchor:v19];
  v47[8] = v18;
  v17 = [(CalendarPopupButtonCell *)self rowLabel];
  v16 = [v17 trailingAnchor];
  v15 = [(id)_layOutGuide leadingAnchor];
  double v14 = [v16 constraintEqualToAnchor:v15];
  v47[9] = v14;
  v13 = [(CalendarPopupButtonCell *)self popupButton];
  id v3 = [v13 centerYAnchor];
  v4 = [(CalendarPopupButtonCell *)self contentView];
  id v5 = [v4 centerYAnchor];
  v6 = [v3 constraintEqualToAnchor:v5];
  v47[10] = v6;
  v7 = [(CalendarPopupButtonCell *)self popupButton];
  v8 = [v7 trailingAnchor];
  id v9 = [(CalendarPopupButtonCell *)self contentView];
  v10 = [v9 trailingAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v47[11] = v11;
  double v12 = +[NSArray arrayWithObjects:v47 count:12];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)_configureViews:(id)a3
{
  id v4 = a3;
  id v5 = [(CalendarPopupButtonCell *)self rowLabel];
  [v5 setText:v4];

  v6 = [(CalendarPopupButtonCell *)self rowLabel];
  [v6 setNumberOfLines:1];

  v7 = [(CalendarPopupButtonCell *)self rowLabel];
  [v7 setLineBreakMode:4];

  v8 = [(id)_callingSpecifier identifier];
  LODWORD(v5) = [v8 isEqualToString:@"SEND_FROM_SPECIFIER_ID"];

  id v9 = [(CalendarPopupButtonCell *)self rowLabel];
  v11 = v9;
  if (v5)
  {
    LODWORD(v10) = 1148846080;
    [v9 setContentCompressionResistancePriority:0 forAxis:v10];
  }
  else
  {
    LODWORD(v10) = 1132068864;
    [v9 setContentCompressionResistancePriority:0 forAxis:v10];

    v11 = [(CalendarPopupButtonCell *)self popupButton];
    LODWORD(v12) = 1148846080;
    [v11 setContentHuggingPriority:0 forAxis:v12];
  }

  id v13 = [(CalendarPopupButtonCell *)self popupButton];
  [v13 sizeToFit];
}

- (void)setPopupMenu:(id)a3
{
  id v4 = a3;
  id v5 = [(CalendarPopupButtonCell *)self popupButton];
  [v5 setMenu:v4];

  id v6 = [(CalendarPopupButtonCell *)self popupButton];
  [v6 sizeToFit];
}

+ (int64_t)cellStyle
{
  return 0;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CalendarPopupButtonCell;
  [(CalendarPopupButtonCell *)&v9 refreshCellContentsWithSpecifier:v4];
  id v5 = [(id)_callingSpecifier identifier];
  unsigned int v6 = [v5 isEqualToString:@"SEND_FROM_SPECIFIER_ID"];

  if (v6)
  {
    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"CALENDAR_SEND_FROM_LABEL" value:&stru_10750 table:@"calendarSettings"];
    [(CalendarPopupButtonCell *)self _configureViews:v8];
  }
  else
  {
    v7 = [v4 identifier];
    [(CalendarPopupButtonCell *)self _configureViews:v7];
  }

  [(CalendarPopupButtonCell *)self layoutIfNeeded];
}

- (UIMenu)popupMenu
{
  return self->_popupMenu;
}

- (UILabel)rowLabel
{
  return self->_rowLabel;
}

- (void)setRowLabel:(id)a3
{
}

- (UIButton)popupButton
{
  return self->_popupButton;
}

- (void)setPopupButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popupButton, 0);
  objc_storeStrong((id *)&self->_rowLabel, 0);

  objc_storeStrong((id *)&self->_popupMenu, 0);
}

@end