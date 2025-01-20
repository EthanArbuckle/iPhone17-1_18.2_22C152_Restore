@interface EKUIListViewTimedEventCell
+ (UIEdgeInsets)adjustedSeparatorInsets;
+ (id)pathForBackgroundForRect:(CGRect)a3 allDay:(BOOL)a4;
+ (void)initialize;
- (EKEvent)event;
- (EKUIListViewTimedEventCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)_attributedStringFromAttributedString:(id)a3 strikethrough:(BOOL)a4;
- (id)_attributedStringFromString:(id)a3 strikethrough:(BOOL)a4 font:(id)a5;
- (id)_createSpacer;
- (id)_subtextFont;
- (id)_subtextMonospacedFont;
- (id)_titleFont;
- (id)initForCarplayWithReuseIdentifier:(id)a3;
- (id)initForDragPreview;
- (void)_adjustNumberOfLines;
- (void)_commonInit;
- (void)_hideOrShowLocationIcon;
- (void)_updateAppEntityAnnotationIfNeeded;
- (void)_updateColors;
- (void)_updateLocationViewsWithStrikethrough:(BOOL)a3;
- (void)_updateTextAndIconColors;
- (void)setEvent:(id)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)updateWithEvent:(id)a3 isMultiday:(BOOL)a4 occurrenceStartDate:(id)a5 dimmed:(BOOL)a6;
@end

@implementation EKUIListViewTimedEventCell

+ (void)initialize
{
  uint64_t v2 = objc_opt_new();
  v3 = (void *)s_iconCache_0;
  s_iconCache_0 = v2;

  v4 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"location.pin.point.of.interest"];
  [(id)s_iconCache_0 setObject:v4 forKeyedSubscript:@"location.pin.point.of.interest"];

  v5 = WalkmanImage_Occurrences();
  [(id)s_iconCache_0 setObject:v5 forKeyedSubscript:&unk_1F0D03A30];

  v6 = TransitImage_Occurrences();
  [(id)s_iconCache_0 setObject:v6 forKeyedSubscript:&unk_1F0D03A48];

  v7 = BicycleImage_Occurrences();
  [(id)s_iconCache_0 setObject:v7 forKeyedSubscript:&unk_1F0D03A60];

  CarImage_Occurrences();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(id)s_iconCache_0 setObject:v8 forKeyedSubscript:&unk_1F0D03A78];
}

- (id)initForCarplayWithReuseIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EKUIListViewTimedEventCell;
  id v3 = [(EKUIListViewCell *)&v6 initForCarplayWithReuseIdentifier:a3];
  v4 = v3;
  if (v3) {
    [v3 _commonInit];
  }
  return v4;
}

- (id)initForDragPreview
{
  v5.receiver = self;
  v5.super_class = (Class)EKUIListViewTimedEventCell;
  id v2 = [(EKUIListViewCell *)&v5 initForDragPreview];
  id v3 = v2;
  if (v2) {
    [v2 _commonInit];
  }
  return v3;
}

- (EKUIListViewTimedEventCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)EKUIListViewTimedEventCell;
  v4 = [(EKUIListViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  objc_super v5 = v4;
  if (v4) {
    [(EKUIListViewTimedEventCell *)v4 _commonInit];
  }
  return v5;
}

- (void)_commonInit
{
  v124[4] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__adjustNumberOfLines name:*MEMORY[0x1E4FB27A8] object:0];

  v4 = [[EKUIListViewCellBackground alloc] initWithCornerRadius:8.0];
  backgroundView = self->_backgroundView;
  self->_backgroundView = v4;

  [(EKUIListViewCellBackground *)self->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v6 = [(EKUIListViewTimedEventCell *)self contentView];
  [v6 addSubview:self->_backgroundView];

  objc_super v7 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  colorBarView = self->_colorBarView;
  self->_colorBarView = v7;

  [(UIView *)self->_colorBarView setTranslatesAutoresizingMaskIntoConstraints:0];
  v9 = [(UIView *)self->_colorBarView layer];
  [v9 setCornerRadius:1.75];

  v10 = [(EKUIListViewTimedEventCell *)self contentView];
  [v10 addSubview:self->_colorBarView];

  v11 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
  travelImage = self->_travelImage;
  self->_travelImage = v11;

  LODWORD(v13) = 1148846080;
  [(UIImageView *)self->_travelImage setContentCompressionResistancePriority:0 forAxis:v13];
  uint64_t v14 = *MEMORY[0x1E4FB2950];
  v15 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB2950] scale:1];
  [(UIImageView *)self->_travelImage setPreferredSymbolConfiguration:v15];

  v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  travelTextLabel = self->_travelTextLabel;
  self->_travelTextLabel = v16;

  [(UILabel *)self->_travelTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v18) = 1132134400;
  [(UILabel *)self->_travelTextLabel setContentCompressionResistancePriority:0 forAxis:v18];
  v19 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  travelDepartureTimeLabel = self->_travelDepartureTimeLabel;
  self->_travelDepartureTimeLabel = v19;

  [(UILabel *)self->_travelDepartureTimeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  id v21 = objc_alloc(MEMORY[0x1E4FB1C60]);
  v22 = self->_travelTextLabel;
  v124[0] = self->_travelImage;
  v124[1] = v22;
  v23 = [(EKUIListViewTimedEventCell *)self _createSpacer];
  v24 = self->_travelDepartureTimeLabel;
  v124[2] = v23;
  v124[3] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v124 count:4];
  v26 = (UIStackView *)[v21 initWithArrangedSubviews:v25];
  travelLine = self->_travelLine;
  self->_travelLine = v26;

  [(UIStackView *)self->_travelLine setAlignment:2];
  [(EKUIListViewCell *)self carplayMode];
  [(UIStackView *)self->_travelLine setSpacing:2.0];
  v28 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  titleField = self->_titleField;
  self->_titleField = v28;

  [(UILabel *)self->_titleField setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v30) = 1132134400;
  [(UILabel *)self->_titleField setContentCompressionResistancePriority:0 forAxis:v30];
  v31 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  topTimeField = self->_topTimeField;
  self->_topTimeField = v31;

  [(UILabel *)self->_topTimeField setTranslatesAutoresizingMaskIntoConstraints:0];
  id v33 = objc_alloc(MEMORY[0x1E4FB1C60]);
  v123[0] = self->_titleField;
  v34 = [(EKUIListViewTimedEventCell *)self _createSpacer];
  v35 = self->_topTimeField;
  v123[1] = v34;
  v123[2] = v35;
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v123 count:3];
  v37 = (UIStackView *)[v33 initWithArrangedSubviews:v36];
  titleLine = self->_titleLine;
  self->_titleLine = v37;

  [(UIStackView *)self->_titleLine setAlignment:2];
  [(EKUIListViewCell *)self carplayMode];
  [(UIStackView *)self->_titleLine setSpacing:2.0];
  v39 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
  locationImage = self->_locationImage;
  self->_locationImage = v39;

  LODWORD(v41) = 1148846080;
  [(UIImageView *)self->_locationImage setContentCompressionResistancePriority:0 forAxis:v41];
  v42 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:v14 scale:1];
  [(UIImageView *)self->_locationImage setPreferredSymbolConfiguration:v42];

  v43 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  locationField = self->_locationField;
  self->_locationField = v43;

  [(UILabel *)self->_locationField setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v45) = 1132134400;
  [(UILabel *)self->_locationField setContentCompressionResistancePriority:0 forAxis:v45];
  v46 = self->_locationField;
  v47 = [(EKUIListViewTimedEventCell *)self _subtextFont];
  [(UILabel *)v46 setFont:v47];

  v48 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  bottomTimeField = self->_bottomTimeField;
  self->_bottomTimeField = v48;

  [(UILabel *)self->_bottomTimeField setTranslatesAutoresizingMaskIntoConstraints:0];
  id v50 = objc_alloc(MEMORY[0x1E4FB1C60]);
  v51 = self->_locationField;
  v122[0] = self->_locationImage;
  v122[1] = v51;
  v52 = [(EKUIListViewTimedEventCell *)self _createSpacer];
  v53 = self->_bottomTimeField;
  v122[2] = v52;
  v122[3] = v53;
  v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v122 count:4];
  v55 = (UIStackView *)[v50 initWithArrangedSubviews:v54];
  locationLine = self->_locationLine;
  self->_locationLine = v55;

  [(UIStackView *)self->_locationLine setAlignment:2];
  [(EKUIListViewCell *)self carplayMode];
  [(UIStackView *)self->_locationLine setSpacing:2.0];
  id v57 = objc_alloc(MEMORY[0x1E4FB1C60]);
  v58 = self->_titleLine;
  v121[0] = self->_travelLine;
  v121[1] = v58;
  v121[2] = self->_locationLine;
  v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v121 count:3];
  v60 = (UIStackView *)[v57 initWithArrangedSubviews:v59];
  textContentView = self->_textContentView;
  self->_textContentView = v60;

  [(UIStackView *)self->_textContentView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_textContentView setAxis:1];
  [(UIStackView *)self->_textContentView setSpacing:1.0];
  [(UIStackView *)self->_textContentView setAlignment:1];
  v62 = [(EKUIListViewTimedEventCell *)self contentView];
  [v62 addSubview:self->_textContentView];

  v107 = (void *)MEMORY[0x1E4F28DC8];
  v63 = [(EKUIListViewCellBackground *)self->_backgroundView leadingAnchor];
  v118 = v63;
  v119 = [(EKUIListViewTimedEventCell *)self contentView];
  uint64_t v64 = [v119 leadingAnchor];
  v117 = (void *)v64;
  if ([(EKUIListViewCell *)self carplayMode]) {
    double v65 = 0.0;
  }
  else {
    double v65 = 12.0;
  }
  v116 = [v63 constraintEqualToAnchor:v64 constant:v65];
  v120[0] = v116;
  v66 = [(EKUIListViewCellBackground *)self->_backgroundView trailingAnchor];
  v114 = v66;
  v115 = [(EKUIListViewTimedEventCell *)self contentView];
  uint64_t v67 = [v115 trailingAnchor];
  v113 = (void *)v67;
  if ([(EKUIListViewCell *)self carplayMode]) {
    double v68 = 0.0;
  }
  else {
    double v68 = 12.0;
  }
  v112 = [v66 constraintEqualToAnchor:v67 constant:-v68];
  v120[1] = v112;
  v69 = [(EKUIListViewCellBackground *)self->_backgroundView topAnchor];
  v110 = v69;
  v111 = [(EKUIListViewTimedEventCell *)self contentView];
  uint64_t v70 = [v111 topAnchor];
  v109 = (void *)v70;
  if ([(EKUIListViewCell *)self carplayMode]) {
    double v71 = 0.0;
  }
  else {
    double v71 = 4.0;
  }
  v108 = [v69 constraintEqualToAnchor:v70 constant:v71];
  v120[2] = v108;
  v72 = [(EKUIListViewCellBackground *)self->_backgroundView bottomAnchor];
  v105 = v72;
  v106 = [(EKUIListViewTimedEventCell *)self contentView];
  uint64_t v73 = [v106 bottomAnchor];
  v104 = (void *)v73;
  if ([(EKUIListViewCell *)self carplayMode]) {
    double v74 = 0.0;
  }
  else {
    double v74 = 4.0;
  }
  v103 = [v72 constraintEqualToAnchor:v73 constant:-v74];
  v120[3] = v103;
  v102 = [(UIView *)self->_colorBarView leadingAnchor];
  v101 = [(EKUIListViewCellBackground *)self->_backgroundView leadingAnchor];
  v100 = [v102 constraintEqualToAnchor:v101 constant:8.0];
  v120[4] = v100;
  v99 = [(UIView *)self->_colorBarView widthAnchor];
  v98 = [v99 constraintEqualToConstant:3.5];
  v120[5] = v98;
  v97 = [(UIView *)self->_colorBarView topAnchor];
  v96 = [(EKUIListViewCellBackground *)self->_backgroundView topAnchor];
  v95 = [v97 constraintEqualToAnchor:v96 constant:8.0];
  v120[6] = v95;
  v94 = [(UIView *)self->_colorBarView bottomAnchor];
  v93 = [(EKUIListViewCellBackground *)self->_backgroundView bottomAnchor];
  v92 = [v94 constraintEqualToAnchor:v93 constant:-8.0];
  v120[7] = v92;
  v75 = [(UIStackView *)self->_textContentView leadingAnchor];
  v91 = v75;
  uint64_t v76 = [(UIView *)self->_colorBarView trailingAnchor];
  v90 = (void *)v76;
  BOOL v77 = [(EKUIListViewCell *)self carplayMode];
  double v78 = 6.0;
  if (v77) {
    double v78 = 5.0;
  }
  v89 = [v75 constraintEqualToAnchor:v76 constant:v78];
  v120[8] = v89;
  v79 = [(UIStackView *)self->_textContentView trailingAnchor];
  v80 = [(EKUIListViewCellBackground *)self->_backgroundView trailingAnchor];
  v81 = [v79 constraintEqualToAnchor:v80 constant:-8.0];
  v120[9] = v81;
  v82 = [(UIStackView *)self->_textContentView topAnchor];
  v83 = [(EKUIListViewCellBackground *)self->_backgroundView topAnchor];
  v84 = [v82 constraintEqualToAnchor:v83 constant:8.0];
  v120[10] = v84;
  v85 = [(UIStackView *)self->_textContentView bottomAnchor];
  v86 = [(EKUIListViewCellBackground *)self->_backgroundView bottomAnchor];
  v87 = [v85 constraintEqualToAnchor:v86 constant:-8.0];
  v120[11] = v87;
  v88 = [MEMORY[0x1E4F1C978] arrayWithObjects:v120 count:12];
  [v107 activateConstraints:v88];
}

