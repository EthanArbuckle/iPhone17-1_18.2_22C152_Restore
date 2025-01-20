@interface MFSendLaterHeaderCollectionViewCell
+ (NSString)reusableIdentifier;
- (MFSendLaterHeaderCollectionViewCell)initWithFrame:(CGRect)a3;
- (MFSendLaterHeaderCollectionViewCellDelegate)delegate;
- (MFSendLaterHeaderCollectionViewHelper)viewHelper;
- (UIDatePicker)datePicker;
- (UIStackView)stackView;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (int64_t)currentVisibleComponent;
- (void)_datePicker:(id)a3 didSelectComponent:(int64_t)a4;
- (void)_updateLabelAndDatePickerOrientation;
- (void)layoutMarginsDidChange;
- (void)setCurrentVisibleComponent:(int64_t)a3;
- (void)setDatePicker:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setStackView:(id)a3;
- (void)setViewHelper:(id)a3;
- (void)updateActiveComponent:(int64_t)a3;
- (void)updateWithDate:(id)a3 timeZone:(id)a4;
@end

@implementation MFSendLaterHeaderCollectionViewCell

+ (NSString)reusableIdentifier
{
  return (NSString *)@"MFSendLaterHeaderCollectionViewCellIdentifier";
}

- (MFSendLaterHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  double width = a3.size.width;
  v50[2] = *MEMORY[0x1E4F143B8];
  v48.receiver = self;
  v48.super_class = (Class)MFSendLaterHeaderCollectionViewCell;
  v4 = -[MFSendLaterHeaderCollectionViewCell initWithFrame:](&v48, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    v5 = [MFSendLaterHeaderCollectionViewHelper alloc];
    [(MFSendLaterHeaderCollectionViewCell *)v4 layoutMargins];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    v14 = [(MFSendLaterHeaderCollectionViewCell *)v4 window];
    v15 = [v14 screen];
    [v15 scale];
    v17 = -[MFSendLaterHeaderCollectionViewHelper initWithWidth:layoutMargins:viewScale:](v5, "initWithWidth:layoutMargins:viewScale:", width, v7, v9, v11, v13, v16);
    [(MFSendLaterHeaderCollectionViewCell *)v4 setViewHelper:v17];

    id v18 = objc_alloc(MEMORY[0x1E4FB1930]);
    v47 = objc_msgSend(v18, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v19 = _EFLocalizedString();
    [v47 setText:v19];

    v20 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [v47 setFont:v20];

    [v47 setAdjustsFontForContentSizeCategory:1];
    id v46 = objc_alloc_init(MEMORY[0x1E4FB16B0]);
    [v46 _setCompactStyleDelegate:v4];
    [v46 setPreferredDatePickerStyle:2];
    [v46 setDatePickerMode:2];
    [(MFSendLaterHeaderCollectionViewCell *)v4 setCurrentVisibleComponent:1];
    objc_msgSend(v46, "_compactStyleSetActiveComponent:", -[MFSendLaterHeaderCollectionViewCell currentVisibleComponent](v4, "currentVisibleComponent"));
    v21 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(MFSendLaterHeaderCollectionViewCell *)v4 setBackgroundColor:v21];

    id v22 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v50[0] = v47;
    v50[1] = v46;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
    v24 = (void *)[v22 initWithArrangedSubviews:v23];

    [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v24 setCustomSpacing:v47 afterView:8.0];
    [(MFSendLaterHeaderCollectionViewCell *)v4 addSubview:v24];
    v25 = (void *)MEMORY[0x1E4F28DC8];
    v45 = [v24 leadingAnchor];
    v42 = [(MFSendLaterHeaderCollectionViewCell *)v4 layoutMarginsGuide];
    v41 = [v42 leadingAnchor];
    v40 = objc_msgSend(v45, "constraintEqualToAnchor:");
    v49[0] = v40;
    v44 = [v24 topAnchor];
    v39 = [(MFSendLaterHeaderCollectionViewCell *)v4 layoutMarginsGuide];
    v38 = [v39 topAnchor];
    v37 = objc_msgSend(v44, "constraintEqualToAnchor:constant:", 7.0);
    v49[1] = v37;
    v43 = [v24 bottomAnchor];
    v36 = [(MFSendLaterHeaderCollectionViewCell *)v4 layoutMarginsGuide];
    v26 = [v36 bottomAnchor];
    v27 = [v43 constraintEqualToAnchor:v26 constant:-7.0];
    v49[2] = v27;
    v28 = [v24 trailingAnchor];
    v29 = [(MFSendLaterHeaderCollectionViewCell *)v4 layoutMarginsGuide];
    v30 = [v29 trailingAnchor];
    v31 = [v28 constraintEqualToAnchor:v30];
    v49[3] = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:4];
    [v25 activateConstraints:v32];

    [(MFSendLaterHeaderCollectionViewCell *)v4 setDatePicker:v46];
    [(MFSendLaterHeaderCollectionViewCell *)v4 setStackView:v24];
    v33 = [(MFSendLaterHeaderCollectionViewCell *)v4 viewHelper];
    v34 = [v47 text];
    [v33 precalculateWidthsWithDescription:v34];

    -[MFSendLaterHeaderCollectionViewCell _updateLabelAndDatePickerOrientation](v4);
  }
  return v4;
}

