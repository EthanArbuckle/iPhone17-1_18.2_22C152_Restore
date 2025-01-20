@interface CSLPRFStingTitleSubtitleCell
+ (int64_t)cellStyle;
- (BOOL)hasSubtitle;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setHasSubtitle:(BOOL)a3;
@end

@implementation CSLPRFStingTitleSubtitleCell

+ (int64_t)cellStyle
{
  return 3;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)CSLPRFStingTitleSubtitleCell;
  [(CSLPRFStingTitleSubtitleCell *)&v14 layoutSubviews];
  if ([(id)objc_opt_class() cellStyle] == (char *)&dword_0 + 3
    && ![(CSLPRFStingTitleSubtitleCell *)self hasSubtitle])
  {
    v3 = [(CSLPRFStingTitleSubtitleCell *)self textLabel];
    [v3 frame];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;

    v10 = [(CSLPRFStingTitleSubtitleCell *)self contentView];
    [v10 bounds];
    double v12 = round((v11 - v9) * 0.5);

    v13 = [(CSLPRFStingTitleSubtitleCell *)self textLabel];
    objc_msgSend(v13, "setFrame:", v5, v12, v7, v9);
  }
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSLPRFStingTitleSubtitleCell;
  [(CSLPRFStingTitleSubtitleCell *)&v9 refreshCellContentsWithSpecifier:v4];
  if ([(id)objc_opt_class() cellStyle] == (char *)&dword_0 + 3)
  {
    double v5 = [(CSLPRFStingTitleSubtitleCell *)self detailTextLabel];
    double v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    [v5 setFont:v6];

    double v7 = [v4 objectForKeyedSubscript:PSTableCellSubtitleTextKey];
    [(CSLPRFStingTitleSubtitleCell *)self setHasSubtitle:v7 != 0];
    if ([(CSLPRFStingTitleSubtitleCell *)self hasSubtitle])
    {
      [v5 setText:v7];
      double v8 = +[UIColor grayColor];
      [v5 setTextColor:v8];
    }
    else
    {
      [v5 setText:@" "];
    }
  }
  [(CSLPRFStingTitleSubtitleCell *)self setNeedsLayout];
}

- (BOOL)hasSubtitle
{
  return self->_hasSubtitle;
}

- (void)setHasSubtitle:(BOOL)a3
{
  self->_hasSubtitle = a3;
}

@end