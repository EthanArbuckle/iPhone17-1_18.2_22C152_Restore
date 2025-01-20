@interface EKUIListViewAllDayEventCell
+ (UIEdgeInsets)adjustedSeparatorInsets;
+ (id)pathForBackgroundForRect:(CGRect)a3 allDay:(BOOL)a4;
- (EKEvent)event;
- (EKUIListViewAllDayEventCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)_subtextMonospacedFont;
- (id)_titleFont;
- (id)initForCarplayWithReuseIdentifier:(id)a3;
- (id)initForDragPreview;
- (int64_t)_userInterfaceStyle;
- (void)_adjustNumberOfLines;
- (void)_commonInit;
- (void)_updateAppEntityAnnotationIfNeeded;
- (void)_updateColors;
- (void)_updateTextAndIconColors;
- (void)layoutSubviews;
- (void)setEvent:(id)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)updateWithEvent:(id)a3 dimmed:(BOOL)a4;
@end

@implementation EKUIListViewAllDayEventCell

- (id)initForCarplayWithReuseIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EKUIListViewAllDayEventCell;
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
  v5.super_class = (Class)EKUIListViewAllDayEventCell;
  id v2 = [(EKUIListViewCell *)&v5 initForDragPreview];
  id v3 = v2;
  if (v2) {
    [v2 _commonInit];
  }
  return v3;
}

- (EKUIListViewAllDayEventCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)EKUIListViewAllDayEventCell;
  v4 = [(EKUIListViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  objc_super v5 = v4;
  if (v4) {
    [(EKUIListViewAllDayEventCell *)v4 _commonInit];
  }
  return v5;
}

- (void)_commonInit
{
  v84[12] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__adjustNumberOfLines name:*MEMORY[0x1E4FB27A8] object:0];

  v4 = [[EKUIListViewCellBackground alloc] initWithCornerRadius:0.0];
  backgroundView = self->_backgroundView;
  self->_backgroundView = v4;

  [(EKUIListViewCellBackground *)self->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v6 = [(EKUIListViewAllDayEventCell *)self contentView];
  [v6 addSubview:self->_backgroundView];

  objc_super v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  dateField = self->_dateField;
  self->_dateField = v7;

  [(UILabel *)self->_dateField setTranslatesAutoresizingMaskIntoConstraints:0];
  v9 = self->_dateField;
  v10 = [(EKUIListViewAllDayEventCell *)self _subtextMonospacedFont];
  [(UILabel *)v9 setFont:v10];

  LODWORD(v11) = 1148846080;
  [(UILabel *)self->_dateField setContentCompressionResistancePriority:0 forAxis:v11];
  v12 = [(EKUIListViewAllDayEventCell *)self contentView];
  [v12 addSubview:self->_dateField];

  v13 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
  imageView = self->_imageView;
  self->_imageView = v13;

  [(UIImageView *)self->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v15) = 1148846080;
  [(UIImageView *)self->_imageView setContentCompressionResistancePriority:0 forAxis:v15];
  LODWORD(v16) = 1148846080;
  [(UIImageView *)self->_imageView setContentCompressionResistancePriority:1 forAxis:v16];
  v17 = [(EKUIListViewAllDayEventCell *)self contentView];
  [v17 addSubview:self->_imageView];

  v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  titleField = self->_titleField;
  self->_titleField = v18;

  [(UILabel *)self->_titleField setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v20) = 1148846080;
  [(UILabel *)self->_titleField setContentCompressionResistancePriority:1 forAxis:v20];
  v21 = self->_titleField;
  v22 = [(EKUIListViewAllDayEventCell *)self _titleFont];
  [(UILabel *)v21 setFont:v22];

  v23 = [(EKUIListViewAllDayEventCell *)self contentView];
  [v23 addSubview:self->_titleField];

  v24 = [(UILabel *)self->_titleField leadingAnchor];
  v25 = [(UIImageView *)self->_imageView trailingAnchor];
  BOOL v26 = [(EKUIListViewCell *)self carplayMode];
  double v27 = 4.5;
  if (v26) {
    double v27 = 3.5;
  }
  v28 = [v24 constraintEqualToAnchor:v25 constant:v27];
  titleLeadingConstraint = self->_titleLeadingConstraint;
  self->_titleLeadingConstraint = v28;

  v71 = (void *)MEMORY[0x1E4F28DC8];
  v30 = [(EKUIListViewCellBackground *)self->_backgroundView leadingAnchor];
  v82 = v30;
  v83 = [(EKUIListViewAllDayEventCell *)self contentView];
  uint64_t v31 = [v83 leadingAnchor];
  v81 = (void *)v31;
  if ([(EKUIListViewCell *)self carplayMode]) {
    double v32 = 0.0;
  }
  else {
    double v32 = 12.0;
  }
  v80 = [v30 constraintEqualToAnchor:v31 constant:v32];
  v84[0] = v80;
  v33 = [(EKUIListViewCellBackground *)self->_backgroundView trailingAnchor];
  v78 = v33;
  v79 = [(EKUIListViewAllDayEventCell *)self contentView];
  uint64_t v34 = [v79 trailingAnchor];
  v77 = (void *)v34;
  if ([(EKUIListViewCell *)self carplayMode]) {
    double v35 = 0.0;
  }
  else {
    double v35 = 12.0;
  }
  v76 = [v33 constraintEqualToAnchor:v34 constant:-v35];
  v84[1] = v76;
  v36 = [(EKUIListViewCellBackground *)self->_backgroundView topAnchor];
  v74 = v36;
  v75 = [(EKUIListViewAllDayEventCell *)self contentView];
  uint64_t v37 = [v75 topAnchor];
  v73 = (void *)v37;
  if ([(EKUIListViewCell *)self carplayMode]) {
    double v38 = 0.0;
  }
  else {
    double v38 = 4.0;
  }
  v72 = [v36 constraintEqualToAnchor:v37 constant:v38];
  v84[2] = v72;
  v39 = [(EKUIListViewCellBackground *)self->_backgroundView bottomAnchor];
  v69 = v39;
  v70 = [(EKUIListViewAllDayEventCell *)self contentView];
  uint64_t v40 = [v70 bottomAnchor];
  v68 = (void *)v40;
  if ([(EKUIListViewCell *)self carplayMode]) {
    double v41 = 0.0;
  }
  else {
    double v41 = 4.0;
  }
  v67 = [v39 constraintEqualToAnchor:v40 constant:-v41];
  v84[3] = v67;
  v66 = [(UIImageView *)self->_imageView centerYAnchor];
  v65 = [(UILabel *)self->_titleField centerYAnchor];
  v64 = [v66 constraintEqualToAnchor:v65];
  v84[4] = v64;
  v63 = [(UIImageView *)self->_imageView leadingAnchor];
  v62 = [(EKUIListViewCellBackground *)self->_backgroundView leadingAnchor];
  v61 = [v63 constraintEqualToAnchor:v62 constant:6.5];
  v84[5] = v61;
  v60 = [(UILabel *)self->_titleField topAnchor];
  v59 = [(EKUIListViewCellBackground *)self->_backgroundView topAnchor];
  v58 = [v60 constraintEqualToAnchor:v59 constant:8.0];
  v84[6] = v58;
  v57 = [(UILabel *)self->_titleField bottomAnchor];
  v56 = [(EKUIListViewCellBackground *)self->_backgroundView bottomAnchor];
  v55 = [v57 constraintEqualToAnchor:v56 constant:-8.0];
  v84[7] = v55;
  v42 = [(UILabel *)self->_titleField trailingAnchor];
  v43 = [(UILabel *)self->_dateField leadingAnchor];
  BOOL v44 = [(EKUIListViewCell *)self carplayMode];
  double v45 = 6.0;
  if (v44) {
    double v45 = 5.0;
  }
  v46 = [v42 constraintLessThanOrEqualToAnchor:v43 constant:-v45];
  v47 = self->_titleLeadingConstraint;
  v84[8] = v46;
  v84[9] = v47;
  v48 = [(UILabel *)self->_dateField firstBaselineAnchor];
  v49 = [(UILabel *)self->_titleField firstBaselineAnchor];
  v50 = [v48 constraintEqualToAnchor:v49];
  v84[10] = v50;
  v51 = [(UILabel *)self->_dateField trailingAnchor];
  v52 = [(EKUIListViewCellBackground *)self->_backgroundView trailingAnchor];
  v53 = [v51 constraintEqualToAnchor:v52 constant:-8.0];
  v84[11] = v53;
  v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:12];
  [v71 activateConstraints:v54];
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)EKUIListViewAllDayEventCell;
  [(EKUITableViewCell *)&v9 layoutSubviews];
  id v3 = [(EKUIListViewAllDayEventCell *)self layer];
  uint64_t v4 = [v3 mask];
  if (v4)
  {
    objc_super v5 = (void *)v4;
  }
  else
  {
    BOOL v6 = [(EKUIListViewCell *)self carplayMode];

    if (!v6) {
      return;
    }
    id v3 = [MEMORY[0x1E4F39BE8] layer];
    id v7 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:1.0];
    objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(v7, "CGColor"));

    v8 = [(EKUIListViewAllDayEventCell *)self layer];
    [v8 bounds];
    objc_msgSend(v3, "setFrame:");

    objc_super v5 = [(EKUIListViewAllDayEventCell *)self layer];
    [v5 setMask:v3];
  }
}

