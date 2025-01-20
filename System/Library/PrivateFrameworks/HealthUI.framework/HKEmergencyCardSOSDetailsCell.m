@interface HKEmergencyCardSOSDetailsCell
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (HKEmergencyCardSOSDetailsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSAttributedString)footerAttributedText;
- (UITextView)footerTextView;
- (void)_setupConstraints;
- (void)_setupViews;
- (void)_updateText;
- (void)setFooterAttributedText:(id)a3;
- (void)setFooterTextView:(id)a3;
- (void)tintColorDidChange;
@end

@implementation HKEmergencyCardSOSDetailsCell

- (HKEmergencyCardSOSDetailsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HKEmergencyCardSOSDetailsCell;
  v4 = [(HKEmergencyCardSOSDetailsCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(HKEmergencyCardSOSDetailsCell *)v4 _setupViews];
    [(HKEmergencyCardSOSDetailsCell *)v5 _setupConstraints];
  }
  return v5;
}

- (void)setFooterAttributedText:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F28B18];
  id v5 = a3;
  v6 = (NSAttributedString *)[[v4 alloc] initWithAttributedString:v5];

  footerAttributedText = self->_footerAttributedText;
  self->_footerAttributedText = v6;

  [(HKEmergencyCardSOSDetailsCell *)self _updateText];
}

- (void)_setupViews
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1DD8]);
  v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(HKEmergencyCardSOSDetailsCell *)self setFooterTextView:v4];

  id v5 = [(HKEmergencyCardSOSDetailsCell *)self footerTextView];
  v6 = [v5 textContainer];
  [v6 lineFragmentPadding];
  double v8 = v7;

  v9 = [(HKEmergencyCardSOSDetailsCell *)self footerTextView];
  objc_msgSend(v9, "setTextContainerInset:", 0.0, -v8, 0.0, -v8);

  v10 = [(HKEmergencyCardSOSDetailsCell *)self footerTextView];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  v11 = [(HKEmergencyCardSOSDetailsCell *)self footerTextView];
  [v11 setScrollEnabled:0];

  v12 = [(HKEmergencyCardSOSDetailsCell *)self footerTextView];
  [v12 setUserInteractionEnabled:1];

  v13 = [(HKEmergencyCardSOSDetailsCell *)self footerTextView];
  [v13 setDelegate:self];

  v14 = [(HKEmergencyCardSOSDetailsCell *)self footerTextView];
  [v14 setEditable:0];

  v15 = [(HKEmergencyCardSOSDetailsCell *)self footerTextView];
  [v15 _setInteractiveTextSelectionDisabled:1];

  v16 = [(HKEmergencyCardSOSDetailsCell *)self footerTextView];
  [v16 setDataDetectorTypes:2];

  v17 = [MEMORY[0x1E4FB1618] clearColor];
  v18 = [(HKEmergencyCardSOSDetailsCell *)self footerTextView];
  [v18 setBackgroundColor:v17];

  v19 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  v20 = [(HKEmergencyCardSOSDetailsCell *)self contentView];
  [v20 setBackgroundColor:v19];

  id v22 = [(HKEmergencyCardSOSDetailsCell *)self contentView];
  v21 = [(HKEmergencyCardSOSDetailsCell *)self footerTextView];
  [v22 addSubview:v21];
}

- (void)_setupConstraints
{
  id v3 = [(HKEmergencyCardSOSDetailsCell *)self footerTextView];
  v4 = [v3 topAnchor];
  id v5 = [(HKEmergencyCardSOSDetailsCell *)self contentView];
  v6 = [v5 topAnchor];
  double v7 = [v4 constraintEqualToSystemSpacingBelowAnchor:v6 multiplier:1.0];
  [v7 setActive:1];

  double v8 = [(HKEmergencyCardSOSDetailsCell *)self footerTextView];
  v9 = [v8 leftAnchor];
  v10 = [(HKEmergencyCardSOSDetailsCell *)self contentView];
  v11 = [v10 leftAnchor];
  v12 = [v9 constraintEqualToSystemSpacingAfterAnchor:v11 multiplier:2.0];
  [v12 setActive:1];

  v13 = [(HKEmergencyCardSOSDetailsCell *)self contentView];
  v14 = [v13 rightAnchor];
  v15 = [(HKEmergencyCardSOSDetailsCell *)self footerTextView];
  v16 = [v15 rightAnchor];
  v17 = [v14 constraintEqualToSystemSpacingAfterAnchor:v16 multiplier:1.0];
  [v17 setActive:1];

  id v22 = [(HKEmergencyCardSOSDetailsCell *)self contentView];
  v18 = [v22 bottomAnchor];
  v19 = [(HKEmergencyCardSOSDetailsCell *)self footerTextView];
  v20 = [v19 bottomAnchor];
  v21 = [v18 constraintEqualToAnchor:v20];
  [v21 setActive:1];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  v6 = (void *)MEMORY[0x1E4F223E0];
  id v7 = a4;
  double v8 = [v6 defaultWorkspace];
  [v8 openSensitiveURL:v7 withOptions:0];

  return 0;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)HKEmergencyCardSOSDetailsCell;
  [(HKEmergencyCardSOSDetailsCell *)&v3 tintColorDidChange];
  [(HKEmergencyCardSOSDetailsCell *)self _updateText];
}

- (void)_updateText
{
  id v4 = [(HKEmergencyCardSOSDetailsCell *)self footerAttributedText];
  objc_super v3 = [(HKEmergencyCardSOSDetailsCell *)self footerTextView];
  [v3 setAttributedText:v4];
}

- (NSAttributedString)footerAttributedText
{
  return self->_footerAttributedText;
}

- (UITextView)footerTextView
{
  return self->_footerTextView;
}

- (void)setFooterTextView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerTextView, 0);
  objc_storeStrong((id *)&self->_footerAttributedText, 0);
}

@end