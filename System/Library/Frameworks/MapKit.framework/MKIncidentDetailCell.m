@interface MKIncidentDetailCell
+ (id)lastUpdateDisplayString:(id)a3;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (MKIncidentDetailCell)initWithReuseIdentifier:(id)a3;
- (NSDate)lastUpdated;
- (NSString)incidentDescription;
- (NSString)title;
- (UIImage)icon;
- (void)_contentSizeCategoryDidChange;
- (void)_setConstraints;
- (void)_updateConstraintValues;
- (void)_updateLastUpdatedLabel;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)infoCardThemeChanged;
- (void)setIcon:(id)a3;
- (void)setIncidentDescription:(id)a3;
- (void)setLastUpdated:(id)a3;
- (void)setTitle:(id)a3;
- (void)updateConstraints;
@end

@implementation MKIncidentDetailCell

- (MKIncidentDetailCell)initWithReuseIdentifier:(id)a3
{
  v37[1] = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)MKIncidentDetailCell;
  v3 = [(MKIncidentDetailCell *)&v35 initWithStyle:0 reuseIdentifier:a3];
  v4 = v3;
  if (v3)
  {
    [(MKIncidentDetailCell *)v3 setAccessibilityIdentifier:@"MKIncidentDetailCell"];
    v5 = objc_alloc_init(_MKUILabel);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v5;

    [(_MKUILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_MKUILabel *)v4->_titleLabel setNumberOfLines:0];
    [(_MKUILabel *)v4->_titleLabel set_mapkit_themeColorProvider:&__block_literal_global_80];
    [(_MKUILabel *)v4->_titleLabel setAccessibilityIdentifier:@"TitleLabel"];
    v7 = [(MKIncidentDetailCell *)v4 contentView];
    [v7 addSubview:v4->_titleLabel];

    v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
    iconImageView = v4->_iconImageView;
    v4->_iconImageView = v8;

    [(UIImageView *)v4->_iconImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v4->_iconImageView setAccessibilityIdentifier:@"IconImageView"];
    v10 = [(MKIncidentDetailCell *)v4 contentView];
    [v10 addSubview:v4->_iconImageView];

    v11 = [MEMORY[0x1E4F428B8] clearColor];
    v12 = [(MKIncidentDetailCell *)v4 contentView];
    [v12 setBackgroundColor:v11];

    v13 = [(MKIncidentDetailCell *)v4 contentView];
    [v13 setOpaque:0];

    v14 = [MEMORY[0x1E4F428B8] clearColor];
    [(MKIncidentDetailCell *)v4 setBackgroundColor:v14];

    [(MKIncidentDetailCell *)v4 setOpaque:0];
    [(MKIncidentDetailCell *)v4 setSelectionStyle:0];
    v15 = (UITextView *)objc_alloc_init(MEMORY[0x1E4F42F58]);
    descriptionLabel = v4->_descriptionLabel;
    v4->_descriptionLabel = v15;

    -[UITextView setTextContainerInset:](v4->_descriptionLabel, "setTextContainerInset:", *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));
    v17 = [(UITextView *)v4->_descriptionLabel textContainer];
    [v17 setLineFragmentPadding:0.0];

    [(UITextView *)v4->_descriptionLabel setDelegate:v4];
    [(UITextView *)v4->_descriptionLabel setEditable:0];
    [(UITextView *)v4->_descriptionLabel setDataDetectorTypes:3];
    [(UITextView *)v4->_descriptionLabel setScrollEnabled:0];
    [(UITextView *)v4->_descriptionLabel setTextAlignment:4];
    v18 = [(UIView *)v4 mk_theme];
    v19 = [v18 textColor];
    [(UITextView *)v4->_descriptionLabel setTextColor:v19];

    v20 = [MEMORY[0x1E4F428B8] clearColor];
    [(UITextView *)v4->_descriptionLabel setBackgroundColor:v20];

    uint64_t v36 = *MEMORY[0x1E4F42510];
    v21 = [(UIView *)v4 mk_theme];
    v22 = [v21 tintColor];
    v37[0] = v22;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
    [(UITextView *)v4->_descriptionLabel setLinkTextAttributes:v23];

    [(UITextView *)v4->_descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextView *)v4->_descriptionLabel setAccessibilityIdentifier:@"DescriptionLabel"];
    v24 = [(MKIncidentDetailCell *)v4 contentView];
    [v24 addSubview:v4->_descriptionLabel];

    v25 = objc_alloc_init(_MKUILabel);
    lastUpdatedLabel = v4->_lastUpdatedLabel;
    v4->_lastUpdatedLabel = v25;

    [(_MKUILabel *)v4->_lastUpdatedLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_MKUILabel *)v4->_lastUpdatedLabel setNumberOfLines:0];
    [(_MKUILabel *)v4->_lastUpdatedLabel set_mapkit_themeColorProvider:&__block_literal_global_16];
    [(_MKUILabel *)v4->_lastUpdatedLabel setAccessibilityIdentifier:@"LastUpdatedLabel"];
    v27 = [(MKIncidentDetailCell *)v4 contentView];
    [v27 addSubview:v4->_lastUpdatedLabel];

    [(_MKUILabel *)v4->_lastUpdatedLabel setTextAlignment:4];
    v28 = [MEMORY[0x1E4F428B8] clearColor];
    [(_MKUILabel *)v4->_lastUpdatedLabel setBackgroundColor:v28];

    [(_MKUILabel *)v4->_titleLabel setTextAlignment:4];
    v29 = [MEMORY[0x1E4F428B8] clearColor];
    [(_MKUILabel *)v4->_titleLabel setBackgroundColor:v29];

    uint64_t v30 = *MEMORY[0x1E4F438C8];
    v31 = objc_msgSend(MEMORY[0x1E4F42A30], "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", *MEMORY[0x1E4F438C8], 0);
    [(UITextView *)v4->_descriptionLabel setFont:v31];

    v32 = objc_msgSend(MEMORY[0x1E4F42A30], "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", v30, 0);
    [(_MKUILabel *)v4->_lastUpdatedLabel setFont:v32];

    v33 = objc_msgSend(MEMORY[0x1E4F42A30], "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", *MEMORY[0x1E4F438F8], 2);
    [(_MKUILabel *)v4->_titleLabel setFont:v33];

    [(MKIncidentDetailCell *)v4 _setConstraints];
  }
  return v4;
}