- (void)_adjustNumberOfLines
{
  id v3 = [(EKUIListViewAllDayEventCell *)self contentView];
  uint64_t v4 = [v3 traitCollection];
  BOOL v5 = EKUIUsesLargeTextLayout(v4);

  [(UIImageView *)self->_imageView setHidden:v5];
  [(UILabel *)self->_dateField setNumberOfLines:v5 ^ 1];
  [(UILabel *)self->_titleField setNumberOfLines:v5 ^ 1];
  [(NSLayoutConstraint *)self->_titleLeadingConstraint setActive:0];
  BOOL v6 = [(UILabel *)self->_titleField leadingAnchor];
  if (!v5)
  {
    id v7 = [(UIImageView *)self->_imageView trailingAnchor];
    BOOL v9 = [(EKUIListViewCell *)self carplayMode];
    double v8 = 4.5;
    if (v9) {
      double v8 = 3.5;
    }
  }
  else
  {
    id v7 = [(EKUIListViewCellBackground *)self->_backgroundView leadingAnchor];
    double v8 = 8.0;
  }
  v10 = [v6 constraintEqualToAnchor:v7 constant:v8];
  titleLeadingConstraint = self->_titleLeadingConstraint;
  self->_titleLeadingConstraint = v10;

  v12 = self->_titleLeadingConstraint;

  [(NSLayoutConstraint *)v12 setActive:1];
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)EKUIListViewAllDayEventCell;
  [(EKUIListViewAllDayEventCell *)&v5 setHighlighted:a3 animated:a4];
  [(EKUIListViewAllDayEventCell *)self _updateAppEntityAnnotationIfNeeded];
  [(EKUIListViewAllDayEventCell *)self _updateColors];
}

- (void)updateWithEvent:(id)a3 dimmed:(BOOL)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(EKUIListViewAllDayEventCell *)self setEvent:v6];
  [(EKUIListViewAllDayEventCell *)self _updateAppEntityAnnotationIfNeeded];
  if (v6)
  {
    self->_dimmed = a4;
    if ([(EKUIListViewCell *)self carplayMode]) {
      [(EKUIListViewAllDayEventCell *)self setSelectionStyle:0];
    }
    uint64_t v7 = [v6 status];
    unsigned int v8 = CUIKEventDisplaysAsDeclined();
    if (v7 == 3) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v8;
    }
    id v10 = objc_alloc(MEMORY[0x1E4F28B18]);
    double v11 = CUIKDisplayedTitleForEvent();
    uint64_t v12 = *MEMORY[0x1E4FB0768];
    uint64_t v35 = *MEMORY[0x1E4FB0768];
    v13 = [NSNumber numberWithInteger:v9];
    v36[0] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    double v15 = (void *)[v10 initWithString:v11 attributes:v14];
    [(UILabel *)self->_titleField setAttributedText:v15];

    double v16 = (void *)MEMORY[0x1E4FB1818];
    v17 = objc_msgSend(v6, "CUIK_symbolName:", objc_msgSend(v6, "isAllDay"));
    v18 = [v16 systemImageNamed:v17];
    [(UIImageView *)self->_imageView setImage:v18];

    if ([(EKUIListViewCell *)self dragPreview])
    {
      id v19 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      [v19 setDateStyle:1];
      double v20 = [(EKUIListViewAllDayEventCell *)self event];
      objc_msgSend(v19, "setTimeStyle:", objc_msgSend(v20, "isAllDay") ^ 1);

      v21 = [(EKUIListViewAllDayEventCell *)self event];
      v22 = [v21 startDate];
      v23 = [v19 stringFromDate:v22];

      id v24 = objc_alloc(MEMORY[0x1E4F28B18]);
      uint64_t v33 = v12;
      v25 = [NSNumber numberWithInteger:v9];
      uint64_t v34 = v25;
      BOOL v26 = (void *)MEMORY[0x1E4F1C9E8];
      double v27 = &v34;
      v28 = &v33;
    }
    else
    {
      id v24 = objc_alloc(MEMORY[0x1E4F28B18]);
      EventKitUIBundle();
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      v23 = [v19 localizedStringForKey:@"all-day" value:&stru_1F0CC2140 table:0];
      uint64_t v31 = v12;
      v25 = [NSNumber numberWithInteger:v9];
      double v32 = v25;
      BOOL v26 = (void *)MEMORY[0x1E4F1C9E8];
      double v27 = &v32;
      v28 = &v31;
    }
    v29 = [v26 dictionaryWithObjects:v27 forKeys:v28 count:1];
    v30 = (void *)[v24 initWithString:v23 attributes:v29];
    [(UILabel *)self->_dateField setAttributedText:v30];

    [(EKUIListViewAllDayEventCell *)self _updateColors];
  }
}

