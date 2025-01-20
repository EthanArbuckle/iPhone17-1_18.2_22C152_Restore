@interface PKTextInputDebugViewTableCell
- (BOOL)showDetailsButton;
- (NSAttributedString)valueAttributedText;
- (NSString)statusKey;
- (NSString)titleText;
- (PKTextInputDebugViewTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (PKTextInputDebugViewTableCellDelegate)delegate;
- (UIButton)_detailsButton;
- (UILabel)_titleLabel;
- (UILabel)_valueLabel;
- (void)_handleDetailsButton:(id)a3;
- (void)_setupContentViewsIfNeeded;
- (void)_updateLabels;
- (void)setDelegate:(id)a3;
- (void)setShowDetailsButton:(BOOL)a3;
- (void)setStatusKey:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setValueAttributedText:(id)a3;
- (void)set_detailsButton:(id)a3;
- (void)set_titleLabel:(id)a3;
- (void)set_valueLabel:(id)a3;
@end

@implementation PKTextInputDebugViewTableCell

- (PKTextInputDebugViewTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PKTextInputDebugViewTableCell;
  v4 = [(PKTextInputDebugViewTableCell *)&v8 initWithStyle:1 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(PKTextInputDebugViewTableCell *)v4 setOpaque:0];
    v6 = [MEMORY[0x1E4FB1618] clearColor];
    [(PKTextInputDebugViewTableCell *)v5 setBackgroundColor:v6];

    [(PKTextInputDebugViewTableCell *)v5 setIndentationLevel:1];
  }
  return v5;
}

- (void)setValueAttributedText:(id)a3
{
  if (self->_valueAttributedText != a3)
  {
    v4 = (NSAttributedString *)[a3 copy];
    valueAttributedText = self->_valueAttributedText;
    self->_valueAttributedText = v4;

    [(PKTextInputDebugViewTableCell *)self _updateLabels];
  }
}

- (void)setTitleText:(id)a3
{
  if (self->_titleText != a3)
  {
    v4 = (NSString *)[a3 copy];
    titleText = self->_titleText;
    self->_titleText = v4;

    [(PKTextInputDebugViewTableCell *)self _updateLabels];
  }
}

- (void)setShowDetailsButton:(BOOL)a3
{
  if (self->_showDetailsButton != a3)
  {
    self->_showDetailsButton = a3;
    [(PKTextInputDebugViewTableCell *)self _updateLabels];
  }
}