uint64_t __48__MKIncidentDetailCell_initWithReuseIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 textColor];
}

uint64_t __48__MKIncidentDetailCell_initWithReuseIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 lightTextColor];
}

- (void)infoCardThemeChanged
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)MKIncidentDetailCell;
  [(UIView *)&v8 infoCardThemeChanged];
  v3 = [(UIView *)self mk_theme];
  v4 = [v3 textColor];
  [(UITextView *)self->_descriptionLabel setTextColor:v4];

  uint64_t v9 = *MEMORY[0x1E4F42510];
  v5 = [(UIView *)self mk_theme];
  v6 = [v5 tintColor];
  v10[0] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [(UITextView *)self->_descriptionLabel setLinkTextAttributes:v7];
}

- (void)_setConstraints
{
  v49[12] = *MEMORY[0x1E4F143B8];
  v3 = [(UIImageView *)self->_iconImageView leadingAnchor];
  v4 = [(MKIncidentDetailCell *)self contentView];
  v5 = [v4 leadingAnchor];
  v6 = [v3 constraintEqualToAnchor:v5 constant:15.0];

  v7 = [(UITextView *)self->_descriptionLabel leadingAnchor];
  objc_super v8 = [(UIImageView *)self->_iconImageView trailingAnchor];
  v48 = [v7 constraintEqualToAnchor:v8 constant:10.0];

  uint64_t v9 = [(MKIncidentDetailCell *)self contentView];
  v10 = [v9 trailingAnchor];
  v11 = [(UITextView *)self->_descriptionLabel trailingAnchor];
  v47 = [v10 constraintEqualToAnchor:v11 constant:15.0];

  v46 = v6;
  LODWORD(v12) = 1148829696;
  [v6 setPriority:v12];
  LODWORD(v13) = 1148829696;
  [v48 setPriority:v13];
  LODWORD(v14) = 1148829696;
  [v47 setPriority:v14];
  v15 = [(_MKUILabel *)self->_titleLabel firstBaselineAnchor];
  v16 = [(MKIncidentDetailCell *)self contentView];
  v17 = [v16 topAnchor];
  v18 = [v15 constraintEqualToAnchor:v17 constant:31.0];
  titleFirstBaselineToTopConstraint = self->_titleFirstBaselineToTopConstraint;
  self->_titleFirstBaselineToTopConstraint = v18;

  v20 = [(MKIncidentDetailCell *)self contentView];
  [v20 addConstraint:self->_titleFirstBaselineToTopConstraint];

  uint64_t v36 = (void *)MEMORY[0x1E4F28DC8];
  v49[0] = self->_titleFirstBaselineToTopConstraint;
  v45 = [(_MKUILabel *)self->_titleLabel leadingAnchor];
  v44 = [(UITextView *)self->_descriptionLabel leadingAnchor];
  v43 = [v45 constraintEqualToAnchor:v44];
  v49[1] = v43;
  v42 = [(_MKUILabel *)self->_titleLabel trailingAnchor];
  v41 = [(UITextView *)self->_descriptionLabel trailingAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v49[2] = v40;
  v49[3] = v6;
  v39 = [(UIImageView *)self->_iconImageView centerYAnchor];
  v38 = [(_MKUILabel *)self->_titleLabel firstBaselineAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v49[4] = v37;
  objc_super v35 = [(UIImageView *)self->_iconImageView widthAnchor];
  v34 = [v35 constraintEqualToConstant:30.0];
  v49[5] = v34;
  v33 = [(UIImageView *)self->_iconImageView heightAnchor];
  v32 = [v33 constraintEqualToConstant:30.0];
  v49[6] = v32;
  v31 = [(UITextView *)self->_descriptionLabel topAnchor];
  v21 = [(_MKUILabel *)self->_titleLabel bottomAnchor];
  v22 = [v31 constraintEqualToAnchor:v21 constant:5.0];
  v49[7] = v22;
  v49[8] = v48;
  v49[9] = v47;
  v23 = [(_MKUILabel *)self->_lastUpdatedLabel leadingAnchor];
  v24 = [(UITextView *)self->_descriptionLabel leadingAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  v49[10] = v25;
  v26 = [(_MKUILabel *)self->_lastUpdatedLabel trailingAnchor];
  v27 = [(UITextView *)self->_descriptionLabel trailingAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  v49[11] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:12];
  [v36 activateConstraints:v29];

  uint64_t v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v30 addObserver:self selector:sel__contentSizeCategoryDidChange name:*MEMORY[0x1E4F43788] object:0];

  [(MKIncidentDetailCell *)self _updateConstraintValues];
}

- (void)updateConstraints
{
  uint64_t v3 = [(_MKUILabel *)self->_lastUpdatedLabel text];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [(_MKUILabel *)self->_lastUpdatedLabel text];
    int v6 = [v5 isEqualToString:&stru_1ED919588];

    if (!v6)
    {
      [(NSLayoutConstraint *)self->_descriptionLastBaselineToBottomConstraint setActive:0];
      if (!self->_lastUpdatedFirstBaselineToDescriptionFirstBaselineConstraint)
      {
        double v14 = [(_MKUILabel *)self->_lastUpdatedLabel firstBaselineAnchor];
        v15 = [(UITextView *)self->_descriptionLabel lastBaselineAnchor];
        v16 = [v14 constraintEqualToAnchor:v15 constant:28.0];
        lastUpdatedFirstBaselineToDescriptionFirstBaselineConstraint = self->_lastUpdatedFirstBaselineToDescriptionFirstBaselineConstraint;
        self->_lastUpdatedFirstBaselineToDescriptionFirstBaselineConstraint = v16;

        [(MKIncidentDetailCell *)self _updateConstraintValues];
      }
      p_lastUpdatedLastBaselineToBottomConstraint = &self->_lastUpdatedLastBaselineToBottomConstraint;
      if (!self->_lastUpdatedLastBaselineToBottomConstraint)
      {
        v18 = [(MKIncidentDetailCell *)self contentView];
        v19 = [v18 bottomAnchor];
        v20 = [(_MKUILabel *)self->_lastUpdatedLabel lastBaselineAnchor];
        uint64_t v21 = [v19 constraintEqualToAnchor:v20 constant:21.0];
        v22 = *p_lastUpdatedLastBaselineToBottomConstraint;
        *p_lastUpdatedLastBaselineToBottomConstraint = (NSLayoutConstraint *)v21;
      }
      [(NSLayoutConstraint *)self->_lastUpdatedFirstBaselineToDescriptionFirstBaselineConstraint setActive:1];
      goto LABEL_10;
    }
  }
  [(NSLayoutConstraint *)self->_lastUpdatedFirstBaselineToDescriptionFirstBaselineConstraint setActive:0];
  [(NSLayoutConstraint *)self->_lastUpdatedLastBaselineToBottomConstraint setActive:0];
  p_lastUpdatedLastBaselineToBottomConstraint = &self->_descriptionLastBaselineToBottomConstraint;
  descriptionLastBaselineToBottomConstraint = self->_descriptionLastBaselineToBottomConstraint;
  if (!descriptionLastBaselineToBottomConstraint)
  {
    uint64_t v9 = [(MKIncidentDetailCell *)self contentView];
    v10 = [v9 bottomAnchor];
    v11 = [(UITextView *)self->_descriptionLabel lastBaselineAnchor];
    uint64_t v12 = [v10 constraintEqualToAnchor:v11 constant:21.0];
    double v13 = *p_lastUpdatedLastBaselineToBottomConstraint;
    *p_lastUpdatedLastBaselineToBottomConstraint = (NSLayoutConstraint *)v12;

LABEL_10:
    descriptionLastBaselineToBottomConstraint = *p_lastUpdatedLastBaselineToBottomConstraint;
  }
  [(NSLayoutConstraint *)descriptionLastBaselineToBottomConstraint setActive:1];
  v23.receiver = self;
  v23.super_class = (Class)MKIncidentDetailCell;
  [(MKIncidentDetailCell *)&v23 updateConstraints];
}

- (void)_updateConstraintValues
{
  uint64_t v3 = [(UITextView *)self->_descriptionLabel font];
  [v3 _scaledValueForValue:31.0];
  v4 = [(MKIncidentDetailCell *)self contentView];
  UIRoundToViewScale();
  -[NSLayoutConstraint setConstant:](self->_titleFirstBaselineToTopConstraint, "setConstant:");

  id v6 = [(_MKUILabel *)self->_lastUpdatedLabel font];
  [v6 _scaledValueForValue:28.0];
  v5 = [(MKIncidentDetailCell *)self contentView];
  UIRoundToViewScale();
  -[NSLayoutConstraint setConstant:](self->_lastUpdatedFirstBaselineToDescriptionFirstBaselineConstraint, "setConstant:");
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MKIncidentDetailCell;
  [(MKIncidentDetailCell *)&v4 dealloc];
}

- (void)_contentSizeCategoryDidChange
{
  uint64_t v3 = *MEMORY[0x1E4F43890];
  objc_super v4 = objc_msgSend(MEMORY[0x1E4F42A30], "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", *MEMORY[0x1E4F43890], 0);
  [(UITextView *)self->_descriptionLabel setFont:v4];

  v5 = objc_msgSend(MEMORY[0x1E4F42A30], "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", v3, 0);
  [(_MKUILabel *)self->_lastUpdatedLabel setFont:v5];

  [(MKIncidentDetailCell *)self _updateConstraintValues];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)MKIncidentDetailCell;
  [(MKIncidentDetailCell *)&v3 didMoveToWindow];
  [(MKIncidentDetailCell *)self _updateConstraintValues];
}