- (void)_hideOrShowLocationIcon
{
  id v5 = [(EKUIListViewTimedEventCell *)self contentView];
  id v3 = [v5 traitCollection];
  if (EKUIUsesLargeTextLayout(v3))
  {
    [(UIImageView *)self->_locationImage setHidden:1];
  }
  else
  {
    v4 = [(UILabel *)self->_locationField attributedText];
    -[UIImageView setHidden:](self->_locationImage, "setHidden:", [v4 length] == 0);
  }
}

- (void)_adjustNumberOfLines
{
  id v3 = [(EKUIListViewTimedEventCell *)self contentView];
  v4 = [v3 traitCollection];
  BOOL v5 = EKUIUsesLargeTextLayout(v4);

  [(UIImageView *)self->_travelImage setHidden:v5];
  [(EKUIListViewTimedEventCell *)self _hideOrShowLocationIcon];
  [(UILabel *)self->_travelTextLabel setNumberOfLines:v5 ^ 1];
  [(UILabel *)self->_travelDepartureTimeLabel setNumberOfLines:v5 ^ 1];
  [(UILabel *)self->_titleField setNumberOfLines:v5 ^ 1];
  [(UILabel *)self->_topTimeField setNumberOfLines:v5 ^ 1];
  [(UILabel *)self->_locationField setNumberOfLines:v5 ^ 1];
  bottomTimeField = self->_bottomTimeField;

  [(UILabel *)bottomTimeField setNumberOfLines:v5 ^ 1];
}

