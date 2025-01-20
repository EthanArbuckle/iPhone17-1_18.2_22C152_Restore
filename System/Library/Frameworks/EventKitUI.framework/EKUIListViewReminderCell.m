@interface EKUIListViewReminderCell
+ (UIEdgeInsets)adjustedSeparatorInsets;
+ (id)pathForBackgroundForRect:(CGRect)a3 allDay:(BOOL)a4;
- (EKEvent)event;
- (EKUIListViewReminderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (EKUIListViewReminderCellDelegate)delegate;
- (id)_subtextMonospacedFont;
- (id)_titleFont;
- (id)initForCarplayWithReuseIdentifier:(id)a3;
- (id)initForDragPreview;
- (void)_adjustNumberOfLines;
- (void)_circleButtonPressed;
- (void)_commonInit;
- (void)_updateBackgroundColor;
- (void)_updateColors;
- (void)_updateTextAndIconColors;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setEvent:(id)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)updateWithEvent:(id)a3 dimmed:(BOOL)a4;
@end

@implementation EKUIListViewReminderCell

- (id)initForCarplayWithReuseIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EKUIListViewReminderCell;
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
  v5.super_class = (Class)EKUIListViewReminderCell;
  id v2 = [(EKUIListViewCell *)&v5 initForDragPreview];
  id v3 = v2;
  if (v2) {
    [v2 _commonInit];
  }
  return v3;
}

