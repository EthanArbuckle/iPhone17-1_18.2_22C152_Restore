@interface HUTimerIntervalPickerCell
- (NSLayoutConstraint)textLabelLeadingConstraint;
- (NSLayoutConstraint)textLabelTrailingConstraint;
- (UILabel)textLabel;
- (void)setTextLabel:(id)a3;
- (void)setTextLabelLeadingConstraint:(id)a3;
- (void)setTextLabelTrailingConstraint:(id)a3;
@end

@implementation HUTimerIntervalPickerCell

- (UILabel)textLabel
{
  v20[3] = *MEMORY[0x1E4F143B8];
  textLabel = self->_textLabel;
  if (!textLabel)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42B38]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(HUTimerIntervalPickerCell *)self setTextLabel:v5];

    [(UILabel *)self->_textLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v6) = 1148846080;
    [(UILabel *)self->_textLabel setContentHuggingPriority:0 forAxis:v6];
    LODWORD(v7) = 1148846080;
    [(UILabel *)self->_textLabel setContentCompressionResistancePriority:0 forAxis:v7];
    [(HUTimerIntervalPickerCell *)self addSubview:self->_textLabel];
    if ([(HUTimerIntervalPickerCell *)self effectiveUserInterfaceLayoutDirection] == 1)double v8 = 4.0; {
    else
    }
      double v8 = 10.0;
    v19 = [(UILabel *)self->_textLabel centerYAnchor];
    v9 = [(HUTimerIntervalPickerCell *)self centerYAnchor];
    v10 = [v19 constraintEqualToAnchor:v9];
    v20[0] = v10;
    v11 = [(UILabel *)self->_textLabel heightAnchor];
    v12 = [v11 constraintEqualToConstant:32.0];
    v20[1] = v12;
    v13 = [(UILabel *)self->_textLabel leadingAnchor];
    v14 = [(HUTimerIntervalPickerCell *)self leadingAnchor];
    v15 = [v13 constraintEqualToAnchor:v14 constant:v8];
    v20[2] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
    [v18 activateConstraints:v16];

    textLabel = self->_textLabel;
  }

  return textLabel;
}

- (void)setTextLabel:(id)a3
{
}

- (NSLayoutConstraint)textLabelLeadingConstraint
{
  return self->_textLabelLeadingConstraint;
}

- (void)setTextLabelLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)textLabelTrailingConstraint
{
  return self->_textLabelTrailingConstraint;
}

- (void)setTextLabelTrailingConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_textLabelLeadingConstraint, 0);

  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end