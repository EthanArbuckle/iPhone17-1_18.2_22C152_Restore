@interface MapsSettingsMenuTableCell
+ (int64_t)cellStyle;
- (MapsSettingsMenuTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)_setupViews;
- (void)_updateConstraints;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation MapsSettingsMenuTableCell

+ (int64_t)cellStyle
{
  return 0;
}

- (MapsSettingsMenuTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)MapsSettingsMenuTableCell;
  v5 = [(MapsSettingsMenuTableCell *)&v11 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    [(MapsSettingsMenuTableCell *)v5 setShouldHideTitle:1];
    [(MapsSettingsMenuTableCell *)v6 _setupViews];
    v7 = self;
    v12 = v7;
    v8 = +[NSArray arrayWithObjects:&v12 count:1];
    id v9 = [(MapsSettingsMenuTableCell *)v6 registerForTraitChanges:v8 withAction:"_updateConstraints"];
  }
  return v6;
}

- (void)willMoveToWindow:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MapsSettingsMenuTableCell;
  [(MapsSettingsMenuTableCell *)&v4 willMoveToWindow:a3];
  [(MapsSettingsMenuTableCell *)self _updateConstraints];
}

- (void)_setupViews
{
  v3 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  label = self->_label;
  self->_label = v3;

  [(UILabel *)self->_label setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_label setNumberOfLines:0];
  v5 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [(UILabel *)self->_label setFont:v5];

  [(UILabel *)self->_label setAdjustsFontForContentSizeCategory:1];
  v6 = [(MapsSettingsMenuTableCell *)self contentView];
  [v6 addSubview:self->_label];

  id v12 = +[UIButtonConfiguration plainButtonConfiguration];
  v7 = +[UIColor secondaryLabelColor];
  [v12 setBaseForegroundColor:v7];

  v8 = +[UIButton buttonWithConfiguration:v12 primaryAction:0];
  menuButton = self->_menuButton;
  self->_menuButton = v8;

  [(UIButton *)self->_menuButton setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v10) = 1148846080;
  [(UIButton *)self->_menuButton setContentHuggingPriority:0 forAxis:v10];
  [(UIButton *)self->_menuButton setShowsMenuAsPrimaryAction:1];
  [(UIButton *)self->_menuButton setChangesSelectionAsPrimaryAction:1];
  objc_super v11 = [(MapsSettingsMenuTableCell *)self contentView];
  [v11 addSubview:self->_menuButton];
}