- (EKUIListViewReminderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)EKUIListViewReminderCell;
  v4 = [(EKUIListViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  objc_super v5 = v4;
  if (v4) {
    [(EKUIListViewReminderCell *)v4 _commonInit];
  }
  return v5;
}

- (void)_commonInit
{
  v85[12] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__adjustNumberOfLines name:*MEMORY[0x1E4FB27A8] object:0];

  v4 = objc_alloc_init(EKUIViewWithCornerRadius);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v4;

  [(EKUIViewWithCornerRadius *)self->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(EKUIListViewReminderCell *)self _updateBackgroundColor];
  objc_super v6 = [(EKUIListViewReminderCell *)self contentView];
  [v6 addSubview:self->_backgroundView];

  objc_super v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  timeField = self->_timeField;
  self->_timeField = v7;

  [(UILabel *)self->_timeField setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v9) = 1148846080;
  [(UILabel *)self->_timeField setContentCompressionResistancePriority:0 forAxis:v9];
  v10 = [(EKUIListViewReminderCell *)self contentView];
  [v10 addSubview:self->_timeField];

  v11 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
  circleIcon = self->_circleIcon;
  self->_circleIcon = v11;

  [(UIImageView *)self->_circleIcon setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v13) = 1148846080;
  [(UIImageView *)self->_circleIcon setContentCompressionResistancePriority:0 forAxis:v13];
  LODWORD(v14) = 1148846080;
  [(UIImageView *)self->_circleIcon setContentCompressionResistancePriority:1 forAxis:v14];
  v15 = [(EKUIListViewReminderCell *)self contentView];
  [v15 addSubview:self->_circleIcon];

  if (![(EKUIListViewCell *)self carplayMode])
  {
    v16 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__circleButtonPressed];
    [(UIImageView *)self->_circleIcon setUserInteractionEnabled:1];
    [(UIImageView *)self->_circleIcon addGestureRecognizer:v16];
  }
  v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  titleField = self->_titleField;
  self->_titleField = v17;

  [(UILabel *)self->_titleField setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v19) = 1148846080;
  [(UILabel *)self->_titleField setContentCompressionResistancePriority:1 forAxis:v19];
  v20 = self->_titleField;
  v21 = [(EKUIListViewReminderCell *)self _titleFont];
  [(UILabel *)v20 setFont:v21];

  v22 = [(EKUIListViewReminderCell *)self contentView];
  [v22 addSubview:self->_titleField];

  v71 = (void *)MEMORY[0x1E4F28DC8];
  v23 = [(EKUIViewWithCornerRadius *)self->_backgroundView leadingAnchor];
  v83 = v23;
  v84 = [(EKUIListViewReminderCell *)self contentView];
  uint64_t v24 = [v84 leadingAnchor];
  v82 = (void *)v24;
  if ([(EKUIListViewCell *)self carplayMode]) {
    double v25 = 0.0;
  }
  else {
    double v25 = 12.0;
  }
  v81 = [v23 constraintEqualToAnchor:v24 constant:v25];
  v85[0] = v81;
  v26 = [(EKUIViewWithCornerRadius *)self->_backgroundView trailingAnchor];
  v79 = v26;
  v80 = [(EKUIListViewReminderCell *)self contentView];
  uint64_t v27 = [v80 trailingAnchor];
  v78 = (void *)v27;
  if ([(EKUIListViewCell *)self carplayMode]) {
    double v28 = 0.0;
  }
  else {
    double v28 = 12.0;
  }
  v77 = [v26 constraintEqualToAnchor:v27 constant:-v28];
  v85[1] = v77;
  v29 = [(EKUIViewWithCornerRadius *)self->_backgroundView topAnchor];
  v75 = v29;
  v76 = [(EKUIListViewReminderCell *)self contentView];
  uint64_t v30 = [v76 topAnchor];
  v74 = (void *)v30;
  if ([(EKUIListViewCell *)self carplayMode]) {
    double v31 = 0.0;
  }
  else {
    double v31 = 4.0;
  }
  v73 = [v29 constraintEqualToAnchor:v30 constant:v31];
  v85[2] = v73;
  v32 = [(EKUIViewWithCornerRadius *)self->_backgroundView bottomAnchor];
  v70 = v32;
  v72 = [(EKUIListViewReminderCell *)self contentView];
  uint64_t v33 = [v72 bottomAnchor];
  v69 = (void *)v33;
  if ([(EKUIListViewCell *)self carplayMode]) {
    double v34 = 0.0;
  }
  else {
    double v34 = 4.0;
  }
  v68 = [v32 constraintEqualToAnchor:v33 constant:-v34];
  v85[3] = v68;
  v67 = [(UIImageView *)self->_circleIcon centerYAnchor];
  v66 = [(UILabel *)self->_titleField centerYAnchor];
  v65 = [v67 constraintEqualToAnchor:v66];
  v85[4] = v65;
  v64 = [(UIImageView *)self->_circleIcon leadingAnchor];
  v63 = [(EKUIViewWithCornerRadius *)self->_backgroundView leadingAnchor];
  v62 = [v64 constraintEqualToAnchor:v63 constant:6.5];
  v85[5] = v62;
  v61 = [(UILabel *)self->_titleField topAnchor];
  v60 = [(EKUIViewWithCornerRadius *)self->_backgroundView topAnchor];
  v59 = [v61 constraintEqualToAnchor:v60 constant:8.0];
  v85[6] = v59;
  v35 = [(UILabel *)self->_titleField leadingAnchor];
  v58 = v35;
  uint64_t v36 = [(UIImageView *)self->_circleIcon trailingAnchor];
  v57 = (void *)v36;
  BOOL v37 = [(EKUIListViewCell *)self carplayMode];
  double v38 = 4.5;
  if (v37) {
    double v38 = 3.5;
  }
  v56 = [v35 constraintEqualToAnchor:v36 constant:v38];
  v85[7] = v56;
  v39 = [(UILabel *)self->_titleField trailingAnchor];
  v55 = v39;
  uint64_t v40 = [(UILabel *)self->_timeField leadingAnchor];
  v54 = (void *)v40;
  BOOL v41 = [(EKUIListViewCell *)self carplayMode];
  double v42 = 6.0;
  if (v41) {
    double v42 = 5.0;
  }
  v53 = [v39 constraintLessThanOrEqualToAnchor:v40 constant:-v42];
  v85[8] = v53;
  v43 = [(UILabel *)self->_titleField bottomAnchor];
  v44 = [(EKUIViewWithCornerRadius *)self->_backgroundView bottomAnchor];
  v45 = [v43 constraintEqualToAnchor:v44 constant:-8.0];
  v85[9] = v45;
  v46 = [(UILabel *)self->_timeField firstBaselineAnchor];
  v47 = [(UILabel *)self->_titleField firstBaselineAnchor];
  v48 = [v46 constraintEqualToAnchor:v47];
  v85[10] = v48;
  v49 = [(UILabel *)self->_timeField trailingAnchor];
  v50 = [(EKUIViewWithCornerRadius *)self->_backgroundView trailingAnchor];
  v51 = [v49 constraintEqualToAnchor:v50 constant:-8.0];
  v85[11] = v51;
  v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:12];
  [v71 activateConstraints:v52];
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)EKUIListViewReminderCell;
  [(EKUITableViewCell *)&v9 layoutSubviews];
  id v3 = [(EKUIListViewReminderCell *)self layer];
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

    v8 = [(EKUIListViewReminderCell *)self layer];
    [v8 bounds];
    objc_msgSend(v3, "setFrame:");

    objc_super v5 = [(EKUIListViewReminderCell *)self layer];
    [v5 setMask:v3];
  }
}

