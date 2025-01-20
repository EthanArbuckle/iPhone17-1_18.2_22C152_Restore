@interface CARSettingsTableViewCell
- (BOOL)isSwitchCell;
- (BOOL)showImageView;
- (CARSettingsCellSpecifier)specifier;
- (CARSettingsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_adjustDetailTextLabel;
- (void)_switchValueChanged:(id)a3;
- (void)_updateFromValue:(id)a3;
- (void)prepareForReuse;
- (void)setShowImageView:(BOOL)a3;
- (void)setSpecifier:(id)a3;
- (void)specifier:(id)a3 didUpdateAccessoryType:(int64_t)a4;
- (void)specifier:(id)a3 didUpdateAttributedTitle:(id)a4;
- (void)specifier:(id)a3 didUpdateDetail:(id)a4;
- (void)specifier:(id)a3 didUpdateEnabled:(BOOL)a4;
- (void)specifier:(id)a3 didUpdateImage:(id)a4;
- (void)specifier:(id)a3 didUpdateSelectionStyle:(int64_t)a4;
- (void)specifier:(id)a3 didUpdateSubtitle:(id)a4;
- (void)specifier:(id)a3 didUpdateTitle:(id)a4;
- (void)specifier:(id)a3 didUpdateTitleColor:(id)a4;
- (void)specifier:(id)a3 didUpdateValue:(id)a4;
- (void)updateConfigurationUsingState:(id)a3;
@end

@implementation CARSettingsTableViewCell

- (CARSettingsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CARSettingsTableViewCell;
  return [(CARSettingsTableViewCell *)&v5 initWithStyle:1 reuseIdentifier:a4];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)CARSettingsTableViewCell;
  [(CARSettingsTableViewCell *)&v3 prepareForReuse];
  [(CARSettingsTableViewCell *)self setSpecifier:0];
}

