@interface MCProfileTitlePageWarningCell
- (MCProfileTitlePageWarningCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)label;
- (UIView)separatorLine;
- (void)_updateConstraintsWithLabel:(id)a3;
- (void)layoutSubviews;
- (void)setSeparatorLine:(id)a3;
@end

@implementation MCProfileTitlePageWarningCell

- (MCProfileTitlePageWarningCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)MCProfileTitlePageWarningCell;
  v4 = [(MCProfileTitlePageWarningCell *)&v16 initWithStyle:a3 reuseIdentifier:a4];
  [(MCProfileTitlePageWarningCell *)v4 setUserInteractionEnabled:0];
  v5 = [MEMORY[0x1E4F428B8] clearColor];
  [(MCProfileTitlePageWarningCell *)v4 setBackgroundColor:v5];

  id v6 = objc_alloc(MEMORY[0x1E4F42B38]);
  uint64_t v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  label = v4->_label;
  v4->_label = (UILabel *)v7;

  v9 = [MEMORY[0x1E4F42A30] systemFontOfSize:17.0];
  [(UILabel *)v4->_label setFont:v9];

  [(UILabel *)v4->_label setNumberOfLines:0];
  [(UILabel *)v4->_label setLineBreakMode:0];
  [(UILabel *)v4->_label setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v10 = objc_opt_new();
  separatorLine = v4->_separatorLine;
  v4->_separatorLine = (UIView *)v10;

  v12 = [MEMORY[0x1E4F428B8] tertiaryLabelColor];
  [(UIView *)v4->_separatorLine setBackgroundColor:v12];

  v13 = [(MCProfileTitlePageWarningCell *)v4 contentView];
  [v13 addSubview:v4->_label];

  v14 = [(MCProfileTitlePageWarningCell *)v4 contentView];
  [v14 addSubview:v4->_separatorLine];

  [(MCProfileTitlePageWarningCell *)v4 _updateConstraintsWithLabel:v4->_label];
  return v4;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)MCProfileTitlePageWarningCell;
  [(MCProfileTitlePageWarningCell *)&v5 layoutSubviews];
  [(MCProfileTitlePageWarningCell *)self bounds];
  double Width = CGRectGetWidth(v6);
  v4 = [(MCProfileTitlePageWarningCell *)self separatorLine];
  objc_msgSend(v4, "setFrame:", 17.0, 0.0, Width, 0.5);
}

- (void)_updateConstraintsWithLabel:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v13 = @"label";
  v14[0] = a3;
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  CGRect v6 = [v4 dictionaryWithObjects:v14 forKeys:&v13 count:1];
  uint64_t v7 = (void *)MEMORY[0x1E4F28DC8];
  v8 = objc_msgSend(NSString, "stringWithFormat:", @"|-%f-[label]-%f-|", 0x4031000000000000, 0x4031000000000000);
  v9 = [v7 constraintsWithVisualFormat:v8 options:0 metrics:0 views:v6];

  uint64_t v10 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-[label]-0-|" options:0 metrics:0 views:v6];

  v11 = [(MCProfileTitlePageWarningCell *)self contentView];
  [v11 addConstraints:v9];

  v12 = [(MCProfileTitlePageWarningCell *)self contentView];
  [v12 addConstraints:v10];
}

- (UILabel)label
{
  return self->_label;
}

- (UIView)separatorLine
{
  return self->_separatorLine;
}

- (void)setSeparatorLine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorLine, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end