- (id)_createSpacer
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v2 setAccessibilityIdentifier:@"Spacer"];
  id v3 = [v2 widthAnchor];
  v4 = [v3 constraintEqualToConstant:1.79769313e308];

  LODWORD(v5) = 1132068864;
  [v4 setPriority:v5];
  [v4 setActive:1];

  return v2;
}

- (void)_updateLocationViewsWithStrikethrough:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (void *)MEMORY[0x1E4F57BA0];
  objc_super v6 = [(EKUIListViewTimedEventCell *)self event];
  id v13 = 0;
  objc_super v7 = [v5 locationStringForEvent:v6 options:288 incomplete:0 leadingImageName:&v13];
  id v8 = (__CFString *)v13;

  if (v8) {
    v9 = v8;
  }
  else {
    v9 = @"location.pin.point.of.interest";
  }
  v10 = [(EKUIListViewTimedEventCell *)self _attributedStringFromAttributedString:v7 strikethrough:v3];
  [(UILabel *)self->_locationField setAttributedText:v10];

  [(EKUIListViewTimedEventCell *)self _hideOrShowLocationIcon];
  if (([(UIImageView *)self->_locationImage isHidden] & 1) == 0)
  {
    v11 = [(id)s_iconCache_0 objectForKeyedSubscript:v9];
    if (!v11)
    {
      v11 = [MEMORY[0x1E4FB1818] systemImageNamed:v9];
      [(id)s_iconCache_0 setObject:v11 forKeyedSubscript:v9];
    }
    v12 = [(UIImageView *)self->_locationImage image];

    if (v12 != v11) {
      [(UIImageView *)self->_locationImage setImage:v11];
    }
  }
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)EKUIListViewTimedEventCell;
  [(EKUIListViewTimedEventCell *)&v5 setHighlighted:a3 animated:a4];
  [(EKUIListViewTimedEventCell *)self _updateAppEntityAnnotationIfNeeded];
  if ([(EKUIListViewCell *)self carplayMode]) {
    [(EKUIListViewTimedEventCell *)self _updateColors];
  }
}

