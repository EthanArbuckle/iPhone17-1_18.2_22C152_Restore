@interface HKTitledListItemLabel
+ (id)createTitledListItem:(id)a3 listBody:(id)a4 itemNumber:(int)a5;
+ (id)createTitledListItem:(id)a3 titleAccessibilityIdentifier:(id)a4 listBody:(id)a5 bodyAccessibilityIdentifier:(id)a6 itemNumber:(int)a7;
- (HKListItemLabel)listItemLabel;
- (HKTitledListItemLabel)initWithView:(id)a3 size:(CGSize)a4 title:(id)a5 body:(id)a6;
- (UILabel)bodyLabel;
- (double)_bodyLabelToBottom;
- (double)_listItemLabelToBody;
- (id)_bodyLabelFont;
- (id)viewForFirstBaselineLayout;
- (int64_t)currentUserInterfaceStyle;
- (void)_setUpConstraints;
- (void)_setUpUI;
- (void)_updateCurrentUserInterfaceStyleIfNeeded;
- (void)layoutSubviews;
- (void)setBodyLabel:(id)a3;
- (void)setCurrentUserInterfaceStyle:(int64_t)a3;
- (void)setListItemLabel:(id)a3;
@end

@implementation HKTitledListItemLabel

- (HKTitledListItemLabel)initWithView:(id)a3 size:(CGSize)a4 title:(id)a5 body:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HKTitledListItemLabel;
  v14 = [(HKTitledListItemLabel *)&v20 init];
  if (v14)
  {
    v15 = -[HKListItemLabel initWithView:size:text:]([HKListItemLabel alloc], "initWithView:size:text:", v11, v12, width, height);
    listItemLabel = v14->_listItemLabel;
    v14->_listItemLabel = v15;

    v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    bodyLabel = v14->_bodyLabel;
    v14->_bodyLabel = v17;

    [(UILabel *)v14->_bodyLabel setText:v13];
    [(HKTitledListItemLabel *)v14 _setUpUI];
    [(HKTitledListItemLabel *)v14 _setUpConstraints];
  }

  return v14;
}

- (id)viewForFirstBaselineLayout
{
  v2 = [(HKTitledListItemLabel *)self listItemLabel];
  v3 = [v2 textLabel];

  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HKTitledListItemLabel;
  [(HKTitledListItemLabel *)&v3 layoutSubviews];
  [(HKTitledListItemLabel *)self _updateCurrentUserInterfaceStyleIfNeeded];
}

+ (id)createTitledListItem:(id)a3 listBody:(id)a4 itemNumber:(int)a5
{
  return (id)[a1 createTitledListItem:a3 titleAccessibilityIdentifier:0 listBody:a4 bodyAccessibilityIdentifier:0 itemNumber:*(void *)&a5];
}

+ (id)createTitledListItem:(id)a3 titleAccessibilityIdentifier:(id)a4 listBody:(id)a5 bodyAccessibilityIdentifier:(id)a6 itemNumber:(int)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [(id)objc_opt_class() createButtonBackgroundView];
  v16 = [HKTitledListItemLabel alloc];
  v17 = [(id)objc_opt_class() createNumberedViewWithInteger:a7];
  [(id)objc_opt_class() listItemSize];
  v18 = -[HKTitledListItemLabel initWithView:size:title:body:](v16, "initWithView:size:title:body:", v17, v14, v12);

  v19 = [(HKTitledListItemLabel *)v18 listItemLabel];
  [v19 setAccessibilityIdentifier:v13];

  objc_super v20 = [(HKTitledListItemLabel *)v18 bodyLabel];
  [v20 setAccessibilityIdentifier:v11];

  [(HKTitledListItemLabel *)v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v15 addSubview:v18];
  -[UIView hk_alignHorizontalConstraintsWithView:insets:](v18, "hk_alignHorizontalConstraintsWithView:insets:", v15, 0.0, 12.0, 0.0, 20.0);
  -[UIView hk_alignVerticalConstraintsWithView:insets:](v18, "hk_alignVerticalConstraintsWithView:insets:", v15, *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));

  return v15;
}

