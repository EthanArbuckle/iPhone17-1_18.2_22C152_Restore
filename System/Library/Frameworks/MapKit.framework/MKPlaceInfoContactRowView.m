@interface MKPlaceInfoContactRowView
+ (id)icon;
- (CNLabeledValue)labeledValue;
- (Class)_labeledValueExpectedValueType;
- (MKPlaceInfoContactRowView)initWithFrame:(CGRect)a3;
- (MKVibrantLabel)titleLabel;
- (NSItemProviderWriting)draggableContent;
- (NSLayoutConstraint)valueToBottomConstraint;
- (UIColor)labelColor;
- (_MKUILabel)valueLabel;
- (id)_icon;
- (id)_iconAccessibilityLabel;
- (id)_valueString;
- (id)iconSelectedBlock;
- (int)analyticsTarget;
- (void)_contentSizeDidChange;
- (void)copy:(id)a3;
- (void)setIconSelectedBlock:(id)a3;
- (void)setLabelColor:(id)a3;
- (void)setLabeledValue:(id)a3;
- (void)setValueToBottomConstraint:(id)a3;
@end

@implementation MKPlaceInfoContactRowView

+ (id)icon
{
  return 0;
}

- (id)_valueString
{
  return 0;
}

- (id)_icon
{
  return 0;
}

- (id)_iconAccessibilityLabel
{
  return 0;
}

- (void)copy:(id)a3
{
  id v4 = [(MKPlaceInfoContactRowView *)self _valueString];
  if ([v4 length])
  {
    v3 = [MEMORY[0x1E4F42C50] generalPasteboard];
    [v3 setString:v4];
  }
}

- (Class)_labeledValueExpectedValueType
{
  return (Class)objc_opt_class();
}