- (void)_adjustNumberOfLines
{
  id v3 = [(EKUIListViewReminderCell *)self contentView];
  uint64_t v4 = [v3 traitCollection];
  BOOL v5 = !EKUIUsesLargeTextLayout(v4);

  [(UILabel *)self->_timeField setNumberOfLines:v5];
  titleField = self->_titleField;

  [(UILabel *)titleField setNumberOfLines:v5];
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)EKUIListViewReminderCell;
  [(EKUIListViewReminderCell *)&v5 setHighlighted:a3 animated:a4];
  [(EKUIListViewReminderCell *)self _updateColors];
}

- (void)_circleButtonPressed
{
  id v3 = [(EKUIListViewReminderCell *)self event];
  int v4 = objc_msgSend(v3, "CUIK_reminderShouldBeEditable");

  if (v4)
  {
    objc_super v5 = [(EKUIListViewReminderCell *)self delegate];
    [v5 eventIconButtonPressed:self];

    id v6 = [(EKUIListViewReminderCell *)self event];
    [(EKUIListViewReminderCell *)self updateWithEvent:v6 dimmed:self->_dimmed];
  }
}

- (void)updateWithEvent:(id)a3 dimmed:(BOOL)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(EKUIListViewReminderCell *)self setEvent:v6];
  if (v6)
  {
    self->_dimmed = a4;
    if ([(EKUIListViewCell *)self carplayMode]) {
      [(EKUIListViewReminderCell *)self setSelectionStyle:0];
    }
    id v7 = [v6 title];
    [(UILabel *)self->_titleField setText:v7];

    v8 = (void *)MEMORY[0x1E4FB1818];
    objc_super v9 = [(EKUIListViewReminderCell *)self event];
    v10 = [(EKUIListViewReminderCell *)self event];
    v11 = objc_msgSend(v9, "CUIK_symbolName:", objc_msgSend(v10, "isAllDay"));
    v12 = [v8 systemImageNamed:v11];
    [(UIImageView *)self->_circleIcon setImage:v12];

    double v13 = [(EKUIListViewReminderCell *)self traitCollection];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __51__EKUIListViewReminderCell_updateWithEvent_dimmed___block_invoke;
    v30[3] = &unk_1E6087570;
    v30[4] = self;
    [v13 performAsCurrentTraitCollection:v30];

    if ([(EKUIListViewCell *)self dragPreview])
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      [v14 setDateStyle:1];
      v15 = [(EKUIListViewReminderCell *)self event];
      objc_msgSend(v14, "setTimeStyle:", objc_msgSend(v15, "isAllDay") ^ 1);

      v16 = [(EKUIListViewReminderCell *)self event];
      v17 = [v16 startDate];
      v18 = [v14 stringFromDate:v17];

      [(UILabel *)self->_timeField setText:v18];
    }
    else
    {
      double v19 = [(EKUIListViewReminderCell *)self event];
      int v20 = [v19 isAllDay];

      if (v20)
      {
        id v21 = objc_alloc(MEMORY[0x1E4F28B18]);
        EventKitUIBundle();
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        v18 = [v14 localizedStringForKey:@"all-day" value:&stru_1F0CC2140 table:0];
        uint64_t v31 = *MEMORY[0x1E4FB06F8];
        v22 = [(EKUIListViewReminderCell *)self _subtextMonospacedFont];
        v32[0] = v22;
        v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
        uint64_t v24 = [v21 initWithString:v18 attributes:v23];
      }
      else
      {
        double v25 = (void *)MEMORY[0x1E4F57C50];
        id v14 = [(EKUIListViewReminderCell *)self event];
        v18 = [v14 startDate];
        v22 = CUIKCalendar();
        v23 = [(EKUIListViewReminderCell *)self _subtextMonospacedFont];
        uint64_t v24 = [v25 timeAttributedTextWithDate:v18 calendar:v22 font:v23 options:16];
      }
      v26 = (void *)v24;
      [(UILabel *)self->_timeField setAttributedText:v24];
    }
    uint64_t v27 = [(EKUIListViewReminderCell *)self event];
    int v28 = [v27 isAllDay];

    double v29 = 8.0;
    if (v28) {
      double v29 = 0.0;
    }
    [(EKUIViewWithCornerRadius *)self->_backgroundView setCornerRadius:v29];
    [(EKUIListViewReminderCell *)self _updateColors];
    if (CalendarLinkLibraryCore()) {
      [(EKUIListViewReminderCell *)self Cal_annotateWithEvent:v6];
    }
  }
}

