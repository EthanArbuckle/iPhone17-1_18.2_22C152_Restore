@interface FIUIWorkoutFootnoteTableViewCell
+ (double)preferredHeight;
- (FIUIWorkoutFootnoteTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSString)footnoteText;
- (NSString)titleText;
- (void)layoutSubviews;
- (void)setFootnoteText:(id)a3;
- (void)setTitleText:(id)a3;
@end

@implementation FIUIWorkoutFootnoteTableViewCell

+ (double)preferredHeight
{
  return 45.0;
}

- (FIUIWorkoutFootnoteTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v22.receiver = self;
  v22.super_class = (Class)FIUIWorkoutFootnoteTableViewCell;
  v4 = [(FIUIWorkoutFootnoteTableViewCell *)&v22 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [MEMORY[0x263F825C8] blackColor];
    [(FIUIWorkoutFootnoteTableViewCell *)v4 setBackgroundColor:v5];

    v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v6;

    v8 = [MEMORY[0x263F825C8] systemGrayColor];
    [(UILabel *)v4->_titleLabel setTextColor:v8];

    uint64_t v9 = *MEMORY[0x263F835B8];
    v10 = [MEMORY[0x263F81708] defaultFontForTextStyle:*MEMORY[0x263F835B8]];
    [(UILabel *)v4->_titleLabel setFont:v10];

    v11 = [(FIUIWorkoutFootnoteTableViewCell *)v4 contentView];
    [v11 addSubview:v4->_titleLabel];

    v12 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    footnoteLabel = v4->_footnoteLabel;
    v4->_footnoteLabel = v12;

    v14 = [MEMORY[0x263F825C8] whiteColor];
    [(UILabel *)v4->_footnoteLabel setTextColor:v14];

    v15 = [MEMORY[0x263F81708] defaultFontForTextStyle:v9];
    [(UILabel *)v4->_footnoteLabel setFont:v15];

    v16 = [(FIUIWorkoutFootnoteTableViewCell *)v4 contentView];
    [v16 addSubview:v4->_footnoteLabel];

    v17 = [FIUIDividerView alloc];
    uint64_t v18 = -[FIUIDividerView initWithFrame:](v17, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    dividerView = v4->_dividerView;
    v4->_dividerView = (UIView *)v18;

    v20 = [(FIUIWorkoutFootnoteTableViewCell *)v4 contentView];
    [v20 addSubview:v4->_dividerView];
  }
  return v4;
}

- (void)setTitleText:(id)a3
{
  v4 = (NSString *)[a3 copy];
  titleText = self->_titleText;
  self->_titleText = v4;

  [(UILabel *)self->_titleLabel setText:self->_titleText];
  [(UILabel *)self->_titleLabel sizeToFit];
  [(FIUIWorkoutFootnoteTableViewCell *)self setNeedsLayout];
}

- (void)setFootnoteText:(id)a3
{
  v4 = (NSString *)[a3 copy];
  footnoteText = self->_footnoteText;
  self->_footnoteText = v4;

  [(UILabel *)self->_footnoteLabel setText:self->_footnoteText];
  [(UILabel *)self->_footnoteLabel sizeToFit];
  [(FIUIWorkoutFootnoteTableViewCell *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)FIUIWorkoutFootnoteTableViewCell;
  [(FIUIWorkoutFootnoteTableViewCell *)&v15 layoutSubviews];
  v3 = [(FIUIWorkoutFootnoteTableViewCell *)self contentView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  CGFloat v11 = v10;

  [(UILabel *)self->_titleLabel _setFirstLineBaselineFrameOriginY:18.0];
  [(UILabel *)self->_titleLabel frame];
  [(UILabel *)self->_titleLabel setFrame:5.5];
  [(UILabel *)self->_titleLabel _firstLineBaselineFrameOriginY];
  [(UILabel *)self->_footnoteLabel _setFirstLineBaselineFrameOriginY:v12 + 17.0];
  [(UILabel *)self->_footnoteLabel frame];
  [(UILabel *)self->_footnoteLabel setFrame:5.5];
  -[UIView sizeThatFits:](self->_dividerView, "sizeThatFits:", v9 + 5.5 * -2.0, 1.79769313e308);
  double v14 = v13;
  v16.origin.x = v5;
  v16.origin.y = v7;
  v16.size.width = v9;
  v16.size.height = v11;
  -[UIView setFrame:](self->_dividerView, "setFrame:", 5.5, CGRectGetMaxY(v16) - v14, v9 + 5.5 * -2.0, v14);
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)footnoteText
{
  return self->_footnoteText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footnoteText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_dividerView, 0);
  objc_storeStrong((id *)&self->_footnoteLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end