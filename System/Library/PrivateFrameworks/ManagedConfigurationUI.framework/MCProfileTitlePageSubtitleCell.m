@interface MCProfileTitlePageSubtitleCell
- (MCProfileTitlePageSubtitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)titleLabel;
- (void)_updateConstraintsWithLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateProgressWithTranslationDistance:(double)a3 referenceDistance:(double)a4 isScrolling:(BOOL)a5;
@end

@implementation MCProfileTitlePageSubtitleCell

- (MCProfileTitlePageSubtitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)MCProfileTitlePageSubtitleCell;
  v4 = [(MCProfileTitlePageSubtitleCell *)&v14 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(MCProfileTitlePageSubtitleCell *)v4 setUserInteractionEnabled:0];
    v6 = [(MCProfileTitlePageSubtitleCell *)v5 contentView];
    [v6 setClipsToBounds:0];

    v7 = [MEMORY[0x1E4F428B8] clearColor];
    [(MCProfileTitlePageSubtitleCell *)v5 setBackgroundColor:v7];

    uint64_t v8 = objc_opt_new();
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = (UILabel *)v8;

    [(UILabel *)v5->_titleLabel setNumberOfLines:0];
    [(UILabel *)v5->_titleLabel setTextAlignment:1];
    [(UILabel *)v5->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = v5->_titleLabel;
    v11 = [MEMORY[0x1E4F42A30] systemFontOfSize:17.0];
    [(UILabel *)v10 setFont:v11];

    v12 = [(MCProfileTitlePageSubtitleCell *)v5 contentView];
    [v12 addSubview:v5->_titleLabel];

    [(MCProfileTitlePageSubtitleCell *)v5 _updateConstraintsWithLabel:v5->_titleLabel];
  }
  return v5;
}

- (void)_updateConstraintsWithLabel:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v13 = @"label";
  v14[0] = a3;
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v7 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"|-%f-[label]-%f-|", 0x402E000000000000, 0x402E000000000000);
  v9 = [v7 constraintsWithVisualFormat:v8 options:0 metrics:0 views:v6];

  v10 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-[label]-0-|" options:0 metrics:0 views:v6];

  v11 = [(MCProfileTitlePageSubtitleCell *)self contentView];
  [v11 addConstraints:v9];

  v12 = [(MCProfileTitlePageSubtitleCell *)self contentView];
  [v12 addConstraints:v10];
}

- (void)updateProgressWithTranslationDistance:(double)a3 referenceDistance:(double)a4 isScrolling:(BOOL)a5
{
  [(MCProfileTitlePageSubtitleCell *)self bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = a3 / 5.0 + v13;
  id v15 = [(MCProfileTitlePageSubtitleCell *)self contentView];
  objc_msgSend(v15, "setFrame:", v8, v14, v10, v12);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end