- (void)_updateLabelAndDatePickerOrientation
{
  if (a1)
  {
    id v5 = [a1 stackView];
    v2 = [a1 viewHelper];
    int v3 = [v2 willContentTruncate];

    if (v3)
    {
      uint64_t v4 = 1;
      [v5 setAxis:1];
    }
    else
    {
      [v5 setAxis:0];
      uint64_t v4 = 3;
    }
    [v5 setAlignment:v4];
    [v5 layoutIfNeeded];
  }
}

- (void)updateActiveComponent:(int64_t)a3
{
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    uint64_t v4 = 2;
  }
  else
  {
    uint64_t v4 = 1;
  }
  [(MFSendLaterHeaderCollectionViewCell *)self setCurrentVisibleComponent:v4];
LABEL_6:
  id v5 = [(MFSendLaterHeaderCollectionViewCell *)self datePicker];
  [v5 _setCompactStyleDelegate:self];
  objc_msgSend(v5, "_compactStyleSetActiveComponent:", -[MFSendLaterHeaderCollectionViewCell currentVisibleComponent](self, "currentVisibleComponent"));
}

- (void)updateWithDate:(id)a3 timeZone:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  double v7 = [(MFSendLaterHeaderCollectionViewCell *)self datePicker];
  [v7 setTimeZone:v6];
  [v7 _setCompactStyleDelegate:self];
  double v8 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  objc_msgSend(v7, "_setDisplaysTimeZone:", objc_msgSend(v6, "isEqual:", v8) ^ 1);

  [v7 setDate:v9];
}

- (void)_datePicker:(id)a3 didSelectComponent:(int64_t)a4
{
  id v7 = [(MFSendLaterHeaderCollectionViewCell *)self delegate];
  if (a4)
  {
    if (a4 == 2)
    {
      [(MFSendLaterHeaderCollectionViewCell *)self setCurrentVisibleComponent:2];
      [v7 sendLaterHeaderCollectionViewCellTimeTapped:self];
    }
    else if (a4 == 1)
    {
      [(MFSendLaterHeaderCollectionViewCell *)self setCurrentVisibleComponent:1];
      [v7 sendLaterHeaderCollectionViewCellDateTapped:self];
    }
  }
  else
  {
    id v6 = [(MFSendLaterHeaderCollectionViewCell *)self datePicker];
    [v6 _setCompactStyleDelegate:self];
    objc_msgSend(v6, "_compactStyleSetActiveComponent:", -[MFSendLaterHeaderCollectionViewCell currentVisibleComponent](self, "currentVisibleComponent"));
  }
}

- (void)layoutMarginsDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)MFSendLaterHeaderCollectionViewCell;
  [(MFSendLaterHeaderCollectionViewCell *)&v5 layoutMarginsDidChange];
  int v3 = [(MFSendLaterHeaderCollectionViewCell *)self viewHelper];
  [(MFSendLaterHeaderCollectionViewCell *)self layoutMargins];
  int v4 = objc_msgSend(v3, "updateLayoutMarginsIfNeeded:");

  if (v4) {
    -[MFSendLaterHeaderCollectionViewCell _updateLabelAndDatePickerOrientation](self);
  }
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MFSendLaterHeaderCollectionViewCell;
  int v4 = [(MFSendLaterHeaderCollectionViewCell *)&v8 preferredLayoutAttributesFittingAttributes:a3];
  objc_super v5 = [(MFSendLaterHeaderCollectionViewCell *)self viewHelper];
  [v4 frame];
  int v6 = [v5 updateWidthIfNeeded:CGRectGetWidth(v10)];

  if (v6) {
    -[MFSendLaterHeaderCollectionViewCell _updateLabelAndDatePickerOrientation](self);
  }

  return v4;
}

- (MFSendLaterHeaderCollectionViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFSendLaterHeaderCollectionViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MFSendLaterHeaderCollectionViewHelper)viewHelper
{
  return self->_viewHelper;
}

- (void)setViewHelper:(id)a3
{
}

- (UIDatePicker)datePicker
{
  return self->_datePicker;
}

- (void)setDatePicker:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (int64_t)currentVisibleComponent
{
  return self->_currentVisibleComponent;
}

- (void)setCurrentVisibleComponent:(int64_t)a3
{
  self->_currentVisibleComponent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_datePicker, 0);
  objc_storeStrong((id *)&self->_viewHelper, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end