- (void)setSpecifier:(id)a3
{
  id v20 = a3;
  [(CARSettingsCellSpecifier *)self->_specifier removeObserver:self];
  objc_storeStrong((id *)&self->_specifier, a3);
  if ([(CARSettingsTableViewCell *)self showImageView])
  {
    objc_super v5 = [v20 image];
    v6 = [(CARSettingsTableViewCell *)self imageView];
    [v6 setImage:v5];
  }
  v7 = [v20 title];
  v8 = [(CARSettingsTableViewCell *)self textLabel];
  [v8 setText:v7];

  v9 = [v20 titleColor];
  v10 = [(CARSettingsTableViewCell *)self textLabel];
  [v10 setTextColor:v9];

  -[CARSettingsTableViewCell setSelectionStyle:](self, "setSelectionStyle:", [v20 selectionStyle]);
  -[CARSettingsTableViewCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", [v20 isEnabled]);
  id v11 = [v20 isEnabled];
  v12 = [(CARSettingsTableViewCell *)self textLabel];
  [v12 setEnabled:v11];

  id v13 = [v20 isEnabled];
  v14 = [(CARSettingsTableViewCell *)self detailTextLabel];
  [v14 setEnabled:v13];

  v15 = [(CARSettingsTableViewCell *)self detailTextLabel];
  [v15 setAdjustsFontSizeToFitWidth:0];

  v16 = [(CARSettingsTableViewCell *)self detailTextLabel];
  [v16 setNumberOfLines:1];

  v17 = [(CARSettingsTableViewCell *)self detailTextLabel];
  [v17 setLineBreakMode:0];

  v18 = [(CARSettingsTableViewCell *)self detailTextLabel];
  [v18 setMinimumFontSize:0.0];

  [(CARSettingsTableViewCell *)self _adjustDetailTextLabel];
  v19 = [v20 cellValue];
  [(CARSettingsTableViewCell *)self _updateFromValue:v19];

  [(CARSettingsCellSpecifier *)self->_specifier addObserver:self];
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CARSettingsTableViewCell;
  [(CARSettingsTableViewCell *)&v13 updateConfigurationUsingState:v4];
  if (([v4 isFocused] & 1) != 0
    || ([v4 isHighlighted] & 1) != 0
    || [v4 isSelected])
  {
    objc_super v5 = +[UIColor _carSystemFocusPrimaryColor];
    v6 = [(CARSettingsTableViewCell *)self textLabel];
    [v6 setTextColor:v5];

    uint64_t v7 = +[UIColor _carSystemFocusSecondaryColor];
  }
  else
  {
    v10 = [(CARSettingsTableViewCell *)self specifier];
    id v11 = [v10 titleColor];
    v12 = [(CARSettingsTableViewCell *)self textLabel];
    [v12 setTextColor:v11];

    uint64_t v7 = +[UIColor _carSystemSecondaryColor];
  }
  v8 = (void *)v7;
  v9 = [(CARSettingsTableViewCell *)self detailTextLabel];
  [v9 setTextColor:v8];
}

- (BOOL)isSwitchCell
{
  v2 = [(CARSettingsTableViewCell *)self accessoryView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)specifier:(id)a3 didUpdateTitle:(id)a4
{
}

- (void)specifier:(id)a3 didUpdateSubtitle:(id)a4
{
}

- (void)specifier:(id)a3 didUpdateAttributedTitle:(id)a4
{
}

- (void)specifier:(id)a3 didUpdateAccessoryType:(int64_t)a4
{
}

- (void)specifier:(id)a3 didUpdateDetail:(id)a4
{
}

- (void)specifier:(id)a3 didUpdateSelectionStyle:(int64_t)a4
{
  [(CARSettingsTableViewCell *)self setSelectionStyle:a4];

  [(CARSettingsTableViewCell *)self _updateFromValue:0];
}

- (void)specifier:(id)a3 didUpdateEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  [(CARSettingsTableViewCell *)self setUserInteractionEnabled:a4];
  v6 = [(CARSettingsTableViewCell *)self textLabel];
  [v6 setEnabled:v4];

  id v7 = [(CARSettingsTableViewCell *)self detailTextLabel];
  [v7 setEnabled:v4];
}

- (void)specifier:(id)a3 didUpdateValue:(id)a4
{
}

- (void)specifier:(id)a3 didUpdateTitleColor:(id)a4
{
  id v5 = a4;
  id v6 = [(CARSettingsTableViewCell *)self textLabel];
  [v6 setTextColor:v5];
}

- (void)specifier:(id)a3 didUpdateImage:(id)a4
{
  id v7 = a3;
  if ([(CARSettingsTableViewCell *)self showImageView])
  {
    id v5 = [v7 image];
    id v6 = [(CARSettingsTableViewCell *)self imageView];
    [v6 setImage:v5];
  }
}

- (void)_updateFromValue:(id)a3
{
  id v52 = a3;
  BOOL v4 = [(CARSettingsTableViewCell *)self traitCollection];
  id v5 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCallout compatibleWithTraitCollection:v4];
  id v6 = [v5 fontDescriptor];

  UIFontDescriptorTraitKey v62 = UIFontWeightTrait;
  id v7 = +[NSNumber numberWithDouble:UIFontWeightRegular];
  v63 = v7;
  v8 = +[NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];

  UIFontDescriptorAttributeName v60 = UIFontDescriptorTraitsAttribute;
  v61 = v8;
  v9 = +[NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
  v10 = [v6 fontDescriptorByAddingAttributes:v9];

  id v11 = [(CARSettingsTableViewCell *)self specifier];
  v12 = [v11 attributedTitle];

  if (v12)
  {
    [(CARSettingsTableViewCell *)self setContentConfiguration:0];
    objc_super v13 = [(CARSettingsTableViewCell *)self specifier];
    v14 = [v13 attributedTitle];
    v15 = [(CARSettingsTableViewCell *)self textLabel];
    [v15 setAttributedText:v14];
  }
  else
  {
    v16 = [(CARSettingsTableViewCell *)self specifier];
    v17 = [v16 subtitle];

    if (v17)
    {
      objc_super v13 = +[UIListContentConfiguration subtitleCellConfiguration];
      v18 = [(CARSettingsTableViewCell *)self specifier];
      v19 = [v18 title];
      [v13 setText:v19];

      id v20 = [v13 textProperties];
      v21 = [(CARSettingsTableViewCell *)self specifier];
      v22 = [v21 titleColor];
      [v20 setColor:v22];

      v23 = [v13 textProperties];
      v24 = +[UIFont fontWithDescriptor:v10 size:0.0];
      [v23 setFont:v24];

      v25 = [(CARSettingsTableViewCell *)self specifier];
      v26 = [v25 subtitle];
      [v13 setSecondaryText:v26];

      v27 = [v13 secondaryTextProperties];
      v28 = +[UIColor secondaryLabelColor];
      [v27 setColor:v28];

      v29 = [(CARSettingsTableViewCell *)self traitCollection];
      v30 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote compatibleWithTraitCollection:v29];
      v31 = [v30 fontDescriptor];

      UIFontDescriptorTraitKey v58 = UIFontWeightTrait;
      v32 = +[NSNumber numberWithDouble:UIFontWeightRegular];
      v59 = v32;
      v33 = +[NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];

      UIFontDescriptorAttributeName v56 = UIFontDescriptorTraitsAttribute;
      v57 = v33;
      v34 = +[NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
      v14 = [v31 fontDescriptorByAddingAttributes:v34];

      v35 = [v13 secondaryTextProperties];
      v36 = +[UIFont fontWithDescriptor:v14 size:0.0];
      [v35 setFont:v36];

      [(CARSettingsTableViewCell *)self setContentConfiguration:v13];
    }
    else
    {
      [(CARSettingsTableViewCell *)self setContentConfiguration:0];
      v37 = [(CARSettingsTableViewCell *)self specifier];
      v38 = [v37 title];
      v39 = [(CARSettingsTableViewCell *)self textLabel];
      [v39 setText:v38];

      objc_super v13 = +[UIFont fontWithDescriptor:v10 size:0.0];
      v14 = [(CARSettingsTableViewCell *)self textLabel];
      [v14 setFont:v13];
    }
  }

  v40 = [(CARSettingsTableViewCell *)self specifier];
  v41 = [v40 detail];
  v42 = [(CARSettingsTableViewCell *)self detailTextLabel];
  [v42 setText:v41];

  v43 = +[UIFont fontWithDescriptor:v10 size:0.0];
  v44 = [(CARSettingsTableViewCell *)self detailTextLabel];
  [v44 setFont:v43];

  v45 = [(CARSettingsTableViewCell *)self specifier];
  BOOL v46 = [v45 accessoryType] == (id)104;

  if (v46)
  {
    v47 = [(CARSettingsTableViewCell *)self accessoryView];
    if (v47
      && ([(CARSettingsTableViewCell *)self accessoryView],
          v48 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v48,
          v47,
          (isKindOfClass & 1) != 0))
    {
      id v50 = [(CARSettingsTableViewCell *)self accessoryView];
    }
    else
    {
      [(CARSettingsTableViewCell *)self setAccessoryType:0];
      id v50 = [objc_alloc((Class)CPUISwitch) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
      objc_initWeak(&location, v50);
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_10001D9B4;
      v53[3] = &unk_100092578;
      objc_copyWeak(&v54, &location);
      [v50 setHandler:v53];
      [v50 addTarget:self action:"_switchValueChanged:" forControlEvents:4096];
      [(CARSettingsTableViewCell *)self setAccessoryView:v50];
      objc_destroyWeak(&v54);
      objc_destroyWeak(&location);
    }
    [v50 setOn:[v52 BOOLValue] animated:0];
  }
  else
  {
    [(CARSettingsTableViewCell *)self setAccessoryView:0];
    v51 = [(CARSettingsTableViewCell *)self specifier];
    -[CARSettingsTableViewCell setAccessoryType:](self, "setAccessoryType:", [v51 accessoryType]);

    [(CARSettingsTableViewCell *)self _adjustDetailTextLabel];
  }
}

- (void)_adjustDetailTextLabel
{
  objc_super v3 = [(CARSettingsTableViewCell *)self specifier];
  BOOL v4 = [v3 detail];
  id v5 = [v4 length];

  if (v5)
  {
    id v6 = [(CARSettingsTableViewCell *)self specifier];
    id v7 = [v6 detailSizeToFit];
    v8 = [(CARSettingsTableViewCell *)self detailTextLabel];
    [v8 setAdjustsFontSizeToFitWidth:v7];

    v9 = [(CARSettingsTableViewCell *)self specifier];
    id v10 = [v9 detailNumberOfLines];
    id v11 = [(CARSettingsTableViewCell *)self detailTextLabel];
    [v11 setNumberOfLines:v10];

    v12 = [(CARSettingsTableViewCell *)self specifier];
    id v13 = [v12 detailLineBreakMode];
    v14 = [(CARSettingsTableViewCell *)self detailTextLabel];
    [v14 setLineBreakMode:v13];

    id v15 = [(CARSettingsTableViewCell *)self detailTextLabel];
    [v15 setMinimumFontSize:10.0];
  }
}

- (void)_switchValueChanged:(id)a3
{
  BOOL v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a3 isOn]);
  [(CARSettingsCellSpecifier *)self->_specifier setCellValue:v4];

  id v5 = [(CARSettingsCellSpecifier *)self->_specifier actionBlock];

  if (v5)
  {
    id v7 = [(CARSettingsCellSpecifier *)self->_specifier actionBlock];
    id v6 = [(CARSettingsCellSpecifier *)self->_specifier cellValue];
    v7[2](v7, v6);
  }
}

- (CARSettingsCellSpecifier)specifier
{
  return self->_specifier;
}

- (BOOL)showImageView
{
  return self->_showImageView;
}

- (void)setShowImageView:(BOOL)a3
{
  self->_showImageView = a3;
}

- (void).cxx_destruct
{
}

@end