- (void)_updateColors
{
  id v3 = [(EKUIListViewAllDayEventCell *)self traitCollection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__EKUIListViewAllDayEventCell__updateColors__block_invoke;
  v4[3] = &unk_1E6087570;
  v4[4] = self;
  [v3 performAsCurrentTraitCollection:v4];
}

void __44__EKUIListViewAllDayEventCell__updateColors__block_invoke(uint64_t a1)
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) event];
  HIDWORD(v24) = [v2 status] == 3;

  id v3 = [*(id *)(a1 + 32) event];
  LODWORD(v24) = CUIKEventDisplaysAsDeclined();

  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "event", v24);
  objc_super v5 = [v4 calendar];
  id v6 = [v5 displayColor];
  uint64_t v7 = [*(id *)(a1 + 32) traitCollection];
  [v7 userInterfaceStyle];
  unsigned int v8 = [*(id *)(a1 + 32) event];
  [v8 needsResponse];
  uint64_t v9 = [*(id *)(a1 + 32) event];
  [v9 isReminderIntegrationEvent];
  [*(id *)(a1 + 32) isSelected];
  id v10 = CUIKColorBarColor();

  if (*(unsigned char *)(*(void *)(a1 + 32) + 1120))
  {
    uint64_t v11 = objc_msgSend(v10, "cuik_colorWithAlphaScaled:", *MEMORY[0x1E4F57AA8]);

    id v10 = (void *)v11;
  }
  uint64_t v12 = (void *)MEMORY[0x1E4FB1830];
  v13 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  v25[0] = v13;
  v25[1] = v10;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  double v15 = [v12 configurationWithPaletteColors:v14];
  double v16 = (void *)MEMORY[0x1E4FB1830];
  v17 = [*(id *)(a1 + 32) _titleFont];
  [v17 pointSize];
  id v19 = [v16 configurationWithPointSize:4 weight:2 scale:v18 + 3.0];
  double v20 = [v15 configurationByApplyingConfiguration:v19];
  [*(id *)(*(void *)(a1 + 32) + 1104) setPreferredSymbolConfiguration:v20];

  [*(id *)(a1 + 32) _updateTextAndIconColors];
  v21 = *(void **)(a1 + 32);
  v22 = (void *)v21[137];
  v23 = [v21 event];
  objc_msgSend(v22, "updateBackgroundColorForEvent:highlighted:dimmed:carplayMode:dragPreview:", v23, objc_msgSend(*(id *)(a1 + 32), "isHighlighted"), *(unsigned __int8 *)(*(void *)(a1 + 32) + 1120), objc_msgSend(*(id *)(a1 + 32), "carplayMode"), objc_msgSend(*(id *)(a1 + 32), "dragPreview"));
}

- (int64_t)_userInterfaceStyle
{
  id v2 = [(EKUIListViewAllDayEventCell *)self traitCollection];
  int64_t v3 = [v2 userInterfaceStyle];

  return v3;
}