- (void)updateWithEvent:(id)a3 isMultiday:(BOOL)a4 occurrenceStartDate:(id)a5 dimmed:(BOOL)a6
{
  BOOL v8 = a4;
  id v71 = a3;
  id v10 = a5;
  [(EKUIListViewTimedEventCell *)self setEvent:v71];
  [(EKUIListViewTimedEventCell *)self _updateAppEntityAnnotationIfNeeded];
  if (!v71) {
    goto LABEL_26;
  }
  self->_dimmed = a6;
  if ([(EKUIListViewCell *)self carplayMode]) {
    [(EKUIListViewTimedEventCell *)self setSelectionStyle:0];
  }
  uint64_t v11 = [v71 status];
  unsigned int v12 = CUIKEventDisplaysAsDeclined();
  if (v11 == 3) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = v12;
  }
  if ([(EKUIListViewCell *)self dragPreview]) {
    uint64_t v14 = 48;
  }
  else {
    uint64_t v14 = 16;
  }
  v15 = CUIKCalendar();
  if (!v8)
  {
    id v70 = v10;
    v25 = (void *)MEMORY[0x1E4F57C50];
    v26 = [v71 startDate];
    v27 = [(EKUIListViewTimedEventCell *)self _subtextMonospacedFont];
    v23 = [v25 timeAttributedTextWithDate:v26 calendar:v15 font:v27 options:v14];

    v28 = [(EKUIListViewTimedEventCell *)self _attributedStringFromAttributedString:v23 strikethrough:v13];
    [(UILabel *)self->_topTimeField setAttributedText:v28];

    v29 = [(EKUIListViewTimedEventCell *)self event];
    double v30 = [v29 startDate];
    v31 = [(EKUIListViewTimedEventCell *)self event];
    v32 = [v31 endDate];
    int v33 = [v30 isEqualToDate:v32];

    if (v33)
    {
      [(UILabel *)self->_bottomTimeField setText:@" "];
    }
    else
    {
      v43 = (void *)MEMORY[0x1E4F57C50];
      v44 = [v71 endDate];
      double v45 = [(EKUIListViewTimedEventCell *)self _subtextMonospacedFont];
      uint64_t v46 = [v43 timeAttributedTextWithDate:v44 calendar:v15 font:v45 options:v14];

      v47 = [(EKUIListViewTimedEventCell *)self _attributedStringFromAttributedString:v46 strikethrough:v13];
      [(UILabel *)self->_bottomTimeField setAttributedText:v47];

      v23 = (void *)v46;
    }
    id v10 = v70;
    goto LABEL_21;
  }
  v16 = [v71 startDate];
  int v17 = [v15 isDate:v16 inSameDayAsDate:v10];

  double v18 = [v71 endDate];
  int v19 = [v15 isDate:v18 inSameDayAsDate:v10];

  if (v17)
  {
    v20 = (void *)MEMORY[0x1E4F57C50];
    id v21 = [v71 startDate];
    v22 = [(EKUIListViewTimedEventCell *)self _subtextMonospacedFont];
    v23 = [v20 timeAttributedTextWithDate:v21 calendar:v15 font:v22 options:v14];

    v24 = [(EKUIListViewTimedEventCell *)self _attributedStringFromAttributedString:v23 strikethrough:v13];
    [(UILabel *)self->_topTimeField setAttributedText:v24];
  }
  else
  {
    v34 = EventKitUIBundle();
    v35 = v34;
    if (v19)
    {
      v23 = [v34 localizedStringForKey:@"Ends label" value:@"Ends" table:0];

      v36 = [(EKUIListViewTimedEventCell *)self _subtextFont];
      v37 = [(EKUIListViewTimedEventCell *)self _attributedStringFromString:v23 strikethrough:v13 font:v36];
      [(UILabel *)self->_topTimeField setAttributedText:v37];

      v38 = (void *)MEMORY[0x1E4F57C50];
      v39 = [v71 endDate];
      v40 = [(EKUIListViewTimedEventCell *)self _subtextMonospacedFont];
      double v41 = [v38 timeAttributedTextWithDate:v39 calendar:v15 font:v40 options:v14];

      v42 = [(EKUIListViewTimedEventCell *)self _attributedStringFromAttributedString:v41 strikethrough:v13];
      [(UILabel *)self->_bottomTimeField setAttributedText:v42];

      goto LABEL_21;
    }
    v23 = [v34 localizedStringForKey:@"all-day label" value:@"all-day" table:0];

    v24 = [(EKUIListViewTimedEventCell *)self _subtextFont];
    v48 = [(EKUIListViewTimedEventCell *)self _attributedStringFromString:v23 strikethrough:v13 font:v24];
    [(UILabel *)self->_topTimeField setAttributedText:v48];
  }
  [(UILabel *)self->_bottomTimeField setText:@" "];