- (MKPlaceInfoContactRowView)initWithFrame:(CGRect)a3
{
  v48[4] = *MEMORY[0x1E4F143B8];
  v46.receiver = self;
  v46.super_class = (Class)MKPlaceInfoContactRowView;
  v3 = -[MKPlaceSectionItemView initWithFrame:](&v46, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    [(MKPlaceInfoContactRowView *)v3 setPreservesSuperviewLayoutMargins:1];
    objc_initWeak(&location, v4);
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v4 selector:sel__contentSizeDidChange name:*MEMORY[0x1E4F43788] object:0];

    v6 = [[MKVibrantLabel alloc] initWithStyle:1];
    labeledValue = v4->_labeledValue;
    v4->_labeledValue = (CNLabeledValue *)v6;

    [(CNLabeledValue *)v4->_labeledValue setTextAlignment:4];
    [(CNLabeledValue *)v4->_labeledValue setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CNLabeledValue *)v4->_labeledValue setClipsToBounds:0];
    v8 = [_MKUILabel alloc];
    uint64_t v9 = -[_MKUILabel initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (MKVibrantLabel *)v9;

    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __43__MKPlaceInfoContactRowView_initWithFrame___block_invoke;
    v43[3] = &unk_1E54BB538;
    objc_copyWeak(&v44, &location);
    [(MKVibrantLabel *)v4->_titleLabel set_mapkit_themeColorProvider:v43];
    [(MKVibrantLabel *)v4->_titleLabel setTextAlignment:4];
    [(MKVibrantLabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MKVibrantLabel *)v4->_titleLabel setNumberOfLines:0];
    [(MKVibrantLabel *)v4->_titleLabel setUserInteractionEnabled:1];
    [(MKPlaceInfoContactRowView *)v4 addSubview:v4->_labeledValue];
    [(MKPlaceInfoContactRowView *)v4 addSubview:v4->_titleLabel];
    v11 = [(CNLabeledValue *)v4->_labeledValue firstBaselineAnchor];
    v12 = [(MKPlaceInfoContactRowView *)v4 topAnchor];
    uint64_t v13 = [v11 constraintEqualToAnchor:v12];
    headerView = v4->_headerView;
    v4->_headerView = (MKPlaceSectionHeaderView *)v13;

    v15 = [(MKVibrantLabel *)v4->_titleLabel firstBaselineAnchor];
    v16 = [(CNLabeledValue *)v4->_labeledValue lastBaselineAnchor];
    uint64_t v17 = [v15 constraintEqualToAnchor:v16];
    topToIconConstraint = v4->_topToIconConstraint;
    v4->_topToIconConstraint = (NSLayoutConstraint *)v17;

    v19 = [(MKPlaceInfoContactRowView *)v4 bottomAnchor];
    v20 = [(MKVibrantLabel *)v4->_titleLabel lastBaselineAnchor];
    uint64_t v21 = [v19 constraintEqualToAnchor:v20];
    id iconSelectedBlock = v4->_iconSelectedBlock;
    v4->_id iconSelectedBlock = (id)v21;

    [(MKPlaceInfoContactRowView *)v4 _contentSizeDidChange];
    v23 = [(MKPlaceInfoContactRowView *)v4 layoutMarginsGuide];
    v24 = [v23 trailingAnchor];
    v25 = [(MKVibrantLabel *)v4->_titleLabel trailingAnchor];
    uint64_t v26 = [v24 constraintGreaterThanOrEqualToAnchor:v25];
    titleToValueConstraint = v4->_titleToValueConstraint;
    v4->_titleToValueConstraint = (NSLayoutConstraint *)v26;

    v48[0] = v4->_headerView;
    v48[1] = v4->_topToIconConstraint;
    v28 = [(CNLabeledValue *)v4->_labeledValue leadingAnchor];
    v29 = [(MKVibrantLabel *)v4->_titleLabel leadingAnchor];
    v30 = [v28 constraintEqualToAnchor:v29];
    v48[2] = v30;
    v31 = [(CNLabeledValue *)v4->_labeledValue trailingAnchor];
    v32 = [(MKVibrantLabel *)v4->_titleLabel trailingAnchor];
    v33 = [v31 constraintLessThanOrEqualToAnchor:v32];
    v48[3] = v33;
    uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:4];
    iconConstraints = v4->_iconConstraints;
    v4->_iconConstraints = (NSArray *)v34;

    v36 = (void *)MEMORY[0x1E4F28DC8];
    v47[0] = v4->_titleToValueConstraint;
    v47[1] = v4->_iconSelectedBlock;
    v37 = [(MKVibrantLabel *)v4->_titleLabel leadingAnchor];
    v38 = [(MKPlaceInfoContactRowView *)v4 layoutMarginsGuide];
    v39 = [v38 leadingAnchor];
    v40 = [v37 constraintEqualToAnchor:v39];
    v47[2] = v40;
    v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:3];
    [v36 activateConstraints:v41];

    [MEMORY[0x1E4F28DC8] activateConstraints:v4->_iconConstraints];
    [(MKPlaceInfoContactRowView *)v4 tintColorDidChange];
    [(MKPlaceInfoContactRowView *)v4 _contentSizeDidChange];
    [(MKPlaceSectionItemView *)v4 infoCardThemeChanged];
    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);
  }
  return v4;
}

id __43__MKPlaceInfoContactRowView_initWithFrame___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && (v3 = (void *)WeakRetained[70]) != 0)
  {
    id v4 = v3;
  }
  else
  {
    v5 = objc_msgSend(WeakRetained, "mk_theme");
    id v4 = [v5 textColor];
  }

  return v4;
}

- (void)_contentSizeDidChange
{
  v3 = +[MKFontManager sharedManager];
  id v4 = [v3 sectionHeaderFont];
  [(CNLabeledValue *)self->_labeledValue setFont:v4];

  v5 = +[MKFontManager sharedManager];
  v6 = [v5 bodyFont];
  [(MKVibrantLabel *)self->_titleLabel setFont:v6];

  v7 = +[MKFontManager sharedManager];
  v8 = [v7 bodyFont];
  objc_msgSend(v8, "_mapkit_scaledValueForValue:", 12.0);
  -[NSLayoutConstraint setConstant:](self->_topToTitleConstraint, "setConstant:");

  uint64_t v9 = +[MKFontManager sharedManager];
  v10 = [v9 bodyFont];
  objc_msgSend(v10, "_mapkit_scaledValueForValue:", 27.0);
  -[MKPlaceSectionHeaderView setConstant:](self->_headerView, "setConstant:");

  v11 = +[MKFontManager sharedManager];
  v12 = [v11 bodyFont];
  objc_msgSend(v12, "_mapkit_scaledValueForValue:", 22.0);
  -[NSLayoutConstraint setConstant:](self->_topToIconConstraint, "setConstant:");

  id v14 = +[MKFontManager sharedManager];
  uint64_t v13 = [v14 bodyFont];
  objc_msgSend(v13, "_mapkit_scaledValueForValue:", 17.0);
  objc_msgSend(self->_iconSelectedBlock, "setConstant:");
}

