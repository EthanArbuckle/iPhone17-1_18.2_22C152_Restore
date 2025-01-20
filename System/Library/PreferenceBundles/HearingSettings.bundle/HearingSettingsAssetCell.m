@interface HearingSettingsAssetCell
- (BOOL)isAccessibilityElement;
- (HearingSettingsAssetCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (NSMutableArray)constraints;
- (UIActivityIndicatorView)spinner;
- (UILabel)downloadSize;
- (UILabel)soundLabel;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)configureConstraints;
- (void)layoutSubviews;
- (void)setConstraints:(id)a3;
- (void)setDownloadSize:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setSoundLabel:(id)a3;
- (void)setSpinner:(id)a3;
- (void)updateInfoLabelText;
@end

@implementation HearingSettingsAssetCell

- (HearingSettingsAssetCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v44.receiver = self;
  v44.super_class = (Class)HearingSettingsAssetCell;
  v10 = [(HearingSettingsAssetCell *)&v44 initWithStyle:a3 reuseIdentifier:v8 specifier:v9];
  v11 = v10;
  if (v10)
  {
    v12 = [(HearingSettingsAssetCell *)v10 titleLabel];
    [v12 setHidden:1];

    id v13 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v17 = (UILabel *)objc_msgSend(v13, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    soundLabel = v11->_soundLabel;
    v11->_soundLabel = v17;

    [(UILabel *)v11->_soundLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v19 = v11->_soundLabel;
    v20 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [(UILabel *)v19 setFont:v20];

    v21 = v11->_soundLabel;
    v22 = +[UIColor clearColor];
    [(UILabel *)v21 setBackgroundColor:v22];

    v23 = v11->_soundLabel;
    v24 = [v9 name];
    [(UILabel *)v23 setText:v24];

    [(UILabel *)v11->_soundLabel setNumberOfLines:0];
    v25 = [(HearingSettingsAssetCell *)v11 contentView];
    [v25 addSubview:v11->_soundLabel];

    v26 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    downloadSize = v11->_downloadSize;
    v11->_downloadSize = v26;

    [(UILabel *)v11->_downloadSize setTranslatesAutoresizingMaskIntoConstraints:0];
    v28 = v11->_downloadSize;
    v29 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
    [(UILabel *)v28 setFont:v29];

    v30 = v11->_downloadSize;
    v31 = +[UIColor clearColor];
    [(UILabel *)v30 setBackgroundColor:v31];

    [(UILabel *)v11->_downloadSize setHidden:1];
    v32 = [(HearingSettingsAssetCell *)v11 contentView];
    [v32 addSubview:v11->_downloadSize];

    v33 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    spinner = v11->_spinner;
    v11->_spinner = v33;

    [(UIActivityIndicatorView *)v11->_spinner setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIActivityIndicatorView *)v11->_spinner setHidden:1];
    v35 = [(HearingSettingsAssetCell *)v11 contentView];
    [v35 addSubview:v11->_spinner];

    [(HearingSettingsAssetCell *)v11 configureConstraints];
    objc_initWeak(&location, v11);
    v36 = [v9 userInfo];
    v37 = +[AXHAServer sharedInstance];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1E038;
    v40[3] = &unk_3CE10;
    id v38 = v36;
    id v41 = v38;
    objc_copyWeak(&v42, &location);
    [v37 registerListener:v11 forComfortSoundsModelUpdatesHandler:v40];

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (void)configureConstraints
{
  v3 = [(HearingSettingsAssetCell *)self constraints];
  +[NSLayoutConstraint deactivateConstraints:v3];

  id v23 = +[NSMutableArray array];
  soundLabel = self->_soundLabel;
  v5 = [(HearingSettingsAssetCell *)self contentView];
  v6 = +[NSLayoutConstraint constraintWithItem:soundLabel attribute:5 relatedBy:0 toItem:v5 attribute:5 multiplier:1.0 constant:15.0];
  [v23 addObject:v6];

  v7 = [(UILabel *)self->_downloadSize text];
  id v8 = [v7 length];

  id v9 = self->_soundLabel;
  v10 = [(HearingSettingsAssetCell *)self contentView];
  if (v8)
  {
    v11 = +[NSLayoutConstraint constraintWithItem:v9 attribute:3 relatedBy:0 toItem:v10 attribute:3 multiplier:1.0 constant:7.5];
    [v23 addObject:v11];

    v12 = +[NSLayoutConstraint constraintWithItem:self->_downloadSize attribute:5 relatedBy:0 toItem:self->_soundLabel attribute:5 multiplier:1.0 constant:0.0];
    [v23 addObject:v12];

    id v13 = +[NSLayoutConstraint constraintWithItem:self->_downloadSize attribute:3 relatedBy:0 toItem:self->_soundLabel attribute:4 multiplier:1.0 constant:0.0];
    [v23 addObject:v13];
  }
  else
  {
    v14 = +[NSLayoutConstraint constraintWithItem:v9 attribute:10 relatedBy:0 toItem:v10 attribute:10 multiplier:1.0 constant:0.0];
    [v23 addObject:v14];

    v15 = self->_soundLabel;
    id v13 = [(HearingSettingsAssetCell *)self contentView];
    v16 = +[NSLayoutConstraint constraintWithItem:v15 attribute:6 relatedBy:0 toItem:v13 attribute:6 multiplier:1.0 constant:0.0];
    [v23 addObject:v16];
  }
  spinner = self->_spinner;
  v18 = [(HearingSettingsAssetCell *)self downloadSize];
  v19 = +[NSLayoutConstraint constraintWithItem:spinner attribute:10 relatedBy:0 toItem:v18 attribute:10 multiplier:1.0 constant:0.0];
  [v23 addObject:v19];

  v20 = self->_spinner;
  v21 = [(HearingSettingsAssetCell *)self downloadSize];
  v22 = +[NSLayoutConstraint constraintWithItem:v20 attribute:5 relatedBy:0 toItem:v21 attribute:6 multiplier:1.0 constant:10.0];
  [v23 addObject:v22];

  +[NSLayoutConstraint activateConstraints:v23];
  [(HearingSettingsAssetCell *)self setConstraints:v23];
}

- (void)updateInfoLabelText
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__specifier]);
  v4 = [WeakRetained userInfo];

  if ([(HearingSettingsAssetCell *)self isEditing]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = [v4 asset];
    v6 = v5;
    if (v5 && [v5 isInstalled])
    {
      [(UILabel *)self->_downloadSize setAdjustsFontSizeToFitWidth:1];
      v7 = hearingLocString();
      id v8 = [v6 downloadSize];
      [v8 floatValue];
      float v10 = v9;
      uint64_t v16 = 0;
      v17 = &v16;
      uint64_t v18 = 0x2020000000;
      v11 = (void (*)(float))off_469E0;
      v19 = off_469E0;
      if (!off_469E0)
      {
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_1F900;
        v15[3] = &unk_3C998;
        v15[4] = &v16;
        sub_1F900((uint64_t)v15);
        v11 = (void (*)(float))v17[3];
      }
      _Block_object_dispose(&v16, 8);
      if (!v11) {
        sub_283D4();
      }
      v12 = v11(v10);
      id v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v12);
      [(UILabel *)self->_downloadSize setText:v13];

      [(UILabel *)self->_downloadSize setHidden:0];
      [(UILabel *)self->_downloadSize sizeToFit];
    }
  }
  else
  {
    [(UILabel *)self->_downloadSize setHidden:1];
  }
  v14 = [(HearingSettingsAssetCell *)self titleLabel];
  [v14 sizeToFit];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)HearingSettingsAssetCell;
  [(HearingSettingsAssetCell *)&v5 setEditing:a3 animated:a4];
  [(HearingSettingsAssetCell *)self configureConstraints];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HearingSettingsAssetCell;
  [(HearingSettingsAssetCell *)&v3 layoutSubviews];
  [(HearingSettingsAssetCell *)self updateInfoLabelText];
}