LABEL_21:

  [v71 travelTime];
  if (v49 == 0.0
    || [(EKUIListViewCell *)self carplayMode]
    || [(EKUIListViewCell *)self dragPreview])
  {
    [(UIStackView *)self->_travelLine setHidden:1];
  }
  else
  {
    [(UIStackView *)self->_travelLine setHidden:0];
    uint64_t v53 = [v71 travelRoutingMode];
    if ((unint64_t)(v53 + 1) < 2) {
      uint64_t v54 = 1;
    }
    else {
      uint64_t v54 = v53;
    }
    v55 = [(UIImageView *)self->_travelImage image];
    v56 = (void *)s_iconCache_0;
    id v57 = [NSNumber numberWithInteger:v54];
    v58 = [v56 objectForKeyedSubscript:v57];

    if (v55 != v58)
    {
      v59 = (void *)s_iconCache_0;
      v60 = [NSNumber numberWithInteger:v54];
      v61 = [v59 objectForKeyedSubscript:v60];
      [(UIImageView *)self->_travelImage setImage:v61];
    }
    v62 = (void *)MEMORY[0x1E4F57C50];
    v63 = [v71 startDateIncludingTravel];
    uint64_t v64 = [(EKUIListViewTimedEventCell *)self _subtextMonospacedFont];
    double v65 = [v62 timeAttributedTextWithDate:v63 calendar:v15 font:v64 options:16];

    v66 = [(EKUIListViewTimedEventCell *)self _attributedStringFromAttributedString:v65 strikethrough:v13];
    [(UILabel *)self->_travelDepartureTimeLabel setAttributedText:v66];

    [v71 travelTime];
    uint64_t v67 = CUIKDisplayStringTravelTimeAndDuration();
    double v68 = [(EKUIListViewTimedEventCell *)self _subtextFont];
    v69 = [(EKUIListViewTimedEventCell *)self _attributedStringFromString:v67 strikethrough:v13 font:v68];
    [(UILabel *)self->_travelTextLabel setAttributedText:v69];
  }
  id v50 = CUIKDisplayedTitleForEvent();
  v51 = [(EKUIListViewTimedEventCell *)self _titleFont];
  v52 = [(EKUIListViewTimedEventCell *)self _attributedStringFromString:v50 strikethrough:v13 font:v51];
  [(UILabel *)self->_titleField setAttributedText:v52];

  [(EKUIListViewTimedEventCell *)self _updateLocationViewsWithStrikethrough:v13];
  [(EKUIListViewTimedEventCell *)self _updateColors];

LABEL_26:
}

- (id)_attributedStringFromString:(id)a3 strikethrough:(BOOL)a4 font:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  BOOL v8 = (objc_class *)MEMORY[0x1E4F28E48];
  id v9 = a3;
  id v10 = (void *)[[v8 alloc] initWithString:v9];

  uint64_t v11 = [v10 length];
  if (v5) {
    objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E4FB0768], &unk_1F0D03A78, 0, v11);
  }
  if (v7) {
    objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v7, 0, v11);
  }
  unsigned int v12 = (void *)[v10 copy];

  return v12;
}

- (id)_attributedStringFromAttributedString:(id)a3 strikethrough:(BOOL)a4
{
  BOOL v4 = a4;
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_super v6 = v5;
  if (v4)
  {
    id v7 = (void *)[v5 mutableCopy];
    uint64_t v11 = *MEMORY[0x1E4FB0768];
    v12[0] = &unk_1F0D03A78;
    BOOL v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    objc_msgSend(v7, "addAttributes:range:", v8, 0, objc_msgSend(v6, "length"));

    id v9 = (id)[v7 copy];
  }
  else
  {
    id v9 = v5;
  }

  return v9;
}

- (id)_titleFont
{
  return (id)[MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28C8] addingSymbolicTraits:2];
}

- (id)_subtextFont
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
}