void __51__EKUIListViewReminderCell_updateWithEvent_dimmed___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4FB1830];
  id v5 = [*(id *)(a1 + 32) _titleFont];
  [v5 pointSize];
  int v4 = [v2 configurationWithPointSize:7 weight:2 scale:v3 + 2.0];
  [*(id *)(*(void *)(a1 + 32) + 1104) setPreferredSymbolConfiguration:v4];
}

- (void)_updateColors
{
  double v3 = [(EKUIListViewReminderCell *)self traitCollection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__EKUIListViewReminderCell__updateColors__block_invoke;
  v4[3] = &unk_1E6087570;
  v4[4] = self;
  [v3 performAsCurrentTraitCollection:v4];
}

void __41__EKUIListViewReminderCell__updateColors__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) carplayMode]
    && [*(id *)(a1 + 32) isHighlighted])
  {
    uint64_t v2 = [MEMORY[0x1E4FB1618] _carSystemFocusPrimaryColor];
  }
  else
  {
    double v3 = [*(id *)(a1 + 32) event];
    char v4 = objc_msgSend(v3, "CUIK_reminderShouldBeEditable");

    if (v4)
    {
      id v5 = [*(id *)(a1 + 32) event];
      objc_msgSend(v5, "CUIK_symbolColor");
      id v9 = (id)objc_claimAutoreleasedReturnValue();

      id v6 = v9;
      goto LABEL_8;
    }
    uint64_t v2 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  }
  id v6 = (void *)v2;
LABEL_8:
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v7 + 1120))
  {
    id v10 = v6;
    uint64_t v8 = objc_msgSend(v6, "cuik_colorWithAlphaScaled:", *MEMORY[0x1E4F57AA8]);

    uint64_t v7 = *(void *)(a1 + 32);
    id v6 = (void *)v8;
  }
  id v11 = v6;
  [*(id *)(v7 + 1104) setTintColor:v6];
  [*(id *)(a1 + 32) _updateTextAndIconColors];
  [*(id *)(a1 + 32) _updateBackgroundColor];
}

