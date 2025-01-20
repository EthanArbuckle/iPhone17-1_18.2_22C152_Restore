@interface CNSharingProfileOnboardingAddressingGrammarCell
+ (id)cellIdentifier;
- (CNSharingProfileOnboardingAddressingGrammarCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)addressingGrammarLabel;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAddressingGrammarLabel:(id)a3;
@end

@implementation CNSharingProfileOnboardingAddressingGrammarCell

- (void).cxx_destruct
{
}

- (UILabel)addressingGrammarLabel
{
  return self->_addressingGrammarLabel;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)CNSharingProfileOnboardingAddressingGrammarCell;
  [(CNSharingProfileOnboardingAddressingGrammarCell *)&v4 prepareForReuse];
  [(UILabel *)self->_addressingGrammarLabel removeFromSuperview];
  addressingGrammarLabel = self->_addressingGrammarLabel;
  self->_addressingGrammarLabel = 0;
}

- (void)setAddressingGrammarLabel:(id)a3
{
  v5 = (UILabel *)a3;
  p_addressingGrammarLabel = &self->_addressingGrammarLabel;
  addressingGrammarLabel = self->_addressingGrammarLabel;
  v11 = v5;
  if (addressingGrammarLabel != v5)
  {
    v8 = [(UILabel *)addressingGrammarLabel superview];
    v9 = [(CNSharingProfileOnboardingAddressingGrammarCell *)self contentView];

    if (v8 == v9) {
      [(UILabel *)*p_addressingGrammarLabel removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_addressingGrammarLabel, a3);
    v10 = [(CNSharingProfileOnboardingAddressingGrammarCell *)self contentView];
    [v10 addSubview:*p_addressingGrammarLabel];
  }
  [(CNSharingProfileOnboardingAddressingGrammarCell *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)CNSharingProfileOnboardingAddressingGrammarCell;
  [(CNSharingProfileOnboardingAddressingGrammarCell *)&v14 layoutSubviews];
  uint64_t v3 = [(CNSharingProfileOnboardingAddressingGrammarCell *)self effectiveUserInterfaceLayoutDirection];
  objc_super v4 = [(CNSharingProfileOnboardingAddressingGrammarCell *)self contentView];
  [v4 bounds];
  double Width = CGRectGetWidth(v15);
  [(CNSharingProfileOnboardingAddressingGrammarCell *)self layoutMargins];
  double v7 = v6;
  [(CNSharingProfileOnboardingAddressingGrammarCell *)self layoutMargins];
  double v9 = v8;

  [(CNSharingProfileOnboardingAddressingGrammarCell *)self layoutMargins];
  if (v3 == 1) {
    double v12 = v11;
  }
  else {
    double v12 = v10;
  }
  v13 = [(CNSharingProfileOnboardingAddressingGrammarCell *)self contentView];
  [v13 bounds];
  -[UILabel setFrame:](self->_addressingGrammarLabel, "setFrame:", v12, 0.0, Width - v7 - v9);
}

- (CNSharingProfileOnboardingAddressingGrammarCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CNSharingProfileOnboardingAddressingGrammarCell;
  objc_super v4 = [(CNSharingProfileOnboardingAddressingGrammarCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(CNSharingProfileOnboardingAddressingGrammarCell *)v4 setAccessoryType:1];
    double v6 = v5;
  }

  return v5;
}

+ (id)cellIdentifier
{
  return @"CNSharingProfileOnboardingAddressingGrammarCell";
}

@end