- (void)setIcon:(id)a3
{
}

- (void)setTitle:(id)a3
{
}

- (void)setIncidentDescription:(id)a3
{
}

- (NSString)incidentDescription
{
  return [(UITextView *)self->_descriptionLabel text];
}

- (void)setLastUpdated:(id)a3
{
  id v5 = a3;
  if (!-[NSDate isEqualToDate:](self->_lastUpdated, "isEqualToDate:"))
  {
    objc_storeStrong((id *)&self->_lastUpdated, a3);
    [(MKIncidentDetailCell *)self _updateLastUpdatedLabel];
  }
}

- (void)_updateLastUpdatedLabel
{
  objc_super v3 = [(MKIncidentDetailCell *)self lastUpdated];

  if (v3)
  {
    objc_super v4 = objc_opt_class();
    id v5 = [(MKIncidentDetailCell *)self lastUpdated];
    id v6 = [v4 lastUpdateDisplayString:v5];
    [(_MKUILabel *)self->_lastUpdatedLabel setText:v6];
  }
  else
  {
    [(_MKUILabel *)self->_lastUpdatedLabel setText:0];
  }

  [(UIView *)self _mapkit_setNeedsUpdateConstraints];
}

+ (id)lastUpdateDisplayString:(id)a3
{
  uint64_t v3 = qword_1E9154190;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1E9154190, &__block_literal_global_39);
  }
  id v5 = (void *)MEMORY[0x1E4F28C10];
  id v6 = [(id)_MergedGlobals_1_10 locale];
  v7 = [v5 dateFormatFromTemplate:@"YYYYMMddjma" options:0 locale:v6];
  [(id)_MergedGlobals_1_10 setDateFormat:v7];

  objc_super v8 = NSString;
  uint64_t v9 = _MKLocalizedStringFromThisBundle(@"Placecard_TransitIncident_LastUpdated");
  v10 = [(id)_MergedGlobals_1_10 stringFromDate:v4];

  v11 = objc_msgSend(v8, "stringWithFormat:", v9, v10);

  return v11;
}

void __48__MKIncidentDetailCell_lastUpdateDisplayString___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_MergedGlobals_1_10;
  _MergedGlobals_1_10 = (uint64_t)v0;

  id v2 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [(id)_MergedGlobals_1_10 setLocale:v2];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v6 = +[MKMapService sharedService];
  [v6 captureUserAction:7006 onTarget:628 eventValue:0];

  return 1;
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)icon
{
  return self->_icon;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_lastUpdatedLastBaselineToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_lastUpdatedFirstBaselineToDescriptionFirstBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_descriptionLastBaselineToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_titleFirstBaselineToTopConstraint, 0);
  objc_storeStrong((id *)&self->_lastUpdatedLabel, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end