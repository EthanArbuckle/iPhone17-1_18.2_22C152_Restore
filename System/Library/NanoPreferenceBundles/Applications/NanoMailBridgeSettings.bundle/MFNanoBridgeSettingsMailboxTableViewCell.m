@interface MFNanoBridgeSettingsMailboxTableViewCell
- (MFNanoBridgeSettingsMailboxTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSString)subtitle;
- (NSString)title;
- (UIImage)icon;
- (id)_subtitleFont;
- (id)_titleFont;
- (unint64_t)level;
- (void)layoutSubviews;
- (void)setIcon:(id)a3;
- (void)setLevel:(unint64_t)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MFNanoBridgeSettingsMailboxTableViewCell

- (MFNanoBridgeSettingsMailboxTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6 = a4;
  v27.receiver = self;
  v27.super_class = (Class)MFNanoBridgeSettingsMailboxTableViewCell;
  v7 = [(MFNanoBridgeSettingsMailboxTableViewCell *)&v27 initWithStyle:a3 reuseIdentifier:v6];
  if (v7)
  {
    v8 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel = v7->_titleLabel;
    v7->_titleLabel = v8;

    v10 = v7->_titleLabel;
    v11 = BPSTextColor();
    [(UILabel *)v10 setTextColor:v11];

    v12 = v7->_titleLabel;
    v13 = [(MFNanoBridgeSettingsMailboxTableViewCell *)v7 _titleFont];
    [(UILabel *)v12 setFont:v13];

    [(UILabel *)v7->_titleLabel setOpaque:0];
    [(UILabel *)v7->_titleLabel setBackgroundColor:0];
    v14 = [(MFNanoBridgeSettingsMailboxTableViewCell *)v7 contentView];
    [v14 addSubview:v7->_titleLabel];

    v15 = (UILabel *)objc_alloc_init((Class)UILabel);
    subtitleLabel = v7->_subtitleLabel;
    v7->_subtitleLabel = v15;

    v17 = v7->_subtitleLabel;
    v18 = BPSDetailTextColor();
    [(UILabel *)v17 setTextColor:v18];

    [(UILabel *)v7->_subtitleLabel setTextAlignment:2];
    v19 = v7->_subtitleLabel;
    v20 = [(MFNanoBridgeSettingsMailboxTableViewCell *)v7 _subtitleFont];
    [(UILabel *)v19 setFont:v20];

    [(UILabel *)v7->_subtitleLabel setOpaque:0];
    [(UILabel *)v7->_subtitleLabel setBackgroundColor:0];
    v21 = [(MFNanoBridgeSettingsMailboxTableViewCell *)v7 contentView];
    [v21 addSubview:v7->_subtitleLabel];

    v22 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:0];
    iconImageView = v7->_iconImageView;
    v7->_iconImageView = v22;

    v24 = [(MFNanoBridgeSettingsMailboxTableViewCell *)v7 contentView];
    [v24 addSubview:v7->_iconImageView];

    v25 = BPSCellHightlightColor();
    [(MFNanoBridgeSettingsMailboxTableViewCell *)v7 setSelectionTintColor:v25];
  }
  return v7;
}

- (void)setIcon:(id)a3
{
  id v4 = a3;
  -[UIImageView setImage:](self->_iconImageView, "setImage:");
  [(UIImageView *)self->_iconImageView sizeToFit];
}

- (UIImage)icon
{
  return [(UIImageView *)self->_iconImageView image];
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)subtitle
{
  return [(UILabel *)self->_subtitleLabel text];
}

- (void)layoutSubviews
{
  v55.receiver = self;
  v55.super_class = (Class)MFNanoBridgeSettingsMailboxTableViewCell;
  [(MFNanoBridgeSettingsMailboxTableViewCell *)&v55 layoutSubviews];
  v3 = [(MFNanoBridgeSettingsMailboxTableViewCell *)self contentView];
  [v3 bounds];
  double v54 = v4;

  [(MFNanoBridgeSettingsMailboxTableViewCell *)self frame];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t rect = v9;
  uint64_t v11 = v10;
  unsigned __int8 v12 = [(MFNanoBridgeSettingsMailboxTableViewCell *)self _shouldReverseLayoutDirection];
  [(UIImageView *)self->_iconImageView frame];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  double v18 = v17;
  double v20 = v19;
  MailTableCellImageCenterForLevel(self->_level);
  if (v12)
  {
    v56.origin.x = v14;
    v56.origin.y = v16;
    v56.size.width = v18;
    v56.size.height = v20;
    CGRectGetWidth(v56);
    UIRoundToViewScale();
    double v22 = v21;
  }
  else
  {
    v57.origin.x = v14;
    v57.origin.y = v16;
    v57.size.width = v18;
    v57.size.height = v20;
    CGRectGetWidth(v57);
    UIRoundToViewScale();
    if (v23 >= 0.0) {
      double v22 = v23;
    }
    else {
      double v22 = 0.0;
    }
  }
  UIRoundToViewScale();
  -[UIImageView setFrame:](self->_iconImageView, "setFrame:", v22, v24, v18, v20);
  [(UILabel *)self->_subtitleLabel sizeToFit];
  [(UILabel *)self->_subtitleLabel frame];
  CGFloat v26 = v25;
  double v28 = v27;
  double v30 = v29;
  uint64_t v31 = v6;
  uint64_t v32 = v8;
  uint64_t v33 = rect;
  uint64_t v34 = v11;
  if (v12) {
    CGRectGetMinX(*(CGRect *)&v31);
  }
  else {
    CGRectGetMaxX(*(CGRect *)&v31);
  }
  v35 = [(MFNanoBridgeSettingsMailboxTableViewCell *)self contentView];
  [v35 frame];
  UIRoundToViewScale();
  double v37 = v36;

  v58.origin.x = v37;
  v58.origin.y = v26;
  v58.size.width = v28;
  v58.size.height = v30;
  CGRectGetHeight(v58);
  UIRoundToViewScale();
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", v37, v38, v28, v30);
  [(UILabel *)self->_titleLabel sizeToFit];
  [(UILabel *)self->_titleLabel frame];
  double v41 = v40;
  if (v12)
  {
    double v42 = v22 + -16.0;
    double v43 = v54 - v42;
    UIRoundToViewScale();
    double v45 = v44;
    double v46 = v42 - v44;
  }
  else
  {
    double v47 = v39;
    double v43 = v18 + v22 + 16.0;
    UIRoundToViewScale();
    double v45 = v48;
    v49 = [(MFNanoBridgeSettingsMailboxTableViewCell *)self contentView];
    [v49 frame];
    double v46 = v37 - v45 + -5.0 - v50;

    if (v47 < v46) {
      double v46 = v47;
    }
  }
  UIRoundToViewScale();
  UIRoundToViewScale();
  double v52 = v51;
  [(MFNanoBridgeSettingsMailboxTableViewCell *)self _setMarginWidth:v43];
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v45, v52, v46, v41);
}

- (id)_titleFont
{
  v2 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody addingSymbolicTraits:0x8000 options:3];
  v3 = +[UIFont fontWithDescriptor:v2 size:0.0];

  return v3;
}

- (id)_subtitleFont
{
  v2 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody addingSymbolicTraits:0x8000 options:3];
  v3 = +[UIFont fontWithDescriptor:v2 size:0.0];

  return v3;
}

- (unint64_t)level
{
  return self->_level;
}

- (void)setLevel:(unint64_t)a3
{
  self->_level = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkmarkImageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end