- (void)setLabelColor:(id)a3
{
  v5 = (NSLayoutConstraint *)a3;
  if (self->_valueToBottomConstraint != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_valueToBottomConstraint, a3);
    if (self->_valueToBottomConstraint)
    {
      -[MKVibrantLabel setTextColor:](self->_titleLabel, "setTextColor:");
    }
    else
    {
      v6 = [(UIView *)self mk_theme];
      v7 = [v6 textColor];
      [(MKVibrantLabel *)self->_titleLabel setTextColor:v7];
    }
    v5 = v8;
  }
}

- (void)setLabeledValue:(id)a3
{
  p_isInRightMouseDownEvent = &self->_isInRightMouseDownEvent;
  id obj = a3;
  if ((objc_msgSend(*(id *)p_isInRightMouseDownEvent, "isEqual:") & 1) == 0)
  {
    v5 = obj;
    if (obj)
    {
      [(MKPlaceInfoContactRowView *)self _labeledValueExpectedValueType];
      v6 = [obj value];
      if (v6 && (objc_opt_isKindOfClass() & 1) == 0)
      {

        id obj = 0;
      }

      v5 = obj;
    }
    id obj = v5;
    objc_storeStrong((id *)&self->_isInRightMouseDownEvent, v5);
    v7 = [*(id *)p_isInRightMouseDownEvent label];
    v8 = v7;
    if (v7 && [v7 length])
    {
      uint64_t v9 = [MEMORY[0x1E4F1BA20] localizedStringForLabel:v8];
      [(CNLabeledValue *)self->_labeledValue setText:v9];
    }
    v10 = [(MKPlaceInfoContactRowView *)self _valueString];
    [(MKVibrantLabel *)self->_titleLabel setText:v10];
  }
}

- (NSItemProviderWriting)draggableContent
{
  return 0;
}

- (int)analyticsTarget
{
  return 0;
}

- (CNLabeledValue)labeledValue
{
  return *(CNLabeledValue **)&self->_isInRightMouseDownEvent;
}

- (MKVibrantLabel)titleLabel
{
  return (MKVibrantLabel *)self->_labeledValue;
}

- (_MKUILabel)valueLabel
{
  return (_MKUILabel *)self->_titleLabel;
}

- (id)iconSelectedBlock
{
  return self->_valueLabel;
}

- (void)setIconSelectedBlock:(id)a3
{
}

- (NSLayoutConstraint)valueToBottomConstraint
{
  return (NSLayoutConstraint *)self->_iconSelectedBlock;
}

- (void)setValueToBottomConstraint:(id)a3
{
}

- (UIColor)labelColor
{
  return (UIColor *)self->_valueToBottomConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueToBottomConstraint, 0);
  objc_storeStrong(&self->_iconSelectedBlock, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_labeledValue, 0);
  objc_storeStrong((id *)&self->_isInRightMouseDownEvent, 0);
  objc_storeStrong((id *)&self->_iconConstraints, 0);
  objc_storeStrong((id *)&self->_valueToTrailingViewConstraint, 0);
  objc_storeStrong((id *)&self->_titleToValueConstraint, 0);
  objc_storeStrong((id *)&self->_topToIconConstraint, 0);
  objc_storeStrong((id *)&self->_topToTitleConstraint, 0);
  objc_storeStrong((id *)&self->_headerView, 0);

  objc_storeStrong((id *)&self->super._selected, 0);
}

@end