- (void)_updateTextAndIconColors
{
  if ([(EKUIListViewCell *)self carplayMode]
    && [(EKUIListViewAllDayEventCell *)self isHighlighted])
  {
    uint64_t v3 = [MEMORY[0x1E4FB1618] _carSystemFocusLabelColor];
  }
  else
  {
    uint64_t v4 = [(EKUIListViewAllDayEventCell *)self event];
    uint64_t v5 = [v4 status];

    id v6 = [(EKUIListViewAllDayEventCell *)self event];
    int v7 = CUIKEventDisplaysAsDeclined();

    if (v5 == 3 || v7)
    {
      uint64_t v3 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    }
    else
    {
      if ([(EKUIListViewCell *)self dragPreview])
      {
        [(EKUIListViewAllDayEventCell *)self _userInterfaceStyle];
        unsigned int v8 = [(EKUIListViewAllDayEventCell *)self event];
        uint64_t v9 = [v8 calendar];
        id v10 = [v9 displayColor];
        CUIKTextColorForCalendarColorForStyle();
        id v13 = (id)objc_claimAutoreleasedReturnValue();

        uint64_t v11 = v13;
        goto LABEL_11;
      }
      uint64_t v3 = [MEMORY[0x1E4FB1618] labelColor];
    }
  }
  uint64_t v11 = (void *)v3;
LABEL_11:
  if (self->_dimmed)
  {
    id v14 = v11;
    uint64_t v12 = objc_msgSend(v11, "cuik_colorWithAlphaScaled:", *MEMORY[0x1E4F57AA8]);

    uint64_t v11 = (void *)v12;
  }
  id v15 = v11;
  [(UILabel *)self->_titleField setTextColor:v11];
  [(UILabel *)self->_dateField setTextColor:v15];
}

- (id)_titleFont
{
  return (id)[MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28C8] addingSymbolicTraits:2];
}

- (id)_subtextMonospacedFont
{
  uint64_t v2 = *MEMORY[0x1E4FB2950];
  uint64_t v3 = *MEMORY[0x1E4FB2780];
  uint64_t v4 = [(EKUIListViewAllDayEventCell *)self traitCollection];
  uint64_t v5 = +[EKUIConstrainedFontUtilities constrainedFontForTextStyle:v2 maximumContentSizeCategory:v3 traitCollection:v4];

  id v6 = (void *)MEMORY[0x1E4FB08E0];
  [v5 pointSize];
  int v7 = objc_msgSend(v6, "monospacedDigitSystemFontOfSize:weight:");

  return v7;
}

- (void)_updateAppEntityAnnotationIfNeeded
{
  if (CalendarLinkLibraryCore())
  {
    id v8 = [(EKUIListViewAllDayEventCell *)self event];
    if ([v8 isNew])
    {
    }
    else
    {
      uint64_t v3 = [(EKUIListViewAllDayEventCell *)self event];
      char v4 = [v3 isBirthday];

      if ((v4 & 1) == 0)
      {
        uint64_t v5 = [(EKUIListViewAllDayEventCell *)self event];
        [(EKUIListViewAllDayEventCell *)self Cal_annotateWithEvent:v5];

        uint64_t v6 = [(EKUIListViewAllDayEventCell *)self isSelected];
        uint64_t v7 = [(EKUIListViewAllDayEventCell *)self isHighlighted];
        [(EKUIListViewAllDayEventCell *)self Cal_updateEntityAnnotationStateIsSelected:v6 isHighlighted:v7 isFocused:0 isDisabled:0 isEditing:0 isPrimary:0];
      }
    }
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)EKUIListViewAllDayEventCell;
  [(EKUIListViewAllDayEventCell *)&v5 setSelected:a3 animated:a4];
  [(EKUIListViewAllDayEventCell *)self _updateAppEntityAnnotationIfNeeded];
}

+ (id)pathForBackgroundForRect:(CGRect)a3 allDay:(BOOL)a4
{
  CGRect v12 = CGRectInset(a3, 12.0, 4.0);
  double x = v12.origin.x;
  double y = v12.origin.y;
  double width = v12.size.width;
  double height = v12.size.height;
  id v8 = (void *)MEMORY[0x1E4FB14C0];
  double v9 = CGRectGetHeight(v12) * 0.5;

  return (id)objc_msgSend(v8, "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v9);
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
  objc_storeStrong((id *)&self->_titleLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_dateField, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_storeStrong((id *)&self->_titleField, 0);
}

@end