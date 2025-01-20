@interface MCInstallationWarningCell
+ (id)reuseIdentifier;
- (MCInstallationWarningCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSArray)constraints;
- (UITextView)warningLabel;
- (void)_setup;
- (void)_setupConstraints;
- (void)setConstraints:(id)a3;
- (void)setWarningLabel:(id)a3;
- (void)setWarningLabelText:(id)a3;
@end

@implementation MCInstallationWarningCell

+ (id)reuseIdentifier
{
  return @"MCInstallationWarningCell";
}

- (MCInstallationWarningCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MCInstallationWarningCell;
  v4 = [(MCInstallationWarningCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(MCInstallationWarningCell *)v4 _setup];
  }
  return v5;
}

- (void)_setup
{
  [(MCInstallationWarningCell *)self setSelectionStyle:0];
  id v3 = objc_alloc(MEMORY[0x1E4F42F58]);
  v4 = (UITextView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  warningLabel = self->_warningLabel;
  self->_warningLabel = v4;

  [(UITextView *)self->_warningLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  [(UITextView *)self->_warningLabel setFont:v6];

  [(UITextView *)self->_warningLabel setEditable:0];
  [(UITextView *)self->_warningLabel setSelectable:1];
  [(UITextView *)self->_warningLabel setScrollEnabled:0];
  [(UITextView *)self->_warningLabel setBackgroundColor:0];
  [(UITextView *)self->_warningLabel setDataDetectorTypes:-1];
  -[UITextView setTextContainerInset:](self->_warningLabel, "setTextContainerInset:", *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));
  objc_super v7 = [(UITextView *)self->_warningLabel textContainer];
  [v7 setLineFragmentPadding:0.0];

  v8 = [(UITextView *)self->_warningLabel textContainer];
  [v8 setLineBreakMode:0];

  v9 = [(MCInstallationWarningCell *)self contentView];
  [v9 addSubview:self->_warningLabel];

  if (MCUIForPairedDevice())
  {
    v10 = BPSDetailTextColor();
    [(UITextView *)self->_warningLabel setTextColor:v10];
  }
  [(MCInstallationWarningCell *)self _setupConstraints];
}

- (void)setWarningLabelText:(id)a3
{
  id v4 = a3;
  id v5 = [(MCInstallationWarningCell *)self warningLabel];
  [v5 setText:v4];
}

- (void)_setupConstraints
{
  id v3 = [(MCInstallationWarningCell *)self constraints];

  if (v3)
  {
    id v4 = [(MCInstallationWarningCell *)self contentView];
    id v5 = [(MCInstallationWarningCell *)self constraints];
    [v4 removeConstraints:v5];

    [(MCInstallationWarningCell *)self setConstraints:0];
  }
  id v22 = (id)objc_opt_new();
  v6 = (void *)MEMORY[0x1E4F28DC8];
  warningLabel = self->_warningLabel;
  v8 = [(MCInstallationWarningCell *)self contentView];
  v9 = [v6 constraintWithItem:warningLabel attribute:3 relatedBy:0 toItem:v8 attribute:3 multiplier:1.0 constant:10.0];
  [v22 addObject:v9];

  v10 = (void *)MEMORY[0x1E4F28DC8];
  v11 = self->_warningLabel;
  v12 = [(MCInstallationWarningCell *)self contentView];
  v13 = [v10 constraintWithItem:v11 attribute:5 relatedBy:0 toItem:v12 attribute:5 multiplier:1.0 constant:10.0];
  [v22 addObject:v13];

  v14 = (void *)MEMORY[0x1E4F28DC8];
  v15 = self->_warningLabel;
  v16 = [(MCInstallationWarningCell *)self contentView];
  v17 = [v14 constraintWithItem:v15 attribute:6 relatedBy:0 toItem:v16 attribute:6 multiplier:1.0 constant:-10.0];
  [v22 addObject:v17];

  v18 = (void *)MEMORY[0x1E4F28DC8];
  v19 = [(MCInstallationWarningCell *)self contentView];
  v20 = [v18 constraintWithItem:v19 attribute:4 relatedBy:0 toItem:self->_warningLabel attribute:4 multiplier:1.0 constant:10.0];
  [v22 addObject:v20];

  [(MCInstallationWarningCell *)self setConstraints:v22];
  v21 = [(MCInstallationWarningCell *)self contentView];
  [v21 addConstraints:v22];
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (UITextView)warningLabel
{
  return self->_warningLabel;
}

- (void)setWarningLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warningLabel, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
}

@end