- (unint64_t)accessibilityTraits
{
  v11.receiver = self;
  v11.super_class = (Class)HearingSettingsAssetCell;
  unint64_t v3 = [(HearingSettingsAssetCell *)&v11 accessibilityTraits];
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__specifier]);
  objc_super v5 = [WeakRetained userInfo];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = +[HUComfortSoundsSettings sharedInstance];
    v7 = [v6 selectedComfortSound];

    -[HearingSettingsAssetCell setChecked:](self, "setChecked:", [v7 isEqual:v5]);
    unsigned int v8 = [v7 isEqual:v5];
    UIAccessibilityTraits v9 = UIAccessibilityTraitSelected;
    if (!v8) {
      UIAccessibilityTraits v9 = 0;
    }
    v3 |= v9;
  }
  return v3;
}

- (id)accessibilityValue
{
  v8.receiver = self;
  v8.super_class = (Class)HearingSettingsAssetCell;
  unint64_t v3 = [(HearingSettingsAssetCell *)&v8 accessibilityValue];
  v4 = [(HearingSettingsAssetCell *)self valueLabel];
  v7 = [v4 accessibilityValue];
  objc_super v5 = __AXStringForVariables();

  return v5;
}

- (id)accessibilityLabel
{
  unint64_t v3 = [(HearingSettingsAssetCell *)self titleLabel];
  v4 = [v3 accessibilityLabel];
  v7 = [(UILabel *)self->_downloadSize accessibilityLabel];
  objc_super v5 = __AXStringForVariables();

  return v5;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (UILabel)soundLabel
{
  return self->_soundLabel;
}

- (void)setSoundLabel:(id)a3
{
}

- (UILabel)downloadSize
{
  return self->_downloadSize;
}

- (void)setDownloadSize:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_downloadSize, 0);

  objc_storeStrong((id *)&self->_soundLabel, 0);
}

@end