- (void)_updateBackgroundColor
{
  id v9 = [MEMORY[0x1E4FB1618] whiteColor];
  double v3 = [(EKUIListViewReminderCell *)self traitCollection];
  [v3 userInterfaceStyle];
  char v4 = CUIKAdjustedColorForColor();

  id v5 = [(EKUIListViewReminderCell *)self traitCollection];
  [v5 userInterfaceStyle];
  id v6 = CUIKBackgroundColorForCalendarColorWithOpaqueForStyle();

  if ([(EKUIListViewCell *)self carplayMode])
  {
    if ([(EKUIListViewReminderCell *)self isHighlighted])
    {
      id v7 = [MEMORY[0x1E4FB1618] _carSystemFocusColor];
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  if ([(EKUIListViewCell *)self dragPreview])
  {
LABEL_5:
    id v7 = v6;
    goto LABEL_7;
  }
  id v7 = [MEMORY[0x1E4FB1618] clearColor];
LABEL_7:
  uint64_t v8 = v7;
  [(EKUIViewWithCornerRadius *)self->_backgroundView setBackgroundColor:v7];
}

- (void)_updateTextAndIconColors
{
  if ([(EKUIListViewCell *)self carplayMode]
    && [(EKUIListViewReminderCell *)self isHighlighted])
  {
    uint64_t v3 = [MEMORY[0x1E4FB1618] _carSystemFocusLabelColor];
LABEL_6:
    id v6 = (void *)v3;
    goto LABEL_11;
  }
  char v4 = [(EKUIListViewReminderCell *)self event];
  int v5 = [v4 completed];

  if (v5)
  {
    uint64_t v3 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    goto LABEL_6;
  }
  id v7 = [(EKUIListViewReminderCell *)self event];
  if (objc_msgSend(v7, "CUIK_reminderShouldBeEditable")) {
    [MEMORY[0x1E4FB1618] labelColor];
  }
  else {
  id v9 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  }

  id v6 = v9;
LABEL_11:
  if (self->_dimmed)
  {
    id v10 = v6;
    uint64_t v8 = objc_msgSend(v6, "cuik_colorWithAlphaScaled:", *MEMORY[0x1E4F57AA8]);

    id v6 = (void *)v8;
  }
  id v11 = v6;
  [(UILabel *)self->_titleField setTextColor:v6];
  [(UILabel *)self->_timeField setTextColor:v11];
}

- (id)_titleFont
{
  return (id)[MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28C8] addingSymbolicTraits:2];
}

- (id)_subtextMonospacedFont
{
  uint64_t v2 = *MEMORY[0x1E4FB2950];
  uint64_t v3 = *MEMORY[0x1E4FB2780];
  char v4 = [(EKUIListViewReminderCell *)self traitCollection];
  int v5 = +[EKUIConstrainedFontUtilities constrainedFontForTextStyle:v2 maximumContentSizeCategory:v3 traitCollection:v4];

  id v6 = (void *)MEMORY[0x1E4FB08E0];
  [v5 pointSize];
  id v7 = objc_msgSend(v6, "monospacedDigitSystemFontOfSize:weight:");

  return v7;
}

+ (id)pathForBackgroundForRect:(CGRect)a3 allDay:(BOOL)a4
{
  BOOL v4 = a4;
  CGRect v13 = CGRectInset(a3, 12.0, 4.0);
  double x = v13.origin.x;
  double y = v13.origin.y;
  double width = v13.size.width;
  double height = v13.size.height;
  double v9 = 8.0;
  if (v4) {
    double v9 = CGRectGetHeight(v13) * 0.5;
  }
  id v10 = (void *)MEMORY[0x1E4FB14C0];

  return (id)objc_msgSend(v10, "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v9);
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

- (EKUIListViewReminderCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKUIListViewReminderCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
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
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timeField, 0);
  objc_storeStrong((id *)&self->_circleIcon, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_storeStrong((id *)&self->_titleField, 0);
}

@end