- (void)_setupContentViewsIfNeeded
{
  v64[4] = *MEMORY[0x1E4F143B8];
  v3 = [(PKTextInputDebugViewTableCell *)self _titleLabel];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(PKTextInputDebugViewTableCell *)self set_titleLabel:v5];
    [v5 setNumberOfLines:1];
    v6 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:1.0];
    [v5 setTextColor:v6];

    v7 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:15.0];
    [v5 setFont:v7];

    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_super v8 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.1];
    [v5 setBackgroundColor:v8];

    v9 = [(PKTextInputDebugViewTableCell *)self contentView];
    [v9 addSubview:v5];

    v56 = [v5 topAnchor];
    v59 = [(PKTextInputDebugViewTableCell *)self contentView];
    v54 = [v59 topAnchor];
    v52 = [v56 constraintEqualToAnchor:v54 constant:10.0];
    v64[0] = v52;
    v48 = [v5 leadingAnchor];
    v50 = [(PKTextInputDebugViewTableCell *)self contentView];
    v46 = [v50 leadingAnchor];
    v10 = [v48 constraintEqualToAnchor:v46 constant:8.0];
    v64[1] = v10;
    v11 = [v5 trailingAnchor];
    v12 = [(PKTextInputDebugViewTableCell *)self contentView];
    v13 = [v12 trailingAnchor];
    v14 = [v11 constraintEqualToAnchor:v13 constant:-8.0];
    v64[2] = v14;
    v15 = [v5 heightAnchor];
    v16 = [v15 constraintGreaterThanOrEqualToConstant:22.0];
    v64[3] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:4];

    [MEMORY[0x1E4F28DC8] activateConstraints:v17];
  }
  v18 = [(PKTextInputDebugViewTableCell *)self _valueLabel];

  if (!v18)
  {
    id v19 = objc_alloc(MEMORY[0x1E4FB1930]);
    v20 = objc_msgSend(v19, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(PKTextInputDebugViewTableCell *)self set_valueLabel:v20];
    [v20 setNumberOfLines:0];
    v21 = [MEMORY[0x1E4FB1618] colorWithWhite:0.9 alpha:1.0];
    [v20 setTextColor:v21];

    v22 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
    [v20 setFont:v22];

    [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
    v23 = [(PKTextInputDebugViewTableCell *)self contentView];
    [v23 addSubview:v20];

    v57 = [v20 topAnchor];
    v60 = [(PKTextInputDebugViewTableCell *)self _titleLabel];
    v55 = [v60 bottomAnchor];
    v53 = [v57 constraintEqualToAnchor:v55 constant:6.0];
    v63[0] = v53;
    v49 = [v20 bottomAnchor];
    v51 = [(PKTextInputDebugViewTableCell *)self contentView];
    v47 = [v51 bottomAnchor];
    v45 = [v49 constraintEqualToAnchor:v47];
    v63[1] = v45;
    v44 = [v20 leadingAnchor];
    v24 = [(PKTextInputDebugViewTableCell *)self contentView];
    v25 = [v24 leadingAnchor];
    v26 = [v44 constraintEqualToAnchor:v25 constant:14.0];
    v63[2] = v26;
    v27 = [v20 trailingAnchor];
    v28 = [(PKTextInputDebugViewTableCell *)self contentView];
    v29 = [v28 trailingAnchor];
    v30 = [v27 constraintEqualToAnchor:v29 constant:-14.0];
    v63[3] = v30;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:4];

    [MEMORY[0x1E4F28DC8] activateConstraints:v31];
  }
  v32 = [(PKTextInputDebugViewTableCell *)self _detailsButton];

  if (!v32)
  {
    v61 = [MEMORY[0x1E4FB1830] configurationWithPointSize:13.0];
    v58 = [MEMORY[0x1E4FB1818] systemImageNamed:@"info.circle" withConfiguration:v61];
    v33 = [MEMORY[0x1E4FB14D0] systemButtonWithImage:v58 target:self action:sel__handleDetailsButton_];
    [(PKTextInputDebugViewTableCell *)self set_detailsButton:v33];
    objc_msgSend(v33, "_setTouchInsets:", -5.0, -5.0, -5.0, -5.0);
    [v33 setTranslatesAutoresizingMaskIntoConstraints:0];
    v34 = [(PKTextInputDebugViewTableCell *)self contentView];
    [v34 addSubview:v33];

    v35 = [v33 centerYAnchor];
    v36 = [(PKTextInputDebugViewTableCell *)self _titleLabel];
    v37 = [v36 centerYAnchor];
    v38 = [v35 constraintEqualToAnchor:v37];
    v62[0] = v38;
    v39 = [v33 trailingAnchor];
    v40 = [(PKTextInputDebugViewTableCell *)self _titleLabel];
    v41 = [v40 trailingAnchor];
    v42 = [v39 constraintEqualToAnchor:v41 constant:-10.0];
    v62[1] = v42;
    v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:2];

    [MEMORY[0x1E4F28DC8] activateConstraints:v43];
  }
}

- (void)_updateLabels
{
  [(PKTextInputDebugViewTableCell *)self _setupContentViewsIfNeeded];
  v3 = [(PKTextInputDebugViewTableCell *)self titleText];
  id v4 = [(PKTextInputDebugViewTableCell *)self _titleLabel];
  [v4 setText:v3];

  v5 = [(PKTextInputDebugViewTableCell *)self valueAttributedText];
  v6 = [(PKTextInputDebugViewTableCell *)self _valueLabel];
  [v6 setAttributedText:v5];

  uint64_t v7 = [(PKTextInputDebugViewTableCell *)self showDetailsButton] ^ 1;
  id v8 = [(PKTextInputDebugViewTableCell *)self _detailsButton];
  [v8 setHidden:v7];
}

- (void)_handleDetailsButton:(id)a3
{
  id v4 = [(PKTextInputDebugViewTableCell *)self delegate];
  [v4 debugViewTableCellDidTapDetailsButton:self];
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSAttributedString)valueAttributedText
{
  return self->_valueAttributedText;
}

- (BOOL)showDetailsButton
{
  return self->_showDetailsButton;
}

- (NSString)statusKey
{
  return self->_statusKey;
}

- (void)setStatusKey:(id)a3
{
}

- (PKTextInputDebugViewTableCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKTextInputDebugViewTableCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)_titleLabel
{
  return self->__titleLabel;
}

- (void)set_titleLabel:(id)a3
{
}

- (UILabel)_valueLabel
{
  return self->__valueLabel;
}

- (void)set_valueLabel:(id)a3
{
}

- (UIButton)_detailsButton
{
  return self->__detailsButton;
}

- (void)set_detailsButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__detailsButton, 0);
  objc_storeStrong((id *)&self->__valueLabel, 0);
  objc_storeStrong((id *)&self->__titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_statusKey, 0);
  objc_storeStrong((id *)&self->_valueAttributedText, 0);

  objc_storeStrong((id *)&self->_titleText, 0);
}

@end