- (void)_setUpUI
{
  objc_super v3 = [(HKTitledListItemLabel *)self listItemLabel];
  [v3 setCenterItemViewToFirstLine:1];

  v4 = [(HKTitledListItemLabel *)self listItemLabel];
  [v4 setBoldText:1];

  v5 = [(HKTitledListItemLabel *)self listItemLabel];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [(HKTitledListItemLabel *)self listItemLabel];
  [(HKTitledListItemLabel *)self addSubview:v6];

  v7 = [(HKTitledListItemLabel *)self bodyLabel];
  [v7 setNumberOfLines:0];

  v8 = [(HKTitledListItemLabel *)self _bodyLabelFont];
  v9 = [(HKTitledListItemLabel *)self bodyLabel];
  [v9 setFont:v8];

  v10 = [(HKTitledListItemLabel *)self bodyLabel];
  [v10 setAdjustsFontForContentSizeCategory:1];

  id v11 = [(HKTitledListItemLabel *)self bodyLabel];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v12 = [(HKTitledListItemLabel *)self bodyLabel];
  [(HKTitledListItemLabel *)self addSubview:v12];
}

- (void)_setUpConstraints
{
  objc_super v3 = [(HKTitledListItemLabel *)self listItemLabel];
  double v4 = *MEMORY[0x1E4FB12A8];
  double v5 = *(double *)(MEMORY[0x1E4FB12A8] + 8);
  double v6 = *(double *)(MEMORY[0x1E4FB12A8] + 16);
  double v7 = *(double *)(MEMORY[0x1E4FB12A8] + 24);
  objc_msgSend(v3, "hk_alignHorizontalConstraintsWithView:insets:", self, *MEMORY[0x1E4FB12A8], v5, v6, v7);

  v8 = [(HKTitledListItemLabel *)self listItemLabel];
  v9 = [v8 topAnchor];
  v10 = [(HKTitledListItemLabel *)self topAnchor];
  id v11 = [v9 constraintEqualToAnchor:v10];
  [v11 setActive:1];

  id v12 = [(HKTitledListItemLabel *)self bodyLabel];
  id v13 = [v12 firstBaselineAnchor];
  id v14 = [(HKTitledListItemLabel *)self listItemLabel];
  v15 = [v14 lastBaselineAnchor];
  [(HKTitledListItemLabel *)self _listItemLabelToBody];
  v16 = objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15);
  [v16 setActive:1];

  v17 = [(HKTitledListItemLabel *)self bodyLabel];
  v18 = [(HKTitledListItemLabel *)self listItemLabel];
  v19 = [v18 textLabel];
  objc_msgSend(v17, "hk_alignHorizontalConstraintsWithView:insets:", v19, v4, v5, v6, v7);

  id v23 = [(HKTitledListItemLabel *)self bottomAnchor];
  objc_super v20 = [(HKTitledListItemLabel *)self bodyLabel];
  v21 = [v20 lastBaselineAnchor];
  [(HKTitledListItemLabel *)self _bodyLabelToBottom];
  v22 = objc_msgSend(v23, "constraintEqualToAnchor:constant:", v21);
  [v22 setActive:1];
}

- (void)_updateCurrentUserInterfaceStyleIfNeeded
{
  objc_super v3 = [(HKTitledListItemLabel *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  if ([(HKTitledListItemLabel *)self currentUserInterfaceStyle] != v4)
  {
    [(HKTitledListItemLabel *)self setCurrentUserInterfaceStyle:v4];
    id v6 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    double v5 = [(HKTitledListItemLabel *)self bodyLabel];
    [v5 setTextColor:v6];
  }
}

- (double)_listItemLabelToBody
{
  v2 = [(HKTitledListItemLabel *)self listItemLabel];
  objc_super v3 = [v2 textLabel];
  uint64_t v4 = [v3 font];
  [v4 _scaledValueForValue:27.0];
  double v6 = v5;

  return v6;
}

- (id)_bodyLabelFont
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
}

- (double)_bodyLabelToBottom
{
  v2 = [(HKTitledListItemLabel *)self _bodyLabelFont];
  [v2 _scaledValueForValue:20.0];
  double v4 = v3;

  return v4;
}

- (HKListItemLabel)listItemLabel
{
  return self->_listItemLabel;
}

- (void)setListItemLabel:(id)a3
{
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void)setBodyLabel:(id)a3
{
}

- (int64_t)currentUserInterfaceStyle
{
  return self->_currentUserInterfaceStyle;
}

- (void)setCurrentUserInterfaceStyle:(int64_t)a3
{
  self->_currentUserInterfaceStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_listItemLabel, 0);
}

@end