- (void)_updateConstraints
{
  if (self->_constraints) {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
  }
  v3 = [(MapsSettingsMenuTableCell *)self traitCollection];
  objc_super v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  v6 = [(UILabel *)self->_label leadingAnchor];
  v7 = [(MapsSettingsMenuTableCell *)self contentView];
  v8 = [v7 layoutMarginsGuide];
  [v8 leadingAnchor];
  v49 = v53 = v6;
  uint64_t v9 = objc_msgSend(v6, "constraintEqualToAnchor:");
  v67 = (void *)v9;
  if (IsAccessibilityCategory)
  {
    v69[0] = v9;
    double v10 = [(UILabel *)self->_label trailingAnchor];
    v66 = [(MapsSettingsMenuTableCell *)self contentView];
    v65 = [v66 layoutMarginsGuide];
    v64 = [v65 trailingAnchor];
    v63 = objc_msgSend(v10, "constraintEqualToAnchor:");
    v69[1] = v63;
    objc_super v11 = [(UILabel *)self->_label topAnchor];
    v61 = [(MapsSettingsMenuTableCell *)self contentView];
    v60 = [v61 layoutMarginsGuide];
    [v60 topAnchor];
    v59 = v62 = v11;
    v58 = objc_msgSend(v11, "constraintEqualToAnchor:");
    v69[2] = v58;
    uint64_t v12 = [(UIButton *)self->_menuButton leadingAnchor];
    v56 = [(MapsSettingsMenuTableCell *)self contentView];
    v55 = [v56 layoutMarginsGuide];
    uint64_t v13 = [v55 leadingAnchor];
    v57 = (void *)v12;
    v14 = (void *)v12;
    v15 = (void *)v13;
    v54 = [v14 constraintEqualToAnchor:v13];
    v69[3] = v54;
    v16 = [(UIButton *)self->_menuButton trailingAnchor];
    v51 = [(MapsSettingsMenuTableCell *)self contentView];
    v50 = [v51 layoutMarginsGuide];
    [v50 trailingAnchor];
    v42 = v52 = v16;
    v48 = [v16 constraintLessThanOrEqualToAnchor:v42];
    v69[4] = v48;
    v17 = [(UIButton *)self->_menuButton topAnchor];
    v18 = [(UILabel *)self->_label bottomAnchor];
    v47 = [v17 constraintEqualToAnchor:v18];
    v69[5] = v47;
    v19 = [(UIButton *)self->_menuButton bottomAnchor];
    v46 = [(MapsSettingsMenuTableCell *)self contentView];
    v45 = [v46 layoutMarginsGuide];
    v44 = [v45 bottomAnchor];
    v43 = objc_msgSend(v19, "constraintEqualToAnchor:");
    v69[6] = v43;
    v20 = +[NSArray arrayWithObjects:v69 count:7];
    constraints = self->_constraints;
    self->_constraints = v20;
  }
  else
  {
    v68[0] = v9;
    v40 = [(UILabel *)self->_label topAnchor];
    v66 = [(MapsSettingsMenuTableCell *)self contentView];
    v65 = [v66 layoutMarginsGuide];
    v64 = [v65 topAnchor];
    v63 = objc_msgSend(v40, "constraintGreaterThanOrEqualToAnchor:");
    v68[1] = v63;
    v22 = [(UILabel *)self->_label bottomAnchor];
    v61 = [(MapsSettingsMenuTableCell *)self contentView];
    v60 = [v61 layoutMarginsGuide];
    [v60 bottomAnchor];
    v59 = v62 = v22;
    v58 = objc_msgSend(v22, "constraintLessThanOrEqualToAnchor:");
    v68[2] = v58;
    v23 = [(UILabel *)self->_label centerYAnchor];
    v56 = [(MapsSettingsMenuTableCell *)self contentView];
    v55 = [v56 layoutMarginsGuide];
    uint64_t v39 = [v55 centerYAnchor];
    v57 = v23;
    v54 = [v23 constraintEqualToAnchor:v39];
    v68[3] = v54;
    v24 = [(UIButton *)self->_menuButton leadingAnchor];
    v51 = [(UILabel *)self->_label trailingAnchor];
    v52 = v24;
    v50 = [v24 constraintGreaterThanOrEqualToAnchor:v51 constant:8.0];
    v68[4] = v50;
    v42 = [(UIButton *)self->_menuButton trailingAnchor];
    v48 = [(MapsSettingsMenuTableCell *)self contentView];
    v38 = [v48 layoutMarginsGuide];
    uint64_t v37 = [v38 trailingAnchor];
    v47 = [v42 constraintEqualToAnchor:v37];
    v68[5] = v47;
    v19 = [(UIButton *)self->_menuButton topAnchor];
    v46 = [(MapsSettingsMenuTableCell *)self contentView];
    v45 = [v46 layoutMarginsGuide];
    v44 = [v45 topAnchor];
    v43 = objc_msgSend(v19, "constraintGreaterThanOrEqualToAnchor:");
    v68[6] = v43;
    constraints = [(UIButton *)self->_menuButton bottomAnchor];
    v36 = [(MapsSettingsMenuTableCell *)self contentView];
    v35 = [v36 layoutMarginsGuide];
    v34 = [v35 bottomAnchor];
    v33 = [constraints constraintLessThanOrEqualToAnchor:v34];
    v68[7] = v33;
    v25 = [(UIButton *)self->_menuButton centerYAnchor];
    [(MapsSettingsMenuTableCell *)self contentView];
    v26 = v41 = v8;
    v27 = [v26 layoutMarginsGuide];
    [v27 centerYAnchor];
    v29 = v28 = v7;
    v30 = [v25 constraintEqualToAnchor:v29];
    v68[8] = v30;
    v31 = +[NSArray arrayWithObjects:v68 count:9];
    v32 = self->_constraints;
    self->_constraints = v31;

    v18 = (void *)v37;
    v7 = v28;
    v17 = v38;

    v15 = (void *)v39;
    v8 = v41;

    double v10 = v40;
  }

  +[NSLayoutConstraint activateConstraints:self->_constraints];
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MapsSettingsMenuTableCell;
  [(MapsSettingsMenuTableCell *)&v9 refreshCellContentsWithSpecifier:v4];
  v5 = [v4 name];
  [(UILabel *)self->_label setText:v5];

  v6 = [v4 userInfo];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v8 = [v4 userInfo];
  }
  else
  {
    v8 = 0;
  }
  [(UIButton *)self->_menuButton setMenu:v8];
  [(MapsSettingsMenuTableCell *)self _setPopupMenuButton:self->_menuButton];
  [(MapsSettingsMenuTableCell *)self setSelectionStyle:3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_menuButton, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end