@interface HUTriggerHeaderCell
- (HFItem)item;
- (HUGridLayoutOptions)layoutOptions;
- (HUTriggerHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSArray)constraints;
- (UILabel)titleLabel;
- (double)contentBottomMargin;
- (void)_updateTitleLabel;
- (void)prepareForReuse;
- (void)setConstraints:(id)a3;
- (void)setContentBottomMargin:(double)a3;
- (void)setItem:(id)a3;
- (void)setLayoutOptions:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateConstraints;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUTriggerHeaderCell

- (HUTriggerHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)HUTriggerHeaderCell;
  v4 = [(HUTriggerHeaderCell *)&v16 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(HUTriggerHeaderCell *)v4 setSelectionStyle:0];
    v6 = [MEMORY[0x1E4F428B8] clearColor];
    [(HUTriggerHeaderCell *)v5 setBackgroundColor:v6];

    id v7 = objc_alloc(MEMORY[0x1E4F42B38]);
    v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(HUTriggerHeaderCell *)v5 setTitleLabel:v8];

    v9 = [(HUTriggerHeaderCell *)v5 titleLabel];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

    v10 = [(HUTriggerHeaderCell *)v5 titleLabel];
    [v10 setAdjustsFontSizeToFitWidth:1];

    v11 = [MEMORY[0x1E4F428B8] labelColor];
    v12 = [(HUTriggerHeaderCell *)v5 titleLabel];
    [v12 setTextColor:v11];

    v13 = [(HUTriggerHeaderCell *)v5 contentView];
    v14 = [(HUTriggerHeaderCell *)v5 titleLabel];
    [v13 addSubview:v14];

    v5->_contentBottomMargin = 9.0;
    [(UITableViewCell *)v5 removeMargins];
    [(HUTriggerHeaderCell *)v5 setNeedsUpdateConstraints];
  }
  return v5;
}

- (void)setLayoutOptions:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_layoutOptions] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_layoutOptions, a3);
    [(HUTriggerHeaderCell *)self setNeedsUpdateConstraints];
    [(HUTriggerHeaderCell *)self _updateTitleLabel];
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)HUTriggerHeaderCell;
  [(HUTriggerHeaderCell *)&v3 prepareForReuse];
  [(HUTriggerHeaderCell *)self setContentBottomMargin:9.0];
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  v4 = [(HUTriggerHeaderCell *)self item];
  id v15 = [v4 latestResults];

  id v5 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  v6 = [v5 localizedUppercaseString];
  id v7 = [(HUTriggerHeaderCell *)self titleLabel];
  [v7 setText:v6];

  v8 = [(HUTriggerHeaderCell *)self titleLabel];
  [v8 setHidden:v5 == 0];

  v9 = [MEMORY[0x1E4F6A420] preferredFontForTextStyle:*MEMORY[0x1E4F438C8] traits:32770];
  v10 = [(HUTriggerHeaderCell *)self titleLabel];
  [v10 setFont:v9];

  v11 = [(HUTriggerHeaderCell *)self titleLabel];
  [v11 setTextAlignment:4];

  v12 = [MEMORY[0x1E4F428B8] systemGrayColor];
  v13 = [(HUTriggerHeaderCell *)self titleLabel];
  [v13 setTextColor:v12];

  v14 = [(HUTriggerHeaderCell *)self titleLabel];
  [v14 setNumberOfLines:0];

  -[HUTriggerHeaderCell setLayoutMargins:](self, "setLayoutMargins:", *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));
  [(HUTriggerHeaderCell *)self setNeedsUpdateConstraints];
}

- (void)updateConstraints
{
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(HUTriggerHeaderCell *)self titleLabel];
  id v5 = [v4 firstBaselineAnchor];
  v6 = [(HUTriggerHeaderCell *)self contentView];
  id v7 = [v6 topAnchor];
  v8 = [v5 constraintEqualToAnchor:v7 constant:40.0];
  [v3 addObject:v8];

  v9 = [(HUTriggerHeaderCell *)self titleLabel];
  v10 = [v9 leadingAnchor];
  v11 = [(HUTriggerHeaderCell *)self contentView];
  v12 = [v11 layoutMarginsGuide];
  v13 = [v12 leadingAnchor];
  v14 = [v10 constraintEqualToAnchor:v13];
  [v3 addObject:v14];

  id v15 = [(HUTriggerHeaderCell *)self titleLabel];
  objc_super v16 = [v15 trailingAnchor];
  v17 = [(HUTriggerHeaderCell *)self contentView];
  v18 = [v17 layoutMarginsGuide];
  v19 = [v18 trailingAnchor];
  v20 = [v16 constraintEqualToAnchor:v19];
  [v3 addObject:v20];

  v21 = [(HUTriggerHeaderCell *)self titleLabel];
  uint64_t v22 = [v21 lastBaselineAnchor];
  v23 = [(HUTriggerHeaderCell *)self contentView];
  v24 = [v23 bottomAnchor];
  [(HUTriggerHeaderCell *)self contentBottomMargin];
  v26 = [(id)v22 constraintEqualToAnchor:v24 constant:-v25];
  [v3 addObject:v26];

  v27 = [(HUTriggerHeaderCell *)self constraints];
  LOBYTE(v22) = [v3 isEqualToArray:v27];

  if ((v22 & 1) == 0)
  {
    v28 = (void *)MEMORY[0x1E4F28DC8];
    v29 = [(HUTriggerHeaderCell *)self constraints];
    [v28 deactivateConstraints:v29];

    [(HUTriggerHeaderCell *)self setConstraints:v3];
    v30 = (void *)MEMORY[0x1E4F28DC8];
    v31 = [(HUTriggerHeaderCell *)self constraints];
    [v30 activateConstraints:v31];
  }
  v32.receiver = self;
  v32.super_class = (Class)HUTriggerHeaderCell;
  [(HUTriggerHeaderCell *)&v32 updateConstraints];
}

- (void)_updateTitleLabel
{
  objc_super v3 = [(HUTriggerHeaderCell *)self layoutOptions];
  v4 = [v3 sectionHeaderFont];
  id v5 = [(HUTriggerHeaderCell *)self titleLabel];
  [v5 setFont:v4];

  v6 = [(HUTriggerHeaderCell *)self layoutOptions];

  if (v6
    && ([(HUTriggerHeaderCell *)self layoutOptions],
        id v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 contentColorStyle],
        v7,
        v8 != 1))
  {
    uint64_t v9 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F428B8] systemGrayColor];
  }
  id v11 = (id)v9;
  v10 = [(HUTriggerHeaderCell *)self titleLabel];
  [v10 setTextColor:v11];
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (HUGridLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (double)contentBottomMargin
{
  return self->_contentBottomMargin;
}

- (void)setContentBottomMargin:(double)a3
{
  self->_contentBottomMargin = a3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_layoutOptions, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

@end