@interface BYODEditDomainHeaderView
- (BYODEditDomainHeaderView)initWithSpecifier:(id)a3;
- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4;
- (void)showDoneButton:(id)a3;
- (void)toggleDoneButton:(BOOL)a3;
@end

@implementation BYODEditDomainHeaderView

- (BYODEditDomainHeaderView)initWithSpecifier:(id)a3
{
  id v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)BYODEditDomainHeaderView;
  v5 = [(BYODEditDomainHeaderView *)&v53 init];
  if (v5)
  {
    id v6 = objc_alloc_init((Class)UILabel);
    v7 = (void *)_headerTitleLabel;
    _headerTitleLabel = (uint64_t)v6;

    v8 = [v4 propertyForKey:@"headerTitle"];
    [(id)_headerTitleLabel setText:v8];

    v9 = PreferencesTableViewFooterFont();
    [(id)_headerTitleLabel setFont:v9];

    v10 = +[UIColor clearColor];
    [(id)_headerTitleLabel setBackgroundColor:v10];

    [(id)_headerTitleLabel setTextAlignment:4];
    [(id)_headerTitleLabel setLineBreakMode:0];
    [(id)_headerTitleLabel setNumberOfLines:0];
    v11 = +[UIColor secondaryLabelColor];
    [(id)_headerTitleLabel setTextColor:v11];

    [(id)_headerTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(BYODEditDomainHeaderView *)v5 addSubview:_headerTitleLabel];
    v52 = [v4 target];
    uint64_t v12 = +[UIButton buttonWithType:1];
    v13 = (void *)_editButton;
    _editButton = v12;

    v14 = (void *)_editButton;
    v15 = +[NSBundle bundleForClass:objc_opt_class()];
    v16 = [v15 localizedStringForKey:@"EDIT" value:&stru_B9F70 table:@"AccountPreferences"];
    [v14 setTitle:v16 forState:0];

    objc_msgSend((id)_editButton, "addTarget:action:forControlEvents:", v52, objc_msgSend(v4, "buttonAction"), 64);
    [(id)_editButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(BYODEditDomainHeaderView *)v5 addSubview:_editButton];
    uint64_t v17 = +[UIButton buttonWithType:1];
    v18 = (void *)_doneButton;
    _doneButton = v17;

    v19 = (void *)_doneButton;
    v20 = +[NSBundle bundleForClass:objc_opt_class()];
    v21 = [v20 localizedStringForKey:@"DONE" value:&stru_B9F70 table:@"AccountPreferences"];
    [v19 setTitle:v21 forState:0];

    objc_msgSend((id)_doneButton, "addTarget:action:forControlEvents:", v52, objc_msgSend(v4, "buttonAction"), 64);
    [(id)_doneButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(BYODEditDomainHeaderView *)v5 addSubview:_doneButton];
    v22 = [v4 propertyForKey:@"tableEditing"];
    LODWORD(v19) = [v22 isEqualToString:@"YES"];

    v23 = &_editButton;
    if (!v19) {
      v23 = &_doneButton;
    }
    [(id)*v23 setHidden:1];
    v24 = [(id)_headerTitleLabel topAnchor];
    v25 = [(BYODEditDomainHeaderView *)v5 topAnchor];
    v26 = [v24 constraintEqualToAnchor:v25 constant:10.0];
    [v26 setActive:1];

    v27 = [(id)_headerTitleLabel leadingAnchor];
    v28 = [(BYODEditDomainHeaderView *)v5 leadingAnchor];
    v29 = [v27 constraintEqualToAnchor:v28 constant:10.0];
    [v29 setActive:1];

    v30 = [(id)_headerTitleLabel bottomAnchor];
    v31 = [(BYODEditDomainHeaderView *)v5 bottomAnchor];
    v32 = [v30 constraintEqualToAnchor:v31 constant:-5.0];
    [v32 setActive:1];

    v33 = [(id)_editButton topAnchor];
    v34 = [(BYODEditDomainHeaderView *)v5 topAnchor];
    v35 = [v33 constraintEqualToAnchor:v34 constant:10.0];
    [v35 setActive:1];

    v36 = [(id)_editButton trailingAnchor];
    v37 = [(BYODEditDomainHeaderView *)v5 trailingAnchor];
    v38 = [v36 constraintEqualToAnchor:v37 constant:-10.0];
    [v38 setActive:1];

    v39 = [(id)_editButton bottomAnchor];
    v40 = [(BYODEditDomainHeaderView *)v5 bottomAnchor];
    v41 = [v39 constraintEqualToAnchor:v40 constant:-5.0];
    [v41 setActive:1];

    v42 = [(id)_doneButton topAnchor];
    v43 = [(BYODEditDomainHeaderView *)v5 topAnchor];
    v44 = [v42 constraintEqualToAnchor:v43 constant:10.0];
    [v44 setActive:1];

    v45 = [(id)_doneButton trailingAnchor];
    v46 = [(BYODEditDomainHeaderView *)v5 trailingAnchor];
    v47 = [v45 constraintEqualToAnchor:v46 constant:-10.0];
    [v47 setActive:1];

    v48 = [(id)_doneButton bottomAnchor];
    v49 = [(BYODEditDomainHeaderView *)v5 bottomAnchor];
    v50 = [v48 constraintEqualToAnchor:v49 constant:-5.0];
    [v50 setActive:1];
  }
  return v5;
}

- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4
{
  id v4 = objc_msgSend((id)_headerTitleLabel, "text", a4, a3);
  id v5 = [v4 length];

  if (v5)
  {
    id v6 = [(id)_headerTitleLabel font];
    [v6 ascender];
    double v8 = v7;
    v9 = [(id)_headerTitleLabel font];
    [v9 descender];
    double v11 = v8 - v10 + 12.0;
  }
  else
  {
    double v11 = 0.0;
  }
  uint64_t v12 = [(id)_editButton titleLabel];
  v13 = [v12 text];
  id v14 = [v13 length];

  if (v14)
  {
    v15 = [v12 font];
    [v15 ascender];
    double v17 = v16;
    v18 = [v12 font];
    [v18 descender];
    double v20 = v17 - v19 + 12.0;
  }
  else
  {
    double v20 = 0.0;
  }

  return round(fmax(v11, v20));
}

- (void)showDoneButton:(id)a3
{
  id v5 = a3;
  [(id)_editButton setHidden:1];
  [(id)_doneButton setHidden:0];
  v3 = (void *)_doneButton;
  id v4 = [v5 target];
  objc_msgSend(v3, "addTarget:action:forEvents:", v4, objc_msgSend(v5, "buttonAction"), 64);
}

- (void)toggleDoneButton:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend((id)_editButton, "setHidden:");
  id v4 = (void *)_doneButton;

  [v4 setHidden:!v3];
}

@end