- (id)_subtextMonospacedFont
{
  uint64_t v2 = *MEMORY[0x1E4FB2950];
  uint64_t v3 = *MEMORY[0x1E4FB2780];
  BOOL v4 = [(EKUIListViewTimedEventCell *)self traitCollection];
  id v5 = +[EKUIConstrainedFontUtilities constrainedFontForTextStyle:v2 maximumContentSizeCategory:v3 traitCollection:v4];

  objc_super v6 = (void *)MEMORY[0x1E4FB08E0];
  [v5 pointSize];
  id v7 = objc_msgSend(v6, "monospacedDigitSystemFontOfSize:weight:");

  return v7;
}

- (void)_updateColors
{
  uint64_t v3 = [(EKUIListViewTimedEventCell *)self traitCollection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__EKUIListViewTimedEventCell__updateColors__block_invoke;
  v4[3] = &unk_1E6087570;
  v4[4] = self;
  [v3 performAsCurrentTraitCollection:v4];
}

void __43__EKUIListViewTimedEventCell__updateColors__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) carplayMode]
    && [*(id *)(a1 + 32) isHighlighted])
  {
    id v16 = [MEMORY[0x1E4FB1618] _carSystemFocusLabelColor];
  }
  else
  {
    uint64_t v2 = [*(id *)(a1 + 32) event];
    [v2 status];

    uint64_t v3 = [*(id *)(a1 + 32) event];
    CUIKEventDisplaysAsDeclined();

    BOOL v4 = [*(id *)(a1 + 32) event];
    id v5 = [v4 calendar];
    objc_super v6 = [v5 displayColor];
    id v7 = [*(id *)(a1 + 32) traitCollection];
    [v7 userInterfaceStyle];
    BOOL v8 = [*(id *)(a1 + 32) event];
    [v8 needsResponse];
    id v9 = [*(id *)(a1 + 32) event];
    [v9 isReminderIntegrationEvent];
    [*(id *)(a1 + 32) isSelected];
    CUIKColorBarColor();
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v10 + 1200))
  {
    uint64_t v11 = objc_msgSend(v16, "cuik_colorWithAlphaScaled:", *MEMORY[0x1E4F57AA8]);

    uint64_t v10 = *(void *)(a1 + 32);
    id v12 = (id)v11;
  }
  else
  {
    id v12 = v16;
  }
  id v17 = v12;
  [*(id *)(v10 + 1184) setBackgroundColor:v12];
  [*(id *)(a1 + 32) _updateTextAndIconColors];
  uint64_t v13 = *(void **)(a1 + 32);
  uint64_t v14 = (void *)v13[149];
  v15 = [v13 event];
  objc_msgSend(v14, "updateBackgroundColorForEvent:highlighted:dimmed:carplayMode:dragPreview:", v15, objc_msgSend(*(id *)(a1 + 32), "isHighlighted"), *(unsigned __int8 *)(*(void *)(a1 + 32) + 1200), objc_msgSend(*(id *)(a1 + 32), "carplayMode"), objc_msgSend(*(id *)(a1 + 32), "dragPreview"));
}

- (void)_updateTextAndIconColors
{
  if ([(EKUIListViewCell *)self carplayMode]
    && [(EKUIListViewTimedEventCell *)self isHighlighted])
  {
    id v22 = [MEMORY[0x1E4FB1618] _carSystemFocusLabelColor];
    uint64_t v3 = [MEMORY[0x1E4FB1618] _carSystemFocusPrimaryColor];
  }
  else
  {
    BOOL v4 = [(EKUIListViewTimedEventCell *)self event];
    uint64_t v5 = [v4 status];

    objc_super v6 = [(EKUIListViewTimedEventCell *)self event];
    int v7 = CUIKEventDisplaysAsDeclined();

    if (v5 == 3 || v7)
    {
      id v22 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
      uint64_t v3 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    }
    else
    {
      if ([(EKUIListViewCell *)self dragPreview])
      {
        BOOL v8 = [(EKUIListViewTimedEventCell *)self event];
        id v9 = [v8 calendar];
        uint64_t v10 = [v9 displayColor];
        uint64_t v11 = [(EKUIListViewTimedEventCell *)self traitCollection];
        [v11 userInterfaceStyle];
        CUIKTextColorForCalendarColorForStyle();
        id v22 = (id)objc_claimAutoreleasedReturnValue();

        id v12 = [(EKUIListViewTimedEventCell *)self event];
        uint64_t v13 = [v12 calendar];
        uint64_t v14 = [v13 displayColor];
        v15 = [(EKUIListViewTimedEventCell *)self traitCollection];
        [v15 userInterfaceStyle];
        id v16 = CUIKSecondaryTextColorForCalendarColorForStyle();

        goto LABEL_11;
      }
      id v22 = [MEMORY[0x1E4FB1618] labelColor];
      uint64_t v3 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    }
  }
  id v16 = (void *)v3;
LABEL_11:
  if (self->_dimmed)
  {
    double v17 = *MEMORY[0x1E4F57AA8];
    uint64_t v18 = objc_msgSend(v22, "cuik_colorWithAlphaScaled:", *MEMORY[0x1E4F57AA8]);

    uint64_t v19 = objc_msgSend(v16, "cuik_colorWithAlphaScaled:", v17);

    id v16 = (void *)v19;
    id v22 = (id)v18;
  }
  v20 = [(EKUIListViewTimedEventCell *)self traitCollection];
  [v20 userInterfaceStyle];
  CUIKOccurrenceLeadingIconAlphaScale();
  id v21 = objc_msgSend(v16, "cuik_colorWithAlphaScaled:");

  [(UIImageView *)self->_travelImage setTintColor:v21];
  [(UILabel *)self->_travelTextLabel setTextColor:v16];
  [(UILabel *)self->_titleField setTextColor:v22];
  [(UILabel *)self->_locationField setTextColor:v16];
  [(UIImageView *)self->_locationImage setTintColor:v21];
  [(UILabel *)self->_travelDepartureTimeLabel setTextColor:v16];
  [(UILabel *)self->_topTimeField setTextColor:v22];
  [(UILabel *)self->_bottomTimeField setTextColor:v16];
}

- (void)_updateAppEntityAnnotationIfNeeded
{
  if (CalendarLinkLibraryCore())
  {
    uint64_t v3 = [(EKUIListViewTimedEventCell *)self event];
    char v4 = [v3 isNew];

    if ((v4 & 1) == 0)
    {
      uint64_t v5 = [(EKUIListViewTimedEventCell *)self event];
      [(EKUIListViewTimedEventCell *)self Cal_annotateWithEvent:v5];

      uint64_t v6 = [(EKUIListViewTimedEventCell *)self isSelected];
      uint64_t v7 = [(EKUIListViewTimedEventCell *)self isHighlighted];
      [(EKUIListViewTimedEventCell *)self Cal_updateEntityAnnotationStateIsSelected:v6 isHighlighted:v7 isFocused:0 isDisabled:0 isEditing:0 isPrimary:0];
    }
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)EKUIListViewTimedEventCell;
  [(EKUIListViewTimedEventCell *)&v5 setSelected:a3 animated:a4];
  [(EKUIListViewTimedEventCell *)self _updateAppEntityAnnotationIfNeeded];
}

+ (id)pathForBackgroundForRect:(CGRect)a3 allDay:(BOOL)a4
{
  CGRect v7 = CGRectInset(a3, 12.0, 4.0);
  char v4 = (void *)MEMORY[0x1E4FB14C0];

  return (id)objc_msgSend(v4, "bezierPathWithRoundedRect:cornerRadius:", v7.origin.x, v7.origin.y, v7.size.width, v7.size.height, 8.0);
}

+ (UIEdgeInsets)adjustedSeparatorInsets
{
  double v2 = 0.0;
  double v3 = 12.0;
  double v4 = 0.0;
  double v5 = 12.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (EKEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_colorBarView, 0);
  objc_storeStrong((id *)&self->_textContentView, 0);
  objc_storeStrong((id *)&self->_bottomTimeField, 0);
  objc_storeStrong((id *)&self->_locationField, 0);
  objc_storeStrong((id *)&self->_locationImage, 0);
  objc_storeStrong((id *)&self->_locationLine, 0);
  objc_storeStrong((id *)&self->_topTimeField, 0);
  objc_storeStrong((id *)&self->_titleField, 0);
  objc_storeStrong((id *)&self->_titleLine, 0);
  objc_storeStrong((id *)&self->_travelDepartureTimeLabel, 0);
  objc_storeStrong((id *)&self->_travelTextLabel, 0);
  objc_storeStrong((id *)&self->_travelImage, 0);

  objc_storeStrong((id *)&self->_